*&---------------------------------------------------------------------*
*&  Include           CVI_COMPLETENESS_CHECK_DECL
*&---------------------------------------------------------------------*


TYPES: ty_return_code TYPE i,
       BEGIN OF ty_preprocessing_check_result,
         software_component    TYPE dlvunit,
         check_id              TYPE c LENGTH 40,   "to be chosen as needed
         description           TYPE c LENGTH 255,  " must contain the SAP note that describes the check, provides further information and how to deal with possible problems.
         return_code           TYPE ty_return_code,
         application_component TYPE ufps_posid,    " Application component for BCP customer incident, if the customer has to open a ticket with questions about the check.
       END   OF ty_preprocessing_check_result .
*tt_preprocessing_check_results type standard table of ty_preprocessing_check_result.

DATA: gt_cust           type  kna1_key_t,
      gt_vend           TYPE  lfa1_key_t,
gc_true(1)          TYPE c VALUE 'X',
GV_DISP       TYPE etonoff.

DATA: gt_cust_cont           type  kna1_key_t,
      gt_vend_cont           TYPE  lfa1_key_t,
      gv_cust_from TYPE kunnr,
      gv_cust_to TYPE kunnr,
      gv_vend_from type lifnr,
      gv_vend_to TYPE lifnr,
      gv_cust_wo_cp(1) type c ,
      gv_cust_with_cp(1) type c,
      gv_vend_with_cp(1) type c,
      gv_vend_wo_cp(1) type c,
      gv_no                 TYPE i,
      gt_fieldcat_cvi   TYPE lvc_t_fcat,
      gs_fcat           TYPE lvc_s_fcat,
      gt_fieldcat_cont        TYPE lvc_t_fcat,
      gr_alv_cvi        TYPE REF TO cl_gui_alv_grid,
      gr_cvi_cc         type REF TO cl_gui_custom_container,
       gr_alv_cvi_cont        TYPE REF TO cl_gui_alv_grid,
      gr_cvi_cc_cont         type REF TO cl_gui_custom_container,
      gt_fcat_vend_cont      TYPE lvc_t_fcat,
      gr_vend_cc_cont        type REF TO cl_gui_custom_container,
      gr_alv_vend       TYPE REF TO cl_gui_alv_grid,
      gr_vend_cc        type REF TO cl_gui_custom_container,
      gt_fcat_vend      TYPE lvc_t_fcat,
      gr_alv_vend_cont       TYPE REF TO cl_gui_alv_grid,
      gs_layout_default       TYPE lvc_s_layo.
