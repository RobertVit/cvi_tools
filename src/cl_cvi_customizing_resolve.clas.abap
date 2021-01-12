class CL_CVI_CUSTOMIZING_RESOLVE definition
  public
  final
  create public .

public section.
  type-pools ABAP .
  type-pools ABAP_POOL .
  type-pools VIMTY .

  types:
    BEGIN OF ty_ddic_output_field_mapping ,
        ddic_field_name   TYPE name_feld,
        output_field_name TYPE name_feld,
      END OF ty_ddic_output_field_mapping .
  types:
    tt_ddic_output_field_mapping TYPE STANDARD TABLE OF ty_ddic_output_field_mapping WITH NON-UNIQUE DEFAULT KEY .
  types:
    BEGIN OF ty_field_mapping_out_to_in ,
        sequence  TYPE i,
        view_name TYPE vim_name,
        mapping   TYPE   tt_ddic_output_field_mapping.
    TYPES END OF ty_field_mapping_out_to_in .
  types:
    tt_field_mapping_out_to_in TYPE STANDARD TABLE OF ty_field_mapping_out_to_in .
  types:
    BEGIN OF ty_scenario_maint_det ,
        scenario       TYPE char12,
        maint_viewname TYPE vim_name,
      END OF ty_scenario_maint_det .
  types:
    tt_scenario_maint_det TYPE STANDARD TABLE OF ty_scenario_maint_det .
  types:
    BEGIN OF ty_log,
        prio         TYPE i,
        icon(40)     TYPE c,
        message(200) TYPE c,
        info(60)     TYPE c,
      END OF ty_log .
  types:
    BEGIN OF ty_documentation,
        node_key   TYPE tv_nodekey,
        item_name  TYPE tv_itmname,
        docuid     TYPE doku_id,
        docuobject TYPE doku_obj,
        title_text TYPE char3,
      END OF ty_documentation .
  types:
    BEGIN OF ty_id_desc_op,
        client         TYPE mandt,
        scenario       TYPE char12,
        id1            TYPE char12,
        id2            TYPE char12,
        input          TYPE char12,
        input_desc(60) TYPE c,
        id1_desc(60)   TYPE c,
        id2_desc(60)   TYPE c,
        text1(40)      TYPE c,
        text2(40)      TYPE c,
        text3(40)      TYPE c,
        text4(40)      TYPE c,
        text5(40)      TYPE c,
        text6(40)      TYPE c,
        text7(100)     TYPE c,
        text8(100)     TYPE c,
        arrow(40)      TYPE c,
        is_change      TYPE sap_bool,
      END OF ty_id_desc_op .
  types:
    tt_id_desc_op TYPE STANDARD TABLE OF ty_id_desc_op .
  types:
    tt_tb002 TYPE STANDARD TABLE OF   tb002 .
  types:
    tt_nriv  TYPE STANDARD TABLE OF   nriv .
  types:
    tt_tb001 TYPE STANDARD TABLE OF   tb001 .
  types:
    tt_t077x TYPE STANDARD TABLE OF   t077x .
  types:
    tt_t077d TYPE STANDARD TABLE OF   t077d .
  types:
    tt_t077k TYPE STANDARD TABLE OF   t077k .
  types:
    tt_t077y TYPE STANDARD TABLE OF   t077y .
  types:
    tt_tb003 TYPE STANDARD TABLE OF   tb003 .
  types:
    tt_tb003a TYPE STANDARD TABLE OF   tb003a .
  types:
    tt_tb003b TYPE STANDARD TABLE OF   tb003b .
  types:
    tt_mdsc_ctrl_opt_a  TYPE STANDARD TABLE OF mdsc_ctrl_opt_a .
  types:
    tt_tb003t TYPE STANDARD TABLE OF tb003t .
  types:
    tt_tsab  TYPE STANDARD TABLE OF tsab .
  types:
    tt_tsabt TYPE STANDARD TABLE OF tsabt .
  types:
    tt_tpfk  TYPE STANDARD TABLE OF tpfk .
  types:
    tt_tpfkt TYPE STANDARD TABLE OF tpfkt .
  types:
    tt_tvpv  TYPE STANDARD TABLE OF tvpv .
  types:
    tt_tvpvt TYPE STANDARD TABLE OF tvpvt .
  types:
    tt_tvip TYPE STANDARD TABLE OF tvip .
  types:
    tt_tvipt TYPE STANDARD TABLE OF tvipt .
  types:
    tt_t502t TYPE STANDARD TABLE OF t502t .
  types:
    tt_tvgf TYPE STANDARD TABLE OF tvgf .
  types:
    tt_tvgft TYPE STANDARD TABLE OF tvgft .
  types:
    tt_tvcin TYPE STANDARD TABLE OF tvcin .
  types:
    tt_tvcint TYPE STANDARD TABLE OF tvcint .
  types:
    tt_tb910 TYPE STANDARD TABLE OF tb910 .
  types:
    tt_tb911 TYPE STANDARD TABLE OF tb911 .
  types:
    tt_tb912 TYPE STANDARD TABLE OF tb912 .
  types:
    tt_tb913 TYPE STANDARD TABLE OF tb913 .
  types:
    tt_tb914 TYPE STANDARD TABLE OF tb914 .
  types:
    tt_tb915 TYPE STANDARD TABLE OF tb915 .
  types:
    tt_tb916 TYPE STANDARD TABLE OF tb916 .
  types:
    tt_tb917 TYPE STANDARD TABLE OF tb917 .
  types:
    tt_tb027 TYPE STANDARD TABLE OF tb027 .
  types:
    tt_tb027t TYPE STANDARD TABLE OF tb027t .
  types:
    tt_cvic_cp1_link   TYPE STANDARD TABLE OF cvic_cp1_link .
  types:
    tt_cvic_cp2_link   TYPE STANDARD TABLE OF cvic_cp2_link .
  types:
    tt_cvic_cp3_link   TYPE STANDARD TABLE OF cvic_cp3_link .
  types:
    tt_cvic_cp4_link   TYPE STANDARD TABLE OF cvic_cp4_link .
  types:
    tt_cvic_marst_link TYPE STANDARD TABLE OF cvic_marst_link .
  types:
    tt_cvic_legform_lnk TYPE STANDARD TABLE OF cvic_legform_lnk .
  types:
    tt_cvic_ccid_link   TYPE STANDARD TABLE OF   cvic_ccid_link .
  types:
    tt_tb019   TYPE STANDARD TABLE OF tb019 .
  types:
    tt_tb020   TYPE STANDARD TABLE OF tb020 .
  types:
    tt_tb033   TYPE STANDARD TABLE OF tb033 .
  types:
    tt_tb033t  TYPE STANDARD TABLE OF tb033t .
  types:
    tt_cvic_cust_to_bp1 TYPE STANDARD TABLE OF cvic_cust_to_bp1 .
  types:
    tt_cvic_vend_to_bp1 TYPE STANDARD TABLE OF cvic_vend_to_bp1 .
  types:
    tt_tbd001           TYPE STANDARD TABLE OF tbd001 .
  types:
    tt_tbd002           TYPE STANDARD TABLE OF tbd002 .
  types:
    tt_cvic_cust_to_bp2 TYPE STANDARD TABLE OF cvic_cust_to_bp2 .
  types:
    tt_cvic_vend_to_bp2 TYPE STANDARD TABLE OF cvic_vend_to_bp2 .
  types:
    tt_tbc001           TYPE STANDARD TABLE OF tbc001 .
  types:
    tt_tbc002           TYPE STANDARD TABLE OF tbc002 .
  types:
    tt_tb038           TYPE STANDARD TABLE OF tb038 .
  types:
    tt_tb038t           TYPE STANDARD TABLE OF tb038t .
  types:
    tt_tp038m1 TYPE STANDARD TABLE OF tp038m1 .
  types:
    tt_tp038m2 TYPE STANDARD TABLE OF tp038m2 .
  types:
    tt_t016    TYPE STANDARD TABLE OF t016 .
  types:
    tt_t016t   TYPE STANDARD TABLE OF t016t .
  types:
    tt_tb038a  TYPE STANDARD TABLE OF tb038a .
  types:
    tt_tb038b  TYPE STANDARD TABLE OF tb038b .
  types:
    tt_log           TYPE STANDARD TABLE OF ty_log .
  types:
    tt_documentation TYPE STANDARD TABLE OF ty_documentation .

  class-data GV_ICON_INCOMPLETE type CHAR40 .
  class-data GV_ICON_CHECKED type CHAR40 .
  class-data GV_ICON_ARROW_RIGHT type CHAR40 .
  class-data GV_ICON_ARROW_LEFT type CHAR40 .
  class-data GV_ICON_GREEN type CHAR40 .
  class-data GV_ICON_YELLOW type CHAR40 .
  class-data GV_ICON_RED type CHAR40 .

  class-methods CLASS_CONSTRUCTOR .
  class-methods READ_DOCUMENTATION
    importing
      !IV_SCENARIO type CHAR12
    exporting
      !EV_DOCUOBJECT type DOKU_OBJ .
  class-methods INITIALIZE_ICONS .
  class-methods PREPARE_MESSAGE
    importing
      !IV_SEVERITY type I optional
      !IV_MESSAGE_NUMBER type SYMSGNO optional
      !IV_PARAM1 type CHAR100 optional
      !IV_PARAM2 type CHAR100 optional
      !IV_PARAM3 type CHAR100 optional
    changing
      !CT_LOG type TT_LOG .
  class-methods GET_SCENARIO_MAINT_DET
    importing
      value(IV_SCENARIO) type CHAR12 default '*'
    exporting
      value(ET_SCENARIO_MAINT_DET) type TT_SCENARIO_MAINT_DET .
  class-methods IS_MAINTAINENCE_EXIST
    importing
      !IV_SCENARIO type CHAR12
    returning
      value(R_RESULT) type SAP_BOOL .
  class-methods CHECK_FOR_EDITABLE
    importing
      !IV_SCENARIO type CHAR12
    exceptions
      EDITABLE_NOT_ALLOWED
      TECHNICAL_ERROR .
  class-methods INSERT_RECORD
    importing
      !IV_VIEWNAME type VIM_NAME
      !IT_DATA type STANDARD TABLE .
  class-methods CONVERT_OUTPUT_TO_INPUT
    importing
      !IT_DDIC_OUTPUT_MAP type TT_DDIC_OUTPUT_FIELD_MAPPING
      !IT_DATA type STANDARD TABLE
      !IV_OUTPUT_VIEW_NAME type VIM_NAME
    exporting
      !ET_OUPUT_DATA type STANDARD TABLE .
  class-methods SAVE_DATA
    importing
      !IT_FIELD_MAPPING_OUT_TO_IN type TT_FIELD_MAPPING_OUT_TO_IN
      !IT_DATA type STANDARD TABLE
    exceptions
      LOCK_ERROR
      TECHNICAL_ERROR .
  class-methods CHECK_DATA
    importing
      !IV_SCENARIO type CHAR12
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods GET_CUSTOMIZING_DETAILS
    importing
      !IV_SCENARIO type CHAR12
    exporting
      !EV_OBJECT type C
      !EV_VIEW type TABNAME
      !EV_TCODE type TCODE .
  class-methods CHECK_DATA_BEFORE_SAVE
    importing
      !IV_SCENARIO type CHAR12
    exporting
      !ET_LOG type TT_LOG
    changing
      !CT_OUTPUT type TT_ID_DESC_OP .
  class-methods LOCK_VIEW
    importing
      !IV_ACTION type CHAR1
      !IV_VIEWNAME type TABNAME optional
    exceptions
      FOREIGN_LOCK
      TECHNICAL_ERROR .
  class-methods GET_MAPPING_OUT_TO_IN
    importing
      !IV_SCENARIO type CHAR12
    exporting
      !ET_MAPPING_OUT_TO_IN type TT_FIELD_MAPPING_OUT_TO_IN .
  class-methods FILL_REQUIRED_DATA
    exporting
      !ET_TVIP type TT_TVIP
      !ET_TVIPT type TT_TVIPT
      !ET_T502T type TT_T502T
      !ET_TVGF type TT_TVGF
      !ET_TVGFT type TT_TVGFT
      !ET_TVCIN type TT_TVCIN
      !ET_TVCINT type TT_TVCINT
      !ET_MDSC_CTRL_OPT_A type TT_MDSC_CTRL_OPT_A
      !ET_TB002 type TT_TB002
      !ET_NRIV type TT_NRIV
      !ET_TB001 type TT_TB001
      !ET_T077X type TT_T077X
      !ET_T077Y type TT_T077Y
      !ET_T077D type TT_T077D
      !ET_T077K type TT_T077K
      !ET_TB003T type TT_TB003T
      !ET_TB003 type TT_TB003
      !ET_TB003A type TT_TB003A
      !ET_RETAIL_SITES type CVIS_WERKS_T
      !ET_TSAB type TT_TSAB
      !ET_TSABT type TT_TSABT
      !ET_TPFK type TT_TPFK
      !ET_TPFKT type TT_TPFKT
      !ET_TVPV type TT_TVPV
      !ET_TVPVT type TT_TVPVT
      !ET_TB910 type TT_TB910
      !ET_TB911 type TT_TB911
      !ET_TB912 type TT_TB912
      !ET_TB913 type TT_TB913
      !ET_TB914 type TT_TB914
      !ET_TB915 type TT_TB915
      !ET_TB916 type TT_TB916
      !ET_TB917 type TT_TB917
      !ET_TB027 type TT_TB027
      !ET_TB027T type TT_TB027T
      !ET_CVIC_CP1_LINK type TT_CVIC_CP1_LINK
      !ET_CVIC_CP2_LINK type TT_CVIC_CP2_LINK
      !ET_CVIC_CP3_LINK type TT_CVIC_CP3_LINK
      !ET_CVIC_CP4_LINK type TT_CVIC_CP4_LINK
      !ET_CVIC_MARST_LINK type TT_CVIC_MARST_LINK
      !ET_CVIC_LEGFORM_LNK type TT_CVIC_LEGFORM_LNK
      !ET_CVIC_CCID_LINK type TT_CVIC_CCID_LINK
      !ET_TB019 type TT_TB019
      !ET_TB020 type TT_TB020
      !ET_TB033 type TT_TB033
      !ET_TB033T type TT_TB033T
      !ET_CVIC_CUST_TO_BP1 type TT_CVIC_CUST_TO_BP1
      !ET_CVIC_VEND_TO_BP1 type TT_CVIC_VEND_TO_BP1
      !ET_TBD002 type TT_TBD002
      !ET_CVIC_CUST_TO_BP2 type TT_CVIC_CUST_TO_BP2
      !ET_CVIC_VEND_TO_BP2 type TT_CVIC_VEND_TO_BP2
      !ET_TBC002 type TT_TBC002
      !ET_TBD001 type TT_TBD001
      !ET_TBC001 type TT_TBC001
      !ET_TB003B type TT_TB003B
      !ET_TB038 type TT_TB038
      !ET_TB038T type TT_TB038T
      !ET_TP038M1 type TT_TP038M1
      !ET_TP038M2 type TT_TP038M2
      !ET_T016 type TT_T016
      !ET_T016T type TT_T016T
      !ET_TB038A type TT_TB038A
      !ET_TB038B type TT_TB038B .
protected section.
private section.

  class-data GT_SCENARIO_MAINT_DET type TT_SCENARIO_MAINT_DET .
  constants GC_GEN_SYNC type TV_NODEKEY value 'GEN_SYNC' ##NO_TEXT.
  constants GC_GEN_PPO type TV_NODEKEY value 'GEN_PPO' ##NO_TEXT.
  constants GC_GEN_REGFUN type TV_NODEKEY value 'GEN_REGFUN' ##NO_TEXT.
  constants GC_GEN_TAX type TV_NODEKEY value 'GEN_TAX' ##NO_TEXT.
  constants GC_GEN_ADDRNR type TV_NODEKEY value 'GEN_ADDRNR' ##NO_TEXT.
  constants GC_GEN_INDUSTRY type TV_NODEKEY value 'GEN_INDUSTRY' ##NO_TEXT.
  constants GC_CBP_ROLES type TV_NODEKEY value 'CBP_ROLES' ##NO_TEXT.
  constants GC_CBP_GROUPNG type TV_NODEKEY value 'CBP_GROUPNG' ##NO_TEXT.
  constants GC_CBP_ACCROLE type TV_NODEKEY value 'CBP_ACCROLE' ##NO_TEXT.
  constants GC_CBP_ACCGRP type TV_NODEKEY value 'CBP_ACCGRP' ##NO_TEXT.
  constants GC_CBPCP_ACTV type TV_NODEKEY value 'CBPCP_ACTV' ##NO_TEXT.
  constants GC_CBPCP_DEPT type TV_NODEKEY value 'CBPCP_DEPT' ##NO_TEXT.
  constants GC_CBPCP_FUNC type TV_NODEKEY value 'CBPCP_FUNC' ##NO_TEXT.
  constants GC_CBPCP_AUTH type TV_NODEKEY value 'CBPCP_AUTH' ##NO_TEXT.
  constants GC_CBPCP_VIP type TV_NODEKEY value 'CBPCP_VIP' ##NO_TEXT.
  constants GC_CBPCP_MARITAL type TV_NODEKEY value 'CBPCP_MARITA' ##NO_TEXT.
  constants GC_CBP_LEGAL type TV_NODEKEY value 'CBP_LEGAL' ##NO_TEXT.
  constants GC_CBP_PAYCARD type TV_NODEKEY value 'CBP_PAYCARD' ##NO_TEXT.
  constants GC_CBPLEG_TAX type TV_NODEKEY value 'CBPLEG_TAX' ##NO_TEXT.
  constants GC_CBPLEG_LOC type TV_NODEKEY value 'CBPLEG_LOC' ##NO_TEXT.
  constants GC_CBPLEG_BANK type TV_NODEKEY value 'CBPLEG_BANK' ##NO_TEXT.
  constants GC_CBP_IND_IN type TV_NODEKEY value 'CBP_IND_IN' ##NO_TEXT.
  constants GC_BPC_IND_OUT type TV_NODEKEY value 'BPC_IND_OUT' ##NO_TEXT.
  constants GC_VBP_ROLES type TV_NODEKEY value 'VBP_ROLES' ##NO_TEXT.
  constants GC_VBP_GROUPNG type TV_NODEKEY value 'VBP_GROUPNG' ##NO_TEXT.
  constants GC_VBP_ACCROLE type TV_NODEKEY value 'VBP_ACCROLE' ##NO_TEXT.
  constants GC_VBP_ACCGRP type TV_NODEKEY value 'VBP_ACCGRP' ##NO_TEXT.
  constants GC_VBP_IND_IN type TV_NODEKEY value 'VBP_IND_IN' ##NO_TEXT.
  constants GC_BPV_IND_OUT type TV_NODEKEY value 'BPV_IND_OUT' ##NO_TEXT.
  constants GC_BPC_ROLES type TV_NODEKEY value 'BPC_ROLES' ##NO_TEXT.
  constants GC_BPC_GROUPNG type TV_NODEKEY value 'BPC_GROUPNG' ##NO_TEXT.
  constants GC_BPC_DEPT type TV_NODEKEY value 'BPC_DEPT' ##NO_TEXT.
  constants GC_BPC_FUNC type TV_NODEKEY value 'BPC_FUNC' ##NO_TEXT.
  constants GC_BPC_AUTH type TV_NODEKEY value 'BPC_AUTH' ##NO_TEXT.
  constants GC_BPC_VIP type TV_NODEKEY value 'BPC_VIP' ##NO_TEXT.
  constants GC_BPC_MARITAL type TV_NODEKEY value 'BPC_MARITAL' ##NO_TEXT.
  constants GC_BPC_LEGAL type TV_NODEKEY value 'BPC_LEGAL' ##NO_TEXT.
  constants GC_BPC_PAYCARD type TV_NODEKEY value 'BPC_PAYCARD' ##NO_TEXT.
  constants GC_BPV_ROLES type TV_NODEKEY value 'BPV_ROLES' ##NO_TEXT.
  constants GC_BPV_GROUPNG type TV_NODEKEY value 'BPV_GROUPNG' ##NO_TEXT.

  class-methods CHECK_PPO_CONNECTION
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_REGISTERED_FM
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_TAX_CATEGORIES
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods CHECK_CUSTOMER_BP_ROLES
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_CUSTOMER_BP_GROUPING
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_BP_CUSTOMER_ROLES
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_BP_CUSTOMER_GROUPING
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_VENDOR_BP_ROLES
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_VENDOR_BP_GROUPING
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_BP_VENDOR_ROLES
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_BP_VENDOR_GROUPING
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_ADDRESS_NUMBER_RANGE
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_CBP_CONTACT_ASSIGNMENT
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_CBP_CONTACT_DEPARTMENT
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods CHECK_CBP_CONTACT_FUNCTIONS
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods CHECK_CBP_CONTACT_AUTHORITY
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods CHECK_CBP_CONTACT_VIP_INDIC
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods CHECK_CBP_CONTACT_MARITAL
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods CHECK_CBP_LEGAL_STATUS
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods CHECK_CBP_PAYMENT_CARDS
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods GET_BP_TO_CONTACT_PERSON
    importing
      !IV_SCENARIO type CHAR12
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods CHECK_CBP_ACC_GRP_TO_BP_ROLE
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods CHECK_CBP_ACC_GRP_TO_BP_GRP
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods CHECK_VBP_ACC_GRP_TO_BP_ROLE
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods CHECK_VBP_ACC_GRP_TO_BP_GRP
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG
      !ET_DROPDOWN_VALUES type LVC_T_DROP .
  class-methods CHECK_INDUSTRY_SYSTEM
    importing
      !IV_SCENARIO type CHAR12
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods CHECK_SYNC_DIRECTION
    exporting
      !ET_OUTPUT type TT_ID_DESC_OP
      !ET_LOG type TT_LOG .
  class-methods SET_SCENARIO_MAINT_DET .
ENDCLASS.



CLASS CL_CVI_CUSTOMIZING_RESOLVE IMPLEMENTATION.


  METHOD check_address_number_range.

    DATA: lt_output       TYPE tt_id_desc_op,
          lt_log          TYPE tt_log,
          lt_nriv         TYPE STANDARD TABLE OF nriv,
          ls_output       TYPE ty_id_desc_op,
          ls_nriv         TYPE nriv,
          lv_available_nr TYPE nrlevel.

    CLEAR: et_output, et_log.

    " Fetch all the required data
    CALL METHOD fill_required_data
      IMPORTING
        et_nriv = lt_nriv.
    " Check number range for ADRNR
    LOOP AT lt_nriv INTO ls_nriv WHERE object = 'ADRNR' AND
                                       externind = space.
      ls_output-id1 = ls_nriv-nrrangenr.
      lv_available_nr = ( ls_nriv-tonumber - ls_nriv-fromnumber ) - ls_nriv-nrlevel.

      IF lv_available_nr LE 50.
        ls_output-text1 = gv_icon_red.
        ls_output-text7 = TEXT-006.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 038
            iv_param1         = TEXT-006
          CHANGING
            ct_log            = lt_log.

      ELSEIF lv_available_nr LE 100.
        ls_output-text1 = gv_icon_yellow.
        ls_output-text7 = TEXT-007.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 038
            iv_param1         = TEXT-007
          CHANGING
            ct_log            = lt_log.
      ELSE.
        ls_output-text1 = gv_icon_green.
        ls_output-text7 =  TEXT-008.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 3
            iv_message_number = 038
            iv_param1         = TEXT-008
          CHANGING
            ct_log            = lt_log.
      ENDIF.
      APPEND ls_output TO lt_output.
      CLEAR  ls_output.
    ENDLOOP.

    SORT lt_log BY prio.
    DELETE ADJACENT DUPLICATES FROM lt_log COMPARING prio.
    DELETE lt_log FROM 2 TO 100.

    et_output   = lt_output.
    et_log      = lt_log.
  ENDMETHOD.


  METHOD check_bp_customer_grouping.

    DATA: lt_output          TYPE tt_id_desc_op,
          lt_log             TYPE tt_log,
          lt_mdsc_ctrl_opt_a TYPE tt_mdsc_ctrl_opt_a,
          lt_tb001           TYPE tt_tb001,
          lt_tb002           TYPE tt_tb002,
          lt_nriv            TYPE tt_nriv,
          lt_t077d           TYPE tt_t077d,
          lt_t077x           TYPE tt_t077x,
          lt_tbd001          TYPE tt_tbd001,
          ls_output          TYPE ty_id_desc_op,
          ls_nr1             TYPE nriv,
          ls_nr2             TYPE nriv,
          ls_tbd001          TYPE tbd001,
          ls_tb001           TYPE tb001,
          ls_tb002           TYPE tb002,
          ls_t077x           TYPE t077x,
          ls_t077d           TYPE t077d,
          ls_nriv            TYPE nriv,
          lv_bu_group        TYPE char100,
          lv_ktokd           TYPE char100,
          lv_numkr           TYPE char100,
          lv_nrrng           TYPE char100,
          lv_icon_right      TYPE char100.

    CLEAR: et_output, et_log.

    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name        = 'ICON_ARROW_RIGHT'
        info        = text-031
        add_stdinf  = 'X'
      IMPORTING
        result = lv_icon_right.

    CALL METHOD fill_required_data
      IMPORTING
        et_mdsc_ctrl_opt_a = lt_mdsc_ctrl_opt_a
        et_tb001           = lt_tb001
        et_tb002           = lt_tb002
        et_nriv            = lt_nriv
        et_t077d           = lt_t077d
        et_t077x           = lt_t077x
        et_tbd001          = lt_tbd001.

    IF lt_tbd001 IS NOT INITIAL.
      READ TABLE lt_mdsc_ctrl_opt_a WITH KEY sync_obj_source = 'BP'
                                       sync_obj_target = 'CUSTOMER'
                                       active_indicator = abap_true TRANSPORTING NO FIELDS.
      IF sy-subrc < 0.
        "Numbers are assigned, but direction bp-customer is not active
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 013
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDIF.

    LOOP AT lt_tbd001 INTO ls_tbd001.
      READ TABLE lt_tb001 WITH KEY bu_group = ls_tbd001-bu_group
                          INTO ls_tb001.
      IF sy-subrc = 0.
        lv_bu_group =  ls_tbd001-bu_group.
        lv_ktokd    =  ls_tbd001-ktokd.
        lv_nrrng    =  ls_tb001-nrrng.

        ls_output-id1 = ls_tbd001-bu_group.
        ls_output-id2 = ls_tbd001-ktokd.
        ls_output-text1 = ls_tb001-nrrng.
        ls_output-text5 = ls_tbd001-xsamenumber.

        READ TABLE lt_tb002 WITH KEY bu_group = ls_tbd001-bu_group
                            INTO ls_tb002.
        IF sy-subrc = 0.
          ls_output-id1_desc = ls_tb002-txt15.  "txt15 = short description
        ELSE.
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 3
              iv_message_number = 033
              iv_param1         = lv_bu_group
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ELSE.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 034
            iv_param1         = TEXT-009
            iv_param2         = lv_bu_group
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      READ TABLE lt_nriv WITH KEY object = 'BU_PARTNER'
                                nrrangenr = ls_tb001-nrrng
                       INTO ls_nriv.
      IF sy-subrc = 0.
        ls_output-text2 = ls_nriv-externind.
      ELSE.
        "Number Range has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 018
            iv_param1         = lv_nrrng
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      READ TABLE lt_t077d WITH KEY ktokd = ls_tbd001-ktokd
                          INTO ls_t077d.

      IF sy-subrc = 0.
        lv_numkr = ls_t077d-numkr.

        ls_output-text3 = ls_t077d-numkr.
        READ TABLE lt_t077x WITH KEY spras = sy-langu
                                     ktokd = ls_tbd001-ktokd
                          INTO ls_t077x.
        IF sy-subrc = 0.
          ls_output-id2_desc = ls_t077x-txt30.
        ELSE.
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 3
              iv_message_number = 035
              iv_param1         = lv_ktokd
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ELSE.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 017
            iv_param1         = TEXT-009
            iv_param2         = lv_ktokd
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      READ TABLE lt_nriv WITH KEY object = 'DEBITOR'
                                nrrangenr = ls_t077d-numkr
                       INTO ls_nriv.
      IF sy-subrc = 0.
        ls_output-text4 = ls_nriv-externind.
      ELSE.
        "Number Range has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 018
            iv_param1         = lv_numkr
            iv_param2         = TEXT-010
          CHANGING
            ct_log            = lt_log.
      ENDIF.

*Check whether account groups still exist
      READ TABLE lt_t077d WITH KEY ktokd = ls_tbd001-ktokd TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 017
            iv_param1         = TEXT-009
            iv_param2         = lv_ktokd
          CHANGING
            ct_log            = lt_log.
      ENDIF.


*Check the number ranges
      IF ls_tbd001-xsamenumber = abap_true.
        READ TABLE lt_nriv WITH KEY object = 'BU_PARTNER'
                                  nrrangenr = ls_tb001-nrrng INTO ls_nr1.
        READ TABLE lt_nriv WITH KEY object = 'DEBITOR'
                                  nrrangenr = ls_t077d-numkr INTO ls_nr2.
        IF ls_nr1-fromnumber <> ls_nr2-fromnumber OR
             ls_nr1-tonumber <> ls_nr2-tonumber.
          "Same Number flag is set, but Number Ranges don't match
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 023
              iv_param1         = lv_nrrng
              iv_param2         = lv_numkr
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ENDIF.

      ls_output-arrow = lv_icon_right.

      APPEND ls_output TO lt_output.
      CLEAR ls_output.

    ENDLOOP.

    SORT lt_log BY message.
    DELETE ADJACENT DUPLICATES FROM lt_log.

    et_output = lt_output.
    et_log = lt_log.

  ENDMETHOD.


  METHOD check_bp_customer_roles.
    DATA: lt_output          TYPE tt_id_desc_op,
          ls_output          TYPE ty_id_desc_op,
          lt_log             TYPE tt_log,
          lt_tbd001          TYPE tt_tbd001,
          lt_tbd002          TYPE tt_tbd002,
          lt_tb003a          TYPE tt_tb003a,
          lt_tb003b          TYPE tt_tb003b,
          ls_tb003b          TYPE tb003b,
          lt_mdsc_ctrl_opt_a TYPE tt_mdsc_ctrl_opt_a,
          lv_role_type       TYPE char100,
          ls_tbd002          TYPE tbd002.

    CLEAR: et_output, et_log.

    CALL METHOD fill_required_data
      IMPORTING
        et_mdsc_ctrl_opt_a = lt_mdsc_ctrl_opt_a
        et_tb003a          = lt_tb003a
        et_tb003b          = lt_tb003b
        et_tbd001          = lt_tbd001
        et_tbd002          = lt_tbd002.

    IF lt_tbd002 IS NOT INITIAL.
      READ TABLE lt_mdsc_ctrl_opt_a WITH KEY sync_obj_source  = 'BP'
                                             sync_obj_target  = 'CUSTOMER'
                                             active_indicator = abap_true TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        "BP Roles are marked as customer roles, but direction bp->customer is not active
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 012
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDIF.

    IF lt_tbd002 IS NOT INITIAL. "at least one entry exists
      IF lt_tbd001 IS INITIAL.
        "BP Roles are marked as customer Roles, but no numbers are assigned
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 019
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDIF.


    LOOP AT lt_tbd002 INTO ls_tbd002.
      lv_role_type = ls_tbd002-rltyp.

      ls_output-id1 = ls_tbd002-rltyp.
      ls_output-text1 = ls_tbd002-deb.

      "check whether bp roles still exist
      READ TABLE lt_tb003a WITH KEY rolecategory = ls_tbd002-rltyp TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        READ TABLE lt_tb003b INTO ls_tb003b WITH KEY
                                  spras = sy-langu
                                  rolecategory = ls_tbd002-rltyp.
        IF sy-subrc = 0.
          ls_output-id1_desc = ls_tb003b-rlctxt.
        ELSE.
          "BP Role has no describtion
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 2
              iv_message_number = 037
              iv_param1         = TEXT-009
              iv_param2         = lv_role_type
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ELSE.
        "BP Role has been deleted for assigned role type
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 016
            iv_param1         = TEXT-009
            iv_param2         = lv_role_type
          CHANGING
            ct_log            = lt_log.
      ENDIF.
      APPEND ls_output TO lt_output.
      CLEAR ls_output.
    ENDLOOP.

    SORT lt_log BY message.
    DELETE ADJACENT DUPLICATES FROM lt_log.

    et_output = lt_output.
    et_log = lt_log.

  ENDMETHOD.


  METHOD check_bp_vendor_grouping.

    DATA: lt_output          TYPE tt_id_desc_op,
          lt_log             TYPE tt_log,
          lt_mdsc_ctrl_opt_a TYPE tt_mdsc_ctrl_opt_a,
          lt_tb001           TYPE tt_tb001,
          lt_tb002           TYPE tt_tb002,
          lt_nriv            TYPE tt_nriv,
          lt_t077k           TYPE tt_t077k,
          lt_t077y           TYPE tt_t077y,
          lt_tbc001          TYPE tt_tbc001,
          ls_output          TYPE ty_id_desc_op,
          ls_tbc001          TYPE tbc001,
          ls_t077k           TYPE t077k,
          ls_t077y           TYPE t077y,
          ls_tb001           TYPE tb001,
          ls_tb002           TYPE tb002,
          ls_nriv            TYPE nriv,
          ls_nr1             TYPE nriv,
          ls_nr2             TYPE nriv,
          lv_bu_group        TYPE char100,
          lv_ktokk           TYPE char100,
          lv_numkr           TYPE char100,
          lv_nrrng           TYPE char100,
          lv_icon_right      TYPE char100.

    CLEAR: et_output, et_log.

    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name        = 'ICON_ARROW_RIGHT'
        info        = text-032
        add_stdinf  = 'X'
      IMPORTING
        result = lv_icon_right.

    CALL METHOD fill_required_data
      IMPORTING
        et_mdsc_ctrl_opt_a = lt_mdsc_ctrl_opt_a
        et_tb001           = lt_tb001
        et_tb002           = lt_tb002
        et_nriv            = lt_nriv
        et_t077k           = lt_t077k
        et_t077y           = lt_t077y
        et_tbc001          = lt_tbc001.

    IF lt_tbc001 IS NOT INITIAL.
      READ TABLE lt_mdsc_ctrl_opt_a WITH KEY sync_obj_source = 'BP'
                                       sync_obj_target = 'VENDOR'
                                       active_indicator = abap_true TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        "Numbers are assigned, but direction bp->vendor is not active
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 025
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDIF.


    LOOP AT lt_tbc001 INTO ls_tbc001.

      lv_bu_group = ls_tbc001-bu_group.
      lv_ktokk    = ls_tbc001-ktokk.

      ls_output-id1 = ls_tbc001-bu_group.
      ls_output-id2 = ls_tbc001-ktokk.
      ls_output-text5 = ls_tbc001-xsamenumber.

      READ TABLE lt_tb001 WITH KEY bu_group = ls_tbc001-bu_group
                          INTO ls_tb001.
      IF sy-subrc = 0.
        lv_nrrng    = ls_tb001-nrrng.

        ls_output-text1 = ls_tb001-nrrng.

        READ TABLE lt_tb002 WITH KEY bu_group = ls_tbc001-bu_group
                          INTO ls_tb002.
        IF sy-subrc = 0.
          ls_output-id1_desc = ls_tb002-txt15.
        ELSE.
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 3
              iv_message_number = 033
              iv_param1         = lv_bu_group
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ELSE.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 034
            iv_param1         = TEXT-009
            iv_param2         = lv_bu_group
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      READ TABLE lt_nriv WITH KEY object = 'BU_PARTNER'
                                nrrangenr = ls_tb001-nrrng
                       INTO ls_nriv.
      IF sy-subrc = 0.
        ls_output-text2 = ls_nriv-externind.
      ELSE.
        "Number Range has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 018
            iv_param1         = lv_nrrng
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      READ TABLE lt_t077k WITH KEY ktokk = ls_tbc001-ktokk
                          INTO ls_t077k.
      IF sy-subrc = 0.
        lv_numkr    = ls_t077k-numkr.
        ls_output-text3 = ls_t077k-numkr.
        READ TABLE lt_t077y WITH KEY ktokk = ls_tbc001-ktokk
                                   spras = sy-langu
                          INTO ls_t077y.
        IF sy-subrc = 0.
          ls_output-id2_desc = ls_t077y-txt30.
        ELSE.
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 3
              iv_message_number = 035
              iv_param1         = lv_ktokk                 " Character field of length 40
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ELSE.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 017
            iv_param1         = TEXT-011
            iv_param2         = lv_ktokk
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      READ TABLE lt_nriv WITH KEY object = 'KREDITOR'
                                nrrangenr = ls_t077k-numkr
                       INTO ls_nriv.
      IF sy-subrc = 0.
        ls_output-text4 = ls_nriv-externind.
      ELSE.
        "Number Range has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 018
            iv_param1         = lv_numkr
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      IF ls_tbc001-xsamenumber = abap_true.
        READ TABLE lt_nriv WITH KEY object = 'BU_PARTNER'
                                  nrrangenr = ls_tb001-nrrng INTO ls_nr1.
        READ TABLE lt_nriv WITH KEY object = 'KREDITOR'
                                  nrrangenr = ls_t077k-numkr INTO ls_nr2.
        IF ls_nr1-fromnumber <> ls_nr2-fromnumber OR
             ls_nr1-tonumber <> ls_nr2-tonumber.
          "Same Number flag is set, but Number Ranges don't match
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 023
              iv_param1         = lv_nrrng
              iv_param2         = lv_numkr
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ENDIF.

      ls_output-arrow = lv_icon_right.

      APPEND ls_output TO lt_output.
      CLEAR ls_output.

    ENDLOOP.

    SORT lt_log BY message.
    DELETE ADJACENT DUPLICATES FROM lt_log.

    et_output = lt_output.
    et_log = lt_log.

  ENDMETHOD.


  METHOD check_bp_vendor_roles.
    DATA: lt_output          TYPE tt_id_desc_op,
          lt_log             TYPE tt_log,
          lt_mdsc_ctrl_opt_a TYPE tt_mdsc_ctrl_opt_a,
          lt_tb003a          TYPE tt_tb003a,
          lt_tb003b          TYPE tt_tb003b,
          lt_tbc001          TYPE tt_tbc001,
          lt_tbc002          TYPE tt_tbc002,
          ls_output          TYPE ty_id_desc_op,
          ls_tb003b          TYPE tb003b,
          ls_tbc002          TYPE tbc002,
          lv_rltyp           TYPE char100.

    CLEAR: et_output, et_log.

    CALL METHOD fill_required_data
      IMPORTING
        et_mdsc_ctrl_opt_a = lt_mdsc_ctrl_opt_a
        et_tb003a          = lt_tb003a
        et_tbc002          = lt_tbc002
        et_tbc001          = lt_tbc001
        et_tb003b          = lt_tb003b.

    IF lt_tbc002 IS NOT INITIAL.
      READ TABLE lt_mdsc_ctrl_opt_a WITH KEY sync_obj_source = 'BP'
                                       sync_obj_target = 'VENDOR'
                                       active_indicator = abap_true TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        "BP Roles are marked as vendor roles but direction bp->vendor is not active
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 024
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDIF.

    "Check whether the bp role has an assigned vendor account group
    IF lt_tbc002 IS NOT INITIAL. "at least one entry exists
      IF lt_tbc001 IS INITIAL.
        "BP Roles are marked as Vendor Roles, but no numbers are assigned
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 028
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDIF.

    LOOP AT lt_tbc002 INTO ls_tbc002.

      lv_rltyp = ls_tbc002-rltyp.

      ls_output-id1 = ls_tbc002-rltyp.
      ls_output-text1 = ls_tbc002-kred.

      READ TABLE lt_tb003a WITH KEY rolecategory = ls_tbc002-rltyp TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        "check if BP Role has no describtion
        READ TABLE lt_tb003b INTO ls_tb003b WITH KEY
                   spras = sy-langu
                   rolecategory = ls_tbc002-rltyp.
        IF sy-subrc EQ 0.
          ls_output-id1_desc = ls_tb003b-rlctxt.
        ELSE.
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 2
              iv_message_number = 037
              iv_param1         = TEXT-012
              iv_param2         = lv_rltyp
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ELSE.
        "BP Role has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 016
            iv_param1         = TEXT-009
            iv_param2         = lv_rltyp
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      APPEND ls_output TO lt_output.
      CLEAR ls_output.
    ENDLOOP.

    SORT lt_log BY message.
    DELETE ADJACENT DUPLICATES FROM lt_log.

    et_output = lt_output.
    et_log        = lt_log.

  ENDMETHOD.


  METHOD check_cbp_acc_grp_to_bp_grp.

    DATA: lt_output           TYPE tt_id_desc_op,
          lt_log              TYPE tt_log,
          lt_ktokd            TYPE STANDARD TABLE OF ktokd,
          lt_retail_sites     TYPE cvis_werks_t,
          lt_tb001            TYPE tt_tb001,
          lt_tb002            TYPE tt_tb002,
          lt_t077d            TYPE tt_t077d,
          lt_t077x            TYPE tt_t077x,
          lt_cvic_cust_to_bp1 TYPE tt_cvic_cust_to_bp1,
          lt_dropdown         TYPE lvc_t_drop,
          ls_ktokd            TYPE ktokd,
          ls_tb001            TYPE tb001,
          ls_tb002            TYPE tb002,
          ls_t077x            TYPE t077x,
          ls_output           TYPE ty_id_desc_op,
          ls_dropdown         TYPE lvc_s_drop,
          lv_ktokd(100)       TYPE c,
          lv_bu_group(100)    TYPE c,
          lv_bp_grouping(60)  TYPE c.

    CLEAR: et_output, et_log,   et_dropdown_values.

*get required data
    CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
      IMPORTING
        et_tb001            = lt_tb001
        et_tb002            = lt_tb002
        et_t077x            = lt_t077x
        et_t077d            = lt_t077d
        et_cvic_cust_to_bp1 = lt_cvic_cust_to_bp1
        et_retail_sites     = lt_retail_sites.

    SELECT DISTINCT ktokd FROM kna1 INTO TABLE lt_ktokd
        FOR ALL ENTRIES IN lt_retail_sites
       WHERE werks NE lt_retail_sites-table_line. "#EC CI_NOFIELD

    DELETE lt_ktokd WHERE table_line = space.

    LOOP AT lt_ktokd INTO ls_ktokd.
      lv_ktokd = ls_ktokd.
      READ TABLE lt_t077d TRANSPORTING NO FIELDS WITH KEY
                 ktokd = ls_ktokd.
      IF sy-subrc NE 0.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 061
            iv_param1         = lv_ktokd
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      READ TABLE lt_cvic_cust_to_bp1 TRANSPORTING NO FIELDS WITH KEY
                 account_group = ls_ktokd.
      IF sy-subrc NE 0.
        "Missing  BP grouping for customer account group
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 020
            iv_param1         = lv_ktokd
          CHANGING
            ct_log            = lt_log.

        ls_output-client = sy-mandt.
        ls_output-id1 = ls_ktokd.
        READ TABLE lt_t077x INTO ls_t077x WITH KEY spras = sy-langu
                                                   ktokd = ls_ktokd.
        IF ls_t077x-txt30 IS NOT INITIAL.
          ls_output-id1_desc = ls_t077x-txt30.
        ELSE.
          "Description for customer account group missing
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 3
              iv_message_number = 035
              iv_param1         = lv_ktokd
            CHANGING
              ct_log            = lt_log.
        ENDIF.
        APPEND ls_output TO lt_output.
        CLEAR ls_output.
      ENDIF.

    ENDLOOP.

    IF lt_output IS NOT INITIAL.
** fill drop down values
      CLEAR ls_dropdown.
      ls_dropdown-handle = '1'.
      ls_dropdown-value = ''.
      APPEND ls_dropdown TO lt_dropdown.

      LOOP AT lt_tb001 INTO ls_tb001.
        lv_bu_group = ls_tb001-bu_group.
        READ TABLE lt_tb002 INTO ls_tb002
                        WITH KEY spras = sy-langu
                                 bu_group = ls_tb001-bu_group.
        IF ls_tb002-txt40 IS INITIAL AND ls_tb002-txt15 IS INITIAL .
          "Description for BP grouping text does not exist
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 3
              iv_message_number = 033
              iv_param1         = lv_bu_group
            CHANGING
              ct_log            = lt_log.
        ENDIF.
        IF ls_tb002-txt40 IS NOT INITIAL.
          CONCATENATE ls_tb001-bu_group ls_tb002-txt40 INTO lv_bp_grouping  SEPARATED BY space.
        ELSE.
          CONCATENATE ls_tb001-bu_group ls_tb002-txt15 INTO lv_bp_grouping  SEPARATED BY space.
        ENDIF.
        ls_dropdown-handle = '1'.
        ls_dropdown-value = lv_bp_grouping.
        APPEND ls_dropdown TO lt_dropdown.
        CLEAR ls_dropdown.
      ENDLOOP.
    ENDIF.

    et_output          = lt_output.
    et_log             = lt_log.

    et_dropdown_values = lt_dropdown.

  ENDMETHOD.


  METHOD check_cbp_acc_grp_to_bp_role.

    DATA: lt_output           TYPE tt_id_desc_op,
          lt_log              TYPE tt_log,
          lt_ktokd            TYPE STANDARD TABLE OF ktokd,
          lt_retail_sites     TYPE cvis_werks_t,
          lt_tb003            TYPE tt_tb003,
          lt_tb003t           TYPE tt_tb003t,
          lt_t077x            TYPE tt_t077x,
          lt_t077d            TYPE tt_t077d,
          lt_tbd002           TYPE tt_tbd002,
          lt_cvic_cust_to_bp2 TYPE tt_cvic_cust_to_bp2,
          lt_dropdown         TYPE lvc_t_drop,
          ls_ktokd            TYPE ktokd,
          ls_tb003            TYPE tb003,
          ls_tb003t           TYPE tb003t,
          ls_t077x            TYPE t077x,
          ls_tbd002           TYPE tbd002,
          ls_output           TYPE ty_id_desc_op,
          ls_dropdown         TYPE lvc_s_drop,
          lv_role(100)        TYPE c,
          lv_acc_grp(100)     TYPE c,
          lv_bp_role(60)      TYPE c.

    CLEAR: et_output, et_log,   et_dropdown_values.

*get required data
    CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
      IMPORTING
        et_tb003            = lt_tb003
        et_tb003t           = lt_tb003t
        et_t077x            = lt_t077x
        et_t077d            = lt_t077d
        et_tbd002           = lt_tbd002
        et_cvic_cust_to_bp2 = lt_cvic_cust_to_bp2
        et_retail_sites     = lt_retail_sites.

    SELECT DISTINCT ktokd FROM kna1 INTO TABLE lt_ktokd
        FOR ALL ENTRIES IN lt_retail_sites
       WHERE werks NE lt_retail_sites-table_line. "#EC CI_NOFIELD

    DELETE lt_ktokd WHERE table_line = space.

    LOOP AT lt_ktokd INTO ls_ktokd.
      lv_acc_grp = ls_ktokd.
      READ TABLE lt_t077d TRANSPORTING NO FIELDS WITH KEY
                 ktokd = ls_ktokd.
      IF sy-subrc NE 0.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 061
            iv_param1         = lv_acc_grp
          CHANGING
            ct_log            = lt_log.
      ENDIF.
      READ TABLE lt_cvic_cust_to_bp2 TRANSPORTING NO FIELDS WITH KEY
                 account_group = ls_ktokd.
      IF sy-subrc NE 0.
        "Account group exist but role mapping is missing
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 021
            iv_param1         = lv_acc_grp
          CHANGING
            ct_log            = lt_log.

        ls_output-client = sy-mandt.
        ls_output-id1 = ls_ktokd.
        READ TABLE lt_t077x INTO ls_t077x WITH KEY spras = sy-langu
                                                   ktokd = ls_ktokd.
        IF ls_t077x-txt30 IS NOT INITIAL.
          ls_output-id1_desc = ls_t077x-txt30.
        ENDIF.

        APPEND ls_output TO lt_output.
        CLEAR ls_output.
      ENDIF.
    ENDLOOP.

    IF lt_output IS NOT INITIAL.
** fill drop down values
      CLEAR ls_dropdown.
      ls_dropdown-handle = '1'.
      ls_dropdown-value = ''.
      APPEND ls_dropdown TO lt_dropdown.

      LOOP AT lt_tbd002 INTO ls_tbd002 WHERE deb = abap_true.
        READ TABLE lt_tb003 INTO ls_tb003 WITH KEY rolecategory = ls_tbd002-rltyp.
        IF sy-subrc EQ 0.
          READ TABLE lt_tb003t INTO ls_tb003t WITH KEY spras = sy-langu
                                                       role = ls_tb003-role.
          IF ls_tb003t-rltxt IS INITIAL.
            lv_role = ls_tb003-role.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 3
                iv_message_number = 036
                iv_param1         = lv_role
              CHANGING
                ct_log            = lt_log.
** write warning log , description for role does not exist.
          ENDIF.
          CONCATENATE ls_tb003-role ls_tb003t-rltxt INTO lv_bp_role  SEPARATED BY space.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = lv_bp_role.
          APPEND ls_dropdown TO lt_dropdown.
          CLEAR ls_dropdown.
        ENDIF.
      ENDLOOP.
    ENDIF.

    et_output          = lt_output.
    et_log             = lt_log.

    et_dropdown_values = lt_dropdown.

  ENDMETHOD.


  METHOD check_cbp_contact_assignment.

    DATA: lt_output      TYPE tt_id_desc_op,
          lt_log         TYPE tt_log,
          ls_output      TYPE ty_id_desc_op,
          ls_map_contact TYPE cvic_map_contact.


    REFRESH: lt_output, lt_log.


    "Activate Assignment of Contact Persons
    SELECT SINGLE * FROM cvic_map_contact  INTO ls_map_contact .
    IF ls_map_contact-map_contact IS INITIAL.
      "Contact person assignment is not activated
      CALL METHOD prepare_message
        EXPORTING
          iv_severity       = 1
          iv_message_number = 038
          iv_param1         = TEXT-013
        CHANGING
          ct_log            = lt_log.

      ls_output-client = sy-mandt.
      ls_output-id1 = ls_map_contact-map_contact.
      APPEND ls_output TO lt_output.
    ENDIF.

    et_output = lt_output.
    et_log    = lt_log.

  ENDMETHOD.


  METHOD check_cbp_contact_authority.

    DATA: lt_output        TYPE tt_id_desc_op,
          lt_log           TYPE tt_log,
          lt_parvo         TYPE STANDARD TABLE OF parvo,
          lt_tvpv          TYPE tt_tvpv,
          lt_tvpvt         TYPE tt_tvpvt,
          lt_tb914         TYPE tt_tb914,
          lt_tb915         TYPE tt_tb915,
          lt_cvic_cp3_link TYPE tt_cvic_cp3_link,
          ls_output        TYPE ty_id_desc_op,
          ls_parvo         TYPE parvo,
          ls_tvpvt         TYPE tvpvt,
          lt_dropdown      TYPE lvc_t_drop,
          ls_dropdown      TYPE lvc_s_drop,
          ls_tb914         TYPE tb914,
          ls_tb915         TYPE tb915,
          lv_parvo(100)    TYPE c,
          lv_auth_desc     TYPE char20.

    CLEAR: et_output, et_log, et_dropdown_values.

*get required data
    CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
      IMPORTING
        et_tvpv          = lt_tvpv
        et_tvpvt         = lt_tvpvt
        et_tb914         = lt_tb914
        et_tb915         = lt_tb915
        et_cvic_cp3_link = lt_cvic_cp3_link.

*b  Assigned Authority of Contact Person
    SELECT DISTINCT parvo FROM knvk INTO TABLE lt_parvo
                          WHERE parvo NE space. "#EC CI_NOFIELD

    SORT lt_parvo.
    DELETE ADJACENT DUPLICATES FROM lt_parvo.


    LOOP AT lt_parvo INTO ls_parvo.
      lv_parvo = ls_parvo.
      READ TABLE lt_tvpv TRANSPORTING NO FIELDS
                         WITH KEY parvo = ls_parvo.
      IF sy-subrc NE 0.
        "Authority has been deleted from table TVPV
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 067
            iv_param1         = lv_parvo
          CHANGING
            ct_log            = lt_log.
      ENDIF.
      READ TABLE lt_cvic_cp3_link TRANSPORTING NO FIELDS
                                   WITH KEY parvo = ls_parvo.
      IF sy-subrc NE 0.
        "Link is missing for Authority
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 053
          CHANGING
            ct_log            = lt_log.

        ls_output-client = sy-mandt.
        ls_output-id1 = ls_parvo.
        READ TABLE lt_tvpvt INTO ls_tvpvt WITH KEY spras = sy-langu
                                                   parvo = ls_parvo.
        IF sy-subrc EQ 0 AND ls_tvpvt-vtext IS NOT INITIAL.
          ls_output-id1_desc = ls_tvpvt-vtext.
        ELSE.
          "Authority description missing
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 2
              iv_message_number = 048
              iv_param1         = lv_parvo
            CHANGING
              ct_log            = lt_log.
        ENDIF.
        APPEND ls_output TO lt_output.
        CLEAR ls_output.
      ENDIF.
    ENDLOOP.

    IF lt_output IS NOT INITIAL.
      CLEAR ls_dropdown.
      ls_dropdown-handle = '1'.
      ls_dropdown-value = ''.
      APPEND ls_dropdown TO lt_dropdown.

      LOOP AT lt_tb914 INTO ls_tb914.
        READ TABLE lt_tb915 INTO ls_tb915 WITH KEY paauth = ls_tb914-paauth.
        IF sy-subrc EQ 0.
          CONCATENATE ls_tb914-paauth ls_tb915-bez20 INTO lv_auth_desc SEPARATED BY space.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = lv_auth_desc.
          APPEND ls_dropdown TO lt_dropdown.
        ENDIF.
      ENDLOOP.
    ENDIF.


    et_output[]   = lt_output[].
    et_log[]           = lt_log[].
    et_dropdown_values[] = lt_dropdown[].

  ENDMETHOD.


  METHOD check_cbp_contact_department.
*
    DATA: lt_output        TYPE tt_id_desc_op,
          lt_log           TYPE tt_log,
          lt_abtnr         TYPE STANDARD TABLE OF abtnr,
          lt_tsab          TYPE STANDARD TABLE OF tsab,
          lt_tsabt         TYPE STANDARD TABLE OF tsabt,
          lt_tb910         TYPE STANDARD TABLE OF tb910,
          lt_tb911         TYPE STANDARD TABLE OF tb911,
          lt_cvic_cp1_link TYPE STANDARD TABLE OF cvic_cp1_link,
          lt_dropdown      TYPE lvc_t_drop,
          ls_dropdown      TYPE lvc_s_drop,
          ls_output        TYPE ty_id_desc_op,
          ls_abtnr         TYPE abtnr,
          ls_tsabt         TYPE tsabt,
          ls_tb910         TYPE tb910,
          ls_tb911         TYPE tb911,
          lv_abtnr(100)    TYPE c,
          lv_dep_desc      TYPE bu_text20.

    CLEAR: et_output, et_log, et_dropdown_values.

*get required data
    CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
      IMPORTING
        et_tsab          = lt_tsab
        et_tsabt         = lt_tsabt
        et_tb910         = lt_tb910
        et_tb911         = lt_tb911
        et_cvic_cp1_link = lt_cvic_cp1_link.

*b.	Assign Department Numbers for Contact Person
    SELECT DISTINCT abtnr FROM knvk INTO TABLE lt_abtnr
                          WHERE abtnr NE space. "#EC CI_NOFIELD

    SORT lt_abtnr.
    DELETE ADJACENT DUPLICATES FROM lt_abtnr.


    LOOP AT lt_abtnr INTO ls_abtnr.
      lv_abtnr = ls_abtnr.
      READ TABLE lt_tsab TRANSPORTING NO FIELDS
                  WITH KEY abtnr = ls_abtnr.
      IF sy-subrc NE 0.
**     Department has been deleted from master table TSAB
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 065
            iv_param1         = lv_abtnr
          CHANGING
            ct_log            = lt_log.
      ENDIF.
      READ TABLE lt_cvic_cp1_link TRANSPORTING NO FIELDS WITH KEY abtnr = ls_abtnr.
      IF sy-subrc NE 0.
        "Link is missing for department
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 051
          CHANGING
            ct_log            = lt_log.

        ls_output-client = sy-mandt.
        ls_output-id1 = ls_abtnr.
        READ TABLE lt_tsabt INTO ls_tsabt WITH KEY spras = sy-langu
                                                    abtnr = ls_abtnr.
        IF sy-subrc EQ 0 AND ls_tsabt-vtext IS NOT INITIAL.
          ls_output-id1_desc = ls_tsabt-vtext.
        ELSE.
          "Department description missing
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 2
              iv_message_number = 046
              iv_param1         = lv_abtnr
            CHANGING
              ct_log            = lt_log.
        ENDIF.
        APPEND ls_output TO lt_output.
      ENDIF.
    ENDLOOP.

    IF lt_output IS NOT INITIAL.
** fill drop down values
      CLEAR ls_dropdown.
      ls_dropdown-handle = '1'.
      ls_dropdown-value = ''.
      APPEND ls_dropdown TO lt_dropdown.

      LOOP AT lt_tb910 INTO ls_tb910.
        READ TABLE lt_tb911 INTO ls_tb911 WITH KEY abtnr = ls_tb910-abtnr.
        IF sy-subrc EQ 0.
          CONCATENATE ls_tb910-abtnr ls_tb911-bez20 INTO lv_dep_desc SEPARATED BY space.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = lv_dep_desc.
          APPEND ls_dropdown TO lt_dropdown.
        ENDIF.
      ENDLOOP.
    ENDIF.

    et_output[]   = lt_output[].
    et_log[]           = lt_log[].

    et_dropdown_values[]  = lt_dropdown[].
  ENDMETHOD.


  METHOD check_cbp_contact_functions.

    DATA: lt_output        TYPE tt_id_desc_op,
          ls_output        TYPE ty_id_desc_op,
          lt_log           TYPE tt_log,
          lt_pafkt         TYPE STANDARD TABLE OF pafkt,
          lt_tpfk          TYPE tt_tpfk,
          lt_tpfkt         TYPE tt_tpfkt,
          lt_tb912         TYPE tt_tb912,
          lt_tb913         TYPE tt_tb913,
          lt_dropdown      TYPE lvc_t_drop,
          lt_cvic_cp2_link TYPE tt_cvic_cp2_link,
          ls_pafkt         TYPE pafkt,
          ls_tpfkt         TYPE tpfkt,
          ls_dropdown      TYPE lvc_s_drop,
          ls_tb912         TYPE tb912,
          ls_tb913         TYPE tb913,
          lv_pafkt(100)    TYPE c,
          lv_func_desc     TYPE bu_bez30.

    CLEAR: et_output, et_log,   et_dropdown_values.

*get required data
    CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
      IMPORTING
        et_tpfk          = lt_tpfk
        et_tpfkt         = lt_tpfkt
        et_tb912         = lt_tb912
        et_tb913         = lt_tb913
        et_cvic_cp2_link = lt_cvic_cp2_link.


*b.	Assigned Funtions Numbers for Contact Person
    SELECT DISTINCT pafkt FROM knvk INTO TABLE lt_pafkt
                          WHERE pafkt NE space. "#EC CI_NOFIELD

    SORT lt_pafkt.
    DELETE ADJACENT DUPLICATES FROM lt_pafkt.

    LOOP AT lt_pafkt INTO ls_pafkt.
      lv_pafkt = ls_pafkt.
      READ TABLE lt_tpfk TRANSPORTING NO FIELDS
                  WITH KEY pafkt = ls_pafkt.
      IF sy-subrc NE 0.
        "Function has been deleted from table pafk
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 066
            iv_param1         = lv_pafkt
          CHANGING
            ct_log            = lt_log.
      ENDIF.
      READ TABLE lt_cvic_cp2_link TRANSPORTING NO FIELDS WITH KEY pafkt = ls_pafkt.
      IF sy-subrc NE 0.
        "Link is missing for Function
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 052
          CHANGING
            ct_log            = lt_log.

        ls_output-client = sy-mandt.
        ls_output-id1 = ls_pafkt.
        READ TABLE lt_tpfkt INTO ls_tpfkt WITH KEY spras = sy-langu
                                                   pafkt = ls_pafkt.
        IF sy-subrc EQ 0 AND ls_tpfkt-vtext IS NOT INITIAL.
          ls_output-id1_desc = ls_tpfkt-vtext.
        ELSE.
          "Funtion description missing
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 2
              iv_message_number = 047
              iv_param1         = lv_pafkt
            CHANGING
              ct_log            = lt_log.
        ENDIF.
        APPEND ls_output TO lt_output.
        CLEAR ls_output.
      ENDIF.
    ENDLOOP.

    IF lt_output IS NOT INITIAL.
** fill drop down values
      CLEAR ls_dropdown.
      ls_dropdown-handle = '1'.
      ls_dropdown-value = ''.
      APPEND ls_dropdown TO lt_dropdown.

      LOOP AT lt_tb912 INTO ls_tb912.
        READ TABLE lt_tb913 INTO ls_tb913 WITH KEY pafkt = ls_tb912-pafkt.
        IF sy-subrc EQ 0.
          CONCATENATE ls_tb912-pafkt ls_tb913-bez30 INTO lv_func_desc SEPARATED BY space.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = lv_func_desc.
          APPEND ls_dropdown TO lt_dropdown.
        ENDIF.
      ENDLOOP.
    ENDIF.
    et_output   = lt_output.
    et_log          = lt_log.

    et_dropdown_values = lt_dropdown.

  ENDMETHOD.


  METHOD check_cbp_contact_marital.


    DATA: lt_output          TYPE tt_id_desc_op,
          lt_log             TYPE tt_log,
          lt_famst           TYPE STANDARD TABLE OF famst,
          lt_t502t           TYPE tt_t502t,
          lt_tb027           TYPE tt_tb027,
          lt_tb027t          TYPE tt_tb027t,
          lt_cvic_marst_link TYPE tt_cvic_marst_link,
          lt_dropdown        TYPE lvc_t_drop,
          ls_output          TYPE ty_id_desc_op,
          ls_t502t           TYPE t502t,
          ls_famst           TYPE famst,
          ls_dropdown        TYPE lvc_s_drop,
          ls_tb027           TYPE tb027,
          ls_tb027t          TYPE tb027t,
          lv_famst(100)      TYPE c,
          lv_marst_desc      TYPE char20.


    CLEAR: et_output, et_log, et_dropdown_values.

*get required data
    CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
      IMPORTING
        et_t502t           = lt_t502t
        et_tb027           = lt_tb027
        et_tb027t          = lt_tb027t
        et_cvic_marst_link = lt_cvic_marst_link.


*b.	Assigned Funtions Numbers for Contact Person
    SELECT DISTINCT famst FROM knvk INTO TABLE lt_famst
                          WHERE famst NE space. "#EC CI_NOFIELD

    SORT lt_famst.
    DELETE ADJACENT DUPLICATES FROM lt_famst.

    LOOP AT lt_famst INTO ls_famst.
      READ TABLE lt_t502t INTO ls_t502t WITH KEY sprsl = sy-langu
                                                 famst = ls_famst.
      IF sy-subrc EQ 0.
        READ TABLE lt_cvic_marst_link TRANSPORTING NO FIELDS
              WITH KEY famst = ls_famst.
        IF sy-subrc NE 0.
          lv_famst = ls_famst.
          "Link is missing for Marital status
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 055
            CHANGING
              ct_log            = lt_log.

          ls_output-client = sy-mandt.
          ls_output-id1 = ls_famst.
          ls_output-id1_desc = ls_t502t-ftext.
          APPEND ls_output TO lt_output.
        ENDIF.
      ELSE.
        "Marital status description missing
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 050
            iv_param1         = lv_famst
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDLOOP.

    IF lt_output IS NOT INITIAL.
      CLEAR ls_dropdown.
      ls_dropdown-handle = '1'.
      ls_dropdown-value = ''.
      APPEND ls_dropdown TO lt_dropdown.
      LOOP AT lt_tb027 INTO ls_tb027 .
        READ TABLE lt_tb027t INTO ls_tb027t WITH KEY marst = ls_tb027-marst.
        IF sy-subrc EQ 0.
          CONCATENATE ls_tb027-marst ls_tb027t-bez20 INTO lv_marst_desc SEPARATED BY space.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = lv_marst_desc.
          APPEND ls_dropdown TO lt_dropdown.
        ENDIF.
      ENDLOOP.
    ENDIF.

    et_output          = lt_output.
    et_log             = lt_log.
    et_dropdown_values = lt_dropdown.

  ENDMETHOD.


  METHOD check_cbp_contact_vip_indic.

    DATA: lt_output        TYPE tt_id_desc_op,
          lt_log           TYPE tt_log,
          lt_pavip         TYPE STANDARD TABLE OF pavip,
          lt_tvip          TYPE tt_tvip,
          lt_tvipt         TYPE tt_tvipt,
          lt_tb916         TYPE tt_tb916,
          lt_tb917         TYPE tt_tb917,
          lt_cvic_cp4_link TYPE tt_cvic_cp4_link,
          ls_output        TYPE ty_id_desc_op,
          ls_pavip         TYPE pavip,
          ls_tvipt         TYPE tvipt,
          lt_dropdown      TYPE lvc_t_drop,
          ls_dropdown      TYPE lvc_s_drop,
          ls_tb916         TYPE tb916,
          ls_tb917         TYPE tb917,
          lv_pavip(100)    TYPE c,
          lv_vip_desc      TYPE char20.

    CLEAR: et_output, et_log,   et_dropdown_values.

*get required data
    CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
      IMPORTING
        et_tvip          = lt_tvip
        et_tvipt         = lt_tvipt
        et_tb916         = lt_tb916
        et_tb917         = lt_tb917
        et_cvic_cp4_link = lt_cvic_cp4_link.

*b.	Assigned Authorities for Contact Person
    SELECT DISTINCT pavip FROM knvk INTO TABLE lt_pavip
                          WHERE pavip NE space. "#EC CI_NOFIELD

    SORT lt_pavip.
    DELETE ADJACENT DUPLICATES FROM lt_pavip.

    LOOP AT lt_pavip INTO ls_pavip.
      lv_pavip = ls_pavip.
      READ TABLE lt_tvip TRANSPORTING NO FIELDS WITH KEY
                         pavip = ls_pavip.
      IF sy-subrc NE 0.
        "Authority has been deleted from table TVPV
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 068
            iv_param1         = lv_pavip
          CHANGING
            ct_log            = lt_log.
      ENDIF.
      READ TABLE lt_cvic_cp4_link TRANSPORTING NO FIELDS
                  WITH KEY pavip = ls_pavip.
      IF sy-subrc NE 0.
        "Link is missing for VIP indicator
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 054
          CHANGING
            ct_log            = lt_log.

        ls_output-client = sy-mandt.
        ls_output-id1 = ls_pavip.
        READ TABLE lt_tvipt INTO ls_tvipt WITH KEY spras = sy-langu
                                                   pavip = ls_pavip.
        IF sy-subrc EQ 0 AND ls_tvipt-vtext IS NOT INITIAL.
          ls_output-id1_desc = ls_tvipt-vtext.
        ELSE.
          "VIP indicator description missing
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 2
              iv_message_number = 049
              iv_param1         = lv_pavip
            CHANGING
              ct_log            = lt_log.
        ENDIF.
        APPEND ls_output TO lt_output.
        CLEAR ls_output.
      ENDIF.
    ENDLOOP.

    IF lt_output IS NOT INITIAL.
      ls_dropdown-handle = '1'.
      ls_dropdown-value = ''.
      APPEND ls_dropdown TO lt_dropdown.
      CLEAR ls_dropdown.
      LOOP AT lt_tb916 INTO ls_tb916.
        READ TABLE lt_tb917 INTO ls_tb917 WITH KEY pavip = ls_tb916-pavip.
        IF sy-subrc EQ 0.
          CONCATENATE ls_tb916-pavip ls_tb917-bez20 INTO lv_vip_desc SEPARATED BY space.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = lv_vip_desc.
          APPEND ls_dropdown TO lt_dropdown.
          CLEAR ls_dropdown.
        ENDIF.
      ENDLOOP.
    ENDIF.


    et_output[]   = lt_output[].
    et_log[]           = lt_log[].

    et_dropdown_values[] = lt_dropdown[].

  ENDMETHOD.


  METHOD check_cbp_legal_status.

    DATA: lt_output           TYPE tt_id_desc_op,
          lt_gform            TYPE STANDARD TABLE OF gform,
          lt_log              TYPE tt_log,
          lt_tvgf             TYPE tt_tvgf,
          lt_tvgft            TYPE tt_tvgft,
          lt_cvic_legform_lnk TYPE tt_cvic_legform_lnk,
          lt_tb019            TYPE tt_tb019,
          lt_tb020            TYPE tt_tb020,
          lt_dropdown         TYPE lvc_t_drop,
          ls_gform            TYPE gform,
          ls_output           TYPE ty_id_desc_op,
          ls_tb019            TYPE tb019,
          ls_dropdown         TYPE lvc_s_drop,
          ls_tb020            TYPE tb020,
          ls_tvgft            TYPE tvgft,
          lv_gform(100)       TYPE c,
          lv_legal_enty(60)   TYPE c.

    CLEAR: et_output, et_log, et_dropdown_values.

*get required data
    CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
      IMPORTING
        et_tvgf             = lt_tvgf
        et_tvgft            = lt_tvgft
        et_cvic_legform_lnk = lt_cvic_legform_lnk
        et_tb019            = lt_tb019
        et_tb020            = lt_tb020.

    SELECT DISTINCT gform FROM kna1 INTO TABLE lt_gform WHERE
                gform NE space. "#EC CI_NOFIELD

    SORT lt_gform.
    DELETE ADJACENT DUPLICATES FROM lt_gform.

    LOOP AT lt_gform INTO ls_gform.
      lv_gform = ls_gform.
      READ TABLE lt_tvgf TRANSPORTING NO FIELDS
        WITH KEY gform = ls_gform.
      IF sy-subrc NE 0.
        "Legal Status has been deleted from table TVGF
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 069
            iv_param1         = lv_gform
          CHANGING
            ct_log            = lt_log.
      ENDIF.
      READ TABLE lt_cvic_legform_lnk TRANSPORTING NO FIELDS
          WITH KEY gform = ls_gform.
      IF sy-subrc NE 0.
        "Link is missing for legal form and legal status
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 042
            iv_param1         = lv_gform
          CHANGING
            ct_log            = lt_log.

        ls_output-client = sy-mandt.
        ls_output-id1 = ls_gform.
        READ TABLE lt_tvgft INTO ls_tvgft WITH KEY spras = sy-langu
                                                   gform = ls_gform.
        IF sy-subrc EQ 0.
          ls_output-id1_desc = ls_tvgft-vtext.
        ELSE.
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 2
              iv_message_number = 041
              iv_param1         = lv_gform
            CHANGING
              ct_log            = lt_log.
        ENDIF.
        APPEND ls_output TO lt_output.
        CLEAR ls_output.
      ENDIF.
    ENDLOOP.

    IF lt_output IS NOT INITIAL.
** fill drop down values
      CLEAR ls_dropdown.
      ls_dropdown-handle = '1'.
      ls_dropdown-value = ''.
      APPEND ls_dropdown TO lt_dropdown.

      LOOP AT lt_tb019 INTO ls_tb019.
        READ TABLE lt_tb020 INTO ls_tb020
                        WITH KEY spras = sy-langu
                                 legal_enty = ls_tb019-legal_enty.
        IF sy-subrc EQ 0.
          CONCATENATE ls_tb019-legal_enty ls_tb020-textshort INTO lv_legal_enty SEPARATED BY space.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = lv_legal_enty.
          APPEND ls_dropdown TO lt_dropdown.
        ENDIF.
      ENDLOOP.
    ENDIF.


    et_output          = lt_output.
    et_log             = lt_log.

    et_dropdown_values = lt_dropdown.

  ENDMETHOD.


  METHOD check_cbp_payment_cards.

    DATA: lt_output           TYPE tt_id_desc_op,
          lt_log              TYPE tt_log,
          lt_ccins            TYPE STANDARD TABLE OF ccins,
          lt_tvcin            TYPE tt_tvcin,
          lt_tvcint           TYPE tt_tvcint,
          lt_cvic_ccid_link   TYPE tt_cvic_ccid_link,
          lt_tb033            TYPE tt_tb033,
          lt_tb033t           TYPE tt_tb033t,
          lt_dropdown         TYPE lvc_t_drop,
          ls_output           TYPE ty_id_desc_op,
          ls_tvcint           TYPE tvcint,
          ls_tb033            TYPE tb033,
          ls_tb033t           TYPE tb033t,
          ls_ccins            TYPE ccins,
          ls_dropdown         TYPE lvc_s_drop,
          lv_ccins(100)       TYPE c,
          lv_payment_card(60) TYPE c.

    CLEAR: et_output, et_log,   et_dropdown_values.

*get required data
    CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
      IMPORTING
        et_tvcin          = lt_tvcin
        et_tvcint         = lt_tvcint
        et_cvic_ccid_link = lt_cvic_ccid_link
        et_tb033          = lt_tb033
        et_tb033t         = lt_tb033t.

    SELECT DISTINCT ccins FROM vckun INTO TABLE lt_ccins WHERE
                ccins NE space. "#EC CI_NOFIELD

    SORT lt_ccins.
    DELETE ADJACENT DUPLICATES FROM lt_ccins.

    LOOP AT lt_ccins INTO ls_ccins.
      lv_ccins = ls_ccins.
      READ TABLE lt_tvcin TRANSPORTING NO FIELDS
            WITH KEY ccins = ls_ccins.
      IF sy-subrc NE 0.
        " Payment card has been deleted from table TVCIN
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 70
            iv_param1         = lv_ccins
          CHANGING
            ct_log            = lt_log.
      ENDIF.
      READ TABLE lt_cvic_ccid_link TRANSPORTING NO FIELDS
          WITH KEY ccins = ls_ccins.
      IF sy-subrc NE 0.
        " link missing for Payment Card Type
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 043
            iv_param1         = lv_ccins
          CHANGING
            ct_log            = lt_log.

        ls_output-client = sy-mandt.
        ls_output-id1 = ls_ccins.
        READ TABLE lt_tvcint INTO ls_tvcint WITH KEY spras = sy-langu
                                                   ccins = ls_ccins.
        IF sy-subrc EQ 0.
          ls_output-id1_desc = ls_tvcint-vtext.
        ELSE.
          " description missing for payment card
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 2
              iv_message_number = 044
              iv_param1         = lv_ccins
            CHANGING
              ct_log            = lt_log.
        ENDIF.
        APPEND ls_output TO lt_output.
        CLEAR ls_output.
      ENDIF.
    ENDLOOP.

    IF lt_output IS NOT INITIAL.
** fill drop down values
      CLEAR ls_dropdown.
      ls_dropdown-handle = '1'.
      ls_dropdown-value = ''.
      APPEND ls_dropdown TO lt_dropdown.

      LOOP AT lt_tb033 INTO ls_tb033.
        READ TABLE lt_cvic_ccid_link TRANSPORTING NO FIELDS
              WITH KEY pcid_bp = ls_tb033-ccins.
        IF sy-subrc EQ 0.
          CONTINUE. "Remove already existing key entries from dropdown.
        ENDIF.
        READ TABLE lt_tb033t INTO ls_tb033t
                        WITH KEY spras = sy-langu
                                 ccins = ls_tb033-ccins.
        IF sy-subrc EQ 0.
          CONCATENATE ls_tb033-ccins ls_tb033t-bez30 INTO lv_payment_card  SEPARATED BY space.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = lv_payment_card.
          APPEND ls_dropdown TO lt_dropdown.
        ENDIF.
      ENDLOOP.
    ENDIF.

    et_output          = lt_output.
    et_log             = lt_log.
    et_dropdown_values = lt_dropdown.

  ENDMETHOD.


  METHOD check_customer_bp_grouping.
    DATA:lt_output           TYPE tt_id_desc_op,
         lt_log              TYPE tt_log,
         lt_mdsc_ctrl_opt_a  TYPE tt_mdsc_ctrl_opt_a,
         lt_tb001            TYPE tt_tb001,
         lt_tb002            TYPE tt_tb002,
         lt_nriv             TYPE tt_nriv,
         lt_t077d            TYPE tt_t077d,
         lt_t077x            TYPE tt_t077x,
         lt_cvic_cust_to_bp2 TYPE tt_cvic_cust_to_bp2,
         lt_cvic_cust_to_bp1 TYPE tt_cvic_cust_to_bp1,
         ls_output           TYPE ty_id_desc_op,
         ls_nr1              TYPE nriv,
         ls_nr2              TYPE nriv,
         ls_cvic_cust_to_bp1 TYPE cvic_cust_to_bp1,
         ls_cvic_cust_to_bp2 TYPE cvic_cust_to_bp2,
         ls_tb001            TYPE tb001,
         ls_tb002            TYPE tb002,
         ls_nriv             TYPE nriv,
         ls_t077d            TYPE t077d,
         ls_t077x            TYPE t077x,
         lv_grouping         TYPE char100,
         lv_account_group    TYPE char100,
         lv_nrrng            TYPE char100,
         lv_numkr            TYPE char100,
         lv_icon_left        TYPE CHAR100.

    CLEAR: et_output, et_log.

    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name        = 'ICON_ARROW_LEFT'
        info        = text-028
        add_stdinf  = 'X'
      IMPORTING
        result = lv_icon_left.

    CALL METHOD fill_required_data
      IMPORTING
        et_mdsc_ctrl_opt_a  = lt_mdsc_ctrl_opt_a
        et_tb001            = lt_tb001
        et_tb002            = lt_tb002
        et_nriv             = lt_nriv
        et_t077d            = lt_t077d
        et_t077x            = lt_t077x
        et_cvic_cust_to_bp2 = lt_cvic_cust_to_bp2
        et_cvic_cust_to_bp1 = lt_cvic_cust_to_bp1.


    "Check customer->BP direction is active
    IF lt_cvic_cust_to_bp1 IS NOT INITIAL.
      READ TABLE lt_mdsc_ctrl_opt_a WITH KEY sync_obj_source = 'CUSTOMER'
                                       sync_obj_target = 'BP'
                                       active_indicator = abap_true TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        "direction customer->bp is not active
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 015
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDIF.

    LOOP AT lt_cvic_cust_to_bp1 INTO ls_cvic_cust_to_bp1.

      lv_grouping      = ls_cvic_cust_to_bp1-grouping.
      lv_account_group = ls_cvic_cust_to_bp1-account_group.

      ls_output-id1 = ls_cvic_cust_to_bp1-grouping.
      ls_output-id2 = ls_cvic_cust_to_bp1-account_group.
      ls_output-text5 = ls_cvic_cust_to_bp1-same_number.
      "Check if BP grouping exist in customizing table
      READ TABLE lt_tb001 WITH KEY bu_group = ls_cvic_cust_to_bp1-grouping
                          INTO ls_tb001.
      IF sy-subrc = 0.
        ls_output-text1 = ls_tb001-nrrng.
        "Check BP grouping text exist
        READ TABLE lt_tb002 WITH KEY bu_group = ls_cvic_cust_to_bp1-grouping
                            INTO ls_tb002.
        IF sy-subrc = 0.
          ls_output-id1_desc = ls_tb002-txt15.
        ELSE.
          " BP grpuping description is missing
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 3
              iv_message_number = 033
              iv_param1         = lv_grouping
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ELSE.
        "Assigned BP grpouping does not exist
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 034
            iv_param1         = TEXT-009
            iv_param2         = lv_grouping
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      " Get the number range indicator of BP grouping
      READ TABLE lt_nriv WITH KEY object    = 'BU_PARTNER'
                                  nrrangenr = ls_tb001-nrrng
                       INTO ls_nriv.
      IF sy-subrc = 0.
        ls_output-text2 = ls_nriv-externind.
      ENDIF.

      "Get the account group text and number range
      READ TABLE lt_t077d WITH KEY ktokd = ls_cvic_cust_to_bp1-account_group
                          INTO ls_t077d.
      IF sy-subrc = 0.
        ls_output-text3 = ls_t077d-numkr.
        READ TABLE lt_t077x WITH KEY ktokd = ls_cvic_cust_to_bp1-account_group
                                     spras = sy-langu
                            INTO ls_t077x.
        IF sy-subrc = 0.
          ls_output-id2_desc = ls_t077x-txt30.
        ELSE.
          "Customer Account text does not exist
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 3
              iv_message_number = 035
              iv_param1         = lv_account_group
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ELSE.
        "Customer Account has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 017
            iv_param1         = TEXT-009
            iv_param2         = lv_account_group
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      " the number range indicator of Customer
      READ TABLE lt_nriv WITH KEY object = 'DEBITOR'
                                nrrangenr = ls_t077d-numkr
                       INTO ls_nriv.
      IF sy-subrc = 0.
        ls_output-text4 = ls_nriv-externind.
      ENDIF.

      READ TABLE lt_nriv WITH KEY object    = 'DEBITOR'
                                  nrrangenr = ls_t077d-numkr TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        lv_numkr = ls_t077d-numkr.
        "Customer account group - number Range has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 018
            iv_param1         = lv_numkr
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      READ TABLE lt_nriv WITH KEY  object    = 'BU_PARTNER'
                                   nrrangenr = ls_tb001-nrrng TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        lv_nrrng = ls_tb001-nrrng.
        "BP grouping - number Range has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 018
            iv_param1         = lv_nrrng
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      IF ls_output-text2 = abap_true.
        IF ls_cvic_cust_to_bp1-same_number <> abap_true.
          "External number assignment for BP is set, same number flag is mandatory
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 022
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ENDIF.

      IF ls_cvic_cust_to_bp1-same_number = abap_true.
        READ TABLE lt_nriv WITH KEY object = 'BU_PARTNER'
                                  nrrangenr = ls_tb001-nrrng INTO ls_nr1.
        READ TABLE lt_nriv WITH KEY object = 'DEBITOR'
                                  nrrangenr = ls_t077d-numkr INTO ls_nr2.
        IF ls_nr1-fromnumber <> ls_nr2-fromnumber OR
             ls_nr1-tonumber <> ls_nr2-tonumber.
          "Same Number flag is set, but Number Ranges don't match
          lv_nrrng = ls_tb001-nrrng.
          lv_numkr = ls_t077d-numkr.
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 023
              iv_param1         = lv_nrrng
              iv_param2         = lv_numkr
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ENDIF.

      ls_output-arrow = lv_icon_left.

      APPEND ls_output TO lt_output.
      CLEAR ls_output.
    ENDLOOP.

    "Check if roles are assigned for account groups
    LOOP AT lt_cvic_cust_to_bp2 INTO ls_cvic_cust_to_bp2.
      " Check if BP grouping exist for role
      READ TABLE lt_cvic_cust_to_bp1 WITH KEY account_group = ls_cvic_cust_to_bp2-account_group TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        lv_account_group = ls_cvic_cust_to_bp2-account_group.
        "A BP Role has been assigned to a Customer Account Group, but BP Account Group is missing
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 020
            iv_param1         = lv_account_group
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDLOOP.

    SORT lt_log BY message.
    DELETE ADJACENT DUPLICATES FROM lt_log.

    et_output = lt_output.
    et_log         = lt_log.

  ENDMETHOD.


  METHOD check_customer_bp_roles.
    DATA: lt_output           TYPE tt_id_desc_op,
          ls_output           TYPE ty_id_desc_op,
          lt_t077x            TYPE tt_t077x,
          ls_t077x            TYPE t077x,
          lt_t077d            TYPE tt_t077d,
          lt_tb003            TYPE tt_tb003,
          lt_mdsc_ctrl_opt_a  TYPE tt_mdsc_ctrl_opt_a,
          lt_tb003t           TYPE tt_tb003t,
          ls_tb003t           TYPE tb003t,
          lt_cvic_cust_to_bp1 TYPE tt_cvic_cust_to_bp1,
          lt_cvic_cust_to_bp2 TYPE tt_cvic_cust_to_bp2,
          ls_cvic_cust_to_bp1 TYPE cvic_cust_to_bp1,
          ls_cvic_cust_to_bp2 TYPE cvic_cust_to_bp2,
          lt_log              TYPE tt_log,
          lv_account_group    TYPE char100,
          lv_role             TYPE char100,
          lv_icon_left        TYPE CHAR100.
    CLEAR: et_output, et_log.

    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name        = 'ICON_ARROW_LEFT'
        info        = text-027
        add_stdinf  = 'X'
      IMPORTING
        result = lv_icon_left.

    CALL METHOD fill_required_data
      IMPORTING
        et_mdsc_ctrl_opt_a  = lt_mdsc_ctrl_opt_a
        et_t077x            = lt_t077x
        et_t077d            = lt_t077d
        et_tb003t           = lt_tb003t
        et_tb003            = lt_tb003
        et_cvic_cust_to_bp1 = lt_cvic_cust_to_bp1
        et_cvic_cust_to_bp2 = lt_cvic_cust_to_bp2.

    IF lt_cvic_cust_to_bp2 IS NOT INITIAL.
      READ TABLE lt_mdsc_ctrl_opt_a WITH KEY sync_obj_source = 'CUSTOMER'
                                             sync_obj_target = 'BP'
                                             active_indicator = abap_true TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        "Account Groups present, but direction customer->bp is not active
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 014
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDIF.


    LOOP AT lt_cvic_cust_to_bp2 INTO ls_cvic_cust_to_bp2.

      lv_account_group = ls_cvic_cust_to_bp2-account_group .
      lv_role = ls_cvic_cust_to_bp2-role.

      ls_output-id1 = ls_cvic_cust_to_bp2-role.
      ls_output-id2 = ls_cvic_cust_to_bp2-account_group.

      "check acccount group text exist or not
      READ TABLE lt_t077x INTO ls_t077x WITH KEY
                               ktokd = ls_cvic_cust_to_bp2-account_group
                               spras = sy-langu.
      IF sy-subrc = 0.
        ls_output-id2_desc = ls_t077x-txt30.
      ELSE.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 3
            iv_message_number = 035
            iv_param1         = lv_account_group
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      "check role text exist or not
      READ TABLE lt_tb003t INTO ls_tb003t WITH KEY
                 role = ls_cvic_cust_to_bp2-role.

      IF sy-subrc = 0.
        ls_output-id1_desc = ls_tb003t-rltxt.
      ELSE.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 3
            iv_message_number = 036
            iv_param1         = lv_role
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      " Check if assigned BP roles is still present
      READ TABLE lt_tb003 WITH KEY role = ls_cvic_cust_to_bp2-role TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        "BP Role has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 016
            iv_param1         = lv_role
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      "check if Customer Account Group has been deleted
      READ TABLE lt_t077d WITH KEY ktokd = ls_cvic_cust_to_bp2-account_group TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        "Customer Account Group has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 017
            iv_param1         = lv_account_group
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      ls_output-arrow = lv_icon_left."gv_icon_arrow_left.

      APPEND ls_output TO lt_output.
    ENDLOOP.

    "Check if BP grouping exist for role
    LOOP AT lt_cvic_cust_to_bp1 INTO ls_cvic_cust_to_bp1.
      READ TABLE lt_cvic_cust_to_bp2 WITH KEY account_group = ls_cvic_cust_to_bp1-account_group TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        "A BP Account Group has been assigned to a customer Account Group, but BP Role is missing
        lv_account_group = ls_cvic_cust_to_bp1-account_group.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 021
            iv_param1         = lv_account_group
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDLOOP.

    SORT lt_log BY message.
    DELETE ADJACENT DUPLICATES FROM lt_log.

    et_output = lt_output.
    et_log = lt_log.

  ENDMETHOD.


  METHOD check_data.

    CLEAR: et_output, et_log, et_dropdown_values.

    CASE iv_scenario.
      WHEN gc_gen_sync.
        CALL METHOD check_sync_direction
          IMPORTING
            et_output = et_output
            et_log    = et_log.

      WHEN gc_gen_ppo.
        CALL METHOD check_ppo_connection
          IMPORTING
            et_output = et_output
            et_log    = et_log.

      WHEN gc_gen_regfun.
        CALL METHOD check_registered_fm
          IMPORTING
            et_output = et_output
            et_log    = et_log.

      WHEN gc_gen_tax.
        CALL METHOD check_tax_categories
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.

      WHEN gc_gen_addrnr.
        CALL METHOD check_address_number_range
          IMPORTING
            et_output = et_output
            et_log    = et_log.

      WHEN gc_gen_industry OR gc_cbp_ind_in OR gc_bpc_ind_out OR
           gc_vbp_ind_in OR gc_bpv_ind_out.

        CALL METHOD check_industry_system
          EXPORTING
            iv_scenario = iv_scenario
          IMPORTING
            et_output   = et_output
            et_log      = et_log.

      WHEN gc_cbp_roles.
        CALL METHOD check_customer_bp_roles
          IMPORTING
            et_output = et_output
            et_log    = et_log.
      WHEN gc_cbp_groupng.
        CALL METHOD check_customer_bp_grouping
          IMPORTING
            et_output = et_output
            et_log    = et_log.

      WHEN gc_cbp_accrole.
        CALL METHOD check_cbp_acc_grp_to_bp_role
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.

      WHEN gc_cbp_accgrp.
        CALL METHOD check_cbp_acc_grp_to_bp_grp
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.

      WHEN gc_cbpcp_actv.
        CALL METHOD check_cbp_contact_assignment
          IMPORTING
            et_output = et_output
            et_log    = et_log.

      WHEN gc_cbpcp_dept.
        CALL METHOD check_cbp_contact_department
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.

      WHEN gc_cbpcp_func.
        CALL METHOD check_cbp_contact_functions
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.


      WHEN gc_cbpcp_auth.
        CALL METHOD check_cbp_contact_authority
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.

      WHEN gc_cbpcp_vip.
        CALL METHOD check_cbp_contact_vip_indic
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.

      WHEN gc_cbpcp_marital.
        CALL METHOD check_cbp_contact_marital
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.

      WHEN gc_cbp_legal.
        CALL METHOD check_cbp_legal_status
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.

      WHEN gc_cbp_paycard.
        CALL METHOD check_cbp_payment_cards
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.

      WHEN gc_vbp_roles.
        CALL METHOD check_vendor_bp_roles
          IMPORTING
            et_output = et_output
            et_log    = et_log.

      WHEN gc_vbp_groupng.
        CALL METHOD check_vendor_bp_grouping
          IMPORTING
            et_output = et_output
            et_log    = et_log.

      WHEN gc_vbp_accrole.
        CALL METHOD check_vbp_acc_grp_to_bp_role
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.

      WHEN gc_vbp_accgrp.
        CALL METHOD check_vbp_acc_grp_to_bp_grp
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.

      WHEN gc_bpc_roles.
        CALL METHOD check_bp_customer_roles
          IMPORTING
            et_output = et_output
            et_log    = et_log.

      WHEN gc_bpc_groupng.
        CALL METHOD check_bp_customer_grouping
          IMPORTING
            et_output = et_output
            et_log    = et_log.

      WHEN gc_bpc_dept OR  gc_bpc_func OR gc_bpc_auth OR gc_bpc_vip OR
           gc_bpc_marital OR gc_bpc_legal OR gc_bpc_paycard.
        CALL METHOD get_bp_to_contact_person
          EXPORTING
            iv_scenario        = iv_scenario
          IMPORTING
            et_output          = et_output
            et_log             = et_log
            et_dropdown_values = et_dropdown_values.

      WHEN gc_bpv_roles.
        CALL METHOD check_bp_vendor_roles
          IMPORTING
            et_output = et_output
            et_log    = et_log.

      WHEN gc_bpv_groupng.
        CALL METHOD check_bp_vendor_grouping
          IMPORTING
            et_output = et_output
            et_log    = et_log.

    ENDCASE.

    SORT et_log BY prio message.
    DELETE ADJACENT DUPLICATES FROM et_log COMPARING prio message.

  ENDMETHOD.


  METHOD check_data_before_save.
    DATA: lt_t077d       TYPE tt_t077d,
          lt_t077k       TYPE tt_t077k,
          ls_t077d       TYPE t077d,
          ls_t077k       TYPE t077k,
          ls_output      TYPE ty_id_desc_op,
          lt_tsab        TYPE tt_tsab,
          lt_tpfk        TYPE tt_tpfk,
          lt_tvpv        TYPE tt_tvpv,
          lt_tvip        TYPE tt_tvip,
          lt_t502t       TYPE tt_t502t,
          lt_tvgf        TYPE tt_tvgf,
          lt_tvcin       TYPE tt_tvcin,
          lt_tb001       TYPE tt_tb001,
          ls_tb001       TYPE tb001,
          lt_nriv        TYPE tt_nriv,
          ls_nriv_bp     TYPE nriv,
          ls_nriv_cust   TYPE nriv,
          ls_nriv_vend   TYPE nriv,
          lv_lines       TYPE i,
          lv_param1(100) TYPE c,
          lv_param2(100) TYPE c,
          lv_var1        TYPE string,
          lt_out_temp    TYPE tt_id_desc_op,
          lv_var2        TYPE string.
    CLEAR et_log.

    FIELD-SYMBOLS: <ls_output> TYPE ty_id_desc_op.

    IF iv_scenario = gc_cbp_accrole   OR
       iv_scenario = gc_cbp_accgrp    OR
       iv_scenario = gc_cbp_legal     OR
       iv_scenario = gc_cbp_paycard   OR
       iv_scenario = gc_cbpcp_dept    OR
       iv_scenario = gc_cbpcp_func    OR
       iv_scenario = gc_cbpcp_auth    OR
       iv_scenario = gc_cbpcp_vip     OR
       iv_scenario = gc_cbpcp_marital OR
       iv_scenario = gc_vbp_accrole   OR
       iv_scenario = gc_vbp_accgrp    OR
       iv_scenario = gc_bpc_legal     OR
       iv_scenario = gc_bpc_paycard   OR
       iv_scenario = gc_bpc_dept      OR
       iv_scenario = gc_bpc_func      OR
       iv_scenario = gc_bpc_auth      OR
       iv_scenario = gc_bpc_vip       OR
       iv_scenario = gc_bpc_marital.
      LOOP AT ct_output ASSIGNING <ls_output>.
        SPLIT <ls_output>-id2_desc AT space INTO lv_var1 lv_var2.
        <ls_output>-id2 = lv_var1.
      ENDLOOP.

      DELETE ct_output WHERE id2 IS INITIAL.
    ENDIF.

    SORT ct_output BY id2.

    CASE iv_scenario.

      WHEN gc_cbp_accrole.
        CALL METHOD fill_required_data
          IMPORTING
            et_t077d = lt_t077d.
        LOOP AT ct_output INTO ls_output.
          READ TABLE lt_t077d TRANSPORTING NO FIELDS WITH KEY
              ktokd = ls_output-id1.
          IF sy-subrc NE 0.
            "Account group has been deleted from table T077D
            lv_param1 = ls_output-id1.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 063
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.
          ENDIF.
        ENDLOOP.

      WHEN gc_cbp_accgrp.

        CALL METHOD fill_required_data
          IMPORTING
            et_t077d = lt_t077d
            et_tb001 = lt_tb001
            et_nriv  = lt_nriv.

        LOOP AT ct_output INTO ls_output.
          READ TABLE lt_t077d INTO ls_t077d WITH KEY
              ktokd = ls_output-id1.
          IF sy-subrc NE 0.
            "Account group has been deleted from table T077D
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 063
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.

          ELSE.
            READ TABLE lt_tb001 INTO ls_tb001  WITH KEY
                                     bu_group = ls_output-id2.
            READ TABLE lt_nriv INTO ls_nriv_cust WITH KEY
                                    object = 'DEBITOR'
                                    nrrangenr = ls_t077d-numkr.
            READ TABLE lt_nriv INTO ls_nriv_bp WITH KEY
                                    object = 'BU_PARTNER'
                                    nrrangenr = ls_tb001-nrrng.
            lv_param1 = ls_output-id1.
            lv_param2 = ls_output-id2.

            IF ls_output-text1 EQ abap_true. "If same number is marked
              "Internal numbering can not be used with same numbers
              IF ls_nriv_bp-externind = abap_false. "
                CALL METHOD prepare_message
                  EXPORTING
                    iv_severity       = 1
                    iv_message_number = 083
                    iv_param1         = TEXT-019
                    iv_param2         = lv_param1
                    iv_param3         = lv_param2
                  CHANGING
                    ct_log            = et_log.
                DELETE TABLE ct_output FROM ls_output.
              ELSE.
                "If same number is marked, BP grouping and account group
                " must have overlapping number range
                IF ls_nriv_cust-fromnumber <> ls_nriv_bp-fromnumber OR
                   ls_nriv_cust-tonumber   <> ls_nriv_bp-tonumber.
              CALL METHOD prepare_message
                EXPORTING
                  iv_severity       = 1
                  iv_message_number = 064
                      iv_param1         = TEXT-019
                      iv_param2         = lv_param1
                      iv_param3         = lv_param2
                    CHANGING
                      ct_log            = et_log.
                  DELETE TABLE ct_output FROM ls_output.
                ENDIF.
              ENDIF.
            ELSE.
              "External numbers can only be used with same numbers
              IF ls_nriv_bp-externind = abap_true.
                CALL METHOD prepare_message
                  EXPORTING
                    iv_severity       = 1
                    iv_message_number = 082
                    iv_param1         = TEXT-019
                    iv_param2         = lv_param1
                    iv_param3         = lv_param2
                  CHANGING
                    ct_log            = et_log.
                DELETE TABLE ct_output FROM ls_output.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDLOOP.

      WHEN gc_cbpcp_dept.

        CALL METHOD fill_required_data
          IMPORTING
            et_tsab = lt_tsab.
        LOOP AT ct_output INTO ls_output.
          READ TABLE lt_tsab TRANSPORTING NO FIELDS WITH KEY
              abtnr = ls_output-id1.
          IF sy-subrc NE 0.
            "Customer department has been deleted from table TSAB
            lv_param1 = ls_output-id1.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 071
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.
          ENDIF.
        ENDLOOP.

      WHEN gc_cbpcp_func.

        CALL METHOD fill_required_data
          IMPORTING
            et_tpfk = lt_tpfk.
        LOOP AT ct_output INTO ls_output.
          READ TABLE lt_tpfk TRANSPORTING NO FIELDS WITH KEY
             pafkt  = ls_output-id1.
          IF sy-subrc NE 0.
            "Customer function has been deleted from table TPFK
            lv_param1 = ls_output-id1.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 072
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.
          ENDIF.
        ENDLOOP.

      WHEN gc_cbpcp_auth.

        CALL METHOD fill_required_data
          IMPORTING
            et_tvpv = lt_tvpv.
        LOOP AT ct_output INTO ls_output.
          READ TABLE lt_tvpv TRANSPORTING NO FIELDS WITH KEY
           parvo   = ls_output-id1.
          IF sy-subrc NE 0.
            "Customer authority has been deleted from table TVPV
            lv_param1 = ls_output-id1.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 073
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.
          ENDIF.
        ENDLOOP.

      WHEN gc_cbpcp_vip.

        CALL METHOD fill_required_data
          IMPORTING
            et_tvip = lt_tvip.
        LOOP AT ct_output INTO ls_output.
          READ TABLE lt_tvip TRANSPORTING NO FIELDS WITH KEY
              pavip = ls_output-id1.
          IF sy-subrc NE 0.
            "Customer VIP indicator has been deleted from table TVIP
            lv_param1 = ls_output-id1.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 074
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.
          ENDIF.
        ENDLOOP.

      WHEN gc_cbpcp_marital.

        CALL METHOD fill_required_data
          IMPORTING
            et_t502t = lt_t502t.
        LOOP AT ct_output INTO ls_output.
          READ TABLE lt_t502t TRANSPORTING NO FIELDS WITH KEY
             famst  = ls_output-id1.
          IF sy-subrc NE 0.
            "Marital status has been deleted from table T502T
            lv_param1 = ls_output-id1.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 075
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.
          ENDIF.
        ENDLOOP.

      WHEN gc_cbp_legal.

        CALL METHOD fill_required_data
          IMPORTING
            et_tvgf = lt_tvgf.
        LOOP AT ct_output INTO ls_output.
          READ TABLE lt_tvgf TRANSPORTING NO FIELDS WITH KEY
              gform = ls_output-id1.
          IF sy-subrc NE 0.
            "Legal form has been deleted from table TVGF
            lv_param1 = ls_output-id1.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 076
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.
          ENDIF.
        ENDLOOP.

      WHEN gc_cbp_paycard.

        CALL METHOD fill_required_data
          IMPORTING
            et_tvcin = lt_tvcin.

        LOOP AT ct_output INTO ls_output.
        "Check and log error if key field of the view
        " has been maintained mutiple times by user
          lt_out_temp = ct_output.

          DELETE lt_out_temp WHERE id2 NE ls_output-id2.
          DESCRIBE TABLE lt_out_temp LINES lv_lines.
          IF ( lv_lines > 1 ).
            lv_param2 = ls_output-id2.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 084
                iv_param1         = TEXT-019
                iv_param2         = TEXT-042
                iv_param3         = lv_param2
              CHANGING
                ct_log            = et_log.

            DELETE ct_output WHERE id2 = ls_output-id2.
            CONTINUE.
          ENDIF.

          READ TABLE lt_tvcin TRANSPORTING NO FIELDS WITH KEY
              ccins = ls_output-id1.
          IF sy-subrc NE 0.
            "Credit card has been deleted from table TVCIN
            lv_param1 = ls_output-id1.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 077
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.
          ENDIF.
        ENDLOOP.

      WHEN gc_vbp_accrole.

        CALL METHOD fill_required_data
          IMPORTING
            et_t077k = lt_t077k.
        LOOP AT ct_output INTO ls_output.
          READ TABLE lt_t077k TRANSPORTING NO FIELDS WITH KEY
              ktokk = ls_output-id1.
          IF sy-subrc NE 0.
            "Vendor account group has been deleted from table T077K
            lv_param1 = ls_output-id1.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 078
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.
          ENDIF.
        ENDLOOP.

      WHEN gc_vbp_accgrp.

        CALL METHOD fill_required_data
          IMPORTING
            et_t077k = lt_t077k
            et_tb001 = lt_tb001
            et_nriv  = lt_nriv.
        LOOP AT ct_output INTO ls_output.
          READ TABLE lt_t077k INTO ls_t077k WITH KEY
              ktokk = ls_output-id1.
          IF sy-subrc NE 0.
            "Vendor account group has been deleted from table T077K
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 078
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.

          ELSE.
            READ TABLE lt_tb001 INTO ls_tb001  WITH KEY
                                     bu_group = ls_output-id2.
            READ TABLE lt_nriv INTO ls_nriv_vend WITH KEY
                                    object = 'DEBITOR'
                                    nrrangenr = ls_t077k-numkr.
            READ TABLE lt_nriv INTO ls_nriv_bp WITH KEY
                                    object = 'BU_PARTNER'
                                    nrrangenr = ls_tb001-nrrng.
            lv_param1 = ls_output-id1.
            lv_param2 = ls_output-id2.
            IF ls_output-text1 EQ abap_true. "If same number is marked
              "Internal numbering can not be used with same numbers
              IF ls_nriv_bp-externind = abap_false. "
                CALL METHOD prepare_message
                  EXPORTING
                    iv_severity       = 1
                    iv_message_number = 083
                    iv_param1         = TEXT-019
                    iv_param2         = lv_param1
                    iv_param3         = lv_param2
                  CHANGING
                    ct_log            = et_log.
                DELETE TABLE ct_output FROM ls_output.
              ELSE.
                "If same number is marked, BP grouping and account group
                " must have overlapping number range
                IF ls_nriv_vend-fromnumber <> ls_nriv_bp-fromnumber OR
                   ls_nriv_vend-tonumber   <> ls_nriv_bp-tonumber.
                  CALL METHOD prepare_message
                    EXPORTING
                      iv_severity       = 1
                      iv_message_number = 064
                      iv_param1         = TEXT-019
                      iv_param2         = lv_param1
                      iv_param3         = lv_param2
                    CHANGING
                      ct_log            = et_log.
                  DELETE TABLE ct_output FROM ls_output.
                ENDIF.
              ENDIF.

            ELSE.
              "External numbers can only be used with same numbers
              IF ls_nriv_bp-externind = abap_true.
              CALL METHOD prepare_message
                EXPORTING
                  iv_severity       = 1
                    iv_message_number = 082
                  iv_param1         = TEXT-019
                  iv_param2         = lv_param1
                  iv_param3         = lv_param2
                CHANGING
                  ct_log            = et_log.
              DELETE TABLE ct_output FROM ls_output.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDLOOP.

      WHEN gc_gen_industry.

        READ TABLE ct_output TRANSPORTING NO FIELDS WITH KEY
                   input = abap_true.
        IF sy-subrc NE 0.
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 038
              iv_param1         = TEXT-026
            CHANGING
              ct_log            = et_log.
          CLEAR ct_output.
        ENDIF.

      WHEN gc_cbp_ind_in OR gc_vbp_ind_in.

        LOOP AT ct_output INTO ls_output.
          IF ls_output-input IS INITIAL.
            lv_param1 = ls_output-input.
            "Industry system is initial
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 080
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.
          ENDIF.
        ENDLOOP.

      WHEN gc_bpc_ind_out OR gc_bpv_ind_out.

        LOOP AT ct_output INTO ls_output.
          IF ls_output-input IS INITIAL.
            "Industry system is initial
            lv_param1 = ls_output-input.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 080
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.
          ENDIF.

          IF ls_output-text1 IS INITIAL.
            "Industry sector is initial
            lv_param1 = ls_output-text1.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 081
                iv_param1         = TEXT-019
                iv_param2         = lv_param1
              CHANGING
                ct_log            = et_log.
            DELETE TABLE ct_output FROM ls_output.
          ENDIF.
        ENDLOOP.

        WHEN gc_bpc_dept.
        "Check and log error if key field of the view
        " has been maintained mutiple times by user
        LOOP AT ct_output INTO ls_output.
          lt_out_temp = ct_output.

          DELETE lt_out_temp WHERE id2 NE ls_output-id2.
          DESCRIBE TABLE lt_out_temp LINES lv_lines.
          IF ( lv_lines > 1 ).
            lv_param2 = ls_output-id2.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 084
                iv_param1         = TEXT-019
                iv_param2         = TEXT-036
                iv_param3         = lv_param2
              CHANGING
                ct_log            = et_log.

            DELETE ct_output WHERE id2 = ls_output-id2.
          ENDIF.
          ENDLOOP.

        WHEN gc_bpc_func.
        "Check and log error if key field of the view
        " has been maintained mutiple times by user
        LOOP AT ct_output INTO ls_output.
          lt_out_temp = ct_output.

          DELETE lt_out_temp WHERE id2 NE ls_output-id2.
          DESCRIBE TABLE lt_out_temp LINES lv_lines.
          IF ( lv_lines > 1 ).
            lv_param2 = ls_output-id2.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 084
                iv_param1         = TEXT-019
                iv_param2         = TEXT-037
                iv_param3         = lv_param2
              CHANGING
                ct_log            = et_log.

            DELETE ct_output WHERE id2 = ls_output-id2.
          ENDIF.
          ENDLOOP.

        WHEN gc_bpc_auth.
        "Check and log error if key field of the view
        " has been maintained mutiple times by user
        LOOP AT ct_output INTO ls_output.
          lt_out_temp = ct_output.

          DELETE lt_out_temp WHERE id2 NE ls_output-id2.
          DESCRIBE TABLE lt_out_temp LINES lv_lines.
          IF ( lv_lines > 1 ).
            lv_param2 = ls_output-id2.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 084
                iv_param1         = TEXT-019
                iv_param2         = TEXT-038
                iv_param3         = lv_param2
              CHANGING
                ct_log            = et_log.

            DELETE ct_output WHERE id2 = ls_output-id2.
          ENDIF.
          ENDLOOP.

        WHEN gc_bpc_vip.
        "Check and log error if key field of the view
        " has been maintained mutiple times by user
        LOOP AT ct_output INTO ls_output.
          lt_out_temp = ct_output.

          DELETE lt_out_temp WHERE id2 NE ls_output-id2.
          DESCRIBE TABLE lt_out_temp LINES lv_lines.
          IF ( lv_lines > 1 ).
            lv_param2 = ls_output-id2.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 084
                iv_param1         = TEXT-019
                iv_param2         = TEXT-039
                iv_param3         = lv_param2
              CHANGING
                ct_log            = et_log.

            DELETE ct_output WHERE id2 = ls_output-id2.
          ENDIF.
          ENDLOOP.

        WHEN gc_bpc_marital.
        "Check and log error if key field of the view
        " has been maintained mutiple times by user
        LOOP AT ct_output INTO ls_output.
          lt_out_temp = ct_output.

          DELETE lt_out_temp WHERE id2 NE ls_output-id2.
          DESCRIBE TABLE lt_out_temp LINES lv_lines.
          IF ( lv_lines > 1 ).
            lv_param2 = ls_output-id2.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 084
                iv_param1         = TEXT-019
                iv_param2         = TEXT-040
                iv_param3         = lv_param2
              CHANGING
                ct_log            = et_log.

            DELETE ct_output WHERE id2 = ls_output-id2.
          ENDIF.
          ENDLOOP.

        WHEN gc_bpc_legal.
        "Check and log error if key field of the view
        " has been maintained mutiple times by user
        LOOP AT ct_output INTO ls_output.
          lt_out_temp = ct_output.

          DELETE lt_out_temp WHERE id2 NE ls_output-id2.
          DESCRIBE TABLE lt_out_temp LINES lv_lines.
          IF ( lv_lines > 1 ).
            lv_param2 = ls_output-id2.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 084
                iv_param1         = TEXT-019
                iv_param2         = TEXT-041
                iv_param3         = lv_param2
              CHANGING
                ct_log            = et_log.

            DELETE ct_output WHERE id2 = ls_output-id2.
          ENDIF.
          ENDLOOP.

      WHEN OTHERS.
    ENDCASE.

  ENDMETHOD.


  METHOD check_for_editable.
    "Data declaration
    DATA:
      lt_maint_det     TYPE tt_scenario_maint_det,
      ls_maint_det     TYPE ty_scenario_maint_det,
      lo_org_crit_inst TYPE vimty_oc_type.

    "Get maintainance details for current node
    CALL METHOD get_scenario_maint_det
      EXPORTING
        iv_scenario           = iv_scenario             " Character Field of Length 12
      IMPORTING
        et_scenario_maint_det = lt_maint_det.

    "Check is user has necesaary authorizations to change the data
    LOOP AT lt_maint_det INTO ls_maint_det.
      "Check authority for view
      CALL FUNCTION 'VIEW_AUTHORITY_CHECK'
        EXPORTING
          view_action                    = 'U'
          view_name                      = ls_maint_det-maint_viewname
          no_warning_for_clientindep     = ''
        CHANGING
          org_crit_inst                  = lo_org_crit_inst
        EXCEPTIONS
          invalid_action                 = 1
          no_authority                   = 2
          no_clientindependent_authority = 3
          table_not_found                = 4
          no_linedependent_authority     = 5
          OTHERS                         = 6.
      IF sy-subrc <> 0.
        CASE sy-subrc.
          WHEN 3.
            MESSAGE ID 'TB' TYPE 'I' NUMBER 109 RAISING technical_error.
          WHEN 4.
            MESSAGE e028(sv) WITH ls_maint_det-maint_viewname RAISING technical_error.
          WHEN 2 OR 5.
            CALL FUNCTION 'VIEW_AUTHORITY_CHECK'  "check show authority
              EXPORTING
                view_action                = 'S'
                view_name                  = ls_maint_det-maint_viewname
                no_warning_for_clientindep = ''
              CHANGING
                org_crit_inst              = lo_org_crit_inst
              EXCEPTIONS
                no_authority               = 8
                no_linedependent_authority = 10.
            CASE sy-subrc.
              WHEN 0.
                MESSAGE i051(sv) RAISING editable_not_allowed.
              WHEN 1.
                MESSAGE e052(sv) RAISING editable_not_allowed.
              WHEN OTHERS.
                MESSAGE e755(sv) RAISING editable_not_allowed
                      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
            ENDCASE.
        ENDCASE.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD check_industry_system.

    DATA: lt_output      TYPE tt_id_desc_op,
          lt_log         TYPE tt_log,
          lt_tb038       TYPE tt_tb038,
          lt_tb038t      TYPE tt_tb038t,
          lt_brsch       TYPE STANDARD TABLE OF brsch,
          lt_tp038m1     TYPE tt_tp038m1,
          lt_tp038m2     TYPE tt_tp038m2,
          lt_t016        TYPE tt_t016,
          lt_t016t       TYPE tt_t016t,
          ls_output      TYPE ty_id_desc_op,
          ls_tb038       TYPE tb038,
          ls_tb038t      TYPE tb038t,
          ls_t016t       TYPE t016t,
          ls_brsch       TYPE brsch,
          lv_brsch(100)  TYPE c,
          lv_istype(100) TYPE c.

    CLEAR: et_output, et_log.

    CALL METHOD fill_required_data
      IMPORTING
        et_tb038   = lt_tb038
        et_tb038t  = lt_tb038t
        et_tp038m1 = lt_tp038m1
        et_tp038m2 = lt_tp038m2
        et_t016    = lt_t016
        et_t016t   = lt_t016t.

    CASE iv_scenario.

      WHEN gc_gen_industry.
        LOOP AT lt_tb038 INTO ls_tb038.
          lv_istype = ls_tb038-istype.

          ls_output-client = sy-mandt.
          ls_output-id1 = ls_tb038-istype.
          ls_output-input = ls_tb038-istdef.

          READ TABLE lt_tb038t INTO ls_tb038t WITH KEY
                                    langu = sy-langu
                                    istype = ls_tb038-istype.
          IF sy-subrc EQ 0.
            ls_output-id1_desc = ls_tb038t-bez30.
          ELSE.
            " Description missing for industry system
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 2
                iv_message_number = 045
                iv_param1         = lv_istype
              CHANGING
                ct_log            = lt_log.
          ENDIF.

          APPEND ls_output TO lt_output.
          CLEAR ls_output.

        ENDLOOP.

      WHEN gc_cbp_ind_in.
        SELECT DISTINCT brsch FROM kna1 INTO TABLE lt_brsch
           WHERE werks NOT IN ( SELECT werks FROM t001w WHERE vlfkz NE space ).
           "#EC CI_NOFIELD "#EC CI_BUFFSUBQ
        LOOP AT lt_brsch INTO ls_brsch.
          READ TABLE lt_tp038m2 TRANSPORTING NO FIELDS WITH KEY
                     brsch = ls_brsch.
          IF sy-subrc EQ 0.
            DELETE TABLE lt_brsch FROM ls_brsch.
          ENDIF.
        ENDLOOP.
      WHEN gc_bpc_ind_out.
        SELECT DISTINCT brsch FROM kna1 INTO TABLE lt_brsch
           WHERE werks NOT IN ( SELECT werks FROM t001w WHERE vlfkz NE space ).
           "#EC CI_NOFIELD "#EC CI_BUFFSUBQ
        LOOP AT lt_brsch INTO ls_brsch.
          READ TABLE lt_tp038m1 TRANSPORTING NO FIELDS WITH KEY
                     brsch = ls_brsch.
          IF sy-subrc EQ 0.
            DELETE TABLE lt_brsch FROM ls_brsch.
          ENDIF.
        ENDLOOP.
      WHEN gc_vbp_ind_in.
        SELECT DISTINCT brsch FROM lfa1 INTO TABLE lt_brsch
          WHERE werks NOT IN ( SELECT werks FROM t001w WHERE vlfkz NE space ).
          "#EC CI_NOFIELD "#EC CI_BUFFSUBQ
        LOOP AT lt_brsch INTO ls_brsch.
          READ TABLE lt_tp038m2 TRANSPORTING NO FIELDS WITH KEY
                     brsch = ls_brsch.
          IF sy-subrc EQ 0.
            DELETE TABLE lt_brsch FROM ls_brsch.
          ENDIF.
        ENDLOOP.
      WHEN gc_bpv_ind_out.
        SELECT DISTINCT brsch FROM lfa1 INTO TABLE lt_brsch
           WHERE werks NOT IN ( SELECT werks FROM t001w WHERE vlfkz NE space ).
           "#EC CI_NOFIELD "#EC CI_BUFFSUBQ
        LOOP AT lt_brsch INTO ls_brsch.
          READ TABLE lt_tp038m1 TRANSPORTING NO FIELDS WITH KEY
                     brsch = ls_brsch.
          IF sy-subrc EQ 0.
            DELETE TABLE lt_brsch FROM ls_brsch.
          ENDIF.
        ENDLOOP.
      WHEN OTHERS.
    ENDCASE.

    IF iv_scenario = gc_cbp_ind_in  OR iv_scenario = gc_vbp_ind_in OR
       iv_scenario = gc_bpc_ind_out OR iv_scenario = gc_bpv_ind_out.

      DELETE lt_brsch WHERE table_line IS INITIAL.

      IF lt_brsch IS NOT INITIAL.
        LOOP AT lt_brsch INTO ls_brsch.
          lv_brsch = ls_brsch.
          READ TABLE lt_t016 TRANSPORTING NO FIELDS WITH KEY brsch = ls_brsch.
          IF sy-subrc NE 0.
            "Customer/vendor Industry key is deleted from T016 table
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 2
                iv_message_number = 079
                iv_param1         = lv_brsch
              CHANGING
                ct_log            = lt_log.
          ENDIF.

          READ TABLE lt_t016t INTO ls_t016t WITH KEY spras = sy-langu
                                                     brsch = ls_brsch.
          IF sy-subrc EQ 0.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 057
              CHANGING
                ct_log            = lt_log.

            ls_output-client = sy-mandt.
            ls_output-id1 = ls_brsch.
            ls_output-id1_desc = ls_t016t-brtxt.

            APPEND ls_output TO lt_output.
            CLEAR ls_output.
          ELSE.
            " Industry key text is missing in table TB016
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 3
                iv_message_number = 056
                iv_param1         = lv_brsch
              CHANGING
                ct_log            = lt_log.
          ENDIF.

        ENDLOOP.
      ENDIF.
    ENDIF.

    et_output = lt_output.
    et_log    = lt_log.
  ENDMETHOD.


  METHOD check_ppo_connection.
    DATA: lt_output          TYPE tt_id_desc_op,
          lt_log             TYPE tt_log,
          lt_ppo_process     TYPE STANDARD TABLE OF /sappo/a_bproc,
          lt_mdsc_ctrl_opt_a TYPE tt_mdsc_ctrl_opt_a,
          ls_output          TYPE ty_id_desc_op,
          ls_ppo_process     TYPE /sappo/a_bproc,
          lv_ppo_active      TYPE c.

    CLEAR: et_log, et_output.

    CALL METHOD fill_required_data
      IMPORTING
        et_mdsc_ctrl_opt_a = lt_mdsc_ctrl_opt_a.
*select data for PPO status
    SELECT SINGLE ppo_active FROM mdsc_ctrl_objppo INTO lv_ppo_active WHERE sync_object = 'BP'.
*select data for active Business Processes in PPO
    SELECT * FROM /sappo/a_bproc INTO TABLE lt_ppo_process WHERE business_process = 'CVI_01' OR  "gc_process_cvi01 or
                                                                 business_process = 'CVI_02' OR  "gc_process_cvi02 or
                                                                 business_process = 'CVI_03' OR  "gc_process_cvi03 or
                                                                 business_process = 'CVI_04'.     "gc_process_cvi04.
    CLEAR ls_output.
    ls_output-text2 = 1.
    ls_output-id1_desc = TEXT-001.

    IF lv_ppo_active = abap_true.
      ls_output-text1 = gv_icon_checked.
    ELSE.
      ls_output-text1 = gv_icon_incomplete.
      READ TABLE lt_ppo_process TRANSPORTING NO FIELDS WITH KEY flg_active = abap_true.
      IF sy-subrc EQ 0.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 009
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDIF.

    APPEND ls_output TO lt_output.
    CLEAR ls_output.

    LOOP AT lt_ppo_process INTO ls_ppo_process.

      CASE ls_ppo_process-business_process.
        WHEN 'CVI_01'.
          READ TABLE lt_mdsc_ctrl_opt_a WITH KEY sync_obj_source  = 'CUSTOMER'
                                                 sync_obj_target  = 'BP'
                                                 active_indicator = abap_true
                                                TRANSPORTING NO FIELDS.
          IF sy-subrc <> 0 AND ls_ppo_process-flg_active EQ abap_true.
            "Process 01 is active, corresponding synch direction is inactive
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 2
                iv_message_number = 010
                iv_param1         = 'CVI_01'
              CHANGING
                ct_log            = lt_log.
          ENDIF.
          ls_output-text2 = 2.
          ls_output-id1_desc = TEXT-002.

        WHEN 'CVI_02'.
          READ TABLE lt_mdsc_ctrl_opt_a WITH KEY sync_obj_source  = 'VENDOR'
                                                 sync_obj_target  = 'BP'
                                                 active_indicator = abap_true
                                                TRANSPORTING NO FIELDS.
          IF sy-subrc <> 0 AND ls_ppo_process-flg_active EQ abap_true.
            "Process 02 is active, corresponding synch direction is inactive
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 2
                iv_message_number = 010
                iv_param1         = 'CVI_02'
              CHANGING
                ct_log            = lt_log.
          ENDIF.
          ls_output-text2 = 3.
          ls_output-id1_desc = TEXT-003.

        WHEN 'CVI_03'.
          READ TABLE lt_mdsc_ctrl_opt_a WITH KEY sync_obj_source  = 'BP'
                                                 sync_obj_target  = 'CUSTOMER'
                                                 active_indicator = abap_true
                                                TRANSPORTING NO FIELDS.
          IF sy-subrc <> 0 AND ls_ppo_process-flg_active EQ abap_true.
            "Process 03 is active, corresponding synch direction is inactive
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 2
                iv_message_number = 010
                iv_param1         = 'CVI_03'
              CHANGING
                ct_log            = lt_log.
          ENDIF.
          ls_output-text2 = 4.
          ls_output-id1_desc = TEXT-004.

        WHEN 'CVI_04'.
          READ TABLE lt_mdsc_ctrl_opt_a WITH KEY sync_obj_source  = 'BP'
                                                 sync_obj_target  = 'VENDOR'
                                                 active_indicator = abap_true
                                                TRANSPORTING NO FIELDS.
          IF sy-subrc <> 0 AND ls_ppo_process-flg_active EQ abap_true.
            "Process 04 is active, corresponding synch direction is inactive
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 2
                iv_message_number = 010
                iv_param1         = 'CVI_04'
              CHANGING
                ct_log            = lt_log.
          ENDIF.
          ls_output-text2 = 5.
          ls_output-id1_desc = TEXT-005.

      ENDCASE.

      IF ls_ppo_process-flg_active EQ abap_true.
        ls_output-text1 = gv_icon_checked.
      ELSE.
        ls_output-text1 = gv_icon_incomplete.
      ENDIF.
      APPEND ls_output TO lt_output.
      CLEAR ls_output.
    ENDLOOP.

    SORT lt_output ASCENDING BY text2.

    et_output = lt_output.
    et_log = lt_log.
  ENDMETHOD.


  METHOD check_registered_fm.

    DATA: lt_crmc_but_call_fu TYPE STANDARD TABLE OF crmc_but_call_fu,
          lt_output           TYPE tt_id_desc_op,
          lt_log              TYPE tt_log,
          ls_crmc_but_call_fu TYPE crmc_but_call_fu,
          ls_output           TYPE ty_id_desc_op.

    CLEAR: et_log, et_output.

* -- Select registred funtion modules from table - crmc_but_call_fu
    SELECT * FROM crmc_but_call_fu INTO TABLE lt_crmc_but_call_fu
         WHERE ( ztpkt = 'BPOUT' AND objap = 'BUPX' AND posnr = '1000000' ) OR
               ( ztpkt = 'CRMOU' AND objap = 'BUPA' AND posnr = '1000000' ) OR
               ( ztpkt = 'CRMOU' AND objap = 'BUPR' AND posnr = '1000000' ) OR
               ( ztpkt = 'MERGE' AND objap = 'BUPA' AND posnr = '1000000' ) OR
               ( ztpkt = 'MERGE' AND objap = 'BUPA' AND posnr = '2000000' ) OR
               ( ztpkt = 'MERGE' AND objap = 'BUPR' AND posnr = '1000000' ).

* -- Check FM registered
    READ TABLE lt_crmc_but_call_fu WITH KEY ztpkt = 'BPOUT' objap = 'BUPX' posnr = '1000000'
                                       xaktv = abap_true TRANSPORTING NO FIELDS.
    IF sy-subrc <> 0.
      "Function Module MDS_BUPA_OUTBOUND is not registered
      CALL METHOD prepare_message
        EXPORTING
          iv_severity       = 1
          iv_message_number = 011
          iv_param1         = 'MDS_BUPA_OUTBOUND'
        CHANGING
          ct_log            = lt_log.
    ENDIF.

    READ TABLE lt_crmc_but_call_fu WITH KEY ztpkt = 'CRMOU' objap = 'BUPA' posnr = '1000000'
                                     xaktv = abap_true TRANSPORTING NO FIELDS.
    IF sy-subrc <> 0.
      "Function Module BUPA_OUTBOUND_BPS_FILL_CENTRAL is not registered
      CALL METHOD prepare_message
        EXPORTING
          iv_severity       = 1
          iv_message_number = 011
          iv_param1         = 'BUPA_OUTBOUND_BPS_FILL_CENTRAL'
        CHANGING
          ct_log            = lt_log.
    ENDIF.

    READ TABLE lt_crmc_but_call_fu WITH KEY ztpkt = 'CRMOU' objap = 'BUPR' posnr = '1000000'
                                     xaktv = abap_true TRANSPORTING NO FIELDS.
    IF sy-subrc <> 0.
      "Function Module BUPA_OUTBOUND_BPR_FILL_CENTRAL is not registered
      CALL METHOD prepare_message
        EXPORTING
          iv_severity       = 1
          iv_message_number = 011
          iv_param1         = 'BUPA_OUTBOUND_BPR_FILL_CENTRAL'
        CHANGING
          ct_log            = lt_log.
    ENDIF.
    READ TABLE lt_crmc_but_call_fu WITH KEY ztpkt = 'MERGE' objap = 'BUPA' posnr = '1000000'
                                     xaktv = abap_true TRANSPORTING NO FIELDS.
    IF sy-subrc <> 0.
      "Function Module MERGE_BUPA_FINSERV is not registered
      CALL METHOD prepare_message
        EXPORTING
          iv_severity       = 1
          iv_message_number = 011
          iv_param1         = 'MERGE_BUPA_FINSERV'
        CHANGING
          ct_log            = lt_log.

    ENDIF.
    READ TABLE lt_crmc_but_call_fu WITH KEY ztpkt = 'MERGE' objap = 'BUPA' posnr = '2000000'
                                     xaktv = abap_true TRANSPORTING NO FIELDS.
    IF sy-subrc <> 0.
      "Function Module MERGE_BUPR_CENTRAL is not registered
      CALL METHOD prepare_message
        EXPORTING
          iv_severity       = 1
          iv_message_number = 011
          iv_param1         = 'MERGE_BUPR_CENTRAL'
        CHANGING
          ct_log            = lt_log.
    ENDIF.
    READ TABLE lt_crmc_but_call_fu WITH KEY ztpkt = 'MERGE' objap = 'BUPR' posnr = '1000000'
                                     xaktv = abap_true TRANSPORTING NO FIELDS.
    IF sy-subrc <> 0.
      "Function Module MERGE_BUPA_CENTRAL is not registered
      CALL METHOD prepare_message
        EXPORTING
          iv_severity       = 1
          iv_message_number = 011
          iv_param1         = 'MERGE_BUPA_CENTRAL'
        CHANGING
          ct_log            = lt_log.
    ENDIF.

*  -- Prepare output table
    LOOP AT lt_crmc_but_call_fu INTO ls_crmc_but_call_fu.
      ls_output-id1   =   ls_crmc_but_call_fu-ztpkt .
      ls_output-text1 = ls_crmc_but_call_fu-objap .
      ls_output-text2 = ls_crmc_but_call_fu-posnr .
      ls_output-text3 = ls_crmc_but_call_fu-fname .
      ls_output-text4 = ls_crmc_but_call_fu-xaktv .
      APPEND ls_output TO lt_output.
    ENDLOOP.

    et_output      = lt_output.
    et_log         = lt_log.

  ENDMETHOD.


  METHOD check_sync_direction.
    DATA: lt_output           TYPE tt_id_desc_op,
          lt_tbd001           TYPE tt_tbd001,
          lt_cvic_cust_to_bp1 TYPE tt_cvic_cust_to_bp1,
          lt_tbd002           TYPE tt_tbd002,
          lt_cvic_cust_to_bp2 TYPE tt_cvic_cust_to_bp2,
          lt_tbc001           TYPE tt_tbc001,
          lt_cvic_vend_to_bp1 TYPE tt_cvic_vend_to_bp1,
          lt_tbc002           TYPE tt_tbc002,
          lt_cvic_vend_to_bp2 TYPE tt_cvic_vend_to_bp2,
          lt_mdsc_ctrl_opt_a  TYPE tt_mdsc_ctrl_opt_a,
          lt_log              TYPE tt_log,
          ls_output           TYPE ty_id_desc_op,
          ls_mdsc_ctrl_opt_a  TYPE mdsc_ctrl_opt_a.

    CLEAR: et_output, et_log.

** Fetch required data
    CALL METHOD fill_required_data
      IMPORTING
        et_mdsc_ctrl_opt_a  = lt_mdsc_ctrl_opt_a
        et_cvic_cust_to_bp1 = lt_cvic_cust_to_bp1
        et_cvic_vend_to_bp1 = lt_cvic_vend_to_bp1
        et_tbd001           = lt_tbd001
        et_tbd002           = lt_tbd002
        et_cvic_cust_to_bp2 = lt_cvic_cust_to_bp2
        et_cvic_vend_to_bp2 = lt_cvic_vend_to_bp2
        et_tbc001           = lt_tbc001
        et_tbc002           = lt_tbc002.

    LOOP AT lt_mdsc_ctrl_opt_a INTO ls_mdsc_ctrl_opt_a.
*Customer
      IF ls_mdsc_ctrl_opt_a-sync_obj_source = 'BP' AND ls_mdsc_ctrl_opt_a-sync_obj_target = 'CUSTOMER'
                                            AND ls_mdsc_ctrl_opt_a-active_indicator = abap_true.

        READ TABLE lt_tbd002 INDEX 1 TRANSPORTING NO FIELDS.
        IF sy-subrc <> 0.
          "direction BP->Customer is active, but no roles are assigned
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 001
            CHANGING
              ct_log            = lt_log.

        ENDIF.

        READ TABLE lt_tbd001 INDEX 1 TRANSPORTING NO FIELDS.
        IF sy-subrc <> 0.
          "direction BP->Customer is active, but no numbers are assigned
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 002
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ELSEIF ls_mdsc_ctrl_opt_a-sync_obj_source = 'CUSTOMER' AND ls_mdsc_ctrl_opt_a-sync_obj_target = 'BP'
                                            AND ls_mdsc_ctrl_opt_a-active_indicator = abap_true.

        READ TABLE lt_cvic_cust_to_bp2 INDEX 1 TRANSPORTING NO FIELDS.
        IF sy-subrc <> 0.
          "direction Customer->BP is active but no roles are marked as customer roles
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 003
            CHANGING
              ct_log            = lt_log.
        ENDIF.

        READ TABLE lt_cvic_cust_to_bp1 INDEX 1 TRANSPORTING NO FIELDS.
        IF sy-subrc <> 0.
          "direction Customer->BP but no numbers are assigned
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 004
            CHANGING
              ct_log            = lt_log.
        ENDIF.
*Vendor
      ELSEIF ls_mdsc_ctrl_opt_a-sync_obj_source = 'BP' AND ls_mdsc_ctrl_opt_a-sync_obj_target = 'VENDOR'
                                            AND ls_mdsc_ctrl_opt_a-active_indicator = abap_true.
        READ TABLE lt_tbc002 INDEX 1 TRANSPORTING NO FIELDS.
        IF sy-subrc <> 0.
          "direction BP->Vendor is active but no roles are marked as vendor roles
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 005
            CHANGING
              ct_log            = lt_log.
        ENDIF.
        READ TABLE lt_tbc001 INDEX 1 TRANSPORTING NO FIELDS.
        IF sy-subrc <> 0.
          "direction BP->Vendor is active but no numbers are assigned
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 006
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ELSEIF ls_mdsc_ctrl_opt_a-sync_obj_source = 'VENDOR' AND ls_mdsc_ctrl_opt_a-sync_obj_target = 'BP'
                                            AND ls_mdsc_ctrl_opt_a-active_indicator = abap_true.
        READ TABLE lt_cvic_vend_to_bp2 INDEX 1 TRANSPORTING NO FIELDS.
        IF sy-subrc <> 0.
          "direction Vendor->BP is active but no roles are marked as vendor roles
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 007
            CHANGING
              ct_log            = lt_log.
        ENDIF.
        READ TABLE lt_cvic_vend_to_bp1 INDEX 1 TRANSPORTING NO FIELDS.
        IF sy-subrc <> 0.
          "direction Vendor->BP is active, but no numbers are assigned
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 008
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ENDIF.

* -- Prepapre output ALV table
      ls_output-id1 = ls_mdsc_ctrl_opt_a-sync_obj_source .
      ls_output-id2 = ls_mdsc_ctrl_opt_a-sync_obj_target .

      IF ls_mdsc_ctrl_opt_a-active_indicator = abap_true.
        ls_output-text1 = gv_icon_checked.
      ELSE.
        ls_output-text1 = gv_icon_incomplete.
      ENDIF.

      APPEND ls_output TO lt_output.
      CLEAR ls_output.
    ENDLOOP.

    et_output = lt_output.
    et_log = lt_log.
  ENDMETHOD.


  METHOD check_tax_categories.
    DATA: lt_output           TYPE tt_id_desc_op,
          lt_log              TYPE tt_log,
          lt_taxtype          TYPE STANDARD TABLE OF bptaxtype,
          lt_j_1atodc         TYPE TABLE OF j_1atodc,
          lt_dropdown_taxtype TYPE lvc_t_drop,
          ls_output           TYPE ty_id_desc_op,
          ls_dropdown_taxtype TYPE lvc_s_drop,
          ls_taxtype          TYPE  bptaxtype,
          ls_j_1atodc         TYPE j_1atodc.

    CLEAR: et_output, et_log, et_dropdown_values.

    " Fetch all the taxtypes which are deleted
    "  from customizing table tfktaxnumtype
    SELECT DISTINCT taxtype FROM dfkkbptaxnum INTO TABLE lt_taxtype
          WHERE taxtype NOT IN ( SELECT taxtype FROM tfktaxnumtype ).
                "#EC CI_NOFIELD "#EC CI_BUFFSUBQ
    IF sy-subrc EQ 0.
      DELETE lt_taxtype WHERE table_line IS INITIAL.
    ENDIF.

    LOOP AT lt_taxtype INTO ls_taxtype.
      ls_output-client = sy-mandt.
      ls_output-id1 = ls_taxtype.
      SEARCH ls_output-id1 FOR '*0'.
      IF sy-subrc EQ 0.
        ls_output-text1 = 'VAT_REGISTRATION_NUMBER_CHECK'.
      ELSE.
        ls_output-text1 = 'BUPA_TAX_NUMBER_CHECK'.
      ENDIF.
      ls_output-text2 = ''.

      APPEND ls_output TO lt_output.

    ENDLOOP.

    IF lt_output[] IS NOT INITIAL.
      "Prepare dropdown table for tax type
      ls_dropdown_taxtype-handle = '1'.
      ls_dropdown_taxtype-value = ''.
      APPEND ls_dropdown_taxtype TO lt_dropdown_taxtype.

      SELECT * FROM j_1atodc INTO TABLE lt_j_1atodc WHERE j_1atodc <> ' '.
      LOOP AT lt_j_1atodc INTO ls_j_1atodc.
        ls_dropdown_taxtype-handle = '1'.
        ls_dropdown_taxtype-value = ls_j_1atodc-j_1atodc.
        APPEND ls_dropdown_taxtype TO lt_dropdown_taxtype.
      ENDLOOP.

      "Tax category inconsistent
      CALL METHOD prepare_message
        EXPORTING
          iv_severity       = 1
          iv_message_number = 038
          iv_param1         = TEXT-020
        CHANGING
          ct_log            = lt_log.

    ELSE.
      "Tax category consistent
      CALL METHOD prepare_message
        EXPORTING
          iv_severity       = 3
          iv_message_number = 038
          iv_param1         = TEXT-021
        CHANGING
          ct_log            = lt_log.
    ENDIF.

    et_output          = lt_output.
    et_log             = lt_log.
    et_dropdown_values = lt_dropdown_taxtype.
  ENDMETHOD.


  METHOD check_vbp_acc_grp_to_bp_grp.

    DATA: lt_output           TYPE tt_id_desc_op,
          lt_log              TYPE tt_log,
          lt_ktokk            TYPE STANDARD TABLE OF ktokk,
          lt_retail_sites     TYPE cvis_werks_t,
          lt_tb001            TYPE tt_tb001,
          lt_tb002            TYPE tt_tb002,
          lt_t077k            TYPE tt_t077k,
          lt_t077y            TYPE tt_t077y,
          lt_cvic_vend_to_bp1 TYPE tt_cvic_vend_to_bp1,
          lt_dropdown         TYPE lvc_t_drop,
          ls_ktokk            TYPE ktokk,
          ls_tb001            TYPE tb001,
          ls_tb002            TYPE tb002,
          ls_t077y            TYPE t077y,
          ls_output           TYPE ty_id_desc_op,
          ls_dropdown         TYPE lvc_s_drop,
          lv_ktokk(100)       TYPE c,
          lv_bu_group(100)    TYPE c,
          lv_bp_grouping(60)  TYPE c.

    CLEAR: et_output, et_log,   et_dropdown_values.

*get required data
    CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
      IMPORTING
        et_tb001            = lt_tb001
        et_tb002            = lt_tb002
        et_t077y            = lt_t077y
        et_t077k            = lt_t077k
        et_cvic_vend_to_bp1 = lt_cvic_vend_to_bp1
        et_retail_sites     = lt_retail_sites.

    SELECT DISTINCT ktokk FROM lfa1 INTO TABLE lt_ktokk
        FOR ALL ENTRIES IN lt_retail_sites
       WHERE werks NE lt_retail_sites-table_line. "#EC CI_NOFIELD

    DELETE lt_ktokk WHERE table_line = space.

    LOOP AT lt_ktokk INTO ls_ktokk.
      lv_ktokk = ls_ktokk.
      READ TABLE lt_t077k TRANSPORTING NO FIELDS WITH KEY
                 ktokk = ls_ktokk.
      IF sy-subrc NE 0.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 062
            iv_param1         = lv_ktokk
          CHANGING
            ct_log            = lt_log.
      ENDIF.
      READ TABLE lt_cvic_vend_to_bp1 TRANSPORTING NO FIELDS WITH KEY
                 account_group = ls_ktokk.
      IF sy-subrc NE 0.
        "Missing  BP grouping for vendor account group
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 029
            iv_param1         = lv_ktokk
          CHANGING
            ct_log            = lt_log.

        ls_output-client = sy-mandt.
        ls_output-id1 = ls_ktokk.
        READ TABLE lt_t077y INTO ls_t077y WITH KEY spras = sy-langu
                                                   ktokk = ls_ktokk.
        IF ls_t077y-txt30 IS NOT INITIAL.
          ls_output-id1_desc = ls_t077y-txt30.
        ELSE.
          "Missing  BP grouping for vendor account group
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 2
              iv_message_number = 035
              iv_param1         = lv_ktokk
            CHANGING
              ct_log            = lt_log.
        ENDIF.

        APPEND ls_output TO lt_output.
        CLEAR ls_output.
      ENDIF.

    ENDLOOP.

    IF lt_output IS NOT INITIAL.
** fill drop down values
      CLEAR ls_dropdown.
      ls_dropdown-handle = '1'.
      ls_dropdown-value = ''.
      APPEND ls_dropdown TO lt_dropdown.

      LOOP AT lt_tb001 INTO ls_tb001.
        lv_bu_group = ls_tb001-bu_group.
        READ TABLE lt_tb002 INTO ls_tb002
                        WITH KEY spras = sy-langu
                                 bu_group = ls_tb001-bu_group.
        IF ls_tb002-txt40 IS INITIAL AND ls_tb002-txt15 IS INITIAL .
          "Description for BP grouping text does not exist
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 2
              iv_message_number = 033
              iv_param1         = lv_bu_group
            CHANGING
              ct_log            = lt_log.
        ENDIF.
        IF ls_tb002-txt40 IS NOT INITIAL.
          CONCATENATE ls_tb001-bu_group ls_tb002-txt40 INTO lv_bp_grouping  SEPARATED BY space.
        ELSE.
          CONCATENATE ls_tb001-bu_group ls_tb002-txt15 INTO lv_bp_grouping  SEPARATED BY space.
        ENDIF.
        ls_dropdown-handle = '1'.
        ls_dropdown-value = lv_bp_grouping.
        APPEND ls_dropdown TO lt_dropdown.
        CLEAR ls_dropdown.
      ENDLOOP.
    ENDIF.

    et_output          = lt_output.
    et_log             = lt_log.
    et_dropdown_values = lt_dropdown.

  ENDMETHOD.


  METHOD check_vbp_acc_grp_to_bp_role.

    DATA: lt_output           TYPE tt_id_desc_op,
          lt_log              TYPE tt_log,
          lt_ktokk            TYPE STANDARD TABLE OF ktokk,
          lt_retail_sites     TYPE cvis_werks_t,
          lt_tb003            TYPE tt_tb003,
          lt_tb003t           TYPE tt_tb003t,
          lt_t077y            TYPE tt_t077y,
          lt_t077k            TYPE tt_t077k,
          lt_tbc002           TYPE tt_tbc002,
          lt_cvic_vend_to_bp2 TYPE tt_cvic_vend_to_bp2,
          lt_dropdown         TYPE lvc_t_drop,
          ls_ktokk            TYPE ktokk,
          ls_tb003            TYPE tb003,
          ls_tb003t           TYPE tb003t,
          ls_t077y            TYPE t077y,
          ls_tbc002           TYPE tbc002,
          ls_output           TYPE ty_id_desc_op,
          ls_dropdown         TYPE lvc_s_drop,
          lv_acc_grp(100)     TYPE c,
          lv_role(100)        TYPE c,
          lv_bp_role(60)      TYPE c.

    CLEAR: et_output, et_log,   et_dropdown_values.

*get required data
    CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
      IMPORTING
        et_tb003            = lt_tb003
        et_tb003t           = lt_tb003t
        et_t077y            = lt_t077y
        et_t077k            = lt_t077k
        et_tbc002           = lt_tbc002
        et_cvic_vend_to_bp2 = lt_cvic_vend_to_bp2
        et_retail_sites     = lt_retail_sites.

    SELECT DISTINCT ktokk FROM lfa1 INTO TABLE lt_ktokk
        FOR ALL ENTRIES IN lt_retail_sites
       WHERE werks NE lt_retail_sites-table_line. "#EC CI_NOFIELD

    DELETE lt_ktokk WHERE table_line = space.

    LOOP AT lt_ktokk INTO ls_ktokk.
      lv_acc_grp = ls_ktokk.
      READ TABLE lt_t077k TRANSPORTING NO FIELDS WITH KEY
                 ktokk = ls_ktokk.
      IF sy-subrc NE 0.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 062
            iv_param1         = lv_acc_grp
          CHANGING
            ct_log            = lt_log.
      ENDIF.
      READ TABLE lt_cvic_vend_to_bp2 TRANSPORTING NO FIELDS WITH KEY
                 account_group = ls_ktokk.
      IF sy-subrc NE 0.
* Vendor account group exist in LFA1 table but role is missing
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 029
            iv_param1         = lv_acc_grp
          CHANGING
            ct_log            = lt_log.

** write data to output table
        ls_output-client = sy-mandt.
        ls_output-id1 = ls_ktokk.
        READ TABLE lt_t077y INTO ls_t077y WITH KEY spras = sy-langu
                                                   ktokk = ls_ktokk.
        IF ls_t077y-txt30 IS NOT INITIAL.
          ls_output-id1_desc = ls_t077y-txt30.
        ENDIF.

        APPEND ls_output TO lt_output.
        CLEAR ls_output.
      ENDIF.
    ENDLOOP.

    IF lt_output IS NOT INITIAL.
** fill drop down values
      CLEAR ls_dropdown.
      ls_dropdown-handle = '1'.
      ls_dropdown-value = ''.
      APPEND ls_dropdown TO lt_dropdown.

      LOOP AT lt_tbc002 INTO ls_tbc002 WHERE kred = abap_true.
        READ TABLE lt_tb003 INTO ls_tb003 WITH KEY rolecategory = ls_tbc002-rltyp.
        IF sy-subrc EQ 0.
          READ TABLE lt_tb003t INTO ls_tb003t WITH KEY spras = sy-langu
                                                       role = ls_tb003-role.
          IF ls_tb003t-rltxt IS INITIAL.
            lv_role = ls_tb003-role.
            "description for role does not exist.
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 2
                iv_message_number = 036
                iv_param1         = lv_role
              CHANGING
                ct_log            = lt_log.
          ENDIF.
          CONCATENATE ls_tb003-role ls_tb003t-rltxt INTO lv_bp_role  SEPARATED BY space.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = lv_bp_role.
          APPEND ls_dropdown TO lt_dropdown.
          CLEAR ls_dropdown.
        ENDIF.
      ENDLOOP.
    ENDIF.

    et_output          = lt_output.
    et_log             = lt_log.
    et_dropdown_values = lt_dropdown.

  ENDMETHOD.


  METHOD check_vendor_bp_grouping.

    DATA: lt_output           TYPE tt_id_desc_op,
          lt_log              TYPE tt_log,
          lt_mdsc_ctrl_opt_a  TYPE tt_mdsc_ctrl_opt_a,
          lt_tb001            TYPE tt_tb001,
          lt_tb002            TYPE tt_tb002,
          lt_nriv             TYPE tt_nriv,
          lt_t077k            TYPE tt_t077k,
          lt_t077y            TYPE tt_t077y,
          lt_cvic_vend_to_bp2 TYPE tt_cvic_vend_to_bp2,
          lt_cvic_vend_to_bp1 TYPE tt_cvic_vend_to_bp1,
          ls_cvic_vend_to_bp1 TYPE cvic_vend_to_bp1,
          ls_cvic_vend_to_bp2 TYPE cvic_vend_to_bp2,
          ls_tb001            TYPE tb001,
          ls_tb002            TYPE tb002,
          ls_nriv             TYPE nriv,
          ls_t077y            TYPE t077y,
          ls_t077k            TYPE t077k,
          ls_nr1              TYPE nriv,
          ls_nr2              TYPE nriv,
          lv_nrrng            TYPE char100,
          ls_output           TYPE ty_id_desc_op,
          lv_numkr            TYPE char100,
          lv_grouping         TYPE char100,
          lv_account_group    TYPE char100,
          lv_icon_left        TYPE char100.

    CLEAR: et_output, et_log.

    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name        = 'ICON_ARROW_LEFT'
        info        = text-030
        add_stdinf  = 'X'
      IMPORTING
        result = lv_icon_left.

    CALL METHOD fill_required_data
      IMPORTING
        et_mdsc_ctrl_opt_a  = lt_mdsc_ctrl_opt_a
        et_tb001            = lt_tb001
        et_tb002            = lt_tb002
        et_nriv             = lt_nriv
        et_t077k            = lt_t077k
        et_t077y            = lt_t077y
        et_cvic_vend_to_bp2 = lt_cvic_vend_to_bp2
        et_cvic_vend_to_bp1 = lt_cvic_vend_to_bp1.

    IF lt_cvic_vend_to_bp1 IS NOT INITIAL.
      READ TABLE lt_mdsc_ctrl_opt_a WITH KEY sync_obj_source = 'VENDOR'
                                       sync_obj_target = 'BP'
                                       active_indicator = abap_true TRANSPORTING NO FIELDS.
      IF sy-subrc <>  0.
        "numbers are assigned, but direction vendor- bp is not active
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 027
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDIF.

    LOOP AT lt_cvic_vend_to_bp1 INTO ls_cvic_vend_to_bp1.

      lv_grouping = ls_cvic_vend_to_bp1-grouping.
      lv_account_group = ls_cvic_vend_to_bp1-account_group.

      ls_output-id1 = ls_cvic_vend_to_bp1-grouping.
      ls_output-id2 = ls_cvic_vend_to_bp1-account_group.
      ls_output-text5 = ls_cvic_vend_to_bp1-same_number.

      READ TABLE lt_tb001 WITH KEY bu_group = ls_cvic_vend_to_bp1-grouping
                          INTO ls_tb001.
      IF sy-subrc = 0.
        ls_output-text1 = ls_tb001-nrrng.
        READ TABLE lt_tb002 WITH KEY bu_group = ls_cvic_vend_to_bp1-grouping
                          INTO ls_tb002 .
        IF sy-subrc = 0.
          ls_output-id1_desc = ls_tb002-txt15.
        ELSE.
          " Text is missing for assigned BP grouping
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 3
              iv_message_number = 033
              iv_param1         = lv_grouping
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ELSE.
        "Assigned BP grouping has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 034
            iv_param1         = TEXT-009
            iv_param2         = lv_grouping
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      READ TABLE lt_nriv WITH KEY object = 'BU_PARTNER'
                                  nrrangenr = ls_tb001-nrrng
                       INTO ls_nriv.
      IF sy-subrc = 0.
        ls_output-text2 = ls_nriv-externind.
      ELSE.
        "Number Range has been deleted assigned busines partner grouoing
        lv_nrrng = ls_tb001-nrrng.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 018
            iv_param1         = lv_nrrng
            iv_param2         = TEXT-011
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      READ TABLE lt_t077k WITH KEY ktokk = ls_cvic_vend_to_bp1-account_group
                          INTO ls_t077k.
      IF sy-subrc = 0.
        ls_output-text3 = ls_t077k-numkr.
        READ TABLE lt_t077y WITH KEY ktokk = ls_cvic_vend_to_bp1-account_group
                                   spras = sy-langu
                          INTO ls_t077y.
        IF sy-subrc = 0.
          ls_output-id2_desc = ls_t077y-txt30.
        ELSE.
          " Description is missing for assigned vendor account group
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 3
              iv_message_number = 035
              iv_param1         = lv_account_group
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ELSE.
        "Assigned Vendor account has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 017
            iv_param1         = TEXT-012
            iv_param2         = lv_account_group
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      READ TABLE lt_nriv WITH KEY object = 'KREDITOR'
                                  nrrangenr = ls_t077k-numkr
                        INTO ls_nriv.
      IF sy-subrc = 0.
        ls_output-text4 = ls_nriv-externind.
      ELSE.
        "Number Range has been deleted for assigned vendor account group
        lv_numkr = ls_t077k-numkr.
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 018
            iv_param1         = lv_numkr
          CHANGING
            ct_log            = lt_log.
      ENDIF.

*Check the number ranges
      IF ls_cvic_vend_to_bp1-same_number = abap_true.
        READ TABLE lt_nriv WITH KEY object = 'BU_PARTNER'
                                  nrrangenr = ls_tb001-nrrng INTO ls_nr1.
        READ TABLE lt_nriv WITH KEY object = 'KREDITOR'
                                  nrrangenr = ls_t077k-numkr INTO ls_nr2.
        IF ls_nr1-fromnumber <>  ls_nr2-fromnumber OR
             ls_nr1-tonumber <>  ls_nr2-tonumber.
          lv_nrrng = ls_tb001-nrrng.
          lv_numkr = ls_t077k-numkr.
          "Same Number flag is set, but Number Ranges don't match
          CALL METHOD prepare_message
            EXPORTING
              iv_severity       = 1
              iv_message_number = 023
              iv_param1         = lv_nrrng
              iv_param2         = lv_numkr
            CHANGING
              ct_log            = lt_log.
        ENDIF.
      ENDIF.

      ls_output-arrow = lv_icon_left.

      APPEND ls_output TO lt_output.
      CLEAR ls_output.
    ENDLOOP.

    LOOP AT lt_cvic_vend_to_bp2 INTO ls_cvic_vend_to_bp2.
      "check if BP grouping are missing for assigned BP roles
      READ TABLE lt_cvic_vend_to_bp1 WITH KEY account_group = ls_cvic_vend_to_bp2-account_group TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        lv_account_group = ls_cvic_vend_to_bp2-account_group.
        "A BP Role has been assigned to a Vendor Account Group, but BP Account Group is missing
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 029
            iv_param1         = lv_account_group
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDLOOP.

    SORT lt_log BY message.
    DELETE ADJACENT DUPLICATES FROM lt_log.

    et_output = lt_output.
    et_log = lt_log.

  ENDMETHOD.


  METHOD check_vendor_bp_roles.
    DATA: lt_output           TYPE tt_id_desc_op,
          lt_log              TYPE tt_log,
          lt_mdsc_ctrl_opt_a  TYPE tt_mdsc_ctrl_opt_a,
          lt_t077y            TYPE tt_t077y,
          lt_t077k            TYPE tt_t077k,
          lt_tb003t           TYPE tt_tb003t,
          lt_tb003            TYPE tt_tb003,
          lt_cvic_vend_to_bp1 TYPE tt_cvic_vend_to_bp1,
          lt_cvic_vend_to_bp2 TYPE tt_cvic_vend_to_bp2,
          ls_output           TYPE ty_id_desc_op,
          ls_cvic_vend_to_bp1 TYPE cvic_vend_to_bp1,
          ls_cvic_vend_to_bp2 TYPE cvic_vend_to_bp2,
          ls_t077y            TYPE t077y,
          ls_tb003t           TYPE tb003t,
          lv_account_group    TYPE char100,
          lv_role             TYPE char100,
          lv_icon_left        TYPE char100.

    CLEAR: et_output,et_log.

    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name        = 'ICON_ARROW_LEFT'
        info        = text-029
        add_stdinf  = 'X'
      IMPORTING
        result = lv_icon_left.

    CALL METHOD fill_required_data
      IMPORTING
        et_mdsc_ctrl_opt_a  = lt_mdsc_ctrl_opt_a
        et_t077y            = lt_t077y
        et_t077k            = lt_t077k
        et_tb003t           = lt_tb003t
        et_tb003            = lt_tb003
        et_cvic_vend_to_bp1 = lt_cvic_vend_to_bp1
        et_cvic_vend_to_bp2 = lt_cvic_vend_to_bp2.

    " Check vendor to BP direction is active
    IF lt_cvic_vend_to_bp2 IS NOT INITIAL.
      READ TABLE lt_mdsc_ctrl_opt_a WITH KEY sync_obj_source = 'VENDOR'
                                       sync_obj_target = 'BP'
                                       active_indicator = abap_true TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        "BP Roles are assigned to Vendor Account Groups, but direction vendor->bp is not active
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 2
            iv_message_number = 026
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDIF.


    LOOP AT lt_cvic_vend_to_bp2 INTO ls_cvic_vend_to_bp2.

      lv_account_group = ls_cvic_vend_to_bp2-account_group.
      lv_role          = ls_cvic_vend_to_bp2-role.

      ls_output-id1 = ls_cvic_vend_to_bp2-role.
      ls_output-id2 = ls_cvic_vend_to_bp2-account_group.

      READ TABLE lt_t077y INTO ls_t077y WITH KEY
                               ktokk = ls_cvic_vend_to_bp2-account_group
                               spras = sy-langu.
      IF sy-subrc = 0.
        ls_output-id2_desc = ls_t077y-txt30.
      ELSE.
        "Account group text doesnt exist
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 3
            iv_message_number = 035
            iv_param1         = lv_account_group
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      READ TABLE lt_tb003t INTO  ls_tb003t WITH KEY
                 spras = sy-langu
                 role = ls_cvic_vend_to_bp2-role.
      IF sy-subrc = 0.
        ls_output-id1_desc = ls_tb003t-rltxt.
      ELSE.
        "BP role text is missing
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 3
            iv_message_number = 036
            iv_param1         = lv_role
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      "Check if assigned BP role exist
      READ TABLE lt_tb003 WITH KEY role = ls_cvic_vend_to_bp2-role TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        "BP Role has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 016
            iv_param1         = TEXT-012
            iv_param2         = lv_role
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      "Check if assigned account group exists
      READ TABLE lt_t077k WITH KEY ktokk = ls_cvic_vend_to_bp2-account_group TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        "Vendor Account group has been deleted
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 017
            iv_param1         = TEXT-009
            iv_param2         = lv_account_group
          CHANGING
            ct_log            = lt_log.
      ENDIF.

      ls_output-arrow = lv_icon_left.
      APPEND ls_output TO lt_output.
    ENDLOOP.

    LOOP AT lt_cvic_vend_to_bp1 INTO ls_cvic_vend_to_bp1.
      READ TABLE lt_cvic_vend_to_bp2 WITH KEY account_group = ls_cvic_vend_to_bp1-account_group TRANSPORTING NO FIELDS.
      IF sy-subrc <>  0.
        lv_account_group = ls_cvic_vend_to_bp1-account_group.
        "A BP Account Group has been assigned to a Vendor Account Group, but BP Role is missing
        CALL METHOD prepare_message
          EXPORTING
            iv_severity       = 1
            iv_message_number = 030
            iv_param1         = lv_account_group
          CHANGING
            ct_log            = lt_log.
      ENDIF.
    ENDLOOP.

    SORT lt_log BY message.
    DELETE ADJACENT DUPLICATES FROM lt_log.

    et_output = lt_output.
    et_log = lt_log.

  ENDMETHOD.


  METHOD class_constructor.
    set_scenario_maint_det( ).
  ENDMETHOD.


  METHOD convert_output_to_input.
    DATA:
     ls_ddic_output_field_mapping TYPE ty_ddic_output_field_mapping.

    FIELD-SYMBOLS:
      <lfs_input_data_s>  TYPE any,
      <lfs_output_data_s> TYPE any,
      <lfs_input_comp>    TYPE any,
      <lfs_input_output>  TYPE any.
    "This method converts data from ALV fileds to view fields which
    " is used later to save records in database
    LOOP AT it_data ASSIGNING <lfs_input_data_s>.
      APPEND INITIAL LINE TO et_ouput_data ASSIGNING <lfs_output_data_s>.
      CHECK <lfs_output_data_s> IS ASSIGNED.
      LOOP AT it_ddic_output_map INTO ls_ddic_output_field_mapping.
        ASSIGN COMPONENT ls_ddic_output_field_mapping-output_field_name OF STRUCTURE <lfs_input_data_s> TO <lfs_input_comp>.
        ASSIGN COMPONENT ls_ddic_output_field_mapping-ddic_field_name OF STRUCTURE <lfs_output_data_s> TO <lfs_input_output>.
        IF <lfs_input_comp> IS ASSIGNED AND <lfs_input_output> IS ASSIGNED.
          <lfs_input_output> = <lfs_input_comp>.
        ENDIF.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.


  METHOD fill_required_data.
    DATA:
      lr_cvi_ka_bp_customer TYPE REF TO cvi_ka_bp_customer,
      lr_cvi_ka_bp_vendor   TYPE REF TO cvi_ka_bp_vendor.

    "Create reference of classes
    lr_cvi_ka_bp_customer = cvi_ka_bp_customer=>get_instance( ).
    lr_cvi_ka_bp_vendor = cvi_ka_bp_vendor=>get_instance( ).

    "Fill data from tables
    IF et_cvic_cust_to_bp1 IS SUPPLIED.
      CALL METHOD lr_cvi_ka_bp_customer->get_cvic_cust_to_bp1
        RECEIVING
          r_cvic_cust_to_bp1 = et_cvic_cust_to_bp1.
    ENDIF.

    IF et_cvic_vend_to_bp1 IS SUPPLIED.
      CALL METHOD lr_cvi_ka_bp_vendor->get_cvic_vend_to_bp1
        RECEIVING
          r_cvic_vend_to_bp1 = et_cvic_vend_to_bp1.
    ENDIF.

    IF et_tbd002 IS SUPPLIED.
      SELECT * FROM tbd002 INTO CORRESPONDING FIELDS OF TABLE et_tbd002.
    ENDIF.

    IF et_tbd001 IS SUPPLIED.
      CALL METHOD lr_cvi_ka_bp_customer->get_tbd001
        RECEIVING
          r_tbd001 = et_tbd001.
    ENDIF.

    IF et_cvic_cust_to_bp2 IS SUPPLIED.
      CALL METHOD lr_cvi_ka_bp_customer->get_cvic_cust_to_bp2
        RECEIVING
          r_cvic_cust_to_bp2 = et_cvic_cust_to_bp2.
    ENDIF.

    IF et_cvic_vend_to_bp2 IS SUPPLIED.
      CALL METHOD lr_cvi_ka_bp_vendor->get_cvic_vend_to_bp2
        RECEIVING
          r_cvic_vend_to_bp2 = et_cvic_vend_to_bp2.
    ENDIF.

    IF et_tbc001 IS SUPPLIED.
      CALL METHOD lr_cvi_ka_bp_vendor->get_tbc001
        RECEIVING
          r_tbc001 = et_tbc001.
    ENDIF.

    IF et_tbc002 IS SUPPLIED.
      SELECT * FROM tbc002 INTO CORRESPONDING FIELDS OF TABLE et_tbc002.
    ENDIF.

*-- Fetch synchrinizaion data from MDSC_CTRL_OPT_A table
    IF et_mdsc_ctrl_opt_a IS SUPPLIED.
      SELECT * FROM mdsc_ctrl_opt_a INTO TABLE et_mdsc_ctrl_opt_a WHERE
                  ( sync_obj_source = 'BP'        AND sync_obj_target = 'CUSTOMER' ) OR
                  ( sync_obj_source = 'BP'        AND sync_obj_target = 'VENDOR' )   OR
                  ( sync_obj_source = 'CUSTOMER'  AND sync_obj_target = 'BP' )       OR
                  ( sync_obj_source = 'VENDOR'    AND sync_obj_target = 'BP' ).
    ENDIF.

    IF et_tb002 IS SUPPLIED.
      SELECT * FROM tb002 INTO TABLE et_tb002 WHERE spras = sy-langu.
    ENDIF.
    IF et_nriv IS SUPPLIED.
      SELECT * FROM nriv INTO CORRESPONDING FIELDS OF TABLE et_nriv WHERE object = 'DEBITOR'  OR
                                                                          object = 'KREDITOR' OR
                                                                          object = 'ADRNR'    OR
                                                                          object = 'BU_PARTNER'.
    ENDIF.
    IF et_tb001 IS SUPPLIED.
      CALL FUNCTION 'BUP_TB001_SELECT_ALL'
        EXPORTING
          i_mandt   = sy-mandt
        TABLES
          t_tb001   = et_tb001
        EXCEPTIONS
          not_found = 1
          OTHERS    = 2.
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
    ENDIF.

    IF et_t077d IS SUPPLIED.
      CALL METHOD lr_cvi_ka_bp_customer->get_t077d
        RECEIVING
          r_t077d = et_t077d.
    ENDIF.

    IF et_t077x IS SUPPLIED.
      SELECT * FROM t077x INTO TABLE et_t077x WHERE spras = sy-langu.
    ENDIF.

    IF et_t077k IS SUPPLIED.
      CALL METHOD lr_cvi_ka_bp_vendor->get_t077k
        RECEIVING
          r_t077k = et_t077k.
    ENDIF.

    IF et_t077y IS SUPPLIED.
      SELECT * FROM t077y INTO TABLE et_t077y WHERE spras = sy-langu.
    ENDIF.

    IF et_tb003 IS SUPPLIED.
      SELECT * FROM tb003 INTO TABLE et_tb003.
      CALL FUNCTION 'BUP_TB003_SELECT_ALL'
        EXPORTING
          i_client  = sy-mandt
          i_xmemory = 'X'
        TABLES
          t_tb003   = et_tb003
        EXCEPTIONS
          not_found = 1
          OTHERS    = 2.
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
    ENDIF.

    IF et_tb003t IS SUPPLIED.
      SELECT * FROM tb003t INTO CORRESPONDING FIELDS OF TABLE et_tb003t WHERE spras = sy-langu.
    ENDIF.

    IF et_tb003a IS SUPPLIED.
      CALL FUNCTION 'BUP_TB003A_SELECT_ALL'
        EXPORTING
          i_client  = sy-mandt
          i_xmemory = 'X'
        TABLES
          t_tb003a  = et_tb003a
        EXCEPTIONS
          not_found = 1
          OTHERS    = 2.
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
      IF et_tb003b IS SUPPLIED AND et_tb003a IS NOT INITIAL.
        SELECT * FROM tb003b INTO TABLE et_tb003b FOR ALL ENTRIES IN
                 et_tb003a WHERE spras = sy-langu  AND
                                 rolecategory = et_tb003a-rolecategory.
      ENDIF.
    ENDIF.

    IF et_retail_sites IS SUPPLIED.
      SELECT werks FROM t001w
               INTO TABLE et_retail_sites
               WHERE vlfkz NE space.
    ENDIF.

    IF et_tsab IS SUPPLIED.
      SELECT * FROM tsab INTO TABLE et_tsab.
      IF et_tsab IS NOT INITIAL AND et_tsabt  IS SUPPLIED.
        SELECT * FROM tsabt INTO TABLE et_tsabt FOR ALL ENTRIES IN et_tsab
                 WHERE  spras = sy-langu AND abtnr = et_tsab-abtnr.
      ENDIF.
    ENDIF.

    IF et_tpfk IS SUPPLIED.
      SELECT * FROM tpfk INTO TABLE et_tpfk.
      IF et_tpfk IS NOT INITIAL AND et_tpfkt IS SUPPLIED.
        SELECT * FROM tpfkt INTO TABLE et_tpfkt FOR ALL ENTRIES IN et_tpfk
                 WHERE  spras = sy-langu AND pafkt = et_tpfk-pafkt.
      ENDIF.
    ENDIF.
    IF et_tvpv IS SUPPLIED.
      SELECT * FROM tvpv INTO TABLE   et_tvpv.
      IF et_tvpv IS NOT INITIAL AND et_tvpvt IS SUPPLIED.
        SELECT * FROM tvpvt INTO TABLE et_tvpvt FOR ALL ENTRIES IN et_tvpv
          WHERE  spras = sy-langu AND parvo = et_tvpv-parvo.
      ENDIF.
    ENDIF.
    IF et_tvip IS SUPPLIED.
      SELECT * FROM tvip INTO TABLE et_tvip.
      IF et_tvip IS NOT INITIAL  AND et_tvipt IS SUPPLIED.
        SELECT * FROM tvipt INTO TABLE et_tvipt FOR ALL ENTRIES IN et_tvip
          WHERE  spras = sy-langu AND pavip = et_tvip-pavip .
      ENDIF.
    ENDIF.
    IF et_t502t IS SUPPLIED.
      SELECT * FROM t502t INTO TABLE  et_t502t
        WHERE  sprsl = sy-langu.
    ENDIF.

    IF et_tvgf  IS SUPPLIED.
      SELECT * FROM tvgf INTO TABLE et_tvgf.
      IF et_tvgf IS NOT INITIAL AND et_tvgft IS SUPPLIED.
        SELECT * FROM tvgft INTO TABLE et_tvgft FOR ALL ENTRIES IN et_tvgf
          WHERE  spras = sy-langu AND gform = et_tvgf-gform.
      ENDIF.
    ENDIF.
    IF et_tvcin IS SUPPLIED.
      SELECT * FROM tvcin INTO TABLE et_tvcin. "#EC CI_GENBUFF
      IF et_tvcin IS NOT INITIAL AND et_tvcint IS SUPPLIED.
        SELECT * FROM tvcint INTO TABLE  et_tvcint FOR ALL ENTRIES IN et_tvcin
          WHERE  spras = sy-langu AND ccins = et_tvcin-ccins.
      ENDIF.
    ENDIF.

    IF et_tb910 IS SUPPLIED.
      SELECT * FROM tb910 INTO TABLE et_tb910." WHERE paauth IS NOT NULL.
      IF sy-subrc = 0.
        DELETE et_tb910 WHERE abtnr IS INITIAL.
        IF et_tb910 IS NOT INITIAL AND et_tb911 IS SUPPLIED.
          SELECT * FROM tb911 INTO TABLE et_tb911 FOR ALL ENTRIES IN et_tb910
            WHERE spras = sy-langu AND abtnr = et_tb910-abtnr.
          IF sy-subrc EQ 0.
            DELETE et_tb911 WHERE abtnr IS INITIAL.
          ENDIF.

        ENDIF.
      ENDIF.
    ENDIF.

    IF et_tb912 IS SUPPLIED.
      SELECT * FROM tb912 INTO TABLE et_tb912.
      IF sy-subrc = 0.
        DELETE et_tb912 WHERE pafkt IS INITIAL.
        IF et_tb912 IS NOT INITIAL AND et_tb913 IS SUPPLIED.
          SELECT * FROM tb913 INTO TABLE et_tb913 FOR ALL ENTRIES IN et_tb912
             WHERE spras = sy-langu AND pafkt = et_tb912-pafkt.
          IF sy-subrc EQ 0.
            DELETE et_tb913 WHERE pafkt IS INITIAL.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.

    IF et_tb914 IS SUPPLIED.
      SELECT * FROM tb914 INTO TABLE et_tb914.
      IF sy-subrc = 0.
        DELETE et_tb914 WHERE paauth IS INITIAL.
        IF et_tb914 IS NOT INITIAL AND et_tb915 IS SUPPLIED.
          SELECT * FROM tb915 INTO TABLE et_tb915 FOR ALL ENTRIES IN et_tb914
             WHERE spras = sy-langu AND paauth = et_tb914-paauth.
          IF sy-subrc EQ 0.
            DELETE et_tb915 WHERE paauth IS INITIAL.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.


    IF et_tb916 IS SUPPLIED.
      SELECT * FROM tb916 INTO TABLE et_tb916." WHERE pavip IS NOT NULL.
      IF sy-subrc = 0.
        DELETE et_tb916 WHERE pavip IS INITIAL.
        IF et_tb916 IS NOT INITIAL AND et_tb917 IS SUPPLIED.
          SELECT * FROM tb917 INTO TABLE et_tb917 FOR ALL ENTRIES IN et_tb916
            WHERE spras = sy-langu AND pavip = et_tb916-pavip.
          IF sy-subrc EQ 0.
            DELETE et_tb917 WHERE pavip IS INITIAL.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.


    IF et_tb027 IS SUPPLIED.
      SELECT * FROM tb027 INTO TABLE et_tb027." WHERE marst IS NOT NULL.
      IF sy-subrc = 0.
        DELETE et_tb027 WHERE marst IS INITIAL.
        IF et_tb027 IS NOT INITIAL AND et_tb027t IS SUPPLIED.
          SELECT * FROM tb027t INTO TABLE et_tb027t FOR ALL ENTRIES IN et_tb027
            WHERE spras = sy-langu AND marst = et_tb027-marst.
          IF sy-subrc EQ 0.
            DELETE et_tb027t WHERE marst IS INITIAL.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.


    IF et_cvic_cp1_link IS SUPPLIED.
      SELECT * FROM cvic_cp1_link INTO TABLE et_cvic_cp1_link.
    ENDIF.

    IF et_cvic_cp2_link IS SUPPLIED.
      SELECT * FROM cvic_cp2_link INTO TABLE et_cvic_cp2_link.
    ENDIF.

    IF et_cvic_cp3_link IS SUPPLIED.
      SELECT * FROM cvic_cp3_link INTO TABLE et_cvic_cp3_link.
    ENDIF.

    IF et_cvic_cp4_link IS SUPPLIED.
      SELECT * FROM cvic_cp4_link INTO TABLE et_cvic_cp4_link.
    ENDIF.

    IF et_cvic_marst_link IS SUPPLIED.
      SELECT * FROM cvic_marst_link INTO TABLE et_cvic_marst_link.
    ENDIF.

    IF et_cvic_legform_lnk IS SUPPLIED.
      SELECT * FROM cvic_legform_lnk INTO TABLE et_cvic_legform_lnk.
    ENDIF.

    IF et_cvic_ccid_link IS SUPPLIED.
      SELECT * FROM cvic_ccid_link INTO TABLE et_cvic_ccid_link.
    ENDIF.



    IF et_tb019 IS SUPPLIED.
      SELECT * FROM tb019 INTO TABLE et_tb019.
      IF sy-subrc EQ 0.
        DELETE et_tb019 WHERE legal_enty IS INITIAL.
        IF et_tb019 IS NOT INITIAL AND et_tb020 IS SUPPLIED.
          SELECT * FROM tb020 INTO TABLE et_tb020 FOR ALL ENTRIES IN et_tb019
             WHERE spras = sy-langu AND legal_enty = et_tb019-legal_enty.
        ENDIF.
      ENDIF.
    ENDIF.

    IF et_tb033 IS SUPPLIED.
      SELECT * FROM tb033 INTO TABLE et_tb033.
      IF sy-subrc EQ 0.
        DELETE et_tb033 WHERE ccins IS INITIAL.
        IF et_tb033 IS NOT INITIAL AND et_tb033t IS SUPPLIED.
          SELECT * FROM tb033t INTO TABLE et_tb033t FOR ALL ENTRIES IN et_tb033
                 WHERE spras = sy-langu AND ccins = et_tb033-ccins.
        ENDIF.
      ENDIF.
    ENDIF.

    IF et_tb038 IS SUPPLIED.
      SELECT * FROM tb038 INTO TABLE et_tb038.
      IF sy-subrc EQ 0.
        DELETE et_tb038 WHERE istype IS INITIAL.
        IF et_tb038 IS NOT INITIAL AND et_tb038t IS SUPPLIED.
          SELECT * FROM tb038t INTO TABLE et_tb038t FOR ALL ENTRIES IN et_tb038
            WHERE langu = sy-langu AND istype = et_tb038-istype.
        ENDIF.
      ENDIF.
    ENDIF.

    IF et_tp038m1 IS SUPPLIED.
      SELECT * FROM tp038m1 INTO TABLE et_tp038m1.
    ENDIF.
    IF et_tp038m2 IS SUPPLIED.
      SELECT * FROM tp038m2 INTO TABLE et_tp038m2.
    ENDIF.

    IF et_t016    IS SUPPLIED.
      SELECT * FROM t016 INTO TABLE et_t016.
      DELETE et_t016 WHERE brsch IS INITIAL.
      IF et_t016 IS NOT INITIAL AND et_t016t IS SUPPLIED.
        SELECT * FROM t016t INTO TABLE et_t016t FOR ALL ENTRIES IN et_t016
          WHERE spras = sy-langu AND brsch = et_t016-brsch.
      ENDIF.
    ENDIF.

    IF et_tb038a  IS SUPPLIED.
      SELECT * FROM tb038a INTO TABLE et_tb038a.
      IF et_tb038a IS NOT INITIAL AND et_tb038b IS SUPPLIED.
        SELECT * FROM tb038b INTO TABLE et_tb038b FOR ALL ENTRIES IN et_tb038a
          WHERE spras = sy-langu AND
                istype = et_tb038a-istype  AND
                ind_sector = et_tb038a-ind_sector.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD get_bp_to_contact_person.
    DATA: ls_output           TYPE ty_id_desc_op,
          lt_dropdown         TYPE lvc_t_drop,
          ls_dropdown         TYPE lvc_s_drop,
          lv_desc(40)         TYPE c,
          lv_message(100)     TYPE c,
          "Department
          lt_tb910            TYPE  tt_tb910,
          ls_tb910            TYPE  tb910,
          lt_tb911            TYPE  tt_tb911,
          ls_tb911            TYPE  tb911,
          lt_tsab             TYPE tt_tsab,
          lt_tsabt            TYPE tt_tsabt,
          ls_tsab             TYPE tsab,
          ls_tsabt            TYPE tsabt,
          lt_cvic_cp1_link    TYPE TABLE OF cvic_cp1_link,
          "Function
          lt_tpfk             TYPE tt_tpfk,
          lt_tpfkt            TYPE tt_tpfkt,
          lt_tb912            TYPE tt_tb912,
          lt_tb913            TYPE tt_tb913,
          ls_tpfk             TYPE tpfk,
          ls_tpfkt            TYPE tpfkt,
          ls_tb912            TYPE tb912,
          ls_tb913            TYPE tb913,
          lt_cvic_cp2_link    TYPE TABLE OF cvic_cp2_link,
          "Authority
          lt_tvpv             TYPE tt_tvpv,
          lt_tvpvt            TYPE tt_tvpvt,
          lt_tb914            TYPE tt_tb914,
          lt_tb915            TYPE tt_tb915,
          lt_cvic_cp3_link    TYPE TABLE OF cvic_cp3_link,
          ls_tvpv             TYPE tvpv,
          ls_tvpvt            TYPE tvpvt,
          ls_tb914            TYPE tb914,
          ls_tb915            TYPE tb915,
          "VIP Indicator
          lt_tvip             TYPE tt_tvip,
          lt_tvipt            TYPE tt_tvipt,
          lt_tb916            TYPE tt_tb916,
          lt_tb917            TYPE tt_tb917,
          ls_tvip             TYPE tvip,
          ls_tvipt            TYPE tvipt,
          ls_tb916            TYPE tb916,
          ls_tb917            TYPE tb917,
          lt_cvic_cp4_link    TYPE TABLE OF cvic_cp4_link,
          "Martial Status
          lt_t502t            TYPE tt_t502t,
          lt_tb027            TYPE tt_tb027,
          lt_tb027t           TYPE tt_tb027t,
          ls_t502t            TYPE t502t,
          ls_tb027            TYPE tb027,
          ls_tb027t           TYPE tb027t,
          lt_cvic_marst_link  TYPE TABLE OF cvic_marst_link,
          "legal
          lt_tvgf             TYPE tt_tvgf,
          lt_tvgft            TYPE tt_tvgft,
          lt_tb019            TYPE tt_tb019,
          lt_tb020            TYPE tt_tb020,
          lt_cvic_legform_lnk TYPE tt_cvic_legform_lnk,
          ls_tb019            TYPE tb019,
          ls_tb020            TYPE tb020,
          ls_tvgf             TYPE tvgf,
          ls_tvgft            TYPE tvgft,
          "Payment Card
          lt_tvcin            TYPE tt_tvcin,
          lt_tvcint           TYPE tt_tvcint,
          lt_cvic_ccid_link   TYPE tt_cvic_ccid_link,
          lt_tb033            TYPE tt_tb033,
          lt_tb033t           TYPE tt_tb033t,
          ls_tvcin            TYPE tvcin,
          ls_tvcint           TYPE tvcint,
          ls_tb033            TYPE tb033,
          ls_tb033t           TYPE tb033t.

    CLEAR: et_output, et_log, et_dropdown_values.

    CASE iv_scenario.
      WHEN gc_bpc_dept. " Department
        CALL METHOD fill_required_data
          IMPORTING
            et_tsab          = lt_tsab
            et_tsabt         = lt_tsabt
            et_tb910         = lt_tb910
            et_tb911         = lt_tb911
            et_cvic_cp1_link = lt_cvic_cp1_link.

        LOOP AT lt_tb910 INTO ls_tb910.
          READ TABLE lt_cvic_cp1_link TRANSPORTING NO FIELDS
            WITH KEY gp_abtnr = ls_tb910-abtnr.
          IF sy-subrc NE 0.
            lv_message = ls_tb910-abtnr.
            "CP Link is missing for BP department
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 051
              CHANGING
                ct_log            = et_log.

            ls_output-client = sy-mandt.
            ls_output-id1 = ls_tb910-abtnr.
            READ TABLE lt_tb911 INTO ls_tb911 WITH KEY spras = sy-langu
                                     abtnr = ls_tb910-abtnr.
            IF sy-subrc EQ 0 AND ls_tb911-bez20 IS NOT INITIAL.
              ls_output-id1_desc = ls_tb911-bez20.
            ELSE.
              "Department description missing
              CALL METHOD prepare_message
                EXPORTING
                  iv_severity       = 2
                  iv_message_number = 046
                  iv_param1         = lv_message
                CHANGING
                  ct_log            = et_log.
            ENDIF.
            APPEND ls_output TO et_output.
          ENDIF.
        ENDLOOP.
        IF et_output IS NOT INITIAL.
** fill drop down values
          CLEAR ls_dropdown.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = ''.
          APPEND ls_dropdown TO lt_dropdown.

          LOOP AT lt_tsab INTO ls_tsab.
            READ TABLE lt_cvic_cp1_link TRANSPORTING NO FIELDS
                       WITH KEY abtnr = ls_tsab-abtnr.
            IF sy-subrc EQ 0.
              CONTINUE. " Skip dropdown help if entry already used as key field
            ENDIF.

            READ TABLE lt_tsabt INTO ls_tsabt WITH KEY spras = sy-langu
                                                       abtnr = ls_tsab-abtnr.
            IF sy-subrc EQ 0.
              CONCATENATE ls_tsab-abtnr ls_tsabt-vtext INTO lv_desc SEPARATED BY space.
              ls_dropdown-handle = '1'.
              ls_dropdown-value = lv_desc.
              APPEND ls_dropdown TO lt_dropdown.
            ENDIF.
          ENDLOOP.
        ENDIF.

      WHEN gc_bpc_func. "department functions
        CALL METHOD fill_required_data
          IMPORTING
            et_tpfk          = lt_tpfk
            et_tpfkt         = lt_tpfkt
            et_tb912         = lt_tb912
            et_tb913         = lt_tb913
            et_cvic_cp2_link = lt_cvic_cp2_link.

        LOOP AT lt_tb912 INTO ls_tb912.
          READ TABLE lt_cvic_cp2_link TRANSPORTING NO FIELDS
            WITH KEY gp_pafkt = ls_tb912-pafkt.
          IF sy-subrc NE 0.
            lv_message = ls_tb912-pafkt.
            "CP Link is missing for BP department
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 052
              CHANGING
                ct_log            = et_log.

            ls_output-client = sy-mandt.
            ls_output-id1 = ls_tb912-pafkt.
            READ TABLE lt_tb913 INTO ls_tb913 WITH KEY
                                     spras = sy-langu
                                     pafkt = ls_tb912-pafkt.
            IF sy-subrc EQ 0 AND ls_tb913-bez30 IS NOT INITIAL.
              ls_output-id1_desc = ls_tb913-bez30.
            ELSE.
              "Funtion description missing
              CALL METHOD prepare_message
                EXPORTING
                  iv_severity       = 2
                  iv_message_number = 047
                  iv_param1         = lv_message
                CHANGING
                  ct_log            = et_log.
            ENDIF.
            APPEND ls_output TO et_output.
          ENDIF.
        ENDLOOP.
        IF et_output IS NOT INITIAL.

** fill drop down values
          CLEAR ls_dropdown.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = ''.
          APPEND ls_dropdown TO lt_dropdown.

          LOOP AT lt_tpfk INTO ls_tpfk.
            READ TABLE lt_cvic_cp2_link TRANSPORTING NO FIELDS
                       WITH KEY pafkt = ls_tpfk-pafkt.
            IF sy-subrc EQ 0.
              CONTINUE. " Skip dropdown help if entry already used as key field
            ENDIF.

            READ TABLE lt_tpfkt INTO ls_tpfkt WITH KEY spras = sy-langu
                                                       pafkt = ls_tpfk-pafkt.
            IF sy-subrc EQ 0.
              CONCATENATE ls_tpfk-pafkt ls_tpfkt-vtext INTO lv_desc SEPARATED BY space.
              ls_dropdown-handle = '1'.
              ls_dropdown-value = lv_desc.
              APPEND ls_dropdown TO lt_dropdown.
            ENDIF.
          ENDLOOP.
        ENDIF.

      WHEN gc_bpc_auth. "Authority
        CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
          IMPORTING
            et_tvpv          = lt_tvpv
            et_tvpvt         = lt_tvpvt
            et_tb914         = lt_tb914
            et_tb915         = lt_tb915
            et_cvic_cp3_link = lt_cvic_cp3_link.

        LOOP AT lt_tb914 INTO ls_tb914.
          READ TABLE lt_cvic_cp3_link TRANSPORTING NO FIELDS
            WITH KEY paauth = ls_tb914-paauth.
          IF sy-subrc NE 0.
            lv_message = ls_tb914-paauth.
            "Link is missing for Authority
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 053
              CHANGING
                ct_log            = et_log.

            ls_output-client = sy-mandt.
            ls_output-id1 = ls_tb914-paauth.
            READ TABLE lt_tb915 INTO ls_tb915 WITH KEY
                                     spras = sy-langu
                                     paauth = ls_tb914-paauth.
            IF sy-subrc EQ 0 AND ls_tb915-bez20 IS NOT INITIAL.
              ls_output-id1_desc = ls_tb915-bez20.
            ELSE.
              "Authority description missing
              CALL METHOD prepare_message
                EXPORTING
                  iv_severity       = 3
                  iv_message_number = 048
                  iv_param1         = lv_message
                CHANGING
                  ct_log            = et_log.
            ENDIF.
            APPEND ls_output TO et_output.
          ENDIF.
        ENDLOOP.

        IF et_output IS NOT INITIAL.

          CLEAR ls_dropdown.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = ''.
          APPEND ls_dropdown TO lt_dropdown.

          LOOP AT lt_tvpv INTO ls_tvpv.
            READ TABLE lt_cvic_cp3_link TRANSPORTING NO FIELDS
                       WITH KEY parvo = ls_tvpv-parvo.
            IF sy-subrc EQ 0.
              CONTINUE. " Skip dropdown help if entry already used as key field
            ENDIF.

            READ TABLE lt_tvpvt INTO ls_tvpvt WITH KEY spras = sy-langu
                                                       parvo = ls_tvpv-parvo.
            IF sy-subrc EQ 0.
              CONCATENATE ls_tvpv-parvo ls_tvpvt-vtext INTO lv_desc SEPARATED BY space.
              ls_dropdown-handle = '1'.
              ls_dropdown-value = lv_desc.
              APPEND ls_dropdown TO lt_dropdown.
            ENDIF.
          ENDLOOP.
        ENDIF.

      WHEN gc_bpc_vip. " VIP
*get required data
        CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
          IMPORTING
            et_tvip          = lt_tvip
            et_tvipt         = lt_tvipt
            et_tb916         = lt_tb916
            et_tb917         = lt_tb917
            et_cvic_cp4_link = lt_cvic_cp4_link.

        LOOP AT lt_tb916 INTO ls_tb916.
          READ TABLE lt_cvic_cp4_link TRANSPORTING NO FIELDS
            WITH KEY gp_pavip = ls_tb916-pavip.
          IF sy-subrc NE 0.
            lv_message = ls_tb916-pavip.
            "Link is missing for VIP indicator
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 054
              CHANGING
                ct_log            = et_log.

            ls_output-client = sy-mandt.
            ls_output-id1 = ls_tb916-pavip.
            READ TABLE lt_tb917 INTO ls_tb917 WITH KEY
                                     spras = sy-langu
                                     pavip = ls_tb916-pavip.
            IF sy-subrc EQ 0 AND ls_tb917-bez20 IS NOT INITIAL.
              ls_output-id1_desc = ls_tb917-bez20.
            ELSE.
              "VIP indicator description missing
              CALL METHOD prepare_message
                EXPORTING
                  iv_severity       = 3
                  iv_message_number = 049
                  iv_param1         = lv_message
                CHANGING
                  ct_log            = et_log.
            ENDIF.
            APPEND ls_output TO et_output.
          ENDIF.
        ENDLOOP.

        IF et_output IS NOT INITIAL.
          CLEAR ls_dropdown.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = ''.
          APPEND ls_dropdown TO lt_dropdown.

          LOOP AT lt_tvip INTO ls_tvip.
            READ TABLE lt_cvic_cp4_link TRANSPORTING NO FIELDS
                       WITH KEY pavip = ls_tvip-pavip.
            IF sy-subrc EQ 0.
              CONTINUE. " Skip dropdown help if entry already used as key field
            ENDIF.

            READ TABLE lt_tvipt INTO ls_tvipt WITH KEY spras = sy-langu
                                                       pavip = ls_tvip-pavip.
            IF sy-subrc EQ 0.
              CONCATENATE ls_tvip-pavip ls_tvipt-vtext INTO lv_desc SEPARATED BY space.
              ls_dropdown-handle = '1'.
              ls_dropdown-value = lv_desc.
              APPEND ls_dropdown TO lt_dropdown.
            ENDIF.
          ENDLOOP.
        ENDIF.

      WHEN gc_bpc_marital. " Marital Status

*get required data
        CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
          IMPORTING
            et_t502t           = lt_t502t
            et_tb027           = lt_tb027
            et_tb027t          = lt_tb027t
            et_cvic_marst_link = lt_cvic_marst_link.

        LOOP AT lt_tb027 INTO ls_tb027.
          READ TABLE lt_cvic_marst_link TRANSPORTING NO FIELDS
            WITH KEY marst = ls_tb027-marst.
          IF sy-subrc NE 0.
            lv_message = ls_tb027-marst.
            "Link is missing for Marital status
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 055
              CHANGING
                ct_log            = et_log.

            ls_output-client = sy-mandt.
            ls_output-id1 = ls_tb027-marst.
            READ TABLE lt_tb027t INTO ls_tb027t WITH KEY
                                     spras = sy-langu
                                     marst = ls_tb027-marst.
            IF sy-subrc EQ 0 AND ls_tb027t-bez20 IS NOT INITIAL.
              ls_output-id1_desc = ls_tb027t-bez20.
            ELSE.
              "Marital status description missing
              CALL METHOD prepare_message
                EXPORTING
                  iv_severity       = 3
                  iv_message_number = 050
                  iv_param1         = lv_message
                CHANGING
                  ct_log            = et_log.
            ENDIF.
            APPEND ls_output TO et_output.
          ENDIF.
        ENDLOOP.

        IF et_output IS NOT INITIAL.
          CLEAR ls_dropdown.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = ''.
          APPEND ls_dropdown TO lt_dropdown.

          LOOP AT lt_t502t INTO ls_t502t.
            READ TABLE lt_cvic_marst_link TRANSPORTING NO FIELDS
                       WITH KEY famst = ls_t502t-famst.
            IF sy-subrc EQ 0.
              CONTINUE. " Skip dropdown help if entry already used as key field
            ENDIF.

            CONCATENATE ls_t502t-famst ls_t502t-ftext INTO lv_desc SEPARATED BY space.
            ls_dropdown-handle = '1'.
            ls_dropdown-value = lv_desc.
            APPEND ls_dropdown TO lt_dropdown.
          ENDLOOP.
        ENDIF.

      WHEN gc_bpc_legal. " Legal form

*get required data
        CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
          IMPORTING
            et_tvgf             = lt_tvgf
            et_tvgft            = lt_tvgft
            et_cvic_legform_lnk = lt_cvic_legform_lnk
            et_tb019            = lt_tb019
            et_tb020            = lt_tb020.

        LOOP AT lt_tb019 INTO ls_tb019.
          READ TABLE lt_cvic_legform_lnk TRANSPORTING NO FIELDS
            WITH KEY legal_enty = ls_tb019-legal_enty.
          IF sy-subrc NE 0.
            lv_message = ls_tb019-legal_enty.
            "CP Link is missing for BP department
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 058
              CHANGING
                ct_log            = et_log.

            ls_output-client = sy-mandt.
            ls_output-id1 = ls_tb019-legal_enty.
            READ TABLE lt_tb020 INTO ls_tb020 WITH KEY
                                     spras = sy-langu
                                     legal_enty = ls_tb019-legal_enty.
            IF ( sy-subrc EQ 0 AND ls_tb020-textlong IS NOT INITIAL ).
              ls_output-id1_desc = ls_tb020-textlong.
            ELSEIF ( sy-subrc EQ 0 AND ls_tb020-textshort IS NOT INITIAL ).
              ls_output-id1_desc = ls_tb020-textshort.
            ELSE.
              CALL METHOD prepare_message
                EXPORTING
                  iv_severity       = 2
                  iv_message_number = 060
                  iv_param1         = lv_message
                CHANGING
                  ct_log            = et_log.
            ENDIF.
            APPEND ls_output TO et_output.
          ENDIF.
        ENDLOOP.

        IF et_output IS NOT INITIAL.
          CLEAR ls_dropdown.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = ''.
          APPEND ls_dropdown TO lt_dropdown.

          LOOP AT lt_tvgf INTO ls_tvgf.
            READ TABLE lt_cvic_legform_lnk TRANSPORTING NO FIELDS
                       WITH KEY gform = ls_tvgf-gform.
            IF sy-subrc EQ 0.
              CONTINUE. " Skip dropdown help if entry already used as key field
            ENDIF.

            READ TABLE lt_tvgft INTO ls_tvgft WITH KEY  spras = sy-langu
                                                       gform = ls_tvgf-gform.
            IF sy-subrc EQ 0.
              CONCATENATE ls_tvgf-gform ls_tvgft-vtext INTO lv_desc SEPARATED BY space.
              ls_dropdown-handle = '1'.
              ls_dropdown-value = lv_desc.
              APPEND ls_dropdown TO lt_dropdown.
            ENDIF.
          ENDLOOP.
        ENDIF.

      WHEN gc_bpc_paycard. "Payment Card type
*get required data
        CALL METHOD cl_cvi_customizing_resolve=>fill_required_data
          IMPORTING
            et_tvcin          = lt_tvcin
            et_tvcint         = lt_tvcint
            et_cvic_ccid_link = lt_cvic_ccid_link
            et_tb033          = lt_tb033
            et_tb033t         = lt_tb033t.

        LOOP AT lt_tb033 INTO ls_tb033.
          READ TABLE lt_cvic_ccid_link TRANSPORTING NO FIELDS
            WITH KEY pcid_bp = ls_tb033-ccins.
          IF sy-subrc NE 0.
            lv_message = ls_tb033-ccins.
            "CP Link is missing for BP department
            CALL METHOD prepare_message
              EXPORTING
                iv_severity       = 1
                iv_message_number = 059
              CHANGING
                ct_log            = et_log.

            ls_output-client = sy-mandt.
            ls_output-id1 = ls_tb033-ccins.
            READ TABLE lt_tb033t INTO ls_tb033t WITH KEY
                                     spras = sy-langu
                                     ccins = ls_tb033-ccins.
            IF sy-subrc EQ 0 AND ls_tb033t-bez30 IS NOT INITIAL.
              ls_output-id1_desc = ls_tb033t-bez30.
            ELSE.
              CALL METHOD prepare_message
                EXPORTING
                  iv_severity       = 2
                  iv_message_number = 044
                  iv_param1         = lv_message
                CHANGING
                  ct_log            = et_log.
            ENDIF.
            APPEND ls_output TO et_output.
          ENDIF.
        ENDLOOP.

        IF et_output IS NOT INITIAL.
          CLEAR ls_dropdown.
          ls_dropdown-handle = '1'.
          ls_dropdown-value = ''.
          APPEND ls_dropdown TO lt_dropdown.

          LOOP AT lt_tvcin INTO ls_tvcin.
            READ TABLE lt_tvcint INTO ls_tvcint WITH KEY  spras = sy-langu
                                                       ccins = ls_tvcin-ccins.
            IF sy-subrc EQ 0.
              CONCATENATE ls_tvcin-ccins ls_tvcint-vtext INTO lv_desc SEPARATED BY space.
              ls_dropdown-handle = '1'.
              ls_dropdown-value = lv_desc.
              APPEND ls_dropdown TO lt_dropdown.
            ENDIF.
          ENDLOOP.
        ENDIF.

    ENDCASE.
    et_dropdown_values = lt_dropdown.
  ENDMETHOD.


  METHOD get_customizing_details.
    CLEAR: ev_object, ev_view,ev_tcode.

    CASE iv_scenario.
      WHEN gc_gen_sync.
        ev_object = 'V'.
        ev_view = 'MDSV_CTRL_OPT_A'.
      WHEN gc_gen_ppo.
        ev_object = 'V'.
        ev_view = '/SAPPO/VA_BPROC'.
      WHEN gc_gen_regfun.
        ev_object = 'V'.
        ev_view = 'CRMC_BUT_CALL_FU'.
      WHEN gc_gen_tax.
        ev_object = 'V'.
        ev_view = 'V_TFKTAXNUMTYPE'.
      WHEN gc_gen_addrnr.
        ev_object = 'T'.
        ev_tcode = 'SA01'.
      WHEN gc_gen_industry.
        ev_object = 'V'.
        ev_view = 'V_TB038'.
      WHEN gc_cbp_roles OR gc_cbp_accrole.
        ev_object = 'V'.
        ev_view = 'CVIV_CUST_TO_BP2'.
      WHEN gc_cbp_groupng OR gc_cbp_accgrp.
        ev_object = 'V'.
        ev_view = 'CVIV_CUST_TO_BP1'.
      WHEN gc_cbp_legal OR gc_bpc_legal.
        ev_object = 'V'.
        ev_view = 'CVIV_LEGFORM_LNK'.
      WHEN gc_cbp_paycard OR gc_bpc_paycard.
        ev_object = 'V'.
        ev_view = 'CVIV_CCID_LINK'.
      WHEN gc_cbp_ind_in OR gc_vbp_ind_in.
        ev_object = 'V'.
        ev_view = 'V_TP038M2'.
      WHEN gc_bpc_ind_out OR gc_bpv_ind_out.
        ev_object = 'V'.
        ev_view = 'V_TP038M1'.
      WHEN gc_cbpcp_actv.
        ev_object = 'V'.
        ev_view = 'CVIV_MAP_CONTACT'.
      WHEN gc_cbpcp_dept OR gc_bpc_dept.
        ev_object = 'V'.
        ev_view = 'CVIV_CP1_LINK'.
      WHEN gc_cbpcp_func OR gc_bpc_func.
        ev_object = 'V'.
        ev_view = 'CVIV_CP2_LINK'.
      WHEN gc_cbpcp_auth OR gc_bpc_auth.
        ev_object = 'V'.
        ev_view = 'CVIV_CP3_LINK'.
      WHEN gc_cbpcp_vip OR gc_bpc_vip.
        ev_object = 'V'.
        ev_view = 'CVIV_CP4_LINK'.
      WHEN gc_cbpcp_marital OR gc_bpc_marital.
        ev_object = 'V'.
        ev_view = 'CVIV_MARST_LINK'.
      WHEN gc_vbp_roles OR gc_vbp_accrole.
        ev_object = 'V'.
        ev_view = 'CVIV_VEND_TO_BP2'.
      WHEN gc_vbp_groupng OR gc_vbp_accgrp.
        ev_object = 'V'.
        ev_view = 'CVIV_VEND_TO_BP1'.
      WHEN gc_bpc_roles.
        ev_object = 'V'.
        ev_view = 'V_TBD002'.
      WHEN gc_bpc_groupng.
        ev_object = 'V'.
        ev_view = 'V_TBD001'.
      WHEN gc_bpv_roles.
        ev_object = 'V'.
        ev_view = 'V_TBC002'.
      WHEN gc_bpv_groupng.
        ev_object = 'V'.
        ev_view = 'V_TBC001'.
      WHEN OTHERS.
    ENDCASE.
  ENDMETHOD.


  METHOD get_mapping_out_to_in.
    DATA: lt_ddic_op_map       TYPE tt_ddic_output_field_mapping,
          ls_ddic_op_map       TYPE ty_ddic_output_field_mapping,
          ls_mapping_out_to_in TYPE ty_field_mapping_out_to_in,
          lv_view_name         TYPE vim_name.
    " For Edit enabled ALV's prepare the mapping between
    " ALV fields to view fields along with view name
    " Later this data is used to convert and save data
    CASE iv_scenario.

      WHEN gc_gen_tax.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'TAXTYPE'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'CHECKFCT'.
        ls_ddic_op_map-output_field_name = 'TEXT1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'TEXT'.
        ls_ddic_op_map-output_field_name = 'ID1_DESC'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'STCDT'.
        ls_ddic_op_map-output_field_name = 'TEXT2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'V_TFKTAXNUMTYPE'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_gen_industry.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'ISTYPE'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'BEZ30'.
        ls_ddic_op_map-output_field_name = 'ID1_DESC'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'ISTDEF'.
        ls_ddic_op_map-output_field_name = 'INPUT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'V_TB038'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_cbp_accrole.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'ACCOUNT_GROUP'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'ROLE'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_CUST_TO_BP2'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_cbp_accgrp.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'ACCOUNT_GROUP'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'GROUPING'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'SAME_NUMBER'.
        ls_ddic_op_map-output_field_name = 'TEXT1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_CUST_TO_BP1'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_cbpcp_actv.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'MAP_CONTACT'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_MAP_CONTACT'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_cbpcp_dept.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'ABTNR'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'GP_ABTNR'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_CP1_LINK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_cbpcp_func.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'PAFKT'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'GP_PAFKT'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_CP2_LINK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_cbpcp_auth.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'PARVO'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'PAAUTH'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_CP3_LINK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_cbpcp_vip.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'PAVIP'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'GP_PAVIP'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_CP4_LINK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_cbpcp_marital.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'FAMST'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'MARST'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_MARST_LINK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_cbp_legal.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'GFORM'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'LEGAL_ENTY'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_LEGFORM_LNK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_cbp_paycard.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'CCINS'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'PCID_BP'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_CCID_LINK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_vbp_accrole.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'ACCOUNT_GROUP'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'ROLE'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_VEND_TO_BP2'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_vbp_accgrp.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'ACCOUNT_GROUP'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'GROUPING'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'SAME_NUMBER'.
        ls_ddic_op_map-output_field_name = 'TEXT1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_VEND_TO_BP1'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_cbp_ind_in OR gc_bpc_ind_out OR
           gc_vbp_ind_in OR gc_bpv_ind_out.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'BRSCH'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'ISTYPE'.
        ls_ddic_op_map-output_field_name = 'INPUT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'IND_SECTOR'.
        ls_ddic_op_map-output_field_name = 'TEXT1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        IF iv_scenario = gc_cbp_ind_in OR iv_scenario = gc_vbp_ind_in.
          lv_view_name = 'V_TP038M2'.
        ELSEIF iv_scenario = gc_bpc_ind_out OR iv_scenario = gc_bpv_ind_out.
          lv_view_name = 'V_TP038M1'.
        ENDIF.

        ls_mapping_out_to_in-view_name = lv_view_name.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_bpc_dept.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'GP_ABTNR'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'ABTNR'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_CP1_LINK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_bpc_func.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'GP_PAFKT'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'PAFKT'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_CP2_LINK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_bpc_auth.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'PAAUTH'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'PARVO'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_CP3_LINK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_bpc_vip.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'GP_PAVIP'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'PAVIP'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_CP4_LINK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_bpc_marital.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'MARST'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'FAMST'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_MARST_LINK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_bpc_legal.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'LEGAL_ENTY'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'GFORM'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_LEGFORM_LNK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

      WHEN gc_bpc_paycard.

        ls_ddic_op_map-ddic_field_name = 'CLIENT'.
        ls_ddic_op_map-output_field_name = 'CLIENT'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'PCID_BP'.
        ls_ddic_op_map-output_field_name = 'ID1'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_ddic_op_map-ddic_field_name = 'CCINS'.
        ls_ddic_op_map-output_field_name = 'ID2'.
        APPEND ls_ddic_op_map TO lt_ddic_op_map.

        ls_mapping_out_to_in-view_name = 'CVIV_CCID_LINK'.
        ls_mapping_out_to_in-mapping = lt_ddic_op_map.
        APPEND ls_mapping_out_to_in TO et_mapping_out_to_in.

    ENDCASE.
  ENDMETHOD.


  METHOD get_scenario_maint_det.
    "Data declaration
    DATA
     lt_scenario_maint_det TYPE tt_scenario_maint_det.

    IF iv_scenario EQ '*'.
      et_scenario_maint_det = gt_scenario_maint_det.
    ELSE.
      lt_scenario_maint_det = gt_scenario_maint_det.
      DELETE lt_scenario_maint_det WHERE scenario <> iv_scenario.
      et_scenario_maint_det = lt_scenario_maint_det.
    ENDIF.
  ENDMETHOD.


  METHOD initialize_icons.

*initialise icons used on Screens and in ALVs
    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name   = 'ICON_INCOMPLETE'
      IMPORTING
        result = cl_cvi_customizing_resolve=>gv_icon_incomplete.

    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name   = 'ICON_CHECKED'
      IMPORTING
        result = cl_cvi_customizing_resolve=>gv_icon_checked.

    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name   = 'ICON_ARROW_RIGHT'
      IMPORTING
        result = cl_cvi_customizing_resolve=>gv_icon_arrow_right.

    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name   = 'ICON_ARROW_LEFT'
      IMPORTING
        result = cl_cvi_customizing_resolve=>gv_icon_arrow_left.

    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name   = 'ICON_LED_GREEN'
        info                  = text-033
        add_stdinf            = 'X'
      IMPORTING
        result = cl_cvi_customizing_resolve=>gv_icon_green.

    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name   = 'ICON_LED_YELLOW'
        info                  = text-034
*        add_stdinf            = 'X'
      IMPORTING
        result = cl_cvi_customizing_resolve=>gv_icon_yellow.

    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name   = 'ICON_LED_RED'
        info                  = text-035
        add_stdinf            = 'X'
      IMPORTING
        result = cl_cvi_customizing_resolve=>gv_icon_red.

  ENDMETHOD.


  METHOD insert_record.

    CONSTANTS : lc_view_prefix TYPE string VALUE 'VIEWPROC_'.

    DATA:
      lv_view_name          TYPE ocus-table,
      lv_func_name          TYPE rs38l_fnam,
      lt_components_extract TYPE abap_compdescr_tab,
      lt_components         TYPE abap_compdescr_tab,
      ls_components         TYPE abap_compdescr,
      lr_ref_table_des      TYPE REF TO cl_abap_structdescr,
      ls_fcat               TYPE lvc_s_fcat,
      lt_fcat               TYPE lvc_t_fcat,
      lr_extract            TYPE REF TO data,
      lr_extract_wa         TYPE REF TO data,
      lr_total              TYPE REF TO data,
      lr_total_wa           TYPE REF TO data,
      lr_input_data         TYPE REF TO data,
      lt_corr_keytab        TYPE TABLE OF   e071k,
      lt_dba_sellist        TYPE TABLE OF  vimsellist,
      lt_dpl_sellist        TYPE TABLE OF vimsellist,
      lt_excl_cua_funct     TYPE TABLE OF   vimexclfun,
      lt_x_header           TYPE TABLE OF vimdesc,
      ls_x_header           TYPE          vimdesc,
      lt_x_namtab           TYPE TABLE OF vimnamtab,
      lv_main_prog_name     TYPE string.

    FIELD-SYMBOLS:
      <lfs_extab>          TYPE STANDARD  TABLE,
      <lfs_total>          TYPE STANDARD  TABLE,
      <lfs_total_wa>       TYPE any,
      <lfs_extract_wa>     TYPE any,
      <lfs_input_data_s>   TYPE any,
      <lfs_last_view_name> TYPE any,
      <lfs_status>         TYPE any,
      <lfs_value>          TYPE any.


    lv_view_name = iv_viewname.

    CONCATENATE lc_view_prefix lv_view_name INTO lv_func_name.

*  Create dynamic table for EXTRACT and TOTAL
*GET the structure of the table.
    lr_ref_table_des ?= cl_abap_typedescr=>describe_by_name( lv_view_name ).
    lt_components = lr_ref_table_des->components[].
    APPEND LINES OF lt_components TO lt_components_extract.

*  Get the structure of the additional fields( ACTION, MARK )
    lr_ref_table_des ?= cl_abap_typedescr=>describe_by_name( 'VIMFLAGTAB' ).
    lt_components = lr_ref_table_des->components[].
    APPEND LINES OF lt_components TO lt_components_extract.


    LOOP AT lt_components_extract INTO ls_components.
      CLEAR ls_fcat.
      ls_fcat-fieldname = ls_components-name.
      CASE ls_components-type_kind.
        WHEN 'C'.
          ls_fcat-datatype = 'CHAR'.
        WHEN 'N'.
          ls_fcat-datatype = 'NUMC'.
        WHEN 'D'.
          ls_fcat-datatype = 'DATE'.
        WHEN 'P'.
          ls_fcat-datatype = 'PACK'.
        WHEN OTHERS.
          ls_fcat-datatype = ls_components-type_kind.
      ENDCASE.
      ls_fcat-inttype = ls_components-type_kind.
      ls_fcat-intlen = ls_components-length.
      ls_fcat-decimals = ls_components-decimals.
      APPEND ls_fcat TO lt_fcat.
    ENDLOOP.

*  Create dynamic internal table and assign to FS
    CALL METHOD cl_alv_table_create=>create_dynamic_table
      EXPORTING
        it_fieldcatalog  = lt_fcat
        i_length_in_byte = 'X'
      IMPORTING
        ep_table         = lr_extract.

    ASSIGN lr_extract->* TO <lfs_extab>.
    CREATE DATA lr_total LIKE <lfs_extab>.
    CREATE DATA lr_total_wa LIKE LINE OF <lfs_extab>.

    CREATE DATA lr_extract_wa LIKE LINE OF <lfs_extab> .
    ASSIGN lr_extract_wa->* TO <lfs_extract_wa>.
    ASSIGN lr_total->* TO <lfs_total>.
    ASSIGN lr_total_wa->* TO <lfs_total_wa>.


*  get the required info for save operations
    CALL FUNCTION 'VIEW_GET_DDIC_INFO'
      EXPORTING
        viewname        = iv_viewname
      TABLES
        sellist         = lt_dba_sellist
        x_header        = lt_x_header
        x_namtab        = lt_x_namtab
      EXCEPTIONS
        no_tvdir_entry  = 1
        table_not_found = 2
        OTHERS          = 3.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.

    READ TABLE lt_x_header INTO ls_x_header INDEX 1.
    IF sy-subrc EQ 0.
      CONCATENATE '(SAPL' ls_x_header-area ')LAST_VIEW_INFO' INTO lv_main_prog_name.
      CONDENSE lv_main_prog_name.
      ASSIGN (lv_main_prog_name) TO <lfs_last_view_name>.
      IF <lfs_last_view_name> IS ASSIGNED.
        <lfs_last_view_name> = 'X'.
      ENDIF.
    ENDIF.


    CALL FUNCTION lv_func_name
      EXPORTING
        fcode                     = 'READ'
        view_action               = 'U'
        view_name                 = lv_view_name
      TABLES
        corr_keytab               = lt_corr_keytab
        dba_sellist               = lt_dba_sellist
        dpl_sellist               = lt_dpl_sellist
        excl_cua_funct            = lt_excl_cua_funct
        extract                   = <lfs_extab>
        total                     = <lfs_total>
        x_header                  = lt_x_header[]
        x_namtab                  = lt_x_namtab[]
      EXCEPTIONS
        no_value_for_subset_ident = 1
        missing_corr_number       = 2
        saving_correction_failed  = 3
        error_message             = 5
        OTHERS                    = 6.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.



    CREATE DATA lr_input_data TYPE (iv_viewname).
    ASSIGN lr_input_data->* TO <lfs_input_data_s>.
    LOOP AT it_data ASSIGNING <lfs_input_data_s>.
      APPEND INITIAL LINE TO <lfs_extab> ASSIGNING <lfs_extract_wa>.
      IF <lfs_extract_wa> IS ASSIGNED.
        <lfs_extract_wa> = <lfs_input_data_s>.
        ASSIGN COMPONENT 'ACTION' OF STRUCTURE <lfs_extract_wa> TO <lfs_value>.
        IF sy-subrc EQ 0.
          <lfs_value> = 'N'.
        ENDIF.
      ENDIF.


      APPEND INITIAL LINE TO <lfs_total> ASSIGNING <lfs_total_wa>.
      IF <lfs_total_wa> IS ASSIGNED.
        <lfs_total_wa> = <lfs_input_data_s>.
        ASSIGN COMPONENT 'ACTION' OF STRUCTURE <lfs_total_wa> TO <lfs_value>.
        IF sy-subrc EQ 0.
          <lfs_value> = 'N'.
        ENDIF.
      ENDIF.
    ENDLOOP.


    READ TABLE lt_x_header INTO ls_x_header INDEX 1.
    IF sy-subrc EQ 0.
      CONCATENATE '(SAPL' ls_x_header-area ')LAST_VIEW_INFO' INTO lv_main_prog_name.
      CONDENSE lv_main_prog_name.
      ASSIGN (lv_main_prog_name) TO <lfs_last_view_name>.
      IF <lfs_last_view_name> IS ASSIGNED.
        <lfs_last_view_name> = 'X'.
      ENDIF.

      "alter the value of Status structure - STATUS_VIEW as without this save wont work
      UNASSIGN <lfs_status>.
      CONCATENATE '(SAPL' ls_x_header-area ')STATUS_'
                  iv_viewname '-UPD_FLAG' INTO lv_main_prog_name.
      CONDENSE lv_main_prog_name.
      ASSIGN (lv_main_prog_name) TO <lfs_status>.
      IF <lfs_status> IS ASSIGNED.
        <lfs_status> = 'X'.
      ENDIF.

      UNASSIGN <lfs_status>.
      CONCATENATE '(SAPL' ls_x_header-area ')STATUS_'
                  iv_viewname '-UPD_CHECKD' INTO lv_main_prog_name.
      CONDENSE lv_main_prog_name.
      ASSIGN (lv_main_prog_name) TO <lfs_status>.
      IF <lfs_status> IS ASSIGNED.
        <lfs_status> = 'X'.
      ENDIF.
    ENDIF.

    CALL FUNCTION lv_func_name
      EXPORTING
        fcode                     = 'SAVE'
        view_action               = 'U'
        view_name                 = lv_view_name
      TABLES
        corr_keytab               = lt_corr_keytab
        dba_sellist               = lt_dba_sellist
        dpl_sellist               = lt_dpl_sellist
        excl_cua_funct            = lt_excl_cua_funct
        extract                   = <lfs_extab>
        total                     = <lfs_total>
        x_header                  = lt_x_header[]
        x_namtab                  = lt_x_namtab[]
      EXCEPTIONS
        no_value_for_subset_ident = 1
        missing_corr_number       = 2
        saving_correction_failed  = 3
        error_message             = 5
        OTHERS                    = 6.
    IF sy-subrc <> 0.
      IF sy-subrc EQ 3 AND sy-msgno = 495.
        MESSAGE ID sy-msgid TYPE 'S' NUMBER sy-msgno
         WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 DISPLAY LIKE sy-msgty.
      ELSE.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
         WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD is_maintainence_exist.
    DATA: lt_maint_det TYPE tt_scenario_maint_det.

    "Check if maintenance is allowed for the selected
    " scenario ID
    CALL METHOD get_scenario_maint_det
      EXPORTING
        iv_scenario           = iv_scenario
      IMPORTING
        et_scenario_maint_det = lt_maint_det.

    IF lt_maint_det IS INITIAL.
      r_result = abap_false.
    ELSE.
      r_result = abap_true.
    ENDIF.
  ENDMETHOD.


  METHOD lock_view.
    DATA lv_uname TYPE sy-uname.

    IF NOT ( iv_action EQ 'E' OR iv_action EQ  'D' ).
      MESSAGE e040 RAISING technical_error.
    ENDIF.

    CALL FUNCTION 'VIEW_ENQUEUE'
      EXPORTING
        action               = iv_action
        enqueue_mode         = 'E'
        view_name            = iv_viewname
*      TABLES
*       sellist              = lt_rangetab
      EXCEPTIONS
        client_reference     = 1
        foreign_lock         = 2
        invalid_action       = 3
        invalid_enqueue_mode = 4
        system_failure       = 5
        table_not_found      = 6
        OTHERS               = 7.
    IF sy-subrc <> 0.
      IF sy-subrc EQ 2.
        lv_uname = sy-msgv1(12).
        MESSAGE e039 WITH iv_viewname lv_uname RAISING foreign_lock.
      ELSE.
        MESSAGE e040 RAISING technical_error.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD prepare_message.
    DATA: ls_log          TYPE ty_log,
          lv_message_text TYPE char200.

    MESSAGE ID 'CVI_CUST_RESOLVE' TYPE 'I' NUMBER iv_message_number WITH iv_param1 iv_param2 iv_param3 INTO lv_message_text.

    ls_log-message = lv_message_text.
    ls_log-prio    = iv_severity.
    IF iv_severity = 1.
      ls_log-icon = gv_icon_red.
    ELSEIF iv_severity = 2.
      ls_log-icon = gv_icon_yellow.
    ELSEIF iv_severity = 3.
      ls_log-icon = gv_icon_green.
    ENDIF.

    APPEND ls_log TO ct_log.
  ENDMETHOD.


  METHOD read_documentation.

    CASE iv_scenario.
      WHEN gc_gen_sync.
        ev_docuobject = 'CVI_FS_C_C_SYNCH_DIRECTION'.
      WHEN gc_gen_ppo.
        ev_docuobject = 'CVI_FS_C_C_PPO_CONNECTION'.
      WHEN gc_gen_regfun.
        ev_docuobject = 'CVI_FS_C_C_FUNCTION_MODULES'.
      WHEN gc_gen_tax.
        ev_docuobject = 'CVI_FS_C_C_TAX_CLASS'.
      WHEN gc_gen_addrnr.
        ev_docuobject = 'CVI_FS_C_C_ADRNR'.
      WHEN gc_gen_industry.
        ev_docuobject = 'CVI_FS_C_C_CUS_IND_SYSTEM'.
      WHEN gc_cbp_roles.
        ev_docuobject = 'CVI_FS_C_C_CUSTOMER_BP'.
      WHEN gc_cbp_groupng.
        ev_docuobject = 'CVI_FS_C_C_CUSTOMER_TO_BP'.
      WHEN gc_cbp_accrole.
        ev_docuobject = 'CVI_FS_C_C_CUS_ROLE'.
      WHEN gc_cbp_accgrp.
        ev_docuobject = 'CVI_FS_C_C_CUS_BPGROUP'.
      WHEN gc_cbpcp_actv.
        ev_docuobject = 'CVI_FS_C_C_CUS_CONPERSON'.
      WHEN gc_cbpcp_dept.
        ev_docuobject = 'CVI_FS_C_C_CUS_DEPT_PERSON'.
      WHEN gc_cbpcp_func.
        ev_docuobject = 'CVI_FS_C_C_CUS_FUN_PERSON'.
      WHEN gc_cbpcp_auth.
        ev_docuobject = 'CVI_FS_C_C_CUS_AUTH_PERSON'.
      WHEN gc_cbpcp_vip.
        ev_docuobject = 'CVI_FS_C_C_CUS_VIP_PERSON'.
      WHEN gc_cbpcp_marital.
        ev_docuobject = 'CVI_FS_C_C_CUS_MAR_STATUS'.
      WHEN gc_cbp_legal.
        ev_docuobject = 'CVI_FS_C_C_CUS_LEGAL_STATUS'.
      WHEN gc_cbp_paycard.
        ev_docuobject = 'CVI_FS_C_C_CUS_PAY_CARDS'.
      WHEN gc_cbp_ind_in.
        ev_docuobject = 'CVI_FS_C_C_IND_KEY'.
      WHEN gc_bpc_ind_out.
        ev_docuobject = 'CVI_FS_C_C_IND_KEY_OUT'.
      WHEN gc_vbp_roles.
        ev_docuobject = 'CVI_FS_C_C_VENDOR_TO_BP'.
      WHEN gc_vbp_groupng.
        ev_docuobject = 'CVI_FS_C_C_VENDOR_TO_BP'.
      WHEN gc_vbp_accrole.
        ev_docuobject = 'CVI_FS_C_C_SUPP_ROLE'.
      WHEN gc_vbp_accgrp.
        ev_docuobject = 'CVI_FS_C_C_SUPP_BPGROUP'.
      WHEN gc_vbp_ind_in.
        ev_docuobject = 'CVI_FS_C_C_IND_KEY'.
      WHEN gc_bpv_ind_out.
        ev_docuobject = 'CVI_FS_C_C_IND_KEY_OUT'.
      WHEN gc_bpc_roles.
        ev_docuobject = 'CVI_FS_C_C_BP_TO_CUSTOMER'.
      WHEN gc_bpc_groupng.
        ev_docuobject = 'CVI_FS_C_C_BP_TO_CUSTOMER'.
      WHEN gc_bpc_dept.
        ev_docuobject = 'CVI_FS_C_C_CUS_POST_DEPT'.
      WHEN gc_bpc_func.
        ev_docuobject = 'CVI_FS_C_C_CUS_POST_FUNC'.
      WHEN gc_bpc_auth.
        ev_docuobject = 'CVI_FS_C_C_CUS_POST_AUTH'.
      WHEN gc_bpc_vip.
        ev_docuobject = 'CVI_FS_C_C_CUS_POST_VIP'.
      WHEN gc_bpc_marital.
        ev_docuobject = 'CVI_FS_C_C_CUS_POST_MARITAL'.
      WHEN gc_bpc_legal.
        ev_docuobject = 'CVI_FS_C_C_CUS_POST_LEGAL'.
      WHEN gc_bpc_paycard.
        ev_docuobject = 'CVI_FS_C_C_CUS_POST_CARDS'.
      WHEN gc_bpv_roles.
        ev_docuobject = 'CVI_FS_C_C_BP_TO_VENDOR'.
      WHEN gc_bpv_groupng.
        ev_docuobject = 'CVI_FS_C_C_BP_TO_VENDOR'.
      WHEN OTHERS.
    ENDCASE.

  ENDMETHOD.


  METHOD save_data.
    DATA lr_final_data TYPE REF TO data.
    DATA ls_field_mapping_out_to_in TYPE ty_field_mapping_out_to_in.
    DATA ls_field_mapping_out_to_in_d TYPE ty_field_mapping_out_to_in.

    FIELD-SYMBOLS <lfs_view_data> TYPE STANDARD TABLE.

    "step 1
    "Acquire the lock for all the view
    "Loop has been used to cover the multiple view scenario.
    "If multiple views are used lock all for editing
    LOOP AT it_field_mapping_out_to_in INTO ls_field_mapping_out_to_in.
      lock_view(
        EXPORTING
          iv_action       = 'E'                 " 'E'-> Enqueue 'D'-> Dequeue
          iv_viewname     = ls_field_mapping_out_to_in-view_name                 " Table Name
        EXCEPTIONS
          foreign_lock    = 1                " View is locked by another user
          technical_error = 2                " system_failure, table_not_found - Non Business Error
          OTHERS          = 3
      ).
      IF sy-subrc <> 0.
        "If any view enquece fails, dequeue all the locked
        LOOP AT it_field_mapping_out_to_in INTO ls_field_mapping_out_to_in_d.
          IF ls_field_mapping_out_to_in_d-view_name EQ ls_field_mapping_out_to_in-view_name.
            EXIT.
          ENDIF.
          lock_view(
        EXPORTING
          iv_action       = 'D'                 " 'E'-> Enqueue 'D'-> Dequeue
          iv_viewname     = ls_field_mapping_out_to_in_d-view_name                 " Table Name
         ).
        ENDLOOP.

        CASE sy-subrc .
          WHEN 1.
            MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 RAISING lock_error.
          WHEN OTHERS.
            MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 RAISING technical_error.
        ENDCASE.

      ENDIF.
    ENDLOOP.

    "Step2
    "Convert output to internal format and call the api to save the data
    LOOP AT it_field_mapping_out_to_in INTO ls_field_mapping_out_to_in.
      CREATE DATA lr_final_data TYPE TABLE OF (ls_field_mapping_out_to_in-view_name).
      ASSIGN lr_final_data->* TO <lfs_view_data>.


      CALL METHOD cl_cvi_customizing_resolve=>convert_output_to_input
        EXPORTING
          it_ddic_output_map  = ls_field_mapping_out_to_in-mapping
          it_data             = it_data "<lfs_data>
          iv_output_view_name = ls_field_mapping_out_to_in-view_name                 " View Names
        IMPORTING
          et_ouput_data       = <lfs_view_data>.


      CALL METHOD cl_cvi_customizing_resolve=>insert_record
        EXPORTING
          iv_viewname = ls_field_mapping_out_to_in-view_name                 " Undefined range (can be used for patch levels)
          it_data     = <lfs_view_data>.
    ENDLOOP.

    "step3
    "Release the aquired lock
    LOOP AT it_field_mapping_out_to_in INTO ls_field_mapping_out_to_in.
      "The lock is aquired 2 times in same session,
      "1. During toggle from display to save,
      "2. During Save data in this method.
      "Hence it is necesarry to remove lock 2 times
      DO 2 TIMES.
        lock_view(
          EXPORTING
            iv_action       = 'D'                 " 'E'-> Enqueue 'D'-> Dequeue
            iv_viewname     = ls_field_mapping_out_to_in-view_name                 " Table Name
          EXCEPTIONS
            foreign_lock    = 1                " View is locked by another user
            technical_error = 2                " system_failure, table_not_found - Non Business Error
            OTHERS          = 3
        ).
        IF sy-subrc <> 0.
          MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
        ENDIF.
      ENDDO.
    ENDLOOP.

  ENDMETHOD.


  METHOD set_scenario_maint_det.

    DEFINE macro_scenario_maint_det.
      ls_scenario_maint_det-scenario = &1.
    ls_scenario_maint_det-maint_viewname = &2.
    APPEND ls_scenario_maint_det TO gt_scenario_maint_det.
    END-OF-DEFINITION.

    DATA: ls_scenario_maint_det TYPE ty_scenario_maint_det.

    macro_scenario_maint_det gc_gen_tax       'V_TFKTAXNUMTYPE'.
    macro_scenario_maint_det gc_gen_industry  'V_TB038'.
    macro_scenario_maint_det gc_cbp_accrole   'CVIV_CUST_TO_BP2'.
    macro_scenario_maint_det gc_cbp_accgrp    'CVIV_CUST_TO_BP1'.
    macro_scenario_maint_det gc_cbp_legal     'CVIV_LEGFORM_LNK'.
    macro_scenario_maint_det gc_cbp_paycard   'CVIV_CCID_LINK'.
    macro_scenario_maint_det gc_cbpcp_actv    'CVIV_MAP_CONTACT'.
    macro_scenario_maint_det gc_cbpcp_dept    'CVIV_CP1_LINK'.
    macro_scenario_maint_det gc_cbpcp_func    'CVIV_CP2_LINK'.
    macro_scenario_maint_det gc_cbpcp_auth    'CVIV_CP3_LINK'.
    macro_scenario_maint_det gc_cbpcp_vip     'CVIV_CP4_LINK'.
    macro_scenario_maint_det gc_cbpcp_marital 'CVIV_MARST_LINK'.
    macro_scenario_maint_det gc_vbp_accrole   'CVIV_VEND_TO_BP2'.
    macro_scenario_maint_det gc_vbp_accgrp    'CVIV_VEND_TO_BP1'.
    macro_scenario_maint_det gc_cbp_ind_in    'V_TP038M2'.
    macro_scenario_maint_det gc_bpc_ind_out   'V_TP038M1'.
    macro_scenario_maint_det gc_vbp_ind_in    'V_TP038M2'.
    macro_scenario_maint_det gc_bpv_ind_out   'V_TP038M1'.
    macro_scenario_maint_det gc_bpc_dept      'CVIV_CP1_LINK'.
    macro_scenario_maint_det gc_bpc_func      'CVIV_CP2_LINK'.
    macro_scenario_maint_det gc_bpc_auth      'CVIV_CP3_LINK'.
    macro_scenario_maint_det gc_bpc_vip       'CVIV_CP4_LINK'.
    macro_scenario_maint_det gc_bpc_marital   'CVIV_MARST_LINK'.
    macro_scenario_maint_det gc_bpc_legal     'CVIV_LEGFORM_LNK'.
    macro_scenario_maint_det gc_bpc_paycard   'CVIV_CCID_LINK'.

  ENDMETHOD.
ENDCLASS.
