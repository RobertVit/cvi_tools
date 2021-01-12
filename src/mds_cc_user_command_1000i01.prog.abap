*----------------------------------------------------------------------*
***INCLUDE ZTEST_CC_USER_COMMAND_1000I01 .
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module USER_COMMAND_1000 input.

DATA : OK_CODE TYPE SY-UCOMM.

case OK_CODE.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN 'END'.
      LEAVE PROGRAM.
    WHEN 'CAN'.
      LEAVE PROGRAM.
endcase.
endmodule.                 " USER_COMMAND_1000  INPUT
