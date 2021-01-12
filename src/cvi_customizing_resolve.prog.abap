*&---------------------------------------------------------------------*
*& Modulpool  CVI_CUSTOMIZING_RESOLVE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
PROGRAM cvi_customizing_resolve MESSAGE-ID CVI_CUST_RESOLVE.

"include for global data declaration
INCLUDE cvi_customizing_resolve_top.
"include for local class declaration
INCLUDE cvi_customizing_resolve_lcl.
"include for PAI modules
INCLUDE cvi_customizing_resolve_i01.
"include for PBO modules
INCLUDE cvi_customizing_resolve_o01.
"include for all subroutines
INCLUDE cvi_customizing_resolve_f01.

LOAD-OF-PROGRAM.

  CREATE OBJECT go_application.
  CALL METHOD cl_cvi_customizing_resolve=>initialize_icons.
  PERFORM prepare_screen_100.
