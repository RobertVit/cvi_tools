*----------------------------------------------------------------------*
***INCLUDE CVI_LOAD_TOOL_CONTROL_UI_ELO01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  CONTROL_UI_ELEMENTS  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE CONTROL_UI_ELEMENTS OUTPUT.

 PERFORM MODIFY_SUBSCREEN_UI_ELEMENTS IN PROGRAM CVI_COCKPIT IF FOUND.
ENDMODULE.
