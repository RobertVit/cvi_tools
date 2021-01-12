*&---------------------------------------------------------------------*
*& Include MDS_BPCUST_LINK_CHECK_RPTTOP     Module Pool      MDS_BPCUST_LINK_CHECK_REPORT
*&
*&---------------------------------------------------------------------*
PROGRAM  MDS_BPCUST_LINK_CHECK_REPORT.

* Global type
types:  begin of gty_bp_customer_ids_alv,
         partner  type bu_partner,
         customer type kunnr,
        end of gty_bp_customer_ids_alv.

DATA : gc_x                      TYPE boole-boole VALUE 'X',
       ok_code                   TYPE sy-ucomm,
       p_testrun                 TYPE boole-boole,
       lv_message                TYPE char100,
       gs_alv_grid               TYPE REF TO cl_gui_alv_grid,
       g_custom_container        TYPE REF TO cl_gui_custom_container,
       gs_entries_to_delete_alv  TYPE gty_bp_customer_ids_alv,
       gt_entries_to_delete_alv  TYPE table of gty_bp_customer_ids_alv.

*&---------------------------------------------------------------------*
*&      Module  set_toolbar  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE set_toolbar OUTPUT.
  SET PF-STATUS 'TOOLBAR'.
  SET TITLEBAR 'TITLE'.
ENDMODULE.                 " set_toolbar  OUTPUT

*&---------------------------------------------------------------------*
*&      Module  user_command_handling  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_handling INPUT.

CASE ok_code.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN 'EXIT'.
      LEAVE PROGRAM.
    WHEN 'CANCEL'.
      LEAVE PROGRAM.
    WHEN OTHERS.
*   do nothing
ENDCASE.

ENDMODULE.                 " user_command_handling  INPUT
*&---------------------------------------------------------------------*
*&      Module  set_screen_status  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE set_screen_status OUTPUT.

CASE ok_code.
  WHEN 'EXECUTE' OR 'ENTER'.
    PERFORM display_result.

    LOOP AT SCREEN.
     IF SCREEN-NAME = 'USER_SELECTION' OR SCREEN-NAME = 'P_TSTRUN' OR SCREEN-NAME = 'P_TESTRUN' OR ( SCREEN-NAME = 'LV_MESSAGE' AND lv_message IS INITIAL ).
        SCREEN-ACTIVE = 0.
     ENDIF.
     MODIFY SCREEN.
    ENDLOOP.

  WHEN OTHERS.
    p_testrun = gc_x.
    LOOP AT SCREEN.
     IF SCREEN-NAME = 'LV_MESSAGE' AND lv_message IS INITIAL.
        SCREEN-ACTIVE = 0.
     ENDIF.
     MODIFY SCREEN.
    ENDLOOP.
ENDCASE.
ENDMODULE.                 " set_screen_status  OUTPUT
*&---------------------------------------------------------------------*
*&      Form  display_result
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM display_result.

* Local type
types:  begin of lty_bp_customer_ids,
         partner_guid  type bu_partner_guid,
         customer      type kunnr,
         del_flag      type boole-boole,
        end of lty_bp_customer_ids.

* Local data declarations
DATA:
    lv_kunnr                  TYPE kna1-kunnr,
    lv_partner_guid           TYPE but000-partner_guid,
    db_customer               TYPE cursor,
    lt_toolbar                TYPE ui_functions,
    ls_bp_customer_ids        TYPE lty_bp_customer_ids,
    lt_bp_customer_ids        TYPE table of lty_bp_customer_ids,
    ls_entries_to_delete      LIKE cvi_cust_link,
    lt_entries_to_delete      LIKE table of ls_entries_to_delete.

DATA:
    ls_field_cat              TYPE lvc_s_fcat,
    lt_field_cat              TYPE lvc_t_fcat.

CONSTANTS:
    lc_pkg_size               TYPE char5 VALUE '10000'.

CLEAR: ls_bp_customer_ids,
       ls_entries_to_delete,
       gs_entries_to_delete_alv.

REFRESH: lt_entries_to_delete,
         gt_entries_to_delete_alv.

OPEN CURSOR db_customer FOR
     select PARTNER_GUID CUSTOMER from cvi_cust_link.             "#EC CI_NOWHERE

DO.

CLEAR   ls_bp_customer_ids.
REFRESH lt_bp_customer_ids.
FETCH NEXT CURSOR db_customer INTO CORRESPONDING FIELDS OF TABLE lt_bp_customer_ids
                              PACKAGE SIZE lc_pkg_size.
  IF sy-subrc <> 0.
     EXIT.
  ELSE.
    LOOP AT lt_bp_customer_ids INTO ls_bp_customer_ids.
      clear lv_partner_guid.
      select single partner_guid FROM  but000
                                 INTO  lv_partner_guid
                                 WHERE partner_guid = ls_bp_customer_ids-partner_guid.

        IF sy-subrc <> 0.
          ls_bp_customer_ids-del_flag = gc_x.
        ELSE.
          clear lv_kunnr.
          select single kunnr FROM  kna1
                              INTO  lv_kunnr
                              WHERE kunnr = ls_bp_customer_ids-customer.

           IF sy-subrc <> 0.
               ls_bp_customer_ids-del_flag = gc_x.
           ENDIF.
        ENDIF.
        IF ls_bp_customer_ids-del_flag = gc_x.
          CLEAR ls_entries_to_delete.
          ls_entries_to_delete-partner_guid = ls_bp_customer_ids-partner_guid.
          ls_entries_to_delete-customer = ls_bp_customer_ids-customer.
          APPEND ls_entries_to_delete TO lt_entries_to_delete.
        ENDIF.
    ENDLOOP.
  ENDIF.

ENDDO.

CLOSE CURSOR db_customer.

IF lt_entries_to_delete IS NOT INITIAL AND p_testrun IS INITIAL.
   DELETE cvi_cust_link FROM TABLE lt_entries_to_delete.
   COMMIT WORK.
ENDIF.

* Set up the data to display what has changed.
  LOOP AT lt_entries_to_delete INTO ls_entries_to_delete.
    clear gs_entries_to_delete_alv.
    CALL FUNCTION 'BUPA_NUMBERS_GET'
     EXPORTING
       IV_PARTNER_GUID  = ls_entries_to_delete-partner_guid
     IMPORTING
       EV_PARTNER       = gs_entries_to_delete_alv-partner.
    gs_entries_to_delete_alv-customer = ls_entries_to_delete-customer.
    APPEND gs_entries_to_delete_alv TO gt_entries_to_delete_alv.
  ENDLOOP.

* Set the table field names.
  ls_field_cat-fieldname = 'PARTNER'.
  ls_field_cat-inttype   = 'C'.
  ls_field_cat-outputlen = '20'.
  ls_field_cat-coltext   = text-006.
  ls_field_cat-seltext   = text-006.
  APPEND ls_field_cat TO  lt_field_cat.

  ls_field_cat-fieldname = 'CUSTOMER'.
  ls_field_cat-inttype   = 'C'.
  ls_field_cat-outputlen = '10'.
  ls_field_cat-coltext   = text-007.
  ls_field_cat-seltext   = text-007.
  APPEND ls_field_cat TO  lt_field_cat.

IF gt_entries_to_delete_alv IS NOT INITIAL.
    lv_message = text-010.
    IF gs_alv_grid IS INITIAL.
      IF g_custom_container IS INITIAL.
         CREATE OBJECT g_custom_container
           EXPORTING
             container_name = 'LC_CONTAINER'.

         CREATE OBJECT gs_alv_grid
           EXPORTING
             i_parent = g_custom_container.
       ENDIF.

*     toolbar certain operations from the toolbar
      PERFORM exclude_toolbar_functions CHANGING lt_toolbar.

      CALL METHOD gs_alv_grid->set_table_for_first_display
        EXPORTING
          it_toolbar_excluding = lt_toolbar
        CHANGING
          it_outtab            = gt_entries_to_delete_alv
          it_fieldcatalog      = lt_field_cat.
    ELSE.
      CALL METHOD gs_alv_grid->refresh_table_display.
    ENDIF.
ELSE.
  lv_message = text-009.
ENDIF.
ENDFORM.                    " display_result

*&---------------------------------------------------------------------*
*&      Form  exclude_toolbar_functions
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--PT_TOOLBAR  text
*----------------------------------------------------------------------*
FORM exclude_toolbar_functions
              CHANGING pt_toolbar TYPE ui_functions.

  DATA ls_toolbar TYPE ui_func.

  ls_toolbar = cl_gui_alv_grid=>mc_fc_separator.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_subtot.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_sum.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_to_office.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_to_rep_tree.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_unfix_columns.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_url_copy_to_clipboard.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_variant_admin.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_views.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_view_crystal.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_view_excel.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_view_grid.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_view_lotus.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_word_processor.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_delete_row.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_insert_row.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_move_row.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_paste.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_paste_new_row.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_undo.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_maintain_variant.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_maximum.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_minimum.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_pc_file.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_refresh.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_reprep.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_save_variant.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_select_all.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_send.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_expcrdata.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_expcrdesig.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_expcrtempl.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_expmdb.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_extend.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_f4.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_filter.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_fix_columns.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_graph.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_help.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_html.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_info.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_load_variant.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_append_row.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_copy.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_copy_row.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_cut.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_deselect_all.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_detail.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_expcrdata.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_expcrdesig.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_expcrtempl.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_expmdb.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_extend.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_f4.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_filter.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_fix_columns.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_graph.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_help.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_html.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_info.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_load_variant.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_append_row.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_copy.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_copy_row.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_deselect_all.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_select_all.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_detail.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_expcrdata.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_expcrdesig.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_expcrtempl.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_expmdb.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_extend.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_f4.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_filter.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_fix_columns.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_graph.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_help.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_html.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_info.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_load_variant.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_append_row.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_loc_copy.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_back_classic.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_abc.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_chain.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_crbatch.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_crweb.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_lineitems.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_master_data.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_more.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_report.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_xint.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_xxl.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_check.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_col_invisible.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_col_optimize.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_count.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_current_variant.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_data_save.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_delete_filter.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_auf.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_average.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_back_classic.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_abc.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_chain.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_crbatch.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_crweb.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_lineitems.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_master_data.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_more.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_report.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_xint.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_call_xxl.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_check.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_col_invisible.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_col_optimize.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_count.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_current_variant.
  APPEND ls_toolbar TO pt_toolbar.
  ls_toolbar = cl_gui_alv_grid=>mc_fc_data_save.
  APPEND ls_toolbar TO pt_toolbar.

ENDFORM.                    " exclude_toolbar_functions
