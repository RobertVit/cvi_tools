*&---------------------------------------------------------------------*
*& Module Pool       CVI_COCKPIT
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
PROGRAM cvi_cockpit MESSAGE-ID cvi_cockpit.

"include for global data declaration
INCLUDE cvi_cockpit_top.

"include shared by CVI_LOAD tool
INCLUDE cvi_cockpit_common.

"include for PAI modules
INCLUDE cvi_cockpit_i01.

"include for PBO modules
INCLUDE cvi_cockpit_o01.

"include for all subroutines
INCLUDE cvi_cockpit_f01.

LOAD-OF-PROGRAM.
  PERFORM load_of_program.
