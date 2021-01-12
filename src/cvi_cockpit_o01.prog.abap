*&---------------------------------------------------------------------*
*&  Include           CVI_COCKPIT_O01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  STATUS_1000  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_1000 OUTPUT.
  SET PF-STATUS 'PF_STATUS_1000'.
  SET TITLEBAR 'TITLE_1000'.

  CLEAR  gv_cursor_field.

  "set Tabstrip icon and Title
  PERFORM update_stage_icon_and_text.

  "set task details over UI dynamically
  PERFORM update_task_status.

  PERFORM update_overall_status.

  PERFORM determine_subcreen_no.

  PERFORM modify_mainscreen_ui_elements.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  CONTROL_UI_ELEMENTS  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE control_ui_elements OUTPUT.
  PERFORM modify_subscreen_ui_elements.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_2000  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_2000 OUTPUT.

  SET PF-STATUS 'PF_STATUS_2000'.
  SET TITLEBAR 'TITLE_2000'.


  PERFORM prepare_and_set_texteditor.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_3000  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_3000 OUTPUT.
  SET PF-STATUS 'PF_STATUS_3000'.
  SET TITLEBAR 'TITLE_3000'.

  PERFORM determine_unsync_records.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_4000  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_4000 OUTPUT.
  SET PF-STATUS 'PF_STATUS_4000'.
  SET TITLEBAR 'TITLE_4000'.
ENDMODULE.
