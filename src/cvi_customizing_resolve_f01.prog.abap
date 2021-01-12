*&---------------------------------------------------------------------*
*&  Include           CVI_CUSTOMIZING_RESOLVE_F01
*&---------------------------------------------------------------------*
CLASS lcl_cvi_customizing_resolve IMPLEMENTATION.

  METHOD prepare_field_catalog.
    CASE iv_scenario.
      WHEN gc_nodes-gen_sync. "Synchronization direction
*-- Prepare field catalog
        PERFORM prepare_fieldcat USING:
          "fieldname coltext  outputlen tooltip  col_pos hotspot icon edit drdn_field checkbox drdn_hndl   CHANGING  gt_fcat_final
           'ID1'   TEXT-101 20 '' '1' ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
           'ID2'   TEXT-102 20 '' '2' ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
           'TEXT1' TEXT-103 10  '' '3' ''  'X' '' '' '' '' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t01.

      WHEN gc_nodes-gen_ppo. "PPO connection
        PERFORM prepare_fieldcat USING:
          'ID1_DESC' TEXT-107 25 '' '1' ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
          'TEXT1'    TEXT-103 10 '' '2' ''  'X' '' '' '' '' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t02.

      WHEN gc_nodes-gen_regfun. "Registered FM's
        PERFORM prepare_fieldcat USING:
          'ID1  '  TEXT-108  6  '' '1' ''  '' '' '' '' '' '' '' CHANGING et_fcat,
          'TEXT1'  TEXT-109  6  '' '2' ''  '' '' '' '' '' '' '' CHANGING et_fcat,
          'TEXT2'  TEXT-110  8  '' '3' ''  '' '' '' '' '' '' '' CHANGING et_fcat,
          'TEXT3'  TEXT-111  25 '' '4' ''  '' '' '' '' '' '' '' CHANGING et_fcat,
          'TEXT4'  TEXT-112  5  TEXT-168 '5' ''  '' '' '' '' '' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t03.

      WHEN gc_nodes-gen_tax. "Missing tax classification

        PERFORM prepare_fieldcat USING:
        'ID1'       TEXT-113 9  '' '1' '' '' ''  '' '' ''  '' '' CHANGING et_fcat,
        'TEXT1'     TEXT-111 20 '' '2' '' '' ''  '' '' ''  '' '' CHANGING et_fcat,
        'ID1_DESC'  TEXT-115 40 '' '3' '' '' 'X' '' '' ''  '' '' CHANGING et_fcat,
        'TEXT2'     TEXT-116 5  '' '4' '' '' 'X' '' '' '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t04.

      WHEN gc_nodes-gen_addrnr. "Check Address number range

        PERFORM prepare_fieldcat USING:
        'TEXT1' TEXT-117 7  '' '1' ''  'X' '' ''  '' '' '' '' CHANGING et_fcat,
        'ID1'   TEXT-118 10 '' '2' ''  ''  '' ''  '' '' '' '' CHANGING et_fcat,
        'TEXT7' TEXT-119 50 '' '3' ''  ''  '' ''  '' '' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t05.

      WHEN gc_nodes-cbp_roles. "Customer acc group->BP roles mapping

        PERFORM prepare_fieldcat USING:
       'ID1'       TEXT-121    6  ''  '1' ''  '' '' '' '' '' '' '' CHANGING et_fcat,
       'ID1_DESC'  TEXT-124    20 ''  '2' ''  '' '' '' '' '' '' '' CHANGING et_fcat,
       'ARROW'     TEXT-125    8  ''  '3' '' 'X' '' '' '' '' '' '' CHANGING et_fcat,
       'ID2'       TEXT-130 17 ''  '4' ''  '' '' '' '' '' '' '' CHANGING et_fcat,
       'ID2_DESC'  TEXT-124    20 ''  '5' ''  '' '' '' '' '' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t08.

      WHEN gc_nodes-cbp_groupng. "Customer acc group->BP grouping mapping

        PERFORM prepare_fieldcat USING:
       'ID1'      TEXT-127 10 ''       '1'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
       'ID1_DESC' TEXT-124 20 TEXT-127 '2'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
       'TEXT1'    TEXT-128 4  TEXT-127 '3'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
       'TEXT2'    TEXT-129 6  TEXT-127 '4'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
       'ARROW'    TEXT-125 7  ''       '5'  ''  'X' '' '' '' '' '' '' CHANGING et_fcat,
       'ID2'      TEXT-130 17 ''       '6'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
       'ID2_DESC' TEXT-124 25 TEXT-130 '7'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
       'TEXT3'    TEXT-128 5  TEXT-130 '8'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
       'TEXT4'    TEXT-129 6  TEXT-130 '9'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
       'TEXT5'    TEXT-131 9  TEXT-160 '10' ''  ''  '' '' '' '' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t09.

      WHEN gc_nodes-cbp_accrole. "Missing BP roles for cutomer acc group

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-130 17 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124 15 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-121 20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t20.

      WHEN gc_nodes-cbp_accgrp. "Missing BP grouping for custmer acc group

        PERFORM prepare_fieldcat USING:
        'ID1'         TEXT-130 17 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC'    TEXT-124 20 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC'    TEXT-127 20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat,
        'TEXT1'       TEXT-131 20 '' '4'  ''  '' 'X' '' 'X' ''  '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t21.

      WHEN gc_nodes-cbpcp_actv. "Contact person activation

        PERFORM prepare_fieldcat USING:
         'ID1' TEXT-134 10 '' '1'  ''  '' 'X' '' 'X' '' 'X' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t12.

      WHEN gc_nodes-cbpcp_dept. "Check customer ->BP contact person department

        PERFORM prepare_fieldcat USING:
        'ID1'        TEXT-135 15 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC'   TEXT-124 20 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC'   TEXT-137 20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t13.

      WHEN gc_nodes-cbpcp_func. "Check customer ->BP contact person funtion

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-139 15  '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124 20  '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-141  20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t14.

      WHEN gc_nodes-cbpcp_auth. "Check customer ->BP contact person Authority

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-142  15 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124  20 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-144  20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t15.

      WHEN gc_nodes-cbpcp_vip. "Check customer ->BP contact person VIP indic

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-145  15 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124  20 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-147  20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t16.

      WHEN gc_nodes-cbpcp_marital. "Check customer ->BP contact person marital stat

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-148  15 '' '1'  ''  '' ''  '' ''  ''   '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124  20 '' '2'  ''  '' ''  '' ''  ''   '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-150  20 '' '4'  ''  '' 'X' '' ''  '1'  '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t17.

      WHEN gc_nodes-cbp_legal. "Check legal status assignment

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-151  12 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124  15 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-152  20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t18.

      WHEN gc_nodes-cbp_paycard. "Check payment card link assignment

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-153  12  '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124  15 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-154  20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t19.

      WHEN gc_nodes-vbp_roles. "Supplier acc group->BP role mapping

        PERFORM prepare_fieldcat USING:
        'ID1'       TEXT-121  6  '' '1' '' ''  '' '' '' '' '' '' CHANGING et_fcat,
        'ID1_DESC'  TEXT-124  25 '' '2' '' ''  '' '' '' '' '' '' CHANGING et_fcat,
        'ARROW'     TEXT-125  10 '' '3' '' 'X' '' '' '' '' '' '' CHANGING et_fcat,
        'ID2'       TEXT-132  18 '' '4' '' ''  '' '' '' '' '' '' CHANGING et_fcat,
        'ID2_DESC'  TEXT-124  25 '' '5' '' ''  '' '' '' '' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t08.

      WHEN gc_nodes-vbp_groupng. "Supplier acc group->BP grouping mapping

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-127 8  ''       '1'  ''  ''  '' '' '' ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124 20 TEXT-127 '2'  ''  ''  '' '' '' ''  '' '' CHANGING et_fcat,
        'TEXT1'    TEXT-128 5  TEXT-127 '3'  ''  ''  '' '' '' ''  '' '' CHANGING et_fcat,
        'TEXT2'    TEXT-129 5  TEXT-127 '4'  ''  ''  '' '' '' ''  '' '' CHANGING et_fcat,
        'ARROW'    TEXT-125 6  ''       '5'  ''  'X' '' '' '' ''  '' '' CHANGING et_fcat,
        'ID2'      TEXT-132 18 ''       '6'  ''  ''  '' '' '' ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-124 20 TEXT-132 '7'  ''  ''  '' '' '' ''  '' '' CHANGING et_fcat,
        'TEXT3'    TEXT-128 5  TEXT-132 '8'  ''  ''  '' '' '' ''  '' '' CHANGING et_fcat,
        'TEXT4'    TEXT-129 5  TEXT-132 '9'  ''  ''  '' '' '' ''  '' '' CHANGING et_fcat,
        'TEXT5'    TEXT-131 10 TEXT-160 '10' ''  ''  '' '' '' ''  '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t09.

      WHEN gc_nodes-vbp_accrole. "Supplier acc group to BP role assignment

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-132 17 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124 20 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-121 20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t22.

      WHEN gc_nodes-vbp_accgrp. "Supplier acc group to BP grouping assignment

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-132 17  '' '1'  ''  ''  ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124 20 '' '2'  ''  ''  ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC'    TEXT-127 20 '' '3'  ''  ''  'X' '' ''  '1' '' '' CHANGING et_fcat,
        'TEXT1'       TEXT-131 20 '' '4'  ''  ''  'X' '' 'X' ''  '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t23.

      WHEN gc_nodes-bpc_roles. "Check business partner->Customer roles

        PERFORM prepare_fieldcat USING:
        'ID1'       TEXT-121 6  '' '1' ''  '' ''  '' '' '' '' '' CHANGING et_fcat,
        'ID1_DESC'  TEXT-124 25 '' '2' ''  '' ''  '' '' '' '' '' CHANGING et_fcat,
        'TEXT1'     TEXT-133 10 '' '3' ''  '' ''  '' '' '' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t08.

      WHEN gc_nodes-bpc_groupng. "Check business partner->customer groupings

        PERFORM prepare_fieldcat USING:
        'ID1'          TEXT-127 12 ''       '1'  ''  ''  '' '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC'     TEXT-124 20 TEXT-127 '2'  ''  ''  '' '' ''  ''  '' '' CHANGING et_fcat,
        'TEXT1'        TEXT-128 4  TEXT-127 '3'  ''  ''  '' '' ''  ''  '' '' CHANGING et_fcat,
        'TEXT2'        TEXT-129 6  TEXT-127 '4'  ''  ''  '' '' ''  ''  '' '' CHANGING et_fcat,
        'ARROW'        TEXT-125 6  ''       '5'  ''  'X' '' '' ''  ''  '' '' CHANGING et_fcat,
        'ID2'          TEXT-130 17 ''       '6'  ''  ''  '' '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC'     TEXT-124 20 TEXT-130 '7'  ''  ''  '' '' ''  ''  '' '' CHANGING et_fcat,
        'TEXT3'        TEXT-128 4  TEXT-130 '8'  ''  ''  '' '' ''  ''  '' '' CHANGING et_fcat,
        'TEXT4'        TEXT-129 6  TEXT-130 '9'  ''  ''  '' '' ''  ''  '' '' CHANGING et_fcat,
        'TEXT5'        TEXT-131 10 TEXT-160 '10' ''  ''  '' '' ''  ''  '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t09.

      WHEN gc_nodes-bpv_roles. "Check business partner->supplier roles

        PERFORM prepare_fieldcat USING:
        'ID1'       TEXT-121 6  '' '1' ''  '' ''  '' ''  '' '' '' CHANGING et_fcat,
        'ID1_DESC'  TEXT-124 25 '' '2' ''  '' ''  '' ''  '' '' '' CHANGING et_fcat,
        'TEXT1'     TEXT-133 10 '' '3' ''  '' ''  '' ''  '' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t08.

      WHEN gc_nodes-bpv_groupng. "Check business partner->supplier grouping

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-127 8  ''       '1'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124 25 TEXT-127 '2'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
        'TEXT1'    TEXT-128 5  TEXT-127 '3'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
        'TEXT2'    TEXT-129 5  TEXT-127 '4'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
        'ARROW'    TEXT-125 6  ''       '5'  ''  'X' '' '' '' '' '' '' CHANGING et_fcat,
        'ID2'      TEXT-132 17 ''       '6'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-124 25 TEXT-132 '7'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
        'TEXT3'    TEXT-128 5  TEXT-132 '8'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
        'TEXT4'    TEXT-129 5  TEXT-132 '9'  ''  ''  '' '' '' '' '' '' CHANGING et_fcat,
        'TEXT5'    TEXT-131 10 TEXT-160 '10' ''  ''  '' '' '' '' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t09.

      WHEN gc_nodes-bpc_dept."Check BP->customer contact department

        PERFORM prepare_fieldcat USING:
        'ID1'        TEXT-137 12 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC'   TEXT-124 20 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC'   TEXT-135 20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t13.

      WHEN gc_nodes-bpc_func."Check BP->customer contact funtion

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-141 12 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124 20 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-139  20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t14.

      WHEN gc_nodes-bpc_auth. "Check BP->customer contact authority

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-144  15 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124  25 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-142  20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t15.

      WHEN gc_nodes-bpc_vip. "Check BP->customer contact VIP indic

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-147  12 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124  20 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-145  20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t16.

      WHEN gc_nodes-bpc_marital. "Check BP->customer contact marital status

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-150  12 '' '1'  ''  '' ''  '' ''  ''   '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124  20 '' '2'  ''  '' ''  '' ''  ''   '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-148  20 '' '4'  ''  '' 'X' '' ''  '1'  '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t17.

      WHEN gc_nodes-bpc_legal."Check BP->customer legal status link

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-152  12 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124  20 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-151  20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t29.

      WHEN gc_nodes-bpc_paycard. "Check BP->customer payment card link

        PERFORM prepare_fieldcat USING:
        'ID1'      TEXT-154  12 '' '1'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC' TEXT-124  20 '' '2'  ''  '' ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID2_DESC' TEXT-153  20 '' '4'  ''  '' 'X' '' ''  '1' '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t19.

      WHEN gc_nodes-gen_industry. "Check standard industry system

        PERFORM prepare_fieldcat USING:
        'ID1'       TEXT-159  12  ''  '1'  ''  ''  ''  '' ''  ''  '' '' CHANGING et_fcat,
        'ID1_DESC'  TEXT-124  15  ''  '2'  ''  ''  ''  '' ''  ''  '' '' CHANGING et_fcat,
        'INPUT'     TEXT-122  18  TEXT-122 '3'  ''  '' 'X'  '' 'X' ''  '' '' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t27.

      WHEN gc_nodes-vbp_ind_in OR gc_nodes-bpv_ind_out OR
           gc_nodes-cbp_ind_in OR gc_nodes-bpc_ind_out.

        PERFORM prepare_fieldcat USING:
       'ID1'       TEXT-156  15 ''  '1'  '' '' ''  '' '' '' '' ''  CHANGING et_fcat,
       'ID1_DESC'  TEXT-124  20 ''  '2'  '' '' ''  '' '' '' '' ''  CHANGING et_fcat,
       'INPUT'     TEXT-157  12 ''  '3'  '' '' 'X' '' '' '' '' 'X' CHANGING et_fcat,
       'TEXT1'     TEXT-158  12 ''  '4'  '' '' 'X' '' '' '' '' 'X' CHANGING et_fcat.

        es_layo-grid_title = TEXT-t28.

    ENDCASE.
  ENDMETHOD.

  METHOD  handle_link_click.
    " this method handles the link click event of the tree
    " control instance

    " show the key of the node and the name of the item
    " of the clicked link in a dynpro field
    DATA: lv_answer     TYPE c,
          lv_error      TYPE c,
          lv_docuobject TYPE doku_obj.
    FIELD-SYMBOLS:
      <lft_data>   TYPE cl_cvi_customizing_resolve=>tt_id_desc_op.
     CLEAR gv_doc_link.

     IF item_name = 1.
       gv_doc_link = abap_true.
       "Show documentation for respective node
       CALL METHOD cl_cvi_customizing_resolve=>read_documentation
         EXPORTING
           iv_scenario   = node_key
         IMPORTING
           ev_docuobject = lv_docuobject.
       IF lv_docuobject IS NOT INITIAL.
         PERFORM show_documentation USING lv_docuobject.
       ENDIF.
     ELSEIF item_name = 2.
    ASSIGN go_application->data->* TO <lft_data>.
    IF <lft_data> IS ASSIGNED AND item_name = 2.
      "If unsaved data is present, ask user decision
      PERFORM check_data_loss USING <lft_data> CHANGING lv_answer.
      IF lv_answer = '1' OR lv_answer IS INITIAL.
        me->event = 'LINK_CLICK'.
        me->item_name = item_name.
        me->node_key = node_key.
        PERFORM lock_current_view USING 'D' go_application->field_map_out_to_in
                                            <lft_data> lv_error.
        ELSE.
        CLEAR: me->event, me->item_name, me->item_name.
      ENDIF.
    ELSE.
      me->event = 'LINK_CLICK'.
      me->item_name = item_name.
      me->node_key = node_key.
      ENDIF.
     ENDIF.
  ENDMETHOD.                    "HANDLE_LINK_CLICK

  METHOD handle_edit_toolbar.

    DATA: ls_toolbar  TYPE stb_button.
    FIELD-SYMBOLS <lfs_toolbar>  TYPE stb_button.

    "ALV Icon for customizing
    MOVE gc_fcode-cust TO ls_toolbar-function.
    MOVE icon_system_administrator TO ls_toolbar-icon.
    MOVE TEXT-161 TO ls_toolbar-quickinfo.
    APPEND ls_toolbar TO e_object->mt_toolbar.

    CHECK display_mode <> 'D'.

    "ALV Icon Display/Edit toggle
    CLEAR ls_toolbar.
    MOVE gc_fcode-toggle TO ls_toolbar-function.
    MOVE icon_toggle_display_change TO ls_toolbar-icon.
    MOVE TEXT-164 TO ls_toolbar-quickinfo.
    APPEND ls_toolbar TO e_object->mt_toolbar.

    "ALV Icon Save
    CLEAR ls_toolbar.
    MOVE gc_fcode-save TO ls_toolbar-function.
    MOVE icon_system_save TO ls_toolbar-icon.
    MOVE TEXT-165 TO ls_toolbar-quickinfo.
    APPEND ls_toolbar TO e_object->mt_toolbar.

    CASE display_mode.
      WHEN 'E'.
        "Edit Mode , Disabled the navigation to customizing button
        READ TABLE e_object->mt_toolbar ASSIGNING <lfs_toolbar> WITH KEY function = gc_fcode-cust.
        IF <lfs_toolbar> IS ASSIGNED.
          <lfs_toolbar>-disabled = abap_true.
        ENDIF.
      WHEN  'R'.
        "ready for Input, Then disabled the Save button
        READ TABLE e_object->mt_toolbar ASSIGNING <lfs_toolbar> WITH KEY function = gc_fcode-save.
        IF <lfs_toolbar> IS ASSIGNED.
          <lfs_toolbar>-disabled = abap_true.
        ENDIF.
      WHEN 'A'. "Incase of any error
        READ TABLE e_object->mt_toolbar ASSIGNING <lfs_toolbar> WITH KEY function = gc_fcode-toggle.
        IF <lfs_toolbar> IS ASSIGNED.
          <lfs_toolbar>-disabled = abap_true.
        ENDIF.

        READ TABLE e_object->mt_toolbar ASSIGNING <lfs_toolbar> WITH KEY function = gc_fcode-save.
        IF <lfs_toolbar> IS ASSIGNED.
          <lfs_toolbar>-disabled = abap_true.
        ENDIF.
    ENDCASE.
  ENDMETHOD.

  METHOD handle_data_changed.
    FIELD-SYMBOLS:
      <lfs_changed_cell> TYPE lvc_s_modi,
      <lft_data>         TYPE cl_cvi_customizing_resolve=>tt_id_desc_op,
      <lfs_data>         TYPE cl_cvi_customizing_resolve=>ty_id_desc_op,
      <lfs_value>        TYPE any.

    ASSIGN go_application->data->* TO <lft_data>.

    " set is change flag for the data changed
    IF <lft_data>  IS ASSIGNED.

      LOOP AT er_data_changed->mt_good_cells ASSIGNING <lfs_changed_cell>.
        READ TABLE <lft_data>  ASSIGNING <lfs_data> INDEX <lfs_changed_cell>-row_id.
        IF sy-subrc EQ 0 AND <lfs_data> IS ASSIGNED.
          ASSIGN COMPONENT 'IS_CHANGE' OF STRUCTURE <lfs_data> TO <lfs_value>.
          IF <lfs_value> IS ASSIGNED.
            <lfs_value> = 'X'.
          ENDIF.
        ENDIF.
      ENDLOOP.

      CASE go_application->node_key.
          "Change the standard selection for industry key
        WHEN 'GEN_INDUSTRY'.
          LOOP AT er_data_changed->mt_good_cells ASSIGNING <lfs_changed_cell>.
            IF <lfs_changed_cell>-fieldname = 'INPUT' AND <lfs_changed_cell>-value = 'X'.
              LOOP AT <lft_data> ASSIGNING <lfs_data>.
                IF <lfs_data> IS ASSIGNED.
                  IF sy-tabix = <lfs_changed_cell>-row_id.
                    <lfs_data>-input = abap_true.
                  ELSE.
                    <lfs_data>-input = space.
                  ENDIF.
                ENDIF.
              ENDLOOP.
            ENDIF.
          ENDLOOP.
        WHEN OTHERS.
      ENDCASE.

    ENDIF.

  ENDMETHOD.

  METHOD set_data_alv_toolbar.
    DATA: lt_exclude_functions TYPE ui_functions.
    "Exclude not required buttons from ALV
    APPEND cl_gui_alv_grid=>mc_fc_maximum TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_minimum TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_subtot TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_sum TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fg_sort TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_filter TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_detail  TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_print  TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_views  TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_mb_export TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_check TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_refresh TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_graph TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_help TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_info TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_sum TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_loc_cut TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_loc_delete_row TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_loc_insert_row TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_average TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_current_variant TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_load_variant TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_loc_append_row  TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_loc_copy  TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_loc_copy_row  TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_loc_paste  TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_loc_paste_new_row TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_loc_undo  TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_maintain_variant TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_maximum TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_minimum TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_save_variant TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_subtot  TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_sum TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_select_all   TO lt_exclude_functions.
    APPEND cl_gui_alv_grid=>mc_fc_deselect_all TO lt_exclude_functions.
    go_application->func_exclude = lt_exclude_functions.

  ENDMETHOD.

  METHOD handle_user_command.
    DATA:
      lv_query  TYPE string,
      lt_data   TYPE cl_cvi_customizing_resolve=>tt_id_desc_op,
      lv_error  TYPE c,
      lv_answer TYPE c.

    FIELD-SYMBOLS:
      <lft_data>      TYPE cl_cvi_customizing_resolve=>tt_id_desc_op,
      <lfs_view_data> TYPE STANDARD TABLE,
      <lfs_data_temp> TYPE STANDARD TABLE.

    "Assigning ALV data to a local structure to protect data from deletion
    " when ALV regeneration is not required
    IF go_application->data IS NOT INITIAL.
      ASSIGN go_application->data->* TO <lfs_data_temp>.
      lt_data = <lfs_data_temp>.
      ASSIGN lt_data TO <lft_data>.
    ENDIF.

    CASE: e_ucomm.

      WHEN gc_fcode-cust.
        "Navigate to customizing
        CALL METHOD go_application->show_customizing
          EXPORTING
            iv_scenario = go_application->node_key.

            PERFORM prepare_output.

      WHEN gc_fcode-save.
        " Perform save operation
        CLEAR: go_application->inconsistent_logs.
        IF go_application->node_key = gc_nodes-gen_industry.
          "incase of industry sending only change entry
          " is deleting the other industries from view, hence
          " skip deletion
        ELSE.
          DELETE <lft_data> WHERE is_change NE 'X'.
          IF <lft_data> IS INITIAL.
            MESSAGE TEXT-m01 TYPE 'S'.
            EXIT.
          ENDIF.
        ENDIF.

        "Check data consistency before save
        CALL METHOD cl_cvi_customizing_resolve=>check_data_before_save
          EXPORTING
            iv_scenario = go_application->node_key
          IMPORTING
            et_log      = go_application->inconsistent_logs
          CHANGING
            ct_output   = <lft_data>.

        "Perform save only if there is consistent data atleast
        "for one change row
        IF <lft_data> IS ASSIGNED AND <lft_data> IS NOT INITIAL.
          "Save consistent data
          CALL METHOD cl_cvi_customizing_resolve=>save_data
            EXPORTING
              it_field_mapping_out_to_in = go_application->field_map_out_to_in
              it_data                    = <lft_data>
            EXCEPTIONS
              lock_error                 = 1                " View is locked by another user
              technical_error            = 2                " system_failure, table_not_found - Non Business Error
              OTHERS                     = 3.
          IF sy-subrc <> 0.
            MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
          ELSE.
            IF sy-msgid = 'TK' AND sy-msgno = 495.
             MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
               WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 DISPLAY LIKE 'E'.
             ELSE.
              MESSAGE TEXT-m06 TYPE 'S'.
              PERFORM prepare_output.
            ENDIF.
          ENDIF.
        ELSE.
          "Display error message in logs incase no consistent data for save
          PERFORM show_table_alv
            USING    go_s100_log_alv
            CHANGING go_application->layout_log
                     go_application->inconsistent_logs
                     go_application->fcat_log.
        ENDIF.


      WHEN gc_fcode-toggle.

        "User has clicked for change in ALV
        IF go_application->display_mode = 'R'.
          " 'E'-> Enqueue 'D'-> Dequeue
          PERFORM lock_current_view USING 'E' go_application->field_map_out_to_in
                                           <lft_data> lv_error.
          IF lv_error NE abap_true.
            go_application->display_mode = 'E'. " Set mode as editable
            CALL METHOD go_s100_details_alv->set_ready_for_input
              EXPORTING
                i_ready_for_input = 1.
          ENDIF.

          "User has clicked for display in ALV
        ELSEIF go_application->display_mode = 'E'.

          PERFORM check_data_loss USING <lft_data> CHANGING lv_answer.
          IF lv_answer = '1' OR lv_answer IS INITIAL.
            " 'E'-> Enqueue 'D'-> Dequeue
            PERFORM lock_current_view USING 'D' go_application->field_map_out_to_in
                                                <lft_data> lv_error.
            IF lv_error NE abap_true.
              go_application->display_mode = 'R'. " Set mode as display
              CALL METHOD go_s100_details_alv->set_ready_for_input
                EXPORTING
                  i_ready_for_input = 0.
            ENDIF.

            PERFORM prepare_output.
          ENDIF.
        ENDIF.
*        go_s100_details_alv->refresh_table_display( ).
    ENDCASE.

  ENDMETHOD.
  METHOD handle_on_f4.
    DATA:
      ls_modi       TYPE lvc_s_modi,
      ls_tb038      TYPE tb038,
      ls_tb038t     TYPE tb038t,
      ls_tb038a     TYPE tb038a,
      ls_tb038b     TYPE tb038b,
      ls_istype     TYPE ty_istype,
      ls_ind_sector TYPE ty_ind_sector,
      lt_rettab     TYPE TABLE OF ddshretval,
      lt_tb038      TYPE STANDARD TABLE OF tb038,
      lt_tb038a     TYPE STANDARD TABLE OF tb038a,
      lt_tb038b     TYPE STANDARD TABLE OF tb038b,
      lt_tb038t     TYPE STANDARD TABLE OF tb038t,
      lt_tp038m1    TYPE STANDARD TABLE OF tp038m1,
      lt_tp038m2    TYPE STANDARD TABLE OF tp038m2,
      lt_istype     TYPE STANDARD TABLE OF ty_istype,
      lt_ind_sector TYPE STANDARD TABLE OF ty_ind_sector.
    FIELD-SYMBOLS:
      <lfs_data>   TYPE cl_cvi_customizing_resolve=>ty_id_desc_op,
      <lfs_rettab> TYPE ddshretval,
      <lft_itab>   TYPE lvc_t_modi,
      <lft_data>   TYPE cl_cvi_customizing_resolve=>tt_id_desc_op.

    CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
      IMPORTING
        et_tb038  = lt_tb038
        et_tb038a = lt_tb038a
        et_tb038b = lt_tb038b
        et_tb038t  = lt_tb038t
        et_tp038m1 = lt_tp038m1
        et_tp038m2 = lt_tp038m2.

    IF e_fieldname = 'INPUT'.  "Field industry key F4 help
      LOOP AT lt_tb038 INTO ls_tb038.
        ls_istype-input = ls_tb038-istype.
        READ TABLE lt_tb038t INTO ls_tb038t WITH KEY
              langu = sy-langu
              istype = ls_tb038-istype.
        IF sy-subrc EQ 0.
          ls_istype-bez30 = ls_tb038t-bez30.
        ENDIF.
        APPEND ls_istype TO lt_istype.
      ENDLOOP.

      CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
        EXPORTING
          retfield        = 'INPUT'
          window_title    = TEXT-162
          value_org       = 'S'
        TABLES
          value_tab       = lt_istype
          return_tab      = lt_rettab
        EXCEPTIONS
          parameter_error = 1
          no_values_found = 2
          OTHERS          = 3.
      IF sy-subrc = 0 AND lt_rettab IS NOT INITIAL.
        READ TABLE lt_rettab ASSIGNING <lfs_rettab> INDEX 1.
        ASSIGN er_event_data->m_data->* TO <lft_itab>.
        IF <lfs_rettab> IS ASSIGNED AND <lft_itab> IS ASSIGNED.
          ls_modi-row_id   = es_row_no-row_id.
          ls_modi-fieldname = 'INPUT'.
          ls_modi-value     = <lfs_rettab>-fieldval.
          APPEND ls_modi TO <lft_itab>.
        ENDIF.
        er_event_data->m_event_handled = 'X'. "(to inform grid that f4 was handled manually)
      ENDIF.
    ENDIF.

    IF e_fieldname = 'TEXT1'. "Field industry sector F4 help

      ASSIGN go_application->data->* TO <lft_data>.
      IF <lft_data>  IS  ASSIGNED.
        READ TABLE <lft_data> ASSIGNING <lfs_data> INDEX es_row_no-row_id.
        IF <lfs_data> IS ASSIGNED.
          LOOP AT lt_tb038a INTO ls_tb038a WHERE istype = <lfs_data>-input.
            READ TABLE lt_tp038m1 TRANSPORTING NO FIELDS
              WITH KEY istype     = ls_tb038a-istype
                       ind_sector = ls_tb038a-ind_sector.
            "Show only industry sectors which are not present as a primary key in DB
            IF sy-subrc NE 0 AND ( go_application->node_key = gc_nodes-bpc_ind_out
                              OR   go_application->node_key = gc_nodes-bpv_ind_out ).
            ls_ind_sector-text1 = ls_tb038a-ind_sector.
            READ TABLE lt_tb038b INTO ls_tb038b WITH KEY
               spras = sy-langu
               istype = <lfs_data>-input
               ind_sector = ls_tb038a-ind_sector.
            IF sy-subrc EQ 0.
              ls_ind_sector-desc = ls_tb038b-text.
            ENDIF.
            APPEND ls_ind_sector TO lt_ind_sector.
            ENDIF.
          ENDLOOP.
        ENDIF.

        CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
          EXPORTING
            retfield        = 'TEXT1'
            window_title    = TEXT-163
            value_org       = 'S'
          TABLES
            value_tab       = lt_ind_sector
            return_tab      = lt_rettab
          EXCEPTIONS
            parameter_error = 1
            no_values_found = 2
            OTHERS          = 3.
        IF sy-subrc = 0 AND lt_rettab IS NOT INITIAL.
          READ TABLE lt_rettab ASSIGNING <lfs_rettab> INDEX 1.
          ASSIGN er_event_data->m_data->* TO <lft_itab>.
          IF <lfs_rettab> IS ASSIGNED AND <lft_itab> IS ASSIGNED.
            ls_modi-row_id   = es_row_no-row_id.
            ls_modi-fieldname = 'TEXT1'.
            ls_modi-value     = <lfs_rettab>-fieldval.
            APPEND ls_modi TO <lft_itab>.
          ENDIF.
          er_event_data->m_event_handled = 'X'. "(to inform grid that f4 was handled manually)
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD show_customizing.
    DATA: lv_object TYPE c.
    DATA lv_view TYPE dd02v-tabname.
    DATA lv_tcode TYPE tcode.

    CALL METHOD cl_cvi_customizing_resolve=>get_customizing_details
      EXPORTING
        iv_scenario = iv_scenario
      IMPORTING
        ev_object   = lv_object
        ev_view     = lv_view
        ev_tcode    = lv_tcode.

    "If customizing object is view then
    "call view maintencance in display mode
    IF lv_object = 'V'.

      CALL FUNCTION 'VIEW_MAINTENANCE_CALL'
        EXPORTING
          action                       = 'S'
          view_name                    = lv_view
        EXCEPTIONS
          client_reference             = 1
          foreign_lock                 = 2
          invalid_action               = 3
          no_clientindependent_auth    = 4
          no_database_function         = 5
          no_editor_function           = 6
          no_show_auth                 = 7
          no_tvdir_entry               = 8
          no_upd_auth                  = 9
          only_show_allowed            = 10
          system_failure               = 11
          unknown_field_in_dba_sellist = 12
          view_not_found               = 13
          maintenance_prohibited       = 14
          OTHERS                       = 15.
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.

    ELSEIF lv_object = 'T'.
      "If customizing object is transaction then
      "call transaction using ABAP4_CALL_TRANSACTION
      CALL FUNCTION 'ABAP4_CALL_TRANSACTION'
        EXPORTING
          tcode                   = lv_tcode
        EXCEPTIONS
          call_transaction_denied = 1
          tcode_invalid           = 2
          OTHERS                  = 3.
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.

    ENDIF.

  ENDMETHOD.

  METHOD handle_data_changed_finished.
    DATA: lv_cursor_pos TYPE lvc_s_stbl,
          lv_row TYPE i,
          lv_col TYPE i.
   IF go_application->node_key = gc_nodes-gen_industry.
    go_s100_details_alv->get_current_cell(
      IMPORTING
        e_row      = lv_row
        e_col     =  lv_col ).
     lv_cursor_pos-row = lv_row.
     lv_cursor_pos-col = lv_col.
    go_s100_details_alv->refresh_table_display( is_stable = lv_cursor_pos ).
   ENDIF.
  ENDMETHOD.

ENDCLASS.

FORM prepare_alv_log CHANGING ct_fcat_log TYPE lvc_t_fcat
                              cs_layout_log TYPE lvc_s_layo.
  cs_layout_log-no_toolbar = 'X'.
*-- Prepare field catalog
  PERFORM prepare_fieldcat USING:
    "fieldname coltext  outputlen tooltip  col_pos hotspot icon edit drdn_field checkbox drdn_hndl  CHANGING  gt_fcat_final
    'ICON'     TEXT-104 4   '' '1' ''  'X' '' ''  '' '' '' '' CHANGING ct_fcat_log,
    'MESSAGE'  TEXT-105 75  '' '2' ''  '' ''  ''  '' '' '' '' CHANGING ct_fcat_log.
ENDFORM.

FORM handle_command_0100.
  DATA:
    return_code   TYPE i,
    lv_docuobject TYPE doku_obj,
    lv_answer     TYPE c.

  FIELD-SYMBOLS:
    <lft_data>   TYPE cl_cvi_customizing_resolve=>tt_id_desc_op.

  CALL METHOD cl_gui_cfw=>dispatch
    IMPORTING
      return_code = return_code.

  gv_ok_code = sy-ucomm.
  "Check if user wants to go out from program
  CASE gv_ok_code.
    WHEN gc_fcode-back OR gc_fcode-exit OR gc_fcode-canc.

      ASSIGN go_application->data->* TO <lft_data>.
      IF <lft_data> IS ASSIGNED.
        "If unsaved data is present, ask user decision
        PERFORM check_data_loss USING <lft_data> CHANGING lv_answer.
        IF lv_answer = '1' OR lv_answer IS INITIAL.
          LEAVE PROGRAM.
        ENDIF.
      ELSE.
        LEAVE PROGRAM.
      ENDIF.

  ENDCASE.

  CASE go_application->event.
    WHEN 'LINK_CLICK'. "Tree event Link_click
       IF go_application->item_name = 2 AND gv_doc_link = abap_false.
        "Show node output in ALV
        PERFORM prepare_output.
      ENDIF.
  ENDCASE.

ENDFORM.

FORM prepare_screen_100.

  DATA:
    lt_tree_hier  TYPE TABLE OF ty_tree_hier,
    lt_events     TYPE cntl_simple_events,
    lt_node_table TYPE treev_ntab,
    lt_item_table TYPE tt_item_table,
    ls_tree_hier  TYPE ty_tree_hier,
    ls_event      TYPE cntl_simple_event.

  DEFINE prepare_tree_details.
    ls_tree_hier-node_id = &2.
    ls_tree_hier-parent_id = &1.
    ls_tree_hier-description = &3.
    ls_tree_hier-is_parent = &4.
    ls_tree_hier-is_edit_allowed = &5.
    ls_tree_hier-view_name = &6.

    APPEND ls_tree_hier TO lt_tree_hier.
  end-OF-DEFINITION.

  "*********************************************************************************
  " Macro name | Parent ID  | Node ID | Description | is_parent
  "*********************************************************************************
  prepare_tree_details  ''       'GEN'           TEXT-001  'X'   ''     ''.
  prepare_tree_details  'GEN'    'GEN_SYNC'      TEXT-006  ''    ''     ''.
  prepare_tree_details  'GEN'    'GEN_PPO'       TEXT-007  ''    ''     ''.
  prepare_tree_details  'GEN'    'GEN_REGFUN'    TEXT-008  ''    ''     ''.
  prepare_tree_details  'GEN'    'GEN_TAX'       TEXT-009  ''    ''     ''.
  prepare_tree_details  'GEN'    'GEN_ADDRNR'    TEXT-010  ''    ''     ''.
  prepare_tree_details  'GEN'    'GEN_INDUSTRY'  TEXT-013  ''    ''     ''.


  prepare_tree_details  ''       'CBP'           TEXT-002  'X'   ''     ''.
  prepare_tree_details  'CBP'    'CBP_ROLES'     TEXT-017  ''    ''     ''.
  prepare_tree_details  'CBP'    'CBP_GROUPNG'   TEXT-018  ''    ''     ''.
  prepare_tree_details  'CBP'    'CBP_ACCROLE'   TEXT-019  ''    ''     ''.
  prepare_tree_details  'CBP'    'CBP_ACCGRP'    TEXT-020  ''    ''     ''.
  prepare_tree_details  'CBP'    'CBP_LEGAL'     TEXT-027  ''    ''     ''.
  prepare_tree_details  'CBP'    'CBP_PAYCARD'   TEXT-028  ''    ''     ''.
  prepare_tree_details  'CBP'    'CBP_IND_IN'    TEXT-014  ''    ''     ''.
  prepare_tree_details  'CBP'    'CBPCP'         TEXT-044  'X'   ''     ''.
  prepare_tree_details  'CBPCP'  'CBPCP_ACTV'    TEXT-021  ''    ''     ''.
  prepare_tree_details  'CBPCP'  'CBPCP_DEPT'    TEXT-022  ''    ''     ''.
  prepare_tree_details  'CBPCP'  'CBPCP_FUNC'    TEXT-023  ''    ''     ''.
  prepare_tree_details  'CBPCP'  'CBPCP_AUTH'    TEXT-024  ''    ''     ''.
  prepare_tree_details  'CBPCP'  'CBPCP_VIP'     TEXT-025  ''    ''     ''.
  prepare_tree_details  'CBPCP'  'CBPCP_MARITA'  TEXT-026  ''    ''     ''.

  prepare_tree_details  ''       'VBP'           TEXT-003  'X'   ''     ''.
  prepare_tree_details  'VBP'    'VBP_ROLES'     TEXT-017  ''    ''     ''.
  prepare_tree_details  'VBP'    'VBP_GROUPNG'   TEXT-018  ''    ''     ''.
  prepare_tree_details  'VBP'    'VBP_ACCROLE'   TEXT-035  ''    ''     ''.
  prepare_tree_details  'VBP'    'VBP_ACCGRP'    TEXT-036  ''    ''     ''.
  prepare_tree_details  'VBP'    'VBP_IND_IN'    TEXT-014  ''    ''     ''.

  prepare_tree_details  ''       'BPC'           TEXT-004  'X'   ''     ''.
  prepare_tree_details  'BPC'    'BPC_ROLES'     TEXT-017  ''    ''     ''.
  prepare_tree_details  'BPC'    'BPC_GROUPNG'   TEXT-018  ''    ''     ''.
  prepare_tree_details  'BPC'    'BPC_LEGAL'     TEXT-t29  ''    ''     ''.
  prepare_tree_details  'BPC'    'BPC_PAYCARD'   TEXT-028  ''    ''     ''.
  prepare_tree_details  'BPC'    'BPC_IND_OUT'   TEXT-015  ''    ''     ''.
  prepare_tree_details  'BPC'    'BPCCP'         TEXT-044  'X'   ''     ''.
  prepare_tree_details  'BPCCP'  'BPC_DEPT'      TEXT-022  ''    ''     ''.
  prepare_tree_details  'BPCCP'  'BPC_FUNC'      TEXT-023  ''    ''     ''.
  prepare_tree_details  'BPCCP'  'BPC_AUTH'      TEXT-024  ''    ''     ''.
  prepare_tree_details  'BPCCP'  'BPC_VIP'       TEXT-025  ''    ''     ''.
  prepare_tree_details  'BPCCP'  'BPC_MARITAL'   TEXT-026  ''    ''     ''.


  prepare_tree_details  ''       'BPV'           TEXT-005  'X'   ''     ''.
  prepare_tree_details  'BPV'    'BPV_ROLES'     TEXT-017  ''    ''     ''.
  prepare_tree_details  'BPV'    'BPV_GROUPNG'   TEXT-018  ''    ''     ''.
  prepare_tree_details  'BPV'    'BPV_IND_OUT'   TEXT-015  ''    ''     ''.


  DATA ls_node TYPE treev_node.
  LOOP AT lt_tree_hier INTO ls_tree_hier.
    ls_node-node_key  =  ls_tree_hier-node_id.
    ls_node-relatkey  =  ls_tree_hier-parent_id.
      ls_node-n_image = 'BNONE'.
    IF ls_tree_hier-is_parent EQ abap_true.
      ls_node-isfolder = abap_true.
    ELSE.
      ls_node-relatship =  cl_gui_list_tree=>relat_last_child.
    ENDIF.
    APPEND ls_node TO lt_node_table.
    CLEAR ls_node.
  ENDLOOP.

  DATA ls_item TYPE mtreeitm.
  LOOP AT lt_tree_hier INTO ls_tree_hier.
    ls_item-node_key   = ls_tree_hier-node_id.
    ls_item-alignment  = cl_gui_list_tree=>align_auto.
    IF ls_tree_hier-is_parent EQ abap_true. "root node
      ls_item-text = ls_tree_hier-description.
      ls_item-class    = '2'.
      ls_item-font = cl_gui_list_tree=>item_font_prop.
      ls_item-item_name  = '1'.
      APPEND ls_item TO lt_item_table.
      CLEAR ls_item.
    ELSE.
      "add the docu button
      ls_item-class    = '5'.
      ls_item-font = ''.
      ls_item-item_name  = '1'.
      ls_item-t_image = '@0P@'.
      ls_item-txtisqinfo = abap_true.
      ls_item-text = text-167.
      APPEND ls_item TO lt_item_table.
      "add the exec button
      ls_item-class    = '5'.
      ls_item-font = ''.
*      ls_item-item_name  = 'NODE_EXEC'.
      ls_item-item_name  = '2'.
      ls_item-t_image = '@15@'.
      ls_item-txtisqinfo = abap_true.
      ls_item-text = text-166.
      APPEND ls_item TO lt_item_table.
      "add the node desc
      ls_item-class    = '2'.
      CLEAR ls_item-t_image.
      ls_item-font = cl_gui_list_tree=>item_font_prop.
      ls_item-item_name  = '3'.
      ls_item-disabled = abap_true.
      ls_item-text = ls_tree_hier-description.
      ls_item-txtisqinfo = abap_false.
      APPEND ls_item TO lt_item_table.
      CLEAR ls_item.
    ENDIF.
  ENDLOOP.

  "Create object for screen 100 container
  CREATE OBJECT go_s100
    EXPORTING
      container_name              = 'CC_0100'
    EXCEPTIONS
      cntl_error                  = 1                " CNTL_ERROR
      cntl_system_error           = 2                " CNTL_SYSTEM_ERROR
      create_error                = 3                " CREATE_ERROR
      lifetime_error              = 4                " LIFETIME_ERROR
      lifetime_dynpro_dynpro_link = 5                " LIFETIME_DYNPRO_DYNPRO_LINK
      OTHERS                      = 6.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  "Split the screen 100 into 2 sections -
  "1- tree and 2 - output
  CREATE OBJECT go_split_1
    EXPORTING
      parent  = go_s100
      rows    = 1
      columns = 2.
  "Tree structure container
  CALL METHOD go_split_1->get_container
    EXPORTING
      row       = 1
      column    = 1
    RECEIVING
      container = go_s100_list.
  "Output container
  CALL METHOD go_split_1->get_container
    EXPORTING
      row       = 1
      column    = 2
    RECEIVING
      container = go_s100_2.
  "Set coulmn width for tree container
  CALL METHOD go_split_1->set_column_width
    EXPORTING
      id                = 1                 " Column ID
      width             = 23                 " NPlWidth
    EXCEPTIONS
      cntl_error        = 1                " See CL_GUI_CONTROL
      cntl_system_error = 2                " See CL_GUI_CONTROL
      OTHERS            = 3.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  " Split output into 2 sections
  " 1 - ALV output and 2 - Log
  CREATE OBJECT go_split_2
    EXPORTING
      parent  = go_s100_2
      rows    = 2
      columns = 1.

  " create output ALV container
  CALL METHOD go_split_2->get_container
    EXPORTING
      row       = 1
      column    = 1
    RECEIVING
      container = go_s100_details.

  "cretae Log container
  CALL METHOD go_split_2->get_container
    EXPORTING
      row       = 2
      column    = 1
    RECEIVING
      container = go_s100_log.

  "Set hight for log container
  CALL METHOD go_split_2->set_row_height
    EXPORTING
      id                = 2                 " Row ID
      height            = 30                 " Height
    EXCEPTIONS
      cntl_error        = 1                " See CL_GUI_CONTROL
      cntl_system_error = 2                " See CL_GUI_CONTROL
      OTHERS            = 3.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

** create a tree control
  CREATE OBJECT go_s100_list_tree
    EXPORTING
      parent                      = go_s100_list
      node_selection_mode         = cl_list_tree_model=>node_sel_mode_single
      item_selection              = 'X'
      with_headers                = ' '
    EXCEPTIONS
      illegal_node_selection_mode = 1
      OTHERS                      = 99.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

* define the events which will be passed to the backend
  " link click
  CLEAR: ls_event, lt_events.
  ls_event-eventid = cl_gui_list_tree=>eventid_link_click.
  ls_event-appl_event = 'X'.
  APPEND ls_event TO lt_events.

  CALL METHOD go_s100_list_tree->set_registered_events
    EXPORTING
      events                    = lt_events
    EXCEPTIONS
      cntl_error                = 1
      cntl_system_error         = 2
      illegal_event_combination = 3.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  "Set handler for event link click
  SET HANDLER go_application->handle_link_click FOR go_s100_list_tree.

  "Prepare tree with all the necesarry parameters
  CALL METHOD go_s100_list_tree->add_nodes_and_items
    EXPORTING
      node_table                     = lt_node_table
      item_table                     = lt_item_table
      item_table_structure_name      = 'MTREEITM'
    EXCEPTIONS
      failed                         = 1
      cntl_system_error              = 3
      error_in_tables                = 4
      dp_error                       = 5
      table_structure_name_not_found = 6.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
ENDFORM.

FORM show_documentation USING docuobject TYPE doku_obj.

  "Show the documentation object in view-mode
  CALL FUNCTION 'DOCU_CALL'
    EXPORTING
      displ             = abap_true
      displ_mode        = '3'
      id                = 'TX' "docuid'
      langu             = sy-langu
      object            = docuobject
      display_shorttext = abap_true.

ENDFORM.                    "show_documentation

FORM show_table_alv USING    ir_alv_grid      TYPE REF TO cl_gui_alv_grid
                    CHANGING cs_layout        TYPE lvc_s_layo
                             ct_outtab        TYPE STANDARD TABLE
                             ct_fieldcatalog  TYPE lvc_t_fcat.

  IF cs_layout-smalltitle IS INITIAL.
    cs_layout-smalltitle = abap_true.
  ENDIF.
    cs_layout-no_rowmark = abap_true.

  CALL METHOD ir_alv_grid->set_table_for_first_display
    EXPORTING
      it_toolbar_excluding = go_application->func_exclude
      is_layout            = cs_layout
    CHANGING
      it_outtab            = ct_outtab
      it_fieldcatalog      = ct_fieldcatalog.

ENDFORM.                    " show_table_alv

FORM prepare_fieldcat USING fieldname   TYPE any
                            coltext     TYPE any
                            outputlen   TYPE any
                            tooltip     TYPE any
                            col_pos     TYPE any
                            hotspot     TYPE any
                            icon        TYPE lvc_icon
                            edit        TYPE lvc_edit
                            drdn_field  TYPE lvc_fname
                            checkbox    TYPE lvc_checkb
                            drdn_hndl   TYPE int4
                            col_opt     TYPE lvc_colopt
                            f4availabl  TYPE  ddf4avail
                   CHANGING lt_fcat TYPE lvc_t_fcat.

  DATA :  ls_fcat_msg TYPE lvc_s_fcat.

  CLEAR ls_fcat_msg.
  ls_fcat_msg-fieldname   = fieldname.
  ls_fcat_msg-coltext     = coltext.
  ls_fcat_msg-outputlen   = outputlen.
  ls_fcat_msg-tooltip     = tooltip.
  ls_fcat_msg-col_pos     = col_pos.
  ls_fcat_msg-hotspot     = hotspot.
  ls_fcat_msg-icon        = icon.
  ls_fcat_msg-edit        = edit.
  ls_fcat_msg-drdn_field  = drdn_field.
  ls_fcat_msg-checkbox    = checkbox.
  ls_fcat_msg-drdn_hndl   = drdn_hndl.
  ls_fcat_msg-col_opt     = col_opt.
  ls_fcat_msg-f4availabl  = f4availabl.
  ls_fcat_msg-lowercase   = 'X'.
  APPEND ls_fcat_msg TO lt_fcat.

ENDFORM.

FORM prepare_output.
  "Data declaration
  FIELD-SYMBOLS:
    <ls_alv_details> TYPE ANY TABLE.
  DATA:
    lv_is_maint_applicable TYPE sap_bool.

  IF go_s100_details_alv IS BOUND.
    go_s100_details_alv->free( ).
  ENDIF.
  IF go_s100_log_alv IS BOUND.
    go_s100_log_alv->free( ).
  ENDIF.

  CREATE OBJECT go_s100_details_alv
    EXPORTING
      i_parent = go_s100_details.


  CREATE OBJECT go_s100_log_alv
    EXPORTING
      i_parent = go_s100_log.


  CLEAR : go_application->data,
          go_application->data_comp_type,
          go_application->field_map_out_to_in,
          go_application->mt_fcat,
          go_application->display_mode,
          go_application->dropdown_values,
          go_application->layout_details,
          go_application->layout_log,
          go_application->fcat_details,
          go_application->fcat_log.

  "Set handler for ALV actions
  SET HANDLER go_application->handle_edit_toolbar FOR go_s100_details_alv.
  SET HANDLER go_application->handle_user_command FOR go_s100_details_alv.
  SET HANDLER go_application->handle_data_changed FOR go_s100_details_alv.
  SET HANDLER go_application->handle_data_changed_finished FOR go_s100_details_alv.
  SET HANDLER go_application->handle_on_f4 FOR go_s100_details_alv.

  "Register F4 help function
  PERFORM register_fields_for_f4 USING go_s100_details_alv.

  CALL METHOD go_s100_details_alv->register_edit_event
    EXPORTING
      i_event_id = cl_gui_alv_grid=>mc_evt_modified.


  "check if there is any maintenance is there
  lv_is_maint_applicable = cl_cvi_customizing_resolve=>is_maintainence_exist( go_application->node_key ).

  IF lv_is_maint_applicable EQ abap_true.
    "check for authorizations
    CALL METHOD cl_cvi_customizing_resolve=>check_for_editable
      EXPORTING
        iv_scenario          = go_application->node_key               " Character Field of Length 12
      EXCEPTIONS
        editable_not_allowed = 1                " One of the check got failed
        OTHERS               = 2.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      go_application->display_mode = 'A'. " Errors- so open with all Toolbar with Non-Editable
    ELSE.
      go_application->display_mode = 'R'." open as Ready for Input
    ENDIF.
  ELSE.
    go_application->display_mode = 'D'. " No Maintainence - So Display mode
  ENDIF.

  CALL METHOD go_application->set_data_alv_toolbar( ).

  "Check and Prepare data for output
  PERFORM prep_alv_details
      USING     go_application->node_key
      CHANGING  go_application->data
                go_application->logs go_application->fcat_details
                go_application->field_map_out_to_in
                go_application->dropdown_values
                go_application->layout_details.
  "Set dropdown values if required.
  IF go_application->dropdown_values IS NOT INITIAL.
    CALL METHOD go_s100_details_alv->set_drop_down_table
      EXPORTING
        it_drop_down = go_application->dropdown_values.
  ENDIF.

  "Prapre log alv data
  PERFORM prepare_alv_log
    CHANGING go_application->fcat_log go_application->layout_log.


  IF go_application->data IS NOT INITIAL.
    ASSIGN go_application->data->* TO <ls_alv_details>.
    IF <ls_alv_details> IS ASSIGNED.
      PERFORM show_table_alv
        USING   go_s100_details_alv
       CHANGING go_application->layout_details
                <ls_alv_details>
                go_application->fcat_details.
    ENDIF.
  ENDIF.

  "Show initial ALV as display mode
  CALL METHOD go_s100_details_alv->set_toolbar_interactive.
  CALL METHOD go_s100_details_alv->set_ready_for_input
    EXPORTING
      i_ready_for_input = 0.

  "Incase no error message is present, log message "No customizing error"
  IF go_application->logs IS INITIAL.
    CALL METHOD cl_cvi_customizing_resolve=>prepare_message
      EXPORTING
        iv_severity       = 3
        iv_message_number = 032
      CHANGING
        ct_log            = go_application->logs.
  ENDIF.

  "Show ALV display for logs
  PERFORM show_table_alv
    USING    go_s100_log_alv
    CHANGING go_application->layout_log
             go_application->logs
             go_application->fcat_log.

ENDFORM.

FORM prep_alv_details
       USING i_scenario TYPE char12
    CHANGING ch_data TYPE REF TO data
             ch_log  TYPE cl_cvi_customizing_resolve=>tt_log
             ch_fcat TYPE lvc_t_fcat
             ch_field_mapping TYPE cl_cvi_customizing_resolve=>tt_field_mapping_out_to_in
             ch_dropdown_values TYPE lvc_t_drop
             ch_layo TYPE lvc_s_layo.

  FIELD-SYMBOLS <lfs_data> TYPE cl_cvi_customizing_resolve=>tt_id_desc_op.

  DATA  lt_log  TYPE cl_cvi_customizing_resolve=>tt_log.

  CREATE DATA ch_data TYPE cl_cvi_customizing_resolve=>tt_id_desc_op.
  ASSIGN ch_data->* TO <lfs_data>.

  "Check and get inconsistent data
  CALL METHOD cl_cvi_customizing_resolve=>check_data
    EXPORTING
      iv_scenario        = i_scenario
    IMPORTING
      et_output          = <lfs_data>
      et_log             = lt_log
      et_dropdown_values = ch_dropdown_values.

  "Get Input to view field mapping for save logic
  CALL METHOD cl_cvi_customizing_resolve=>get_mapping_out_to_in
    EXPORTING
      iv_scenario          = i_scenario
    IMPORTING
      et_mapping_out_to_in = ch_field_mapping.

  "Prepare field catalog
  go_application->prepare_field_catalog(
    EXPORTING
      iv_scenario = i_scenario
    IMPORTING
      et_fcat     = ch_fcat
      es_layo     = ch_layo ).

  "If there are any error messages from save process them in log
  IF go_application->inconsistent_logs IS INITIAL.
    ch_log = lt_log.
  ELSE.
    ch_log = go_application->inconsistent_logs.
    CLEAR go_application->inconsistent_logs.
  ENDIF.


ENDFORM.

FORM register_fields_for_f4  USING io_application TYPE REF TO cl_gui_alv_grid.

  DATA: lt_fields_f4 TYPE lvc_t_f4,
        ls_fields_f4 TYPE lvc_s_f4.

* register the fields which you want custom input help for
  ls_fields_f4-fieldname = 'INPUT'.
  ls_fields_f4-register = 'X'.
  APPEND ls_fields_f4 TO lt_fields_f4.

  ls_fields_f4-fieldname = 'TEXT1'.
  ls_fields_f4-register = 'X'.
  APPEND ls_fields_f4 TO lt_fields_f4.

  CALL METHOD io_application->register_f4_for_fields
    EXPORTING
      it_f4 = lt_fields_f4.

ENDFORM.

FORM lock_current_view
   USING action                 TYPE c
         it_field_map_out_to_in TYPE cl_cvi_customizing_resolve=>tt_field_mapping_out_to_in
         it_data                TYPE cl_cvi_customizing_resolve=>tt_id_desc_op
         ev_error               TYPE c.

  DATA ls_mapping_in_to_out   TYPE
            cl_cvi_customizing_resolve=>ty_field_mapping_out_to_in.
  IF it_data IS NOT INITIAL.
    LOOP AT it_field_map_out_to_in INTO ls_mapping_in_to_out.
      CALL METHOD cl_cvi_customizing_resolve=>lock_view
        EXPORTING
          iv_action       = action " 'E'-> Enqueue 'D'-> Dequeue
          iv_viewname     = ls_mapping_in_to_out-view_name                 " Table Name
        EXCEPTIONS
          foreign_lock    = 1  " View is locked by another user
          technical_error = 2  " system_failure, table_not_found - Non Business Error
          OTHERS          = 3.
      IF sy-subrc NE 0.
        MESSAGE s039 WITH sy-msgv1 sy-msgv2 RAISING foreign_lock DISPLAY LIKE 'E'.
        ev_error = abap_true.
      ENDIF.
    ENDLOOP.
  ENDIF.
ENDFORM.

FORM check_data_loss USING it_data TYPE cl_cvi_customizing_resolve=>tt_id_desc_op
                     CHANGING cv_answer TYPE c.
  READ TABLE it_data TRANSPORTING NO FIELDS
        WITH KEY is_change = abap_true.
  IF sy-subrc EQ 0.
    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
        titlebar              = TEXT-m02
        text_question         = TEXT-m03
        text_button_1         = TEXT-m04
        text_button_2         = TEXT-m05
        display_cancel_button = ' '
        popup_type            = 'ICON_MESSAGE_INFO'
      IMPORTING
        answer                = cv_answer.
  ENDIF.

ENDFORM.
