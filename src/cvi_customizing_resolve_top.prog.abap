*&---------------------------------------------------------------------*
*&  Include           CVI_CUSTOMIZING_RESOLVE_TOP
*&---------------------------------------------------------------------*
* Definition:
* ~~~~~~~~~~~
 CLASS lcl_cvi_customizing_resolve DEFINITION DEFERRED.

 TYPES:
   BEGIN OF ty_tabkey,
     tabkey TYPE trobj_name,
   END OF ty_tabkey,

   BEGIN OF ty_istype,
     input TYPE bu_istype,
     bez30 TYPE bu_bez30,
   END OF ty_istype,

   BEGIN OF ty_ind_sector,
     text1 TYPE bu_ind_sector,
     desc  TYPE bu_text100,
   END OF ty_ind_sector,

   BEGIN OF ty_tree_hier,
     node_id         TYPE tv_nodekey,
     parent_id       TYPE tv_nodekey,
     description     TYPE string,
     is_parent       TYPE sap_bool,
     is_edit_allowed TYPE sap_bool,
     view_name       TYPE vim_name,
   END OF ty_tree_hier.

 TYPES:
   tt_tabkey     TYPE STANDARD TABLE OF ty_tabkey,
   tt_item_table TYPE STANDARD TABLE OF mtreeitm.

 CONSTANTS:
   BEGIN OF gc_fcode,
     back   TYPE gui_code VALUE 'BACK',
     exit   TYPE gui_code VALUE 'EXIT',
     canc   TYPE gui_code VALUE 'CANC',
     save   TYPE gui_code VALUE 'SAVE',
     toggle TYPE gui_code VALUE 'TOGGLE',
     disp   TYPE gui_code VALUE 'DISP',
     cust   TYPE gui_code VALUE 'CUST',
   END OF gc_fcode,

   BEGIN OF gc_nodes,
     gen           TYPE tv_nodekey VALUE    'GEN', "tv_nodekey
     gen_sync      TYPE tv_nodekey VALUE    'GEN_SYNC',
     gen_ppo       TYPE tv_nodekey VALUE    'GEN_PPO',
     gen_regfun    TYPE tv_nodekey VALUE    'GEN_REGFUN',
     gen_tax       TYPE tv_nodekey VALUE    'GEN_TAX',
     gen_addrnr    TYPE tv_nodekey VALUE    'GEN_ADDRNR',
     gen_industry  TYPE tv_nodekey VALUE    'GEN_INDUSTRY',

     cbp           TYPE tv_nodekey VALUE    'CBP',
     cbpcp         TYPE tv_nodekey VALUE    'CBPCP',
     cbp_roles     TYPE tv_nodekey VALUE    'CBP_ROLES',
     cbp_groupng   TYPE tv_nodekey VALUE    'CBP_GROUPNG',
     cbp_accrole   TYPE tv_nodekey VALUE    'CBP_ACCROLE',
     cbp_accgrp    TYPE tv_nodekey VALUE    'CBP_ACCGRP',
     cbpcp_actv    TYPE tv_nodekey VALUE    'CBPCP_ACTV',
     cbpcp_dept    TYPE tv_nodekey VALUE    'CBPCP_DEPT',
     cbpcp_func    TYPE tv_nodekey VALUE    'CBPCP_FUNC',
     cbpcp_auth    TYPE tv_nodekey VALUE    'CBPCP_AUTH',
     cbpcp_vip     TYPE tv_nodekey VALUE    'CBPCP_VIP',
     cbpcp_marital TYPE tv_nodekey VALUE    'CBPCP_MARITA',
     cbp_legal     TYPE tv_nodekey VALUE    'CBP_LEGAL',
     cbp_paycard   TYPE tv_nodekey VALUE    'CBP_PAYCARD',
     cbpleg_tax    TYPE tv_nodekey VALUE    'CBPLEG_TAX',
     cbpleg_loc    TYPE tv_nodekey VALUE    'CBPLEG_LOC',
     cbpleg_bank   TYPE tv_nodekey VALUE    'CBPLEG_BANK',
     cbp_ind_in    TYPE tv_nodekey VALUE    'CBP_IND_IN',

     vbp           TYPE tv_nodekey VALUE    'VBP',
     vbp_roles     TYPE tv_nodekey VALUE    'VBP_ROLES',
     vbp_groupng   TYPE tv_nodekey VALUE    'VBP_GROUPNG',
     vbp_accrole   TYPE tv_nodekey VALUE    'VBP_ACCROLE',
     vbp_accgrp    TYPE tv_nodekey VALUE    'VBP_ACCGRP',
     vbp_ind_in    TYPE tv_nodekey VALUE    'VBP_IND_IN',

     bpc           TYPE tv_nodekey VALUE    'BPC',
     bpc_roles     TYPE tv_nodekey VALUE    'BPC_ROLES',
     bpc_groupng   TYPE tv_nodekey VALUE    'BPC_GROUPNG',
     bpc_dept      TYPE tv_nodekey VALUE    'BPC_DEPT',
     bpc_func      TYPE tv_nodekey VALUE    'BPC_FUNC',
     bpc_auth      TYPE tv_nodekey VALUE    'BPC_AUTH',
     bpc_vip       TYPE tv_nodekey VALUE    'BPC_VIP',
     bpc_marital   TYPE tv_nodekey VALUE    'BPC_MARITAL',
     bpc_legal     TYPE tv_nodekey VALUE    'BPC_LEGAL',
     bpc_paycard   TYPE tv_nodekey VALUE    'BPC_PAYCARD',
     bpc_ind_out   TYPE tv_nodekey VALUE    'BPC_IND_OUT',

     bpv           TYPE tv_nodekey VALUE    'BPV',
     bpv_roles     TYPE tv_nodekey VALUE    'BPV_ROLES',
     bpv_groupng   TYPE tv_nodekey VALUE    'BPV_GROUPNG',
     bpv_ind_out   TYPE tv_nodekey VALUE    'BPV_IND_OUT',
   END OF gc_nodes.

 DATA:
   gv_ok_code          TYPE sy-ucomm,
   gv_doc_link         TYPE c,
   go_s100             TYPE REF TO cl_gui_custom_container,
   go_split_1          TYPE REF TO cl_gui_splitter_container,
   go_split_2          TYPE REF TO cl_gui_splitter_container,
   go_s100_list        TYPE REF TO cl_gui_container,
   go_s100_details     TYPE REF TO cl_gui_container,
   go_s100_log         TYPE REF TO cl_gui_container,
   go_s100_2           TYPE REF TO cl_gui_container,
   go_s100_list_tree   TYPE REF TO cl_gui_list_tree,
   go_s100_details_alv TYPE REF TO cl_gui_alv_grid,
   go_s100_log_alv     TYPE REF TO cl_gui_alv_grid,
   go_application      TYPE REF TO lcl_cvi_customizing_resolve.
