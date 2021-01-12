class CL_CVI_COCKPIT definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ty_fcode_navigation,
        fcode         TYPE sy-ucomm,
        nav_type      TYPE c LENGTH 10,
        is_executable TYPE abap_bool,  "--> if the target is executable tcode/report
        target        TYPE c LENGTH 220,
        param_1       TYPE c LENGTH 220,
      END OF ty_fcode_navigation .
  types:
    BEGIN OF ty_status_metadata,
        status      TYPE cvi_cockpit_status,
        icon        TYPE c LENGTH 4,
        status_text TYPE val_text,
      END OF ty_status_metadata .
  types:
    BEGIN OF ty_stage_details,
        stage             TYPE cvi_cockpit_stage,
        status            TYPE icon_d,
        stage_text        TYPE cvi_cockpit_staget,
        stage_artifact_id TYPE cvi_cockpit_artifact,
        edit_allowed      TYPE sap_bool,
        action_allowed    TYPE sap_bool,
        active_tab        TYPE sap_bool,
      END OF ty_stage_details .
  types:
    BEGIN OF ty_task_details.
        INCLUDE TYPE cvi_cockpit_stat AS db_status.
        TYPES : status_text       TYPE cvi_cockpit_statust,
        status_icon       TYPE icon_d,
        task_artifact_id  TYPE cvi_cockpit_artifact,
        stage_artifact_id TYPE cvi_cockpit_artifact,
        is_changed        TYPE c LENGTH 1,
      END OF ty_task_details .
  types:
    BEGIN OF ty_stage_metadata,
        stage             TYPE cvi_cockpit_stage,
        sequence          TYPE cvi_cockpit_stage_seq,
        stage_artifact_id TYPE cvi_cockpit_artifact,
        stage_text        TYPE cvi_cockpit_staget,
      END OF ty_stage_metadata .
  types:
    BEGIN OF ty_task_metadata,
        task              TYPE cvi_cockpit_task,
        stage             TYPE cvi_cockpit_stage,
        task_artifact_id  TYPE cvi_cockpit_artifact,
        stage_artifact_id TYPE cvi_cockpit_artifact,
        task_text         TYPE cvi_cockpit_taskt,
      END OF ty_task_metadata .
  types:
    tt_cockpit_log TYPE STANDARD TABLE OF cvi_cockpit_log .
  types:
    tt_task_details TYPE STANDARD TABLE OF ty_task_details .
  types:
    tt_stage_details TYPE STANDARD TABLE OF ty_stage_details .
  types:
    tt_stage_metadata TYPE STANDARD TABLE OF ty_stage_metadata .
  types:
    tt_task_metadata TYPE STANDARD TABLE OF ty_task_metadata .
  types:
    tt_status_metadata TYPE STANDARD TABLE OF ty_status_metadata .
  types:
    tt_fcode_rn   TYPE RANGE OF sy-ucomm .

  constants:
    BEGIN OF c_status,
        default     TYPE icon_d VALUE '@EB@', "  Light out; Undefined
        green       TYPE icon_d VALUE '@08@', "Green light; Go; OK
        yellow      TYPE icon_d VALUE '@09@', "Yellow light; Caution
        red         TYPE icon_d VALUE '@0A@', "Red light; Negative
        led_red     TYPE  icon_d VALUE  icon_led_red,
        led_yellow  TYPE  icon_d VALUE  icon_led_yellow,
        led_green   TYPE  icon_d VALUE  icon_led_green,
        led_default TYPE  icon_d VALUE  icon_status,
      END OF c_status .

  class-methods CLASS_CONSTRUCTOR .
  class-methods GET_DATA
    exporting
      !ET_STAGE type TT_STAGE_DETAILS
      !ET_TASK type TT_TASK_DETAILS .
  class-methods DETERMINE_STAGE_STATUS
    importing
      !IT_TASK_STATUS type TT_TASK_DETAILS
    exporting
      !ET_STAGE_STATUS type TT_STAGE_DETAILS .
  class-methods SAVE
    importing
      !IT_DATA type TT_TASK_DETAILS
      !IT_LOGS type TT_COCKPIT_LOG optional
    exporting
      !EV_SUBRC type SY-SUBRC .
  class-methods DISPLAY_LOGS
    importing
      !IV_STAGE type CVI_COCKPIT_STAGE
    exceptions
      NO_RECORD_FOUND
      ALV_ERROR .
  class-methods EXECUTE_ACTION
    importing
      !IV_STAGE_ARTIFACT_ID type CVI_COCKPIT_ARTIFACT
      !IV_OKCODE type SY-UCOMM
      !IV_ACTION type STRING
    exceptions
      PROCESSING_ERROR
      NO_RECORD_FOUND .
  class-methods RESET_SUBSEQUENT_STAGES
    importing
      value(IV_STAGE) type CVI_COCKPIT_STAGE
    exporting
      !ET_COCKPIT_LOG type TT_COCKPIT_LOG
    changing
      !CT_STAGE_DETAILS type TT_STAGE_DETAILS
      !CT_TASK_DETAILS type TT_TASK_DETAILS .
  class-methods GET_STATUS_DETAILS
    importing
      !IV_STATUS type CVI_COCKPIT_STATUS
    exporting
      !ES_STATUS_DETAILS type TY_STATUS_METADATA .
  class-methods DO_BEFORE_TASK_CHANGE
    importing
      !IS_TASK_DETAILS_OLD type TY_TASK_DETAILS
      !IS_TASK_DETAILS_NEW type TY_TASK_DETAILS
    exceptions
      VALIDATION_ERROR .
  class-methods GET_METADATA
    exporting
      !ET_STATUS type TT_STATUS_METADATA
      !ET_STAGE type TT_STAGE_METADATA
      !ET_TASK type TT_TASK_METADATA .
  class-methods GET_UNSYNCHRONISED_RECORDS
    exporting
      !EV_CUST_UNSYNC_COUNT type I
      !EV_VEND_UNSYNC_COUNT type I
      !EV_ALL_SYNCHRONIZED type SAP_BOOL .
  class-methods RETURN_APPLICABLE_FCODE
    returning
      value(RT_FCODE_RN) type TT_FCODE_RN .
protected section.
private section.

  constants:
    BEGIN OF c_navigation,
        url     TYPE char10 VALUE 'URL',
        img     TYPE char10 VALUE 'IMG',
        tcode   TYPE char10 VALUE 'TCODE',
        report  TYPE char10 VALUE 'REPORT',
        docu    TYPE char10 VALUE 'DOCU',
        routine TYPE char10 VALUE 'ROUTINE',
      END OF c_navigation .
  constants:
    BEGIN OF c_stage_prefix,
        logs TYPE string VALUE 'LOGS',
      END OF c_stage_prefix .
  constants:
    BEGIN OF c_task_prefix,
        exec TYPE string VALUE 'EXEC',
        info TYPE string VALUE 'INFO',
      END OF c_task_prefix .
  class-data ST_FCODE_LIST_RN type TT_FCODE_RN .
  class-data:
    St_fcode_navigation TYPE TABLE OF ty_fcode_navigation .
  class-data:
    St_status_mapping TYPE TABLE OF ty_status_metadata .
  class-data ST_STAGE_METADATA type TT_STAGE_METADATA .
  class-data ST_TASK_METADATA type TT_TASK_METADATA .

  class-methods DO_NAVIGATION
    importing
      !IV_OKCODE type SY-UCOMM
    exceptions
      MAPPING_NOT_MAINTAINED
      ERROR_WHILE_PROCESSING .
  class-methods GET_FCODES_MAPPING_CVI_LOAD
    returning
      value(FCODE_LIST) like ST_FCODE_NAVIGATION .
  class-methods SET_APPLICABLE_FCODES .
  class-methods EXECUTE_INFO_ACTION
    importing
      !IV_UCOMM type SY-UCOMM
    exceptions
      MAPPING_NOT_FOUND
      ERROR_WHILE_PROCESSING .
  class-methods SAVE_LOGS
    importing
      !IT_COCKPIT_STATUS type TT_TASK_DETAILS
      !IT_LOGS type TT_COCKPIT_LOG optional
    exporting
      !EV_SUBRC type SY-SUBRC .
  class-methods SET_METADATA .
  class-methods MAINTAIN_NAVIGATION_MAPPING .
  class-methods DO_BEFORE_TASK_CNG_CVI_LOAD
    importing
      !IS_TASK_DETAILS_OLD type TY_TASK_DETAILS
      !IS_TASK_DETAILS_NEW type TY_TASK_DETAILS
    exceptions
      VALIDATION_ERROR .
  class-methods DO_BEFORE_ACTION
    importing
      !IV_OKCODE type SYUCOMM
      !IV_STAGE_ARTIFACT_ID type CVI_COCKPIT_ARTIFACT
    exceptions
      TERMINATE_ACTION .
  class-methods DO_BEFORE_ACTION_CVI_LOAD
    importing
      !IV_OKCODE type SYUCOMM
    exceptions
      TERMINATE_ACTION .
ENDCLASS.



CLASS CL_CVI_COCKPIT IMPLEMENTATION.


METHOD class_constructor.
  "maintain the navigation mapping for all the exec and info buttons
  maintain_navigation_mapping( ).

  "set the metadata for status, Task & stages
  set_metadata( ).

  "set applicable fcodes for both Task and stage
  set_applicable_fcodes( ).

  ENDMETHOD.                    "class_constructor


METHOD determine_stage_status.
"**********************************************************************************
"Based on each task for all stage, all stage status will be determine
"Also following flag will be set at TASK level
"     Each task EDIT button
"     Action is allowed or not at task level
"     which stage should active
"**********************************************************************************
  TYPES: BEGIN OF ty_stage_task_list,
           stage            TYPE cvi_cockpit_stage,
           task             TYPE cvi_cockpit_task,
           task_status_icon TYPE icon_d,
         END OF ty_stage_task_list.

  DATA : lt_stage_task_list     TYPE TABLE OF ty_stage_task_list,
         ls_stage_task_list     TYPE          ty_stage_task_list,
         ls_task_status         TYPE          ty_task_details,
         lv_is_all_task_green   TYPE          sap_bool,
         lt_stage_metadata      TYPE          tt_stage_metadata,
         ls_stage_metadata      TYPE          ty_stage_metadata,
         lv_is_subsequent_stage TYPE          sap_bool,
         ls_stage_details       TYPE          ty_stage_details,
         lt_curr_stage_det      TYPE          tt_stage_details.

  FIELD-SYMBOLS <lfs_stage_status> TYPE ty_stage_details.

  "stote the current stage status in local table - will be used at the end
  lt_curr_stage_det = et_stage_status.

  CLEAR et_stage_status.


  "prepare all task, stage & icon - in define sequence so that control break processing can be applied
  LOOP AT it_task_status INTO ls_task_status.
    ls_stage_task_list-stage = ls_task_status-stage .
    ls_stage_task_list-task = ls_task_status-task .
    ls_stage_task_list-task_status_icon = ls_task_status-status_icon.
    APPEND ls_stage_task_list TO lt_stage_task_list.
  ENDLOOP.

  CLEAR et_stage_status.
  SORT lt_stage_task_list BY stage.

  lt_stage_metadata = ST_stage_metadata. "Metadata or Stage Master
  LOOP AT lt_stage_task_list INTO ls_stage_task_list .
    AT NEW stage.
      "For each stage - assume all task are green
      lv_is_all_task_green = abap_true.
    ENDAT.

    "in case one of the task are not green - set the flag to false
    IF ls_stage_task_list-task_status_icon <> c_status-green.
      lv_is_all_task_green = abap_false.
    ENDIF.

    AT END OF stage.

      APPEND INITIAL LINE TO et_stage_status ASSIGNING <lfs_stage_status>.
      ASSERT <lfs_stage_status> IS ASSIGNED. " never expected !!!

      "set STAGE level information
      <lfs_stage_status>-stage = ls_stage_task_list-stage.
      READ TABLE lt_stage_metadata INTO ls_stage_metadata WITH KEY stage = ls_stage_task_list-stage.
      IF sy-subrc EQ 0.
        <lfs_stage_status>-stage_text = ls_stage_metadata-stage_text.
        <lfs_stage_status>-stage_artifact_id = ls_stage_metadata-stage_artifact_id.
      ENDIF.

      "Fist check the flag to be TRUE -> means all task under this stage are GREEN,then stage status is green
      IF lv_is_all_task_green EQ abap_true.
        <lfs_stage_status>-status = c_status-led_green.
        CONTINUE.
      ENDIF.

      "if one of the task status is RED, then stage status is RED
      READ TABLE it_task_status WITH KEY stage = <lfs_stage_status>-stage status_icon = c_status-red TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        <lfs_stage_status>-status = c_status-led_red.
        CONTINUE.
      ENDIF.

      "if one of the task status is YELLOW, then stage status is YELLOW
      READ TABLE it_task_status WITH KEY stage = <lfs_stage_status>-stage status_icon = c_status-yellow TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        <lfs_stage_status>-status = c_status-led_yellow.
        CONTINUE.
      ENDIF.

      "**** at this stage there are no RED, YELLOW & All GREEN
      "****Then check if there is atleast one GREEN - if Yes set the status as YELLOW
      "When one or more task is green but not all, then stage status is yellow
      READ TABLE it_task_status WITH KEY stage = <lfs_stage_status>-stage status_icon = c_status-green TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        <lfs_stage_status>-status = c_status-led_yellow.
        CONTINUE.
      ENDIF.

      "if none of the above conditioned satisfied, then tab status should be defaulted to undefined : Lights out
      <lfs_stage_status>-status = c_status-led_default.
    ENDAT.
  ENDLOOP.

  "*******************************************************************************************************************
  "Determine each stage's editable behaviour
  "All the subsequent stage followed by the running one should be disabled
  "*******************************************************************************************************************
  SORT lt_stage_metadata BY sequence ASCENDING.
  "lv_is_subsequent_stage -> Flag to indicate Nth+ steps
  "Edit button(lv_is_subsequent_stage) is not required for all stage followed by current/running stage(not green)
  "traverse STAGE wise starting from first stage and on occurance of any NON-GREEN - implies to be current(Nth) stage
  LOOP AT lt_stage_metadata INTO ls_stage_metadata.
    CHECK lv_is_subsequent_stage = abap_false.
    READ TABLE et_stage_status ASSIGNING <lfs_stage_status> WITH KEY stage = ls_stage_metadata-stage.
    IF sy-subrc EQ 0.
      <lfs_stage_status>-edit_allowed = abap_true. "Enable the edit button from 1st till Nth Stage
      IF <lfs_stage_status>-status <> c_status-led_green.
        lv_is_subsequent_stage = abap_true.
        <lfs_stage_status>-active_tab = abap_true.
        "check if the Edit is already enabled from UI
        "lt_curr_stage_det -> points to current state of stage from UI
        READ TABLE lt_curr_stage_det INTO ls_stage_details WITH KEY stage = <lfs_stage_status>-stage.
        IF sy-subrc EQ 0 .
          <lfs_stage_status>-action_allowed = ls_stage_details-action_allowed.
        ENDIF.
      ENDIF.
    ENDIF.
    AT LAST.
      "if lv_is_subsequent_stage is not set-> means last tab is currently being processed.
      "so set active_tab as true
      IF lv_is_subsequent_stage EQ abap_false.
        <lfs_stage_status>-active_tab = abap_true.
      ENDIF.
    ENDAT.
  ENDLOOP.
  ENDMETHOD.                    "determine_stage_status


METHOD display_logs.
  TYPES : BEGIN OF ty_log.
            INCLUDE TYPE cvi_cockpit_log AS log.
            TYPES : task_text   TYPE cvi_cockpit_taskt,
            status_text TYPE cvi_cockpit_statust,
          END OF ty_log.

  DATA : lt_logs             TYPE TABLE OF  ty_log,
         lo_alv              TYPE REF TO    cl_salv_table,
         lr_functions        TYPE REF TO    cl_salv_functions_list,
         lr_columns          TYPE REF TO    cl_salv_columns_list,
         lr_column           TYPE REF TO    cl_salv_column_table,
         lr_display_settings TYPE REF TO    cl_salv_display_settings,
         ls_task_metadata    TYPE           cl_cvi_cockpit=>ty_task_metadata,
         lt_task_metadata    TYPE           cl_cvi_cockpit=>tt_task_metadata,
         ls_status_metadata  TYPE           cl_cvi_cockpit=>ty_status_metadata,
         lt_tasks            TYPE TABLE OF  cvi_cockpit_task,
         lr_groups           TYPE REF TO cl_salv_sorts,
         lv_column_text_s    TYPE            scrtext_s,
         lv_column_text_m    TYPE            scrtext_m,
         lv_column_text_l    TYPE            scrtext_l.

  FIELD-SYMBOLS : <fs_log> TYPE ty_log.

  CLEAR: lv_column_text_s,lv_column_text_m,lv_column_text_l.
  "get all possible TASK for the STAGE
  CALL METHOD cl_cvi_cockpit=>get_metadata
    IMPORTING
      et_task = lt_task_metadata.

  IF lt_task_metadata IS NOT INITIAL.

      LOOP AT lt_task_metadata INTO ls_task_metadata WHERE stage = iv_stage .
        APPEND ls_task_metadata-task TO lt_tasks.
      ENDLOOP.

    "All fields are required - hence doing select *
    SELECT * FROM cvi_cockpit_log INTO TABLE lt_logs FOR ALL ENTRIES IN lt_tasks WHERE task = lt_tasks-table_line. "#EC CI_NOFIELD
  ENDIF.

  IF lt_logs IS INITIAL.
    RAISE no_record_found.
  ENDIF.

  SORT lt_logs BY task changed_on DESCENDING changed_at DESCENDING.

  " Map task and status description
  LOOP AT lt_logs ASSIGNING <fs_log>.
    READ TABLE lt_task_metadata INTO ls_task_metadata WITH KEY task = <fs_log>-task.
    IF sy-subrc = 0.
      <fs_log>-task_text = ls_task_metadata-task_text.
    ENDIF.

    READ TABLE st_status_mapping INTO ls_status_metadata WITH KEY status = <fs_log>-status.
    IF sy-subrc = 0.
      <fs_log>-status_text = ls_status_metadata-status_text.
    ENDIF.
  ENDLOOP.


  TRY.
      cl_salv_table=>factory(
        IMPORTING
          r_salv_table = lo_alv
        CHANGING
          t_table      = lt_logs[] ).
    CATCH cx_salv_msg.
      RAISE alv_error.
  ENDTRY.

  IF lo_alv IS BOUND.
    " keep only the required functions
    lr_functions = lo_alv->get_functions( ).
    lr_functions->set_filter( abap_true ).
    lr_functions->set_sort_desc( abap_true ).
    lr_functions->set_sort_asc( abap_true ).
    lr_functions->set_find( abap_true ).


    TRY .
        "For below columns - set visiblity as FALSE
        lr_columns = lo_alv->get_columns( ).
        lr_column ?= lr_columns->get_column('GUID').
        lr_column->set_visible( abap_false ).
        lr_column ?= lr_columns->get_column('TASK').
        lr_column->set_visible( abap_false ).
        lr_column ?= lr_columns->get_column('MANDT').
        lr_column->set_visible( abap_false ).
        lr_column ?= lr_columns->get_column('STATUS').
        lr_column->set_visible( abap_false ).

        lr_column ?= lr_columns->get_column('COMMENTS').
        lr_column->set_output_length('30').

        lr_columns->set_column_position(
            columnname = 'STATUS_TEXT'
            position   = 2
        ).
        lr_column ?= lr_columns->get_column('STATUS_TEXT').
        lr_column->set_output_length('15').
        lv_column_text_s = lv_column_text_m = lv_column_text_l = TEXT-004.
        lr_column->set_short_text( lv_column_text_s ).
        lr_column->set_medium_text( lv_column_text_m ).
        lr_column->set_long_text( lv_column_text_l ).
        CLEAR: lv_column_text_s,lv_column_text_m,lv_column_text_l.

        lr_columns->set_column_position(
            columnname = 'TASK_TEXT'
            position   = 1
        ).
        lr_columns->set_key_fixation( abap_true ).
        lr_column ?= lr_columns->get_column('TASK_TEXT').
        lr_column->set_output_length('28').
        lv_column_text_s = lv_column_text_m = lv_column_text_l = TEXT-005.
        lr_column->set_short_text( lv_column_text_s ).
        lr_column->set_medium_text( lv_column_text_m ).
        lr_column->set_long_text( lv_column_text_l ).
        lr_column->set_key( abap_true ).
        CLEAR: lv_column_text_s,lv_column_text_m,lv_column_text_l.


        lr_column ?= lr_columns->get_column('CHANGED_AT').
        lv_column_text_s = lv_column_text_m = lv_column_text_l = TEXT-006.
        lr_column->set_short_text( lv_column_text_s ).
        lr_column->set_medium_text( lv_column_text_m ).
        lr_column->set_long_text( lv_column_text_l ).
        CLEAR: lv_column_text_s,lv_column_text_m,lv_column_text_l.

        lr_groups = lo_alv->get_sorts( ) .
        lr_groups->clear( ).

        TRY.
            lr_groups->add_sort(
            columnname = 'TASK_TEXT'
            position   = 1
            sequence   = if_salv_c_sort=>sort_up ).

          CATCH cx_salv_not_found cx_salv_data_error cx_salv_existing.
            RAISE alv_error.
        ENDTRY.

        " Change pop-up header
        lr_display_settings = lo_alv->get_display_settings( ).
        lr_display_settings->set_list_header( TEXT-007 ).

      CATCH cx_salv_not_found.
        RAISE alv_error.
    ENDTRY.

    lo_alv->set_screen_popup(
      start_column = 25
      end_column  = 120
      start_line  = 6
      end_line    = 20 ).

      TEST-SEAM logs. end-TEST-SEAM.
      lo_alv->display( ).
  ENDIF.
ENDMETHOD.


METHOD do_before_action.
  DATA lv_hide_cvi_sync TYPE sap_bool VALUE 'X'.
    IF iv_stage_artifact_id <> 'LOAD'.
    IF iv_okcode = 'EXEC-PREP_AC'.
      "set the flag in ABAP Memory - this will be used in SCREEN 100 of program CVI_UPGRADE_CHECK_RESOLVE
      "to hide the CVI Synchronization option
      EXPORT lv_hide_cvi_sync FROM lv_hide_cvi_sync TO MEMORY ID 'HIDE_CVI_SYNC'.
    ENDIF.
  ELSE.
    CALL METHOD do_before_action_cvi_load
      EXPORTING
        iv_okcode        = iv_okcode            " Function Code
      EXCEPTIONS
        terminate_action = 1                " Abort the action
        OTHERS           = 2.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 RAISING terminate_action.
    ENDIF.
  ENDIF.
  ENDMETHOD.                    "do_before_action


METHOD DO_BEFORE_ACTION_CVI_LOAD.

  IF IV_OKCODE = 'EXEC-LOAD_LTOOL'.
    CALL FUNCTION 'CVI_SET_MIGRATION_CHECK'
        EXPORTING
          lv_migration_check       = 'X'.
   ENDIF.

  ENDMETHOD.                    "DO_BEFORE_ACTION_CVI_LOAD


METHOD do_before_task_change.
  "Below method is only meant to be called for CVI_LOAD tab
  IF is_task_details_old-stage = '03'.
    CALL METHOD do_before_task_cng_cvi_load
      EXPORTING
        is_task_details_old = is_task_details_old
        is_task_details_new = is_task_details_new
      EXCEPTIONS
        validation_error    = 1                " Undo the changes and revert back to previous
        OTHERS              = 2.
    IF sy-subrc <> 0.
      CASE sy-subrc.
        WHEN 1.
          MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 RAISING validation_error.
      ENDCASE.
    ENDIF.
  ENDIF.
  ENDMETHOD.                    "do_before_task_change


METHOD DO_BEFORE_TASK_CNG_CVI_LOAD.

  DATA: lt_cust      type  kna1_key_t,
        lt_vend      TYPE  lfa1_key_t,
        lt_cust_cont type  kna1_key_t,
        lt_vend_cont TYPE  lfa1_key_t,
        lv_answer(1) type c.

  TYPES: ty_return_code TYPE i,
         BEGIN OF ty_preprocessing_check_result,
           software_component    TYPE dlvunit,
           check_id              TYPE c LENGTH 40,   "to be chosen as needed
           description           TYPE c LENGTH 255,  " must contain the SAP note that describes the check, provides further information and how to deal with possible problems.
           return_code           TYPE ty_return_code,
           application_component TYPE ufps_posid,    " Application component for BCP customer incident, if the customer has to open a ticket with questions about the check.
         END   OF ty_preprocessing_check_result .

  DATA : lt_check_results  TYPE TABLE OF ty_preprocessing_check_result.

  IF is_task_details_new-stage = '03'.

    IF ( is_task_details_new-task = '07' ) AND ( is_task_details_new-status_icon = c_status-green ).

      CALL METHOD cl_s4_checks_bp_enh=>check_cvi_mapping
        IMPORTING
          et_cust          = lt_cust
          et_vend          = lt_vend
        CHANGING
          ct_check_results = lt_check_results.

      CALL METHOD cl_s4_checks_bp_enh=>CHECK_CONTACT_PERSON_MAPPING
        IMPORTING
          et_cust_cont     = lt_cust_cont
          et_vend_cont     = lt_vend_cont
        CHANGING
          ct_check_results = lt_check_results.

        TEST-SEAM cng_load.

        end-TEST-SEAM.
        IF lt_cust IS NOT INITIAL OR lt_vend IS NOT INITIAL OR lt_cust_cont IS NOT INITIAL OR lt_vend_cont IS NOT INITIAL.

        CALL FUNCTION 'POPUP_TO_CONFIRM'
          EXPORTING
            titlebar      = text-002
            text_question = text-003
          IMPORTING
            answer        = lv_answer.

        IF lv_answer NE '1'.  "If answer is not yes
         MESSAGE s010(cvi_cockpit) RAISING VALIDATION_ERROR.
        ENDIF.

      ENDIF.
    ENDIF.
  ENDIF.

  ENDMETHOD.


METHOD do_navigation.

  DATA : ls_fcode_navigation TYPE ty_fcode_navigation,
         lv_parent_node_id   TYPE ttree-id,
         lv_child_node_id    TYPE hier_iface-node_id,
           lv_tcode            TYPE sy-tcode,
           lt_rsmp_check       TYPE TABLE OF rsmp_check.

  "read the target navigation, in case not found - raise an exception

    READ TABLE st_fcode_navigation WITH KEY fcode = iv_okcode INTO ls_fcode_navigation.
  IF sy-subrc <> 0.
    MESSAGE e004(cvi_cockpit) RAISING mapping_not_maintained.
  ENDIF.

  "based on the mapping - do the reguired navigation
  CASE ls_fcode_navigation-nav_type.
    WHEN c_navigation-url. "URL navigation
        TEST-SEAM navigation_1.end-TEST-SEAM.

        CALL FUNCTION 'CALL_BROWSER'
        EXPORTING
          url                    = ls_fcode_navigation-target
          window_name            = ' '
          new_window             = 'X'
        EXCEPTIONS
          frontend_not_supported = 1
          frontend_error         = 2
          prog_not_found         = 3
          no_batch               = 4
          unspecified_error      = 5
          OTHERS                 = 6.
      IF sy-subrc <> 0.
        MESSAGE e004(cvi_cockpit) RAISING error_while_processing.
      ENDIF.

    WHEN c_navigation-tcode. " Transaction Navigation
      lv_tcode = ls_fcode_navigation-target.
        "check if the transaction code exists
       CALL FUNCTION 'RS_TRANSACTION_INCONSISTENCIES'
         EXPORTING
           transaction_code       = lv_tcode
         tables
           error_list             = lt_rsmp_check
        EXCEPTIONS
          object_not_found       = 1
          OTHERS                 = 2 .
       IF sy-subrc <> 0.
         IF sy-subrc EQ 1 AND ls_fcode_navigation-param_1 IS NOT INITIAL.
           "variable ls_fcode_navigation-param_1 holds the respective note#
           MESSAGE s011(cvi_cockpit) WITH ls_fcode_navigation-param_1 RAISING error_while_processing.
         else.
           MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 RAISING error_while_processing.
         ENDIF.
       ENDIF.

       "check if the user is having required authorization
       CALL FUNCTION 'AUTHORITY_CHECK_TCODE'
         EXPORTING
           tcode         = lv_tcode
        EXCEPTIONS
          ok            = 1
          not_ok        = 2
          OTHERS        = 3.
       IF sy-subrc <> 1.
         MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 RAISING error_while_processing.
       ENDIF.

        TEST-SEAM navigation_2. end-TEST-SEAM.
        CALL FUNCTION 'ABAP4_CALL_TRANSACTION'
        EXPORTING
          tcode                   = lv_tcode
        EXCEPTIONS
          call_transaction_denied = 1
          tcode_invalid           = 2
          OTHERS                  = 3.
      IF sy-subrc <> 0.
          MESSAGE e004(cvi_cockpit) RAISING error_while_processing.
      ENDIF.
    WHEN c_navigation-img. " SPRO navigation
      lv_parent_node_id = ls_fcode_navigation-target.
      lv_child_node_id = ls_fcode_navigation-param_1.
        TEST-SEAM navigation_3. end-TEST-SEAM.
        TRY .
          CALL FUNCTION 'STREE_BROWSER_DYNP_HC'
            EXPORTING
              structure_id     = lv_parent_node_id
              position_on_node = lv_child_node_id.
        CATCH cx_root.
          MESSAGE e004(cvi_cockpit) RAISING error_while_processing.
      ENDTRY.

    WHEN c_navigation-docu.
      CALL METHOD execute_info_action
        EXPORTING
          iv_ucomm               = iv_okcode                 " ABAP-Systemfeld: Funktionscode, der PAI ausgelöst hat
        EXCEPTIONS
          mapping_not_found      = 1                " Mapping not maintained
          error_while_processing = 2                " Error while executing the action
          OTHERS                 = 3.
      IF sy-subrc <> 0.
        CASE sy-subrc.
          WHEN 1.
            MESSAGE e004(cvi_cockpit) RAISING mapping_not_maintained.
          WHEN 2.
            MESSAGE e004(cvi_cockpit) RAISING error_while_processing.
        ENDCASE.
      ENDIF.


      WHEN c_navigation-routine.
        TEST-SEAM navigation_4. end-TEST-SEAM.
      PERFORM  (ls_fcode_navigation-target) IN PROGRAM (ls_fcode_navigation-param_1) IF FOUND.
    WHEN OTHERS.
      MESSAGE e004(cvi_cockpit) RAISING error_while_processing.
  ENDCASE.

  ENDMETHOD.


METHOD execute_action.
  DATA ls_stage_metadata TYPE ty_stage_metadata.

  "Any processing that is required before doing the actual action call
  CALL METHOD do_before_action
    EXPORTING
      iv_okcode            = iv_okcode               " Function Code
      iv_stage_artifact_id = iv_stage_artifact_id              " Artifact Id - Alias name
    EXCEPTIONS
      terminate_action     = 1                " Abort the action
      OTHERS               = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 RAISING processing_error.
  ENDIF.

  CASE iv_action.
    WHEN c_task_prefix-exec OR c_task_prefix-info. "For Exe and Info button
      do_navigation(
        EXPORTING
          iv_okcode            =   iv_okcode                " ABAP-Systemfeld: Funktionscode, der PAI ausgelöst hat
        EXCEPTIONS
          mapping_not_maintained     = 1                " Error while navigating
          error_while_processing     = 2                " Navigation mapping not found
          OTHERS                     = 3
      ).
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 RAISING processing_error.
      ENDIF.

    WHEN c_stage_prefix-logs. " on click of Log Button
      READ TABLE st_stage_metadata INTO ls_stage_metadata WITH KEY stage_artifact_id = iv_stage_artifact_id.
      IF sy-subrc EQ 0.
        CALL METHOD cl_cvi_cockpit=>display_logs
          EXPORTING
            iv_stage        = ls_stage_metadata-stage                " CVI cockpit stage
          EXCEPTIONS
            no_record_found = 1                " No log found
            alv_error       = 2                " Error while displaying ALV
            OTHERS          = 3.
        IF sy-subrc <> 0.
          IF sy-subrc EQ 1.
            MESSAGE e005(cvi_cockpit) RAISING no_record_found.
          ELSE.
            MESSAGE e004(cvi_cockpit) RAISING processing_error.
          ENDIF.
        ENDIF.
      ENDIF.
    WHEN OTHERS.
  ENDCASE.
  ENDMETHOD.                    "execute_action


METHOD execute_info_action.

  DATA :lv_help_object      TYPE          dokhl-object,
        ls_help_info        TYPE          help_info,
        ls_fcode_navigation TYPE          ty_fcode_navigation,
        lv_doc_id           TYPE          dokhl-id,
        lt_exclude          TYPE TABLE OF rsnewleng-fcode,
        lt_tdline           TYPE TABLE OF tline.

  "read the document details
  READ TABLE ST_fcode_navigation WITH KEY fcode = iv_ucomm INTO ls_fcode_navigation.
  IF sy-subrc <> 0.
    RAISE mapping_not_found.
  ENDIF.

  lv_help_object = ls_fcode_navigation-target.
  lv_doc_id = ls_fcode_navigation-param_1.
  CALL FUNCTION 'DOCU_GET_FOR_F1HELP'
    EXPORTING
      id       = lv_doc_id
        langu    = sy-langu
      object   = lv_help_object
    TABLES
      line     = lt_tdline
    EXCEPTIONS
      ret_code = 1
      OTHERS   = 2.
  IF sy-subrc <> 0.
    RAISE error_while_processing.
  ENDIF.

    TEST-SEAM info_actn.  end-TEST-SEAM.
    CALL FUNCTION 'HELP_DOCULINES_SHOW'
    EXPORTING
      cucol      = 10
      curow      = 3
      help_infos = ls_help_info
    TABLES
      excludefun = lt_exclude
      helplines  = lt_tdline.
ENDMETHOD.


METHOD get_data.
  DATA :ls_task_metadata  TYPE          ty_task_metadata,
        lt_status_db      TYPE TABLE OF cvi_cockpit_stat,
        ls_status_db      TYPE          cvi_cockpit_stat,
        ls_task_details   TYPE          ty_task_details,
        ls_status_mapping LIKE LINE OF  st_status_mapping.
  "****************************************************************************************************
  "Prepare the details for task
  "****************************************************************************************************
  CLEAR : et_stage, et_task.
  CHECK st_task_metadata IS NOT INITIAL. " this is never expected

  "select all the tasks from the DB
  "select without any where cond performed as all enteries are required and als this table is expected to have maximum of ~15-30 entries
  SELECT * FROM cvi_cockpit_stat INTO TABLE lt_status_db. "#EC CI_NOWHERE
  "iterate through the tasks list and overwrite if record found in DB
  LOOP AT st_task_metadata INTO ls_task_metadata.
    "check if there is an entry in DB
    READ TABLE lt_status_db INTO ls_status_db WITH KEY task = ls_task_metadata-task.
    IF sy-subrc EQ 0.
      ls_task_details-db_status = ls_status_db.
    ELSE. "assign default values
      ls_task_details-task = ls_task_metadata-task.
      ls_task_details-stage = ls_task_metadata-stage.
      ls_task_details-status = '01'. "default status : undefined
    ENDIF.
    ls_task_details-task_artifact_id = ls_task_metadata-task_artifact_id.
    ls_task_details-stage_artifact_id = ls_task_metadata-stage_artifact_id.
    "read icon mapped with status.
    READ TABLE st_status_mapping INTO ls_status_mapping WITH KEY status = ls_task_details-status.
    IF sy-subrc = 0.
      ls_task_details-status_icon = ls_status_mapping-icon.
      ls_task_details-status_text = ls_status_mapping-status_text.
    ENDIF.
    APPEND ls_task_details  TO et_task.
    CLEAR ls_task_details.
  ENDLOOP.

  "****************************************************************************************************
  "Prepare the details for the task
  "****************************************************************************************************
  determine_stage_status(
    EXPORTING
      it_task_status  = et_task
    IMPORTING
      et_stage_status = et_stage
  ).
  ENDMETHOD.                    "get_data


METHOD GET_FCODES_MAPPING_CVI_LOAD.
   "data declaration
  DATA : ls_fcode_map       TYPE ty_fcode_navigation,
         lt_cvi_load_fcodes TYPE TABLE OF  ty_fcode_navigation.

  "start of mapping for all fcodes with respective target navigation
  ls_fcode_map-fcode = 'EXEC-LOAD_PREIN'.
  ls_fcode_map-nav_type = c_navigation-tcode.
  ls_fcode_map-target = 'CRMC_BUT_CALL_FU'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-LOAD_BLKTR'.
  ls_fcode_map-nav_type = c_navigation-tcode.
  ls_fcode_map-target = 'SM01_CUS'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-LOAD_FI'.
  ls_fcode_map-nav_type = c_navigation-url.
  ls_fcode_map-target = 'https://launchpad.support.sap.com/#/notes/2821676'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-LOAD_LTOOL'.
  ls_fcode_map-nav_type = c_navigation-tcode.
  ls_fcode_map-target = 'MDS_LOAD_COCKPIT'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-LOAD_CCHK'.
  ls_fcode_map-nav_type = c_navigation-tcode.
  ls_fcode_map-target = 'CVI_COMPL_CHK'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-LOAD_PPO'.
  ls_fcode_map-nav_type = c_navigation-routine.
  ls_fcode_map-target = 'EXECUTE_PPO2_TRANSACTION'.
  ls_fcode_map-param_1 = 'CVI_COCKPIT'.
  ls_fcode_map-is_executable = abap_true.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-LOAD_POSIN'.
  ls_fcode_map-nav_type = c_navigation-tcode.
  ls_fcode_map-target = 'CRMC_BUT_CALL_FU'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-LOAD_RELTR'.
  ls_fcode_map-nav_type = c_navigation-tcode.
  ls_fcode_map-target = 'SM01_CUS'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

    ls_fcode_map-fcode = 'EXEC-LOAD_RELTR'.
  ls_fcode_map-nav_type = c_navigation-tcode.
  ls_fcode_map-target = 'SM01_CUS'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-LOAD_PREIN'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'ACT_DEAC_INT_HELP'.
  ls_fcode_map-param_1 = 'TX'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-LOAD_BLKTR'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'BMT_HELP'.
  ls_fcode_map-param_1 = 'TX'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-LOAD_FI'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'FI_HELP'.
  ls_fcode_map-param_1 = 'TX'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-LOAD_LTOOL'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'REAL_LOAD_HELP'.
  ls_fcode_map-param_1 = 'TX'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-LOAD_PPO'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'PPO_ORDER_HELP'.
  ls_fcode_map-param_1 = 'TX'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-LOAD_CCHK'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'CVI_COMP_CHK'.
  ls_fcode_map-param_1 = 'TX'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.


  ls_fcode_map-fcode = 'INFO-LOAD_POSIN'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'ACT_INT_HELP'.
  ls_fcode_map-param_1 = 'TX'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-LOAD_RELTR'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'RMT_HELP'.
  ls_fcode_map-param_1 = 'TX'.
  APPEND ls_fcode_map TO lt_cvi_load_fcodes.
  CLEAR ls_fcode_map.

  fcode_list = lt_cvi_load_fcodes.
  ENDMETHOD.                    "GET_FCODES_MAPPING_CVI_LOAD


METHOD get_metadata.
  CLEAR :et_status,et_stage,et_task.

  et_status = st_status_mapping.
  et_stage = st_stage_metadata.
  et_task = st_task_metadata.
  ENDMETHOD.                    "get_metadata


METHOD get_status_details.
  READ TABLE  ST_status_mapping INTO es_status_details WITH KEY status = iv_status .
  ENDMETHOD.                    "get_status_details


METHOD get_unsynchronised_records.
  DATA : lt_check_results  TYPE cl_s4_checks_bp_enh=>tt_preprocessing_check_results,
         lt_kna1           TYPE kna1_key_t,
         lt_lfa1           TYPE lfa1_key_t.

  CLEAR : ev_cust_unsync_count,ev_vend_unsync_count, ev_all_synchronized.

  CALL METHOD cl_s4_checks_bp_enh=>check_cvi_mapping
    IMPORTING
      et_cust          = lt_kna1
      et_vend          = lt_lfa1
    CHANGING
      ct_check_results = lt_check_results.

  DESCRIBE TABLE lt_kna1 LINES ev_cust_unsync_count.
  DESCRIBE TABLE lt_lfa1 LINES ev_vend_unsync_count.

  IF ( ev_cust_unsync_count + ev_vend_unsync_count ) GT 0.
    ev_all_synchronized = abap_false.
  ELSE.
    ev_all_synchronized = abap_true.
  ENDIF.

ENDMETHOD.                    "get_unsynchronised_records


METHOD maintain_navigation_mapping.
  DATA : ls_fcode_map       TYPE            ty_fcode_navigation,
         lt_cvi_load_fcodes TYPE TABLE OF   ty_fcode_navigation.
  "********************************************************************
  "Mapping for the Execute Buttons                                    *
  "********************************************************************
  "start of mapping for all fcodes with respective target navigation
  ls_fcode_map-fcode = 'EXEC-VALD_NC'.
  ls_fcode_map-nav_type = c_navigation-url.
  ls_fcode_map-target = 'https://launchpad.support.sap.com/#/notes/2823648'.
  ls_fcode_map-is_executable = abap_false.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-VALD_LIB'.
  ls_fcode_map-nav_type = c_navigation-url.
  ls_fcode_map-target = 'https://launchpad.support.sap.com/#/notes/2823632'.
  ls_fcode_map-is_executable = abap_false.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-PREP_MDC'.
  ls_fcode_map-nav_type = c_navigation-tcode.
  ls_fcode_map-target = 'CVI_PRECHK'.
  ls_fcode_map-is_executable = abap_true.
  ls_fcode_map-param_1 = '2743494'.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-PREP_AC'.
  ls_fcode_map-nav_type = c_navigation-tcode.
  ls_fcode_map-target = 'CVI_CUSTOMIZING_CHK'.
  ls_fcode_map-is_executable = abap_true.
  ls_fcode_map-param_1 = '2344034'.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-PREP_SUP'.
  ls_fcode_map-nav_type = c_navigation-img.
  ls_fcode_map-target = '4243699C42AB1681E10000000A114E5A'. "GUID for IMG tree for 'Activate checks suppression'
  ls_fcode_map-param_1 = '9BA1385035171ED98D9820CAFEED4402'.
  ls_fcode_map-is_executable = abap_true.  " To be decided
  ls_fcode_map-param_1 = '2780288'.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-UPGD_PPO'.
  ls_fcode_map-nav_type = c_navigation-routine.
  ls_fcode_map-target = 'EXECUTE_PPO2_TRANSACTION'.
  ls_fcode_map-param_1 = 'CVI_COCKPIT'.
  ls_fcode_map-is_executable = abap_true.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'EXEC-UPGD_PRECK'.
  ls_fcode_map-nav_type = c_navigation-tcode.
  ls_fcode_map-target = 'CVI_PRECHECK_UPGRADE'.
  ls_fcode_map-is_executable = abap_true.
  ls_fcode_map-param_1 = '2831894'.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  "********************************************************************
  "Mapping for the Info Buttons                                       *
  "********************************************************************
  ls_fcode_map-fcode = 'INFO-VALD_NC'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'CVI_NOTE'.
  ls_fcode_map-param_1 = 'TX'.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-VALD_LIB'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'CVI_LIBRARY'.
  ls_fcode_map-param_1 = 'TX'.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-PREP_MDC'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'CVI_MIGRATION_PRECHK'.
  ls_fcode_map-param_1 = 'RE'.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-PREP_AC'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'CVI_UPGRADE_CHECK_RESOLVE'.
  ls_fcode_map-param_1 = 'RE'.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-PREP_SUP'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'SIMGCVI_PRECHK_SUP'.
  ls_fcode_map-param_1 = 'HY'.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-UPGD_PPO'.
  ls_fcode_map-nav_type = c_navigation-docu.
    ls_fcode_map-target = 'PPO_ORDER_HELP'.
  ls_fcode_map-param_1 = 'TX'.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  ls_fcode_map-fcode = 'INFO-UPGD_PRECK'.
  ls_fcode_map-nav_type = c_navigation-docu.
  ls_fcode_map-target = 'PRECHECK_UPGRADATION_REPORT'.
  ls_fcode_map-param_1 = 'RE'.
  APPEND ls_fcode_map TO st_fcode_navigation.
  CLEAR ls_fcode_map.

  "get the list of FCODES applicable for CVI Load Screen
  CALL METHOD get_fcodes_mapping_cvi_load
    RECEIVING
      fcode_list = lt_cvi_load_fcodes.

  APPEND LINES OF lt_cvi_load_fcodes TO st_fcode_navigation.

  ENDMETHOD.                    "maintain_navigation_mapping


METHOD reset_subsequent_stages.
  DATA: lt_stage_metadata TYPE tt_stage_metadata,
        ls_stage_metadata TYPE ty_stage_metadata,
        lv_stage_priority TYPE       i,
        ls_status_mapping LIKE LINE OF st_status_mapping,
        lt_cockpit_log    TYPE TABLE OF cvi_cockpit_log,
        ls_cockpit_log    LIKE LINE OF lt_cockpit_log.


  FIELD-SYMBOLS <lfs_task_details>   TYPE       ty_task_details.
  FIELD-SYMBOLS <lfs_stage_details>   TYPE       ty_stage_details.

  CLEAR et_cockpit_log.
  lt_stage_metadata = st_stage_metadata.
  SORT lt_stage_metadata BY sequence ASCENDING.

  READ TABLE lt_stage_metadata INTO ls_stage_metadata WITH KEY stage = iv_stage.
  IF sy-subrc EQ 0.
    lv_stage_priority = ls_stage_metadata-sequence.
  ENDIF.


  LOOP AT lt_stage_metadata INTO ls_stage_metadata.
    IF lv_stage_priority GE ls_stage_metadata-sequence.
      CONTINUE. "  N case - dont do anything
    ENDIF.

    LOOP AT ct_task_details ASSIGNING <lfs_task_details> WHERE stage = ls_stage_metadata-stage.
      IF <lfs_task_details>-changed_by IS INITIAL."Dont reset if it is not yet initiated
        CONTINUE.
      ENDIF.
      <lfs_task_details>-changed_by = sy-uname.
      <lfs_task_details>-changed_on = sy-datum.
      <lfs_task_details>-changed_at = sy-uzeit.
      <lfs_task_details>-status = '01'.
      <lfs_task_details>-is_changed = abap_true.
      "read icon mapped with status.
      READ TABLE st_status_mapping INTO ls_status_mapping WITH KEY status = <lfs_task_details>-status.
      IF sy-subrc = 0.
        <lfs_task_details>-status_icon = ls_status_mapping-icon.
        <lfs_task_details>-status_text = ls_status_mapping-status_text.
      ENDIF.

      " Prepare extra entries for log table for all the entries reset by user of current and subsequent stages
      " ls_cockpit_log-guid -> GUID will be filled during save
      ls_cockpit_log-mandt = sy-mandt.
      ls_cockpit_log-task = <lfs_task_details>-task.
      ls_cockpit_log-status = <lfs_task_details>-status.
      ls_cockpit_log-changed_by = <lfs_task_details>-changed_by.
      ls_cockpit_log-changed_on = <lfs_task_details>-changed_on.
      ls_cockpit_log-changed_at = <lfs_task_details>-changed_at.
      ls_cockpit_log-comments = TEXT-001. " '*** Task reset by user****'
      APPEND ls_cockpit_log TO et_cockpit_log.
      CLEAR ls_cockpit_log.
    ENDLOOP.
  ENDLOOP.

  determine_stage_status(
    EXPORTING
      it_task_status   =  ct_task_details
    IMPORTING
      et_stage_status  = ct_stage_details
  ).

  "Set flag as true to set the editablility for different actions.
  READ TABLE ct_stage_details ASSIGNING <lfs_stage_details> WITH KEY stage = iv_stage.
  IF sy-subrc EQ 0.
    <lfs_stage_details>-action_allowed = abap_true.
  ENDIF.
  ENDMETHOD.                    "reset_subsequent_stages


METHOD return_applicable_fcode.
  rt_fcode_rn = st_fcode_list_rn.
  ENDMETHOD.                    "return_applicable_fcode


METHOD save.
  DATA: lt_cockpit_status TYPE tt_task_details.

  CHECK it_data IS NOT INITIAL.

  CLEAR ev_subrc.
  lt_cockpit_status = it_data.
  SORT lt_cockpit_status BY is_changed.
  "Delete all the unchanged records
  DELETE lt_cockpit_status WHERE is_changed = abap_false.
  IF lt_cockpit_status IS NOT INITIAL.
    ev_subrc = 0." set default as all good
    MODIFY cvi_cockpit_stat FROM TABLE lt_cockpit_status. "modify is required as insert or update both may come
    IF sy-subrc  = 0.
      " update log or history table
      save_logs(
        EXPORTING
          it_cockpit_status =  lt_cockpit_status                " Current status for changed all tasks
          it_logs  = it_logs
        IMPORTING
          ev_subrc          =  ev_subrc                " sy-subrc
      ).
    ELSE.
      ev_subrc = 4.
    ENDIF.  " Error to be handled by caller
  ENDIF.

  IF ev_subrc EQ 4.
    ROLLBACK WORK.
  ELSE.
    COMMIT WORK.
  ENDIF.
  ENDMETHOD.                    "save


METHOD save_logs.

  DATA: ls_cockpit_status TYPE ty_task_details.
  DATA: ls_cockpit_log   TYPE  cvi_cockpit_log,
        lt_cockpit_log   TYPE TABLE OF  cvi_cockpit_log,
        lt_incoming_logs TYPE TABLE OF  cvi_cockpit_log.
  DATA: lv_guid TYPE guid_32.

  FIELD-SYMBOLS : <fs_cockpit_log>  TYPE  cvi_cockpit_log.

  IF it_logs IS NOT INITIAL.
    lt_incoming_logs = it_logs.
    APPEND LINES OF lt_incoming_logs TO lt_cockpit_log.
  ENDIF.


  LOOP AT it_cockpit_status INTO ls_cockpit_status.
    MOVE-CORRESPONDING ls_cockpit_status TO ls_cockpit_log.
    APPEND ls_cockpit_log TO lt_cockpit_log.
    CLEAR ls_cockpit_log.
  ENDLOOP.

  " Add GUID for every record
  LOOP AT lt_cockpit_log ASSIGNING <fs_cockpit_log>.
    CALL FUNCTION 'GUID_CREATE'
      IMPORTING
        ev_guid_32 = lv_guid.

    <fs_cockpit_log>-guid = lv_guid.
    CLEAR lv_guid.
  ENDLOOP.

  IF lt_cockpit_log IS NOT INITIAL.
    INSERT cvi_cockpit_log FROM TABLE lt_cockpit_log.
    ev_subrc = sy-subrc.
  ELSE.
    ev_subrc = 4.
  ENDIF.

  ENDMETHOD.                    "save_logs


METHOD set_applicable_fcodes.

  DATA: ls_stage_metadata TYPE          ty_stage_metadata,
        ls_task_metadata  TYPE          ty_task_metadata,
        ls_fcode_list_rn  LIKE LINE OF  st_fcode_list_rn,
        lo_strucdescr     TYPE REF TO   cl_abap_structdescr,
        ls_components     TYPE          abap_compdescr.

  "*****************************************************************************************
  " Fill the Fcodes applicable for different STAGE                                         *
  "*****************************************************************************************
  "prepare the Fcodes for the stage -  log button
  lo_strucdescr ?= cl_abap_typedescr=>describe_by_data( c_stage_prefix ).
  IF lo_strucdescr IS BOUND.
    LOOP AT lo_strucdescr->components INTO ls_components. "nested loop - as max 30 records may come overall
      LOOP AT st_stage_metadata INTO ls_stage_metadata.
        ls_fcode_list_rn-option = 'EQ'.
        ls_fcode_list_rn-sign = 'I'.
        CONCATENATE ls_components-name '-' ls_stage_metadata-stage_artifact_id INTO ls_fcode_list_rn-low.
        APPEND ls_fcode_list_rn TO st_fcode_list_rn.
      ENDLOOP.
    ENDLOOP.
  ENDIF.

  "*****************************************************************************************
  " Fill the Fcodes applicable for different task                                         *
  "*****************************************************************************************
  FREE lo_strucdescr.
  "prepare the Fcodes for the TASK - Execute and Info button
  lo_strucdescr ?= cl_abap_typedescr=>describe_by_data( c_task_prefix ).
  IF lo_strucdescr IS BOUND.
    LOOP AT lo_strucdescr->components INTO ls_components. "nested loop - as max 30 records may come overall
      LOOP AT st_task_metadata INTO ls_task_metadata.
        ls_fcode_list_rn-option = 'EQ'.
        ls_fcode_list_rn-sign = 'I'.
        CONCATENATE ls_components-name '-' ls_task_metadata-task_artifact_id INTO ls_fcode_list_rn-low.
        APPEND ls_fcode_list_rn TO st_fcode_list_rn.
      ENDLOOP.
    ENDLOOP.
  ENDIF.
  ENDMETHOD.                    "set_applicable_fcodes


METHOD set_metadata.
  DATA: ls_status_map     TYPE ty_status_metadata,
        ls_stage_metadata TYPE ty_stage_metadata,
        ls_task_metadata  TYPE ty_task_metadata,
        lt_status         TYPE TABLE OF cvi_ckp_stat,
        lt_task           TYPE TABLE OF cvi_ckp_task,
        lt_stage          TYPE TABLE OF cvi_ckp_stg,
        lt_status_t       TYPE TABLE OF cvi_ckp_stat_t,
        lt_stage_t        TYPE TABLE OF cvi_ckp_stg_t,
        lt_task_t         TYPE TABLE OF cvi_ckp_task_t,
        ls_status         TYPE cvi_ckp_stat,
        ls_stage          TYPE cvi_ckp_stg,
        ls_task           TYPE          cvi_ckp_task,
        ls_status_t       TYPE cvi_ckp_stat_t,
        ls_stage_t        TYPE cvi_ckp_stg_t,
        ls_task_t         TYPE          cvi_ckp_task_t,
        lt_stage_task_map TYPE TABLE OF cvi_ckp_stgtsk,
        ls_stage_task_map TYPE          cvi_ckp_stgtsk.


  "****************************************************************************
  " Status Metadata
  "****************************************************************************
  SELECT * FROM cvi_ckp_stat
    INTO TABLE lt_status. "#EC CI_NOWHERE " where condition not required
  IF sy-subrc EQ 0.
    SELECT * FROM cvi_ckp_stat_t
      INTO TABLE lt_status_t
      FOR ALL ENTRIES IN lt_status
      WHERE status =   lt_status-status
      AND spras = sy-langu.           "#EC CI_NO_TRANSFORM
  ENDIF.

  LOOP AT lt_status INTO ls_status.
    ls_status_map-status = ls_status-status.
    ls_status_map-icon = ls_status-icon.
    READ TABLE lt_status_t INTO ls_status_t WITH KEY status = ls_status-status.
    IF sy-subrc EQ 0.
      ls_status_map-status_text = ls_status_t-status_t.
    ENDIF.
    APPEND ls_status_map TO ST_status_mapping.
    CLEAR ls_status_map.
  ENDLOOP.
  SORT st_status_mapping by status ASCENDING.
  "****************************************************************************
  "Stage Metadata
  "****************************************************************************
  SELECT * FROM cvi_ckp_stg
    INTO TABLE lt_stage."#EC CI_NOWHERE "Where condition not required
  IF sy-subrc EQ 0.
    SELECT * FROM cvi_ckp_stg_t       "#EC CI_NO_TRANSFORM
      INTO TABLE lt_stage_t
      FOR ALL ENTRIES IN lt_stage
      WHERE stage = lt_stage-stage
      AND spras = sy-langu.
  ENDIF.
  LOOP AT lt_stage INTO ls_stage.
    ls_stage_metadata-stage = ls_stage-stage.
    ls_stage_metadata-sequence = ls_stage-sequence.
    ls_stage_metadata-stage_artifact_id = ls_stage-artifact_id.
    READ TABLE lt_stage_t INTO ls_stage_t WITH KEY stage = ls_stage-stage.
    IF sy-subrc EQ 0.
      ls_stage_metadata-stage_text = ls_stage_t-stage_t.
    ENDIF.
    APPEND ls_stage_metadata TO ST_stage_metadata.
    CLEAR ls_stage_metadata.
  ENDLOOP.


  "****************************************************************************
  " Task Metadata
  "****************************************************************************

  SELECT * FROM cvi_ckp_task
  INTO TABLE lt_task. "#EC CI_NOWHERE #EC CI_NO_TRANSFORM " where condition not required
  IF sy-subrc EQ 0.
    SELECT * FROM cvi_ckp_task_t
      INTO TABLE lt_task_t
      FOR ALL ENTRIES IN lt_task
      WHERE task =   lt_task-task
      AND spras = sy-langu.           "#EC CI_NO_TRANSFORM

    SELECT * FROM cvi_ckp_stgtsk "#EC CI_NO_TRANSFORM
      INTO TABLE lt_stage_task_map
      FOR ALL ENTRIES IN lt_task
      WHERE task =   lt_task-task. "#EC CI_NOFIRST   "#EC CI_NO_TRANSFORM
  ENDIF.

  LOOP AT lt_task INTO ls_task.
    ls_task_metadata-task = ls_task-task.
    ls_task_metadata-task_artifact_id = ls_task-artifact_id.
    "read the task description
    READ TABLE lt_task_t INTO ls_task_t WITH KEY task = ls_task-task.
    IF sy-subrc EQ 0.
      ls_task_metadata-task_text = ls_task_t-task_t.
    ENDIF.
    "read the stage id mapped with the task
    READ TABLE lt_stage_task_map INTO ls_stage_task_map WITH KEY task = ls_task-task.
    IF sy-subrc EQ 0.
      ls_task_metadata-stage = ls_stage_task_map-stage.
      READ TABLE lt_stage INTO ls_stage WITH KEY stage = ls_stage_task_map-stage.
      IF sy-subrc EQ 0.
        ls_task_metadata-stage_artifact_id = ls_stage-artifact_id.
      ENDIF.
    ENDIF.
    APPEND ls_task_metadata TO ST_task_metadata.
    CLEAR ls_task_metadata.
  ENDLOOP.
  ENDMETHOD.                    "set_metadata
ENDCLASS.
