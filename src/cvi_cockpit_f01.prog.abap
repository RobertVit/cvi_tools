*----------------------------------------------------------------------*
***INCLUDE CVI_COCKPIT_F01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  HANDLE_COMMAND_1000
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM handle_command_1000 .
  DATA : lv_ucomm_indicator TYPE string,
         lv_artifact_id     TYPE cvi_cockpit_artifact,
         lv_subrc           TYPE sy-subrc,
         lv_answer          TYPE char1,
         ls_task_details    LIKE LINE OF gt_task_details,
         lv_help_object     TYPE dokhl-object,
         lv_doc_id          TYPE dokhl-id,
         lv_langu           TYPE sy-langu.


  FIELD-SYMBOLS <lfs_stage_status> TYPE cl_cvi_cockpit=>ty_stage_details.

  CASE gv_okcode.
      "Handle ok-code assigned in the gui-status
    WHEN gc_fcode-back OR gc_fcode-cancel  OR gc_fcode-exit.
      PERFORM check_and_confirm_unsaved_data CHANGING lv_answer.
      IF lv_answer EQ abap_true.
        PERFORM dequeue_cockpit.
        LEAVE PROGRAM.
      ENDIF.
      "ok-code for the different tabs of the tabstrip
    WHEN gc_tabstrip_fcode-validation.
      ts_cockpit-activetab = gc_tabstrip_fcode-validation.
    WHEN gc_tabstrip_fcode-preparation.
      ts_cockpit-activetab = gc_tabstrip_fcode-preparation.
    WHEN gc_tabstrip_fcode-cvi_load.
      ts_cockpit-activetab = gc_tabstrip_fcode-cvi_load.
    WHEN gc_tabstrip_fcode-prep_sum.
      ts_cockpit-activetab = gc_tabstrip_fcode-prep_sum.
    WHEN gc_fcode-click. " when click on the status icon
      IF gv_cursor_field IS NOT INITIAL AND strlen( gv_cursor_field ) GT 5.
        IF gv_cursor_field+0(4) = 'STAT'.
          CLEAR gs_status_pop_det.
          gs_status_pop_det-task_artifact_id = gv_cursor_field+5.
          CALL SCREEN 2000 STARTING AT 10 08 ENDING AT 60 12.
        ENDIF.
      ENDIF.
    WHEN gc_fcode-save. " Save the current status to DB
      READ TABLE gt_task_details WITH KEY is_changed = abap_true TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        "call the save method
        CALL METHOD cl_cvi_cockpit=>save
          EXPORTING
            it_data  = gt_task_details
            it_logs  = gt_cockpit_log
          IMPORTING
            ev_subrc = lv_subrc.
        IF lv_subrc = 0.
          MESSAGE s002(cvi_cockpit). " Success message.
          "Clear  'is_changed' flag of the table
          ls_task_details-is_changed = abap_false.
          MODIFY gt_task_details FROM ls_task_details TRANSPORTING is_changed WHERE is_changed = abap_true.
        ENDIF.
      ELSE.
        MESSAGE s003(cvi_cockpit).
      ENDIF.
    WHEN gc_fcode-unsync. " Open Pop-Up to display the Unsynchronized counts of Customer & Supplier
      CALL SCREEN 3000 STARTING AT 45 06 ENDING AT 103 12.
    WHEN gc_fcode-help.
      lv_help_object = 'CVI_COCKPIT'.
      lv_doc_id      = 'RE'.
      lv_langu       = sy-langu.
      PERFORM display_docu USING lv_help_object lv_doc_id lv_langu.
    WHEN gc_fcode-next_steps.
      lv_help_object = 'NEXT_STEPS'.
      lv_doc_id      = 'TX'.
      lv_langu       = sy-langu.
      PERFORM display_docu USING lv_help_object lv_doc_id lv_langu.
    WHEN OTHERS.
      "Check and store the first 4 character into var lv_ucomm_indicator of the ok-code.
      "lv_ucomm_indicator can have EDIT - For Change, LOGS- for Log display, INFO- For Documenetation, EXEC-FOr Execute
      IF strlen( gv_okcode ) GE 4.
        lv_ucomm_indicator = gv_okcode+0(4).
      ENDIF.
      IF lv_ucomm_indicator = 'EDIT'.
        IF strlen( gv_okcode ) GE 5.
          lv_artifact_id = gv_okcode+5. "will have the stage artifcact ID
        ENDIF.
        " read the task details
        "if edit is pressed on the current allowed task then set the editable or else get a confirmation to reset
        READ TABLE gt_stage_status ASSIGNING <lfs_stage_status> WITH KEY stage_artifact_id = lv_artifact_id.
        IF sy-subrc EQ 0.
          "check if the stage is already opened in edit state
*          if <lfs_stage_status>-

          PERFORM enqueue_cockpit.


          IF <lfs_stage_status>-active_tab = abap_true.
            <lfs_stage_status>-action_allowed = abap_true.
          ELSE.
            MESSAGE w006(cvi_cockpit).
            <lfs_stage_status>-action_allowed = abap_true.
          ENDIF.
        ENDIF.
        "handle button's action assigned on the various tabs
        "attribute mt_fcode_list_rn contains list of all valid fcodes
      ELSEIF gv_okcode IN cl_cvi_cockpit=>return_applicable_fcode( ).
        lv_artifact_id = ts_cockpit-activetab.
        CALL METHOD cl_cvi_cockpit=>execute_action
          EXPORTING
            iv_stage_artifact_id = lv_artifact_id
            iv_okcode            = gv_okcode       " ABAP-Systemfeld: Funktionscode, der PAI ausgelöst hat
            iv_action            = lv_ucomm_indicator
          EXCEPTIONS
            processing_error     = 1                " Error while proessing
            no_record_found      = 2                " No record found to process
            OTHERS               = 3.
        IF sy-subrc <> 0.
          MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
        ENDIF.
      ENDIF.
  ENDCASE.
ENDFORM.                    "handle_command_1000
*&---------------------------------------------------------------------*
*&      Form  GET_CURSOR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_cursor .
  GET CURSOR FIELD gv_cursor_field.
ENDFORM.                    "get_cursor
*&---------------------------------------------------------------------*
*&      Form  UPDATE_TASK_STATUS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM update_task_status .
  CONSTANTS :lc_stat      TYPE string VALUE 'STAT',
             lc_change_by TYPE string VALUE 'CHANGE_BY',
             lc_change_on TYPE string VALUE 'CHANGE_ON',
             lc_hyphen    TYPE string VALUE '-'.

  FIELD-SYMBOLS <fs_value> TYPE any .

  DATA: lv_component_name TYPE string,
        lv_date_c         TYPE char10.

  LOOP AT gt_task_details INTO gs_task_details WHERE stage_artifact_id = ts_cockpit-activetab.
    "update the status icon information
    CONCATENATE lc_stat lc_hyphen gs_task_details-task_artifact_id INTO lv_component_name.
    ASSIGN  (lv_component_name)  TO <fs_value>.
    IF <fs_value> IS ASSIGNED .
      PERFORM icon_create USING gs_task_details-status_icon '' gs_task_details-status_text CHANGING <fs_value>.
    ENDIF.

    "update the i/o field of Changed On
    CONCATENATE lc_change_on lc_hyphen gs_task_details-task_artifact_id INTO lv_component_name.
    ASSIGN  (lv_component_name)  TO <fs_value>.
    IF <fs_value> IS ASSIGNED .
      IF gs_task_details-changed_on IS NOT INITIAL.
        WRITE gs_task_details-changed_on TO lv_date_c.
        <fs_value> = lv_date_c.
      ENDIF.
    ENDIF.

    "update the i/o field of Changed by
    CONCATENATE lc_change_by lc_hyphen gs_task_details-task_artifact_id INTO lv_component_name.
    ASSIGN  (lv_component_name)  TO <fs_value>.
    IF <fs_value> IS ASSIGNED .
      <fs_value> = gs_task_details-changed_by.
    ENDIF.
  ENDLOOP.

  "***************************************************************************************
  "Update the global varaibles of the CVI_LOAD_TOOL program if CVI-LOAD screen is called *
  "***************************************************************************************
  IF ts_cockpit-activetab = 'LOAD'.
    "update the Global Structure "STAT'
    CONCATENATE '(' gc_cvi_load_program_name ')' lc_stat INTO lv_component_name.
    ASSIGN  (lv_component_name)  TO <fs_value>.
    IF <fs_value> IS ASSIGNED .
      <fs_value> = stat.
    ENDIF.

    "update the Global Structure "CHANGE_ON'
    CONCATENATE '(' gc_cvi_load_program_name ')' lc_change_on INTO lv_component_name.
    ASSIGN  (lv_component_name)  TO <fs_value>.
    IF <fs_value> IS ASSIGNED .
      <fs_value> = change_on.
    ENDIF.

    "update the Global Structure "CHANGE_BY'
    CONCATENATE '(' gc_cvi_load_program_name ')' lc_change_by INTO lv_component_name.
    ASSIGN  (lv_component_name)  TO <fs_value>.
    IF <fs_value> IS ASSIGNED .
      <fs_value> = change_by.
    ENDIF.
  ENDIF.

ENDFORM.                    "update_task_status
*&---------------------------------------------------------------------*
*&      Form  MODIFY_SUBSCREEN_UI_ELEMENTS
*&---------------------------------------------------------------------*
* "based on Flag - enable or disable the EDIT and EXEC actions accordingly
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM modify_subscreen_ui_elements.

  READ TABLE gt_stage_status INTO gs_stage_status WITH KEY stage_artifact_id = ts_cockpit-activetab.
  IF sy-subrc EQ 0.
    "Screen modification to be done based on 'executable' / 'non-executable' navigations
    LOOP AT SCREEN.
      "for EDIT button at task level
      IF screen-group1 = 'CHG' AND gs_stage_status-edit_allowed EQ abap_false.
        screen-input = 0.
        MODIFY SCREEN.
        CONTINUE.
      ENDIF.
      "For EXEC action at task level
      IF screen-group1 = 'EXE' AND gs_stage_status-action_allowed EQ abap_false.
        screen-input = 0.
        MODIFY SCREEN.
        CONTINUE.
      ENDIF.
    ENDLOOP.
  ENDIF.
ENDFORM.                    "modify_subscreen_ui_elements
*&---------------------------------------------------------------------*
*&      Form  DETERMINE_SUBCREEN_NO
*&---------------------------------------------------------------------*
* Based on the Tab-Pressed determine the subscreen and Main Program Name
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM determine_subcreen_no .
  CASE ts_cockpit-activetab.
    WHEN gc_tabstrip_fcode-validation.
      gv_subcsreen = '1100'.
      gv_repid = sy-repid.
    WHEN gc_tabstrip_fcode-preparation.
      gv_subcsreen = '1200'.
      gv_repid = sy-repid.
    WHEN gc_tabstrip_fcode-cvi_load.
      gv_subcsreen = '1310'.
      gv_repid = gc_cvi_load_program_name.
    WHEN gc_tabstrip_fcode-prep_sum.
      gv_subcsreen = '1400'.
      gv_repid = sy-repid.
  ENDCASE.
ENDFORM.                    "determine_subcreen_no
*&---------------------------------------------------------------------*
*&      Form  GET_RESET_CONFIRMATION
*&---------------------------------------------------------------------*
* Open Pop-up for user confirmation
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_reset_confirmation CHANGING ch_answer TYPE char1.
  CALL FUNCTION 'POPUP_TO_CONFIRM'
    EXPORTING
      titlebar              = 'Reset Confirmation'(001)
      text_question         = 'Modifying tasks of a confirmed stage will fully reset all subsequent stages. Do you still want to proceed ?'(010)
      display_cancel_button = ''
      default_button        = '2'
    IMPORTING
      answer                = ch_answer
    EXCEPTIONS
      text_not_found        = 1
      OTHERS                = 2.
  IF sy-subrc <> 0.
    MESSAGE e004.
  ENDIF.
ENDFORM.                    "get_reset_confirmation
*&---------------------------------------------------------------------*
*&      Form  INITIALIZE_TEXT_EDITOR
*&---------------------------------------------------------------------*
* Initialize the Text Editor - for comment
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM initialize_text_editor CHANGING ch_error TYPE sap_bool.
  CONSTANTS: lc_container_name TYPE char20 VALUE 'CC_COMMENT'.

  "Initialiaze only editor ref is initial
  CHECK go_editor_container IS NOT BOUND.

  CREATE OBJECT go_editor_container
    EXPORTING
      container_name              = lc_container_name
    EXCEPTIONS
      cntl_error                  = 1
      cntl_system_error           = 2
      create_error                = 3
      lifetime_error              = 4
      lifetime_dynpro_dynpro_link = 5.
  IF sy-subrc <> 0.
    ch_error = abap_true.
    MESSAGE e004.
  ELSE.
    CREATE OBJECT go_editor
      EXPORTING
        max_number_chars           = gc_max_number_chars
        parent                     = go_editor_container
        wordwrap_mode              = cl_gui_textedit=>wordwrap_at_windowborder
        wordwrap_to_linebreak_mode = cl_gui_textedit=>true
      EXCEPTIONS
        OTHERS                     = 1.
    IF sy-subrc <> 0.
      ch_error = abap_true.
      MESSAGE e004.
    ELSEIF go_editor IS BOUND.
      "hide the toolbars
      CALL METHOD go_editor->set_toolbar_mode
        EXPORTING
          toolbar_mode           = cl_gui_textedit=>false
        EXCEPTIONS
          error_cntl_call_method = 1
          invalid_parameter      = 2
          OTHERS                 = 3.
      IF sy-subrc <> 0.
        MESSAGE e004.
      ENDIF.
      "hide the status Bar
      CALL METHOD go_editor->set_statusbar_mode
        EXPORTING
          statusbar_mode         = cl_gui_textedit=>false
        EXCEPTIONS
          error_cntl_call_method = 1
          invalid_parameter      = 2
          OTHERS                 = 3.
      IF sy-subrc <> 0.
        MESSAGE e004.
      ENDIF.
    ELSE.
      ch_error = abap_true.
    ENDIF.
  ENDIF.
ENDFORM.                    "initialize_text_editor
*&---------------------------------------------------------------------*
*&      Form  PREPARE_AND_SET_TEXTEDITOR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM prepare_and_set_texteditor.

  DATA : lv_editor_error   TYPE sap_bool,
         lv_status_comment TYPE string.

  CLEAR gs_status_pop_det-is_data_changed.
  "get the task details based on the selection
  READ TABLE gt_task_details INTO gs_task_details WITH KEY task_artifact_id = gs_status_pop_det-task_artifact_id.
  IF sy-subrc EQ 0.
    gs_status_pop_det-stage = gs_task_details-stage.
    gs_status_pop_det-stage_artifact_id = gs_task_details-stage_artifact_id.
    gs_status_pop_det-task = gs_task_details-task.
    gs_status_pop_det-status = gs_task_details-status.
    gs_status_pop_det-status_icon = gs_task_details-status_icon.
    gs_status_pop_det-status_text = gs_task_details-status_text.
    gs_status_pop_det-comments = gs_task_details-comments.
    gs_status_pop_det-changed_by = gs_task_details-changed_by.
    WRITE gs_task_details-changed_on TO gs_status_pop_det-changed_on.
  ENDIF.

  "initialize the editor control if required
  PERFORM initialize_text_editor CHANGING lv_editor_error.

  "set the text in the editor
  lv_status_comment = gs_status_pop_det-comments.
  CALL METHOD go_editor->set_textstream
    EXPORTING
      text                   = lv_status_comment
    EXCEPTIONS
      error_cntl_call_method = 1
      not_supported_by_gui   = 2
      OTHERS                 = 3.
  IF sy-subrc <> 0.
    MESSAGE e004.
  ENDIF.
  "set readonly attribute
  PERFORM chng_texteditor_disp_attribute.
ENDFORM.                    "prepare_and_set_texteditor
*&---------------------------------------------------------------------*
*&      Form  CHNG_TEXTEDITOR_DISP_ATTRIBUTE
*&---------------------------------------------------------------------*
*  Set the TextEditor Readonly attribute based on the Task status
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM chng_texteditor_disp_attribute .
  DATA: lv_displayonly      VALUE abap_true,
        lv_displayonly_mode TYPE i.

  "in case of read only
  READ TABLE gt_stage_status INTO gs_stage_status WITH KEY stage_artifact_id = ts_cockpit-activetab.
  lv_displayonly =   gs_stage_status-action_allowed. " sy-subrc check not required as default provided


  IF lv_displayonly EQ abap_false.
    LOOP AT SCREEN.
      IF screen-group1 = 'EXE'.
        screen-input = 0.
        MODIFY SCREEN.
        CONTINUE.
      ENDIF.
    ENDLOOP.
    lv_displayonly_mode = cl_gui_textedit=>true.
  ELSE.
    lv_displayonly_mode = cl_gui_textedit=>false.
  ENDIF.

  CALL METHOD go_editor->set_readonly_mode
    EXPORTING
      readonly_mode          = lv_displayonly_mode      "read-only mode; eq 0: OFF ; ne 0: ON
    EXCEPTIONS
      error_cntl_call_method = 1                " Error while setting read-only mode!
      invalid_parameter      = 2                " INVALID_PARAMETER
      OTHERS                 = 3.
  IF sy-subrc <> 0.
    MESSAGE e004.
  ENDIF.

ENDFORM.                    "chng_texteditor_disp_attribute
*&---------------------------------------------------------------------*
*&      Form  UPDATE_TASK_DETAILS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_GV_CURSOR_FIELD+5  text
*----------------------------------------------------------------------*
FORM update_task_details  USING    p_task_id TYPE cvi_cockpit_task.
  DATA: ls_task_old_value TYPE cl_cvi_cockpit=>ty_task_details.


  CHECK gs_status_pop_det-is_data_changed EQ abap_true."something got changed

  READ TABLE gt_task_details INTO gs_task_details WITH KEY task = p_task_id.
  IF sy-subrc EQ 0.
    ls_task_old_value = gs_task_details.
    gs_task_details-status = gs_status_pop_det-status.
    gs_task_details-status_icon = gs_status_pop_det-status_icon.
    gs_task_details-status_text = gs_status_pop_det-status_text.
    gs_task_details-comments = gs_status_pop_det-comments.
    gs_task_details-changed_by = sy-uname.
    gs_task_details-changed_on = sy-datum.
    gs_task_details-changed_at = sy-uzeit.
    gs_task_details-is_changed = abap_true.

    CALL METHOD cl_cvi_cockpit=>do_before_task_change
      EXPORTING
        is_task_details_old = ls_task_old_value
        is_task_details_new = gs_task_details
      EXCEPTIONS
        validation_error    = 1
        OTHERS              = 2.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ELSE.
      MODIFY gt_task_details FROM gs_task_details TRANSPORTING status status_icon status_text comments changed_by changed_on changed_at is_changed
      WHERE task = gs_status_pop_det-task.

      "update the Stage internal table
      CALL METHOD cl_cvi_cockpit=>determine_stage_status
        EXPORTING
          it_task_status  = gt_task_details
        IMPORTING
          et_stage_status = gt_stage_status.
    ENDIF.
  ENDIF.
ENDFORM.                    "update_task_details
*&---------------------------------------------------------------------*
*&      Form  UPDATE_STAGE_ICON_AND_TEXT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM update_stage_icon_and_text .
  CONSTANTS c_tab TYPE string VALUE 'TAB-'.

  DATA: lt_stage_metadata TYPE cl_cvi_cockpit=>tt_stage_metadata,
        ls_stage_metadata TYPE cl_cvi_cockpit=>ty_stage_metadata,

        lv_component_name TYPE string.

  FIELD-SYMBOLS : <lfs_value> TYPE any.

  cl_cvi_cockpit=>get_metadata(
    IMPORTING
      et_stage  =  lt_stage_metadata
  ).

  LOOP AT gt_stage_status INTO gs_stage_status.
    READ TABLE lt_stage_metadata INTO ls_stage_metadata WITH KEY stage = gs_stage_status-stage.
    ASSERT sy-subrc EQ 0.

    CONCATENATE c_tab ls_stage_metadata-stage_artifact_id INTO lv_component_name.
    ASSIGN (lv_component_name) TO <lfs_value>.
    IF <lfs_value> IS ASSIGNED.
      READ TABLE lt_stage_metadata INTO ls_stage_metadata WITH KEY stage = gs_stage_status-stage.
      IF sy-subrc EQ 0.
        <lfs_value> = ls_stage_metadata-stage_text.
      ENDIF.
      PERFORM icon_create USING gs_stage_status-status <lfs_value> '' CHANGING <lfs_value>.
    ENDIF.
  ENDLOOP.
ENDFORM.                    "update_stage_icon_and_text
*&---------------------------------------------------------------------*
*&      Form  ICON_CREATE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_GS_TASK_DETAILS_STATUS_ICON  text
*      -->P_GS_TASK_DETAILS_STATUS_TEXT  text
*      <--P_<FS_VALUE>  text
*----------------------------------------------------------------------*
FORM icon_create  USING    p_status_icon TYPE icon_d
                           p_status_text
                           p_icon_info
                  CHANGING p_result TYPE string.

  CALL FUNCTION 'ICON_CREATE'
    EXPORTING
      name                  = p_status_icon
      text                  = p_status_text
      info                  = p_icon_info
      add_stdinf            = space
    IMPORTING
      result                = p_result
    EXCEPTIONS
      icon_not_found        = 1
      outputfield_too_short = 2
      OTHERS                = 3.
  IF sy-subrc <> 0.
    MESSAGE e004.
  ENDIF.
ENDFORM.                    "icon_create
*&---------------------------------------------------------------------*
*&      Form  VALIDATE_AND_SET_TASK_DET
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_GS_STATUS_POP_DET_STATUS  text
*----------------------------------------------------------------------*
FORM validate_and_set_task_det  USING    p_status TYPE cvi_cockpit_status.

  DATA: ls_status_map     TYPE cl_cvi_cockpit=>ty_status_metadata.

  CALL METHOD cl_cvi_cockpit=>get_status_details
    EXPORTING
      iv_status         = p_status
    IMPORTING
      es_status_details = ls_status_map.

  IF ls_status_map IS INITIAL.
    MESSAGE e007 WITH p_status.
  ENDIF.

  "all good -> set the values for further procesing
  gs_status_pop_det-status_icon = ls_status_map-icon.
  gs_status_pop_det-status_text = ls_status_map-status_text.
  gs_status_pop_det-is_data_changed = abap_true.
ENDFORM.                    "validate_and_set_task_det
*&---------------------------------------------------------------------*
*&      Form  DISPLAY_STATUS_F4
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM display_status_f4 .
  TYPES: BEGIN OF lty_status_list,
           status      TYPE cvi_cockpit_status,
           status_text TYPE val_text,
         END OF lty_status_list.

  DATA: lt_status_list    TYPE TABLE OF lty_status_list,
        ls_status_list    TYPE lty_status_list,
        lt_return_values  TYPE TABLE OF ddshretval,
        ls_return_values  TYPE         ddshretval,
        lt_dynpfields     TYPE TABLE OF dynpread,
        ls_dynpfields     TYPE          dynpread,
        ls_status_mapping TYPE cl_cvi_cockpit=>ty_status_metadata,
        lt_status_mapping TYPE cl_cvi_cockpit=>tt_status_metadata.

  CLEAR lt_status_list.

  CALL METHOD cl_cvi_cockpit=>get_metadata
    IMPORTING
      et_status = lt_status_mapping.

  LOOP AT lt_status_mapping INTO ls_status_mapping.
    ls_status_list-status = ls_status_mapping-status.
    ls_status_list-status_text = ls_status_mapping-status_text .
    APPEND ls_status_list TO lt_status_list.
  ENDLOOP.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'STATUS' "internal table field
      dynpprog        = 'CVI_COCKPIT' "program name
      dynpnr          = '2000' "screen number
      dynprofield     = 'GS_STATUS_POP_DET-STATUS' "screen field name
      value_org       = 'S'
      window_title    = 'Task Status'(002)
    TABLES
      value_tab       = lt_status_list  "internal table
      return_tab      = lt_return_values
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.

  IF sy-subrc EQ 0.
    READ TABLE lt_return_values INTO ls_return_values INDEX 1.
    IF sy-subrc EQ 0.
      READ TABLE lt_status_mapping INTO ls_status_mapping WITH KEY status =  ls_return_values-fieldval.
      IF sy-subrc EQ 0.
        ls_dynpfields-fieldvalue = ls_status_mapping-status_text.
      ENDIF.
      ls_dynpfields-fieldname = 'GS_STATUS_POP_DET-STATUS_TEXT'.
      APPEND ls_dynpfields TO lt_dynpfields.

      ls_dynpfields-fieldname = 'GS_STATUS_POP_DET-STATUS_ICON'.
      ls_dynpfields-fieldvalue = ls_status_mapping-icon.
      APPEND ls_dynpfields TO lt_dynpfields.


      ls_dynpfields-fieldname = 'GS_STATUS_POP_DET-STATUS'.
      ls_dynpfields-fieldvalue = ls_return_values-fieldval.
      APPEND ls_dynpfields TO lt_dynpfields.


      CALL FUNCTION 'DYNP_VALUES_UPDATE'
        EXPORTING
          dyname               = 'CVI_COCKPIT'
          dynumb               = '2000'
        TABLES
          dynpfields           = lt_dynpfields
        EXCEPTIONS
          invalid_abapworkarea = 1
          invalid_dynprofield  = 2
          invalid_dynproname   = 3
          invalid_dynpronummer = 4
          invalid_request      = 5
          no_fielddescription  = 6
          undefind_error       = 7
          OTHERS               = 8.
      IF sy-subrc <> 0.
        MESSAGE e004.
      ENDIF.

    ENDIF.
  ENDIF.
ENDFORM.                    "display_status_f4

*&---------------------------------------------------------------------*
*&      Form  VALIDATE_COMMENT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM validate_comment.
  DATA: lv_is_modified    TYPE i,
        lv_status_comment TYPE string.

 " Validate only if the tab is ready for input. The comment validation should not happen in case of display mode
  READ TABLE gt_stage_status INTO gs_stage_status WITH KEY stage_artifact_id = ts_cockpit-activetab.
  IF sy-subrc = 0.
    IF gs_stage_status-action_allowed = abap_true.
      "validate the comment
  CALL METHOD go_editor->get_textstream
    IMPORTING
      text                   = lv_status_comment
      is_modified            = lv_is_modified
    EXCEPTIONS
      error_cntl_call_method = 1
      not_supported_by_gui   = 2
      OTHERS                 = 3.
  IF sy-subrc <> 0.
    MESSAGE e004.
  ENDIF.
  CALL METHOD cl_gui_cfw=>flush
    EXCEPTIONS
      OTHERS = 1.
  IF sy-subrc NE 0.
    MESSAGE e004.
  ENDIF.
  IF lv_status_comment IS INITIAL.
    MESSAGE e008.
  ENDIF.

  IF lv_is_modified EQ 1. "proceed only modififcation is done
    gs_status_pop_det-comments = lv_status_comment.
    gs_status_pop_det-is_data_changed = abap_true.
      ENDIF.
    ENDIF.
  ENDIF.
ENDFORM.                    "validate_comment
*&---------------------------------------------------------------------*
*&      Form  CHECK_AND_CONFIRM_UNSAVED_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM check_and_confirm_unsaved_data CHANGING p_answer TYPE char1.
  DATA lv_answer .
  p_answer = abap_true.

  READ TABLE gt_task_details WITH KEY is_changed = abap_true TRANSPORTING NO FIELDS.
  IF sy-subrc <> 0. "no unsaved data
    RETURN.
  ENDIF.

  "get the confirmation for the unsaved data
  CALL FUNCTION 'POPUP_TO_CONFIRM'
    EXPORTING
      text_question  = 'Unsaved data will be lost. Do you want to proceed?'(003)
      default_button = '2'
    IMPORTING
      answer         = lv_answer
    EXCEPTIONS
      text_not_found = 1
      OTHERS         = 2.
  IF sy-subrc <> 0.
    MESSAGE e004.
  ENDIF.
  IF lv_answer <> '1'. " user has confrimed to discard changes
    p_answer = abap_false.
  ENDIF.
ENDFORM.                    "check_and_confirm_unsaved_data
*&---------------------------------------------------------------------*
*&      Form  UPDATE_OVERALL_STATUS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM update_overall_status .
  DATA: is_all_stage_completed TYPE sap_bool VALUE abap_true,
        lv_icon                TYPE icon_d,
        lv_all_records_sync    TYPE sap_bool.

  FIELD-SYMBOLS <lfs_value> TYPE any.

  LOOP AT gt_stage_status INTO gs_stage_status.
    IF gs_stage_status-status <> cl_cvi_cockpit=>c_status-led_green.
      is_all_stage_completed = abap_false.
      EXIT.
    ENDIF.
  ENDLOOP.


  IF is_all_stage_completed = abap_false.
    "not all stages are completed - set overall status as 'RED' and exit
    lv_icon = cl_cvi_cockpit=>c_status-led_red.
    gs_overall_status-overall_status_text = 'Not ready'(005).
  ELSE.
    "all stages are completed so now check if all records are syncronized
    cl_cvi_cockpit=>get_unsynchronised_records(
      IMPORTING
        ev_all_synchronized  =  lv_all_records_sync   " Boolean Variable (X=True, Space=False)
    ).
    IF lv_all_records_sync = abap_false.
      lv_icon = cl_cvi_cockpit=>c_status-led_red.
      gs_overall_status-overall_status_text = 'Not ready'(005).
    ELSE.
      lv_icon = cl_cvi_cockpit=>c_status-led_green.
      gs_overall_status-overall_status_text = 'Ready'(004).
    ENDIF.
  ENDIF.

  ASSIGN ('GS_OVERALL_STATUS-OVERALL_STATUS_ICON') TO <lfs_value>.
  IF <lfs_value> IS ASSIGNED.
    PERFORM icon_create USING lv_icon '' '' CHANGING <lfs_value>.
  ENDIF.

ENDFORM.                    "update_overall_status
*&---------------------------------------------------------------------*
*&      Form  DATE_TO_EXTERNAL
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_GS_PPO_INPUTS_DATE_FROM  text
*      <--P_LS_BDCDATA_FVAL  text
*----------------------------------------------------------------------*
FORM date_to_external  USING    date TYPE dats
                       CHANGING value TYPE char10.

  CALL FUNCTION 'CONVERT_DATE_TO_EXTERNAL'
    EXPORTING
      date_internal = date
    IMPORTING
      date_external = value.

ENDFORM.                    "date_to_external
*&---------------------------------------------------------------------*
*&      Form  VALIDATE_PPO2_INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM validate_ppo2_input .

* 1. --> At least one option (customer/vendor) is mandatory
* 2. --> Creation date from is mandatory

  IF gs_ppo_inputs-customer IS INITIAL AND gs_ppo_inputs-vendor IS INITIAL .
    MESSAGE e000.
  ENDIF.

  IF gs_ppo_inputs-date_from IS INITIAL.
    MESSAGE e001.
  ENDIF.
ENDFORM.                    "validate_ppo2_input
*&---------------------------------------------------------------------*
*&      Form  EXECUTE_PPO2_TRANSACTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM execute_ppo2_transaction .   ##CALLED
  CALL SCREEN 4000 STARTING AT 10 08 ENDING AT 70 10.
ENDFORM.                    "execute_ppo2_transaction
*&---------------------------------------------------------------------*
*&      Form  LOAD_OF_PROGRAM
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM load_of_program .
  FIELD-SYMBOLS: <fs_value> TYPE any.
  CALL METHOD cl_cvi_cockpit=>get_data
    IMPORTING
      et_stage = gt_stage_status
      et_task  = gt_task_details.

  "set the default tab
  READ TABLE gt_stage_status INTO gs_stage_status WITH KEY active_tab = abap_true.
  IF sy-subrc EQ 0.
    ts_cockpit-activetab = gs_stage_status-stage_artifact_id.
  ELSE.
    ts_cockpit-activetab = gc_tabstrip_fcode-validation.
  ENDIF.

  PERFORM  load_dummy IN PROGRAM (gc_cvi_load_program_name) IF FOUND.
  ASSIGN ('(CVI_LOAD_TOOL)TAB') TO <fs_value>.
  IF <fs_value> IS NOT ASSIGNED.
    MESSAGE a011 WITH '2812309'.
  ENDIF.
ENDFORM.                    "load_of_program
*&---------------------------------------------------------------------*
*&      Form  CALL_PPO2_TRANSACTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM call_ppo2_transaction .

  DATA : lt_bdcdata TYPE TABLE OF bdcdata.

  "prepare BDC data for MDS_PP02 transaction
  PERFORM prepare_input_data CHANGING lt_bdcdata.

  CALL FUNCTION 'ABAP4_CALL_TRANSACTION'
    EXPORTING
      tcode                   = 'MDS_PPO2'
      mode_val                = 'E'
    TABLES
      using_tab               = lt_bdcdata
    EXCEPTIONS
      call_transaction_denied = 1
      tcode_invalid           = 2
      OTHERS                  = 3.
  IF sy-subrc <> 0.
    MESSAGE e004.
  ELSE.
    CLEAR gs_ppo_inputs.
  ENDIF.
ENDFORM.                    "call_ppo2_transaction
*&---------------------------------------------------------------------*
*&      Form  ENQUEUE_COCKPIT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM enqueue_cockpit." CHANGING p_lv_subrc.
  CALL FUNCTION 'ENQUEUE_E_CVI_COCKPIT'
    EXPORTING
      task           = gc_cockpit_lock_arg
    EXCEPTIONS
      foreign_lock   = 1
      system_failure = 2
      OTHERS         = 3.
  IF sy-subrc <> 0.
    MESSAGE e009 WITH sy-msgv1.
  ENDIF.
ENDFORM.                    "enqueue_cockpit
*&---------------------------------------------------------------------*
*&      Form  DEQUEUE_COCKPIT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM dequeue_cockpit .
  CALL FUNCTION 'DEQUEUE_E_CVI_COCKPIT'
    EXPORTING
      task = gc_cockpit_lock_arg.
ENDFORM.                    "dequeue_cockpit
*&---------------------------------------------------------------------*
*&      Form  VALIDATE_AND_UPDATE_STATUS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM validate_and_update_status .
  DATA: lv_answer ,
        lv_ucomm      TYPE sy-ucomm.

  FIELD-SYMBOLS <lfs_stage_status> TYPE cl_cvi_cockpit=>ty_stage_details.

  IF sy-ucomm EQ gc_fcode-ok.
    " validate if the status entered is a valid on
    PERFORM validate_and_set_task_det USING gs_status_pop_det-status.

    " read the task details
    "if edit is pressed on the current allowed task then set the editable or else get a confirmation to reset
    READ TABLE gt_stage_status ASSIGNING <lfs_stage_status> WITH KEY stage_artifact_id = gs_status_pop_det-stage_artifact_id.
    IF sy-subrc EQ 0.
      IF <lfs_stage_status>-active_tab = abap_false AND gs_status_pop_det-status_icon <> cl_cvi_cockpit=>c_status-green.
        "get the confirmation from the user for reset
        CLEAR lv_answer.
        lv_ucomm = sy-ucomm.
        PERFORM get_reset_confirmation CHANGING lv_answer.
        IF lv_answer EQ '1'. " yes user has confirmed
          CALL METHOD cl_cvi_cockpit=>reset_subsequent_stages
            EXPORTING
              iv_stage         = <lfs_stage_status>-stage  " CVI cockpit stage
            IMPORTING
              et_cockpit_log   = gt_cockpit_log
            CHANGING
              ct_task_details  = gt_task_details
              ct_stage_details = gt_stage_status.
          sy-ucomm = lv_ucomm.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDIF.
ENDFORM.                    "validate_and_update_status
*&---------------------------------------------------------------------*
*&      Form  DETERMINE_UNSYNC_RECORDS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM determine_unsync_records .
  " Use GV_CUST and GV_VEND to populate the values
  CALL METHOD cl_cvi_cockpit=>get_unsynchronised_records
    IMPORTING
      ev_cust_unsync_count = gs_overall_status-cust_unsync_count
      ev_vend_unsync_count = gs_overall_status-vend_unsync_count.

  gs_overall_status-text_1 = TEXT-006.
  gs_overall_status-text_2 = TEXT-007.
ENDFORM.                    "determine_unsync_records
*&---------------------------------------------------------------------*
*&      Form  PREPARE_INPUT_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM prepare_input_data CHANGING ch_ppo_inputs TYPE bdcdata_tab.

  DATA: ls_bdcdata       TYPE bdcdata,
        lt_bdcdata       TYPE TABLE OF bdcdata,
        lv_date_external TYPE char10.

  ls_bdcdata-program = '/SAPPO/SAPLAPI_DIALOG_START'.
  ls_bdcdata-dynpro  = '0100'.
  ls_bdcdata-dynbegin = 'X'.
  APPEND ls_bdcdata TO lt_bdcdata.
  CLEAR ls_bdcdata.

  ls_bdcdata-fnam = 'BDC_OKCODE'.
  ls_bdcdata-fval = 'EXECUTE'.
  APPEND ls_bdcdata TO lt_bdcdata.
  CLEAR ls_bdcdata.

  IF gs_ppo_inputs-customer IS NOT INITIAL.   " If customer is selected
    ls_bdcdata-fnam = 'S_SEL3-LOW'. " Business process
    ls_bdcdata-fval = 'CVI_01'. " Customer to BP
    APPEND ls_bdcdata TO lt_bdcdata.
    CLEAR ls_bdcdata.
    IF gs_ppo_inputs-vendor IS NOT INITIAL .  " If customer + vendor is selected
      ls_bdcdata-fnam = 'S_SEL3-HIGH'.
      ls_bdcdata-fval = 'CVI_02'. " Vendor to BP
      APPEND ls_bdcdata TO lt_bdcdata.
      CLEAR ls_bdcdata.
    ENDIF.

  ELSEIF gs_ppo_inputs-vendor IS NOT INITIAL. " If only vendor is selected
    ls_bdcdata-fnam = 'S_SEL3-LOW'. " Business process
    ls_bdcdata-fval = 'CVI_02'. " Customer to BP
    APPEND ls_bdcdata TO lt_bdcdata.
    CLEAR ls_bdcdata.
  ENDIF.

  "convert the date to external format
  IF gs_ppo_inputs-date_from IS NOT INITIAL.
    PERFORM date_to_external USING    gs_ppo_inputs-date_from
                             CHANGING lv_date_external.
    ls_bdcdata-fval = lv_date_external.
  ENDIF.

  ls_bdcdata-fnam = 'S_SEL29-LOW'.
  APPEND ls_bdcdata TO lt_bdcdata.
  CLEAR ls_bdcdata.

  IF gs_ppo_inputs-date_to IS NOT INITIAL.
    CLEAR lv_date_external.
    PERFORM date_to_external USING    gs_ppo_inputs-date_to
                               CHANGING lv_date_external.
    ls_bdcdata-fval = lv_date_external.
  ENDIF.
  ls_bdcdata-fnam = 'S_SEL29-HIGH'.
  APPEND ls_bdcdata TO lt_bdcdata.
  CLEAR ls_bdcdata.

  ch_ppo_inputs = lt_bdcdata.
ENDFORM.                    "prepare_input_data
*&---------------------------------------------------------------------*
*&      Form  MODIFY_MAINSCREEN_UI_ELEMENTS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM modify_mainscreen_ui_elements .
  LOOP AT SCREEN.
    IF screen-name = 'PUSH_NEXT_STEPS'.
      IF gs_overall_status-overall_status_text = TEXT-005. "Checking with text instead of ICON due to type mismatch
        screen-input = 0.
        MODIFY SCREEN.
      ELSE.
        screen-input = 1.
        MODIFY SCREEN.
      ENDIF.
    ENDIF.
  ENDLOOP.
ENDFORM.                    "modify_mainscreen_ui_elements
*&---------------------------------------------------------------------*
*&      Form  DISPLAY_DOCU
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_HELP_OBJ  text
*      -->P_DOC_ID  text
*      -->P_LANGU   text
*----------------------------------------------------------------------*
FORM display_docu  USING    p_help_obj TYPE dokhl-object
                            p_doc_id TYPE dokhl-id
                            p_langu TYPE sy-langu.

  DATA: lt_tdline    TYPE TABLE OF tline,
        lt_exclude   TYPE TABLE OF rsnewleng-fcode,
        ls_help_info TYPE          help_info.

  CALL FUNCTION 'DOCU_GET_FOR_F1HELP'
    EXPORTING
      id       = p_doc_id
      langu    = p_langu
      object   = p_help_obj
    TABLES
      line     = lt_tdline
    EXCEPTIONS
      ret_code = 1
      OTHERS   = 2.
  IF sy-subrc <> 0.
    MESSAGE e004. "Error while processing
  ENDIF.
  CALL FUNCTION 'HELP_DOCULINES_SHOW'
    EXPORTING
      cucol      = 10
      curow      = 3
      help_infos = ls_help_info
    TABLES
      excludefun = lt_exclude
      helplines  = lt_tdline.
ENDFORM.                    "display_docu
