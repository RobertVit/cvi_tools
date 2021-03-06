*&---------------------------------------------------------------------*
*& Include MDS_BPCONT_LINK_CHECK_RPTTOP     Module Pool      MDS_BPCONT_LINK_CHECK_REPORT
*&
*&---------------------------------------------------------------------*
PROGRAM  MDS_BPCONT_LINK_CHECK_REPORT.

* Global types
  types:
       begin of gty_bp_cust_contact_ids_alv,
         partner        type bu_partner,
         person         type bu_partner,
         customer_cont  type parnr,
       end of gty_bp_cust_contact_ids_alv.

  DATA:
      ok_code                   TYPE sy-ucomm,
      p_testrun                 TYPE boole-boole,
      lv_message                TYPE char100,
      gc_x                      TYPE boole-boole VALUE 'X',
      gs_alv_grid               TYPE REF TO cl_gui_alv_grid,
      g_custom_container        TYPE REF TO cl_gui_custom_container,
      gs_entries_to_delete_alv  TYPE gty_bp_cust_contact_ids_alv,
      gt_entries_to_delete_alv  TYPE table of gty_bp_cust_contact_ids_alv.

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
*----------------------------------------------------------------------*
FORM display_result.

* Local type
types:  begin of lty_bp_cust_contact_ids,
         partner_guid  type bu_partner_guid,
         person_guid   type bu_partner_guid,
         customer_cont type parnr,
         del_flag      type boole-boole,
        end of lty_bp_cust_contact_ids.

* Local data declarations
DATA:
    lv_parnr                  TYPE knvk-parnr,
    lv_person                 TYPE bu_partner,
    lv_partner                TYPE bu_partner,
    lv_partnertmp             TYPE bu_partner,
*    lv_partner_guid           TYPE but000-partner_guid,
*    lv_person_guid            TYPE but000-partner_guid,
    db_cust_contact           TYPE cursor,
    lt_toolbar                TYPE ui_functions,
    ls_bp_cust_contact_ids    TYPE lty_bp_cust_contact_ids,
    lt_bp_cust_contact_ids    TYPE table of lty_bp_cust_contact_ids,
    ls_entries_to_delete      LIKE cvi_cust_ct_link,
    lt_entries_to_delete      LIKE table of ls_entries_to_delete.

DATA:
    lt_field_cat              TYPE lvc_t_fcat,
    ls_field_cat              TYPE lvc_s_fcat.

CONSTANTS:
    lc_reltyp                 TYPE char6       VALUE 'BUR001',
    lc_pkg_size               TYPE char5       VALUE '10000'.

CLEAR:lv_message,
      ls_entries_to_delete,
      gs_entries_to_delete_alv.

REFRESH:
      lt_entries_to_delete,
      gt_entries_to_delete_alv.

OPEN CURSOR db_cust_contact FOR
     select PARTNER_GUID PERSON_GUID CUSTOMER_CONT from cvi_cust_ct_link.   "#EC CI_NOWHERE

DO.

CLEAR   ls_bp_cust_contact_ids.
REFRESH lt_bp_cust_contact_ids.

FETCH NEXT CURSOR db_cust_contact INTO CORRESPONDING FIELDS OF TABLE lt_bp_cust_contact_ids
                                  PACKAGE SIZE lc_pkg_size.

  IF sy-subrc <> 0.
     EXIT.
  ELSE.
      LOOP AT lt_bp_cust_contact_ids INTO ls_bp_cust_contact_ids.
        clear lv_partner.
        select single partner FROM  but000
                                   INTO  lv_partner
                                   WHERE partner_guid = ls_bp_cust_contact_ids-partner_guid. "#EC *


        IF sy-subrc <> 0.
          ls_bp_cust_contact_ids-del_flag = gc_x.
        ELSE.
          clear lv_person.
          select single partner FROM  but000
                                     INTO  lv_person
                                     WHERE partner_guid = ls_bp_cust_contact_ids-person_guid. "#EC *


          IF sy-subrc <> 0.
             ls_bp_cust_contact_ids-del_flag = gc_x.
          ELSE.
             clear: lv_partnertmp.
             select single partner1 FROM but051
                                    INTO lv_partnertmp
                                    WHERE ( partner1     = lv_partner
                                            AND partner2 = lv_person
                                            AND reltyp   = lc_reltyp )
                                          OR
                                          ( partner1     = lv_person
                                            AND partner2 = lv_partner
                                            AND reltyp   = lc_reltyp ). "#EC *

             IF sy-subrc <> 0.
                ls_bp_cust_contact_ids-del_flag = gc_x.
             ELSE.
               clear lv_parnr.
               select single parnr FROM  knvk
                                   INTO  lv_parnr
                                   WHERE parnr = ls_bp_cust_contact_ids-customer_cont.

               IF sy-subrc <> 0.
                   ls_bp_cust_contact_ids-del_flag = gc_x.
               ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.
        IF ls_bp_cust_contact_ids-del_flag = gc_x.
          CLEAR ls_entries_to_delete.
          ls_entries_to_delete-partner_guid = ls_bp_cust_contact_ids-partner_guid.
          ls_entries_to_delete-person_guid = ls_bp_cust_contact_ids-person_guid.
          ls_entries_to_delete-customer_cont = ls_bp_cust_contact_ids-customer_cont.
          APPEND ls_entries_to_delete TO lt_entries_to_delete.
        ENDIF.
     ENDLOOP.
  ENDIF.

ENDDO.

CLOSE CURSOR db_cust_contact.

IF lt_entries_to_delete IS NOT INITIAL AND p_testrun IS INITIAL.
   DELETE cvi_cust_ct_link FROM TABLE lt_entries_to_delete.
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

    CALL FUNCTION 'BUPA_NUMBERS_GET'
     EXPORTING
       IV_PARTNER_GUID  = ls_entries_to_delete-person_guid
     IMPORTING
       EV_PARTNER       = gs_entries_to_delete_alv-person.

    gs_entries_to_delete_alv-customer_cont = ls_entries_to_delete-customer_cont.
    APPEND gs_entries_to_delete_alv TO gt_entries_to_delete_alv.
  ENDLOOP.

* Set the table field names.
  ls_field_cat-fieldname = 'PARTNER'.
  ls_field_cat-inttype   = 'C'.
  ls_field_cat-outputlen = '20'.
  ls_field_cat-coltext   = text-006.
  ls_field_cat-seltext   = text-006.
  APPEND ls_field_cat TO lt_field_cat.

  ls_field_cat-fieldname = 'PERSON'.
  ls_field_cat-inttype   = 'C'.
  ls_field_cat-outputlen = '10'.
  ls_field_cat-coltext   = text-007.
  ls_field_cat-seltext   = text-007.
  APPEND ls_field_cat TO lt_field_cat.

  ls_field_cat-fieldname = 'CUSTOMER_CONT'.
  ls_field_cat-inttype   = 'C'.
  ls_field_cat-outputlen = '10'.
  ls_field_cat-coltext   = text-008.
  ls_field_cat-seltext   = text-008.
  APPEND ls_field_cat TO lt_field_cat.

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
