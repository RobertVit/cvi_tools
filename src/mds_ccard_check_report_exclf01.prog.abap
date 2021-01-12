*----------------------------------------------------------------------*
***INCLUDE MDS_CCARD_CHECK_REPORT_EXCLF01 .
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  exclude_toolbar_functions
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--P_LT_TOOLBAR  text
*----------------------------------------------------------------------*
FORM exclude_toolbar_functions  CHANGING pt_toolbar TYPE ui_functions.
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
