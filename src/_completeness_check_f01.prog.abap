*----------------------------------------------------------------------*
***INCLUDE _COMPLETENESS_CHECK_F01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  SHOW_TABLE_ALV **
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form show_table_alv using    ir_alv_grid      type ref to cl_gui_alv_grid
                             is_layout        type lvc_s_layo
                    changing it_outtab        type standard table
                             it_fieldcatalog  type lvc_t_fcat.


  call method ir_alv_grid->set_table_for_first_display
    exporting
      is_layout       = is_layout
    changing
      it_outtab       = it_outtab
      it_fieldcatalog = it_fieldcatalog.





endform.
