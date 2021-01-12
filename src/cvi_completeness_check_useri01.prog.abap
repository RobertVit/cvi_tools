*----------------------------------------------------------------------*
***INCLUDE CVI_COMPLETENESS_CHECK_USERI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1311  INPUT    .
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE USER_COMMAND_1311 INPUT.
CASE SY-UCOMM.
  WHEN 'DISP'.
    GV_DISP = 'X'.
  WHEN 'EXPORT'.
    CALL SCREEN 1312 STARTING AT 10 10.
  WHEN 'BACK'.
    LEAVE TO SCREEN 0.
  WHEN 'CANCEL' OR 'EXIT'.
    LEAVE PROGRAM.
 ENDCASE.
ENDMODULE.
