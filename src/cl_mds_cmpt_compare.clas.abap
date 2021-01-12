class CL_MDS_CMPT_COMPARE definition
  public
  final
  create public .

public section.
*"* public components of class CL_MDS_CMPT_COMPARE
*"* do not include other source files here!!!

  methods COMPARE_VENDOR_AS_SOURCE
    importing
      !IS_SOURCE_ST type VMDS_EI_MAIN
      !IS_TARGET_ST type VMDS_EI_MAIN
      !IS_TARGET_ORG type BUS_EI_MAIN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_CUSTOMER_AS_SOURCE
    importing
      !IS_SOURCE_ST type CMDS_EI_MAIN
      !IS_TARGET_ST type CMDS_EI_MAIN
      !IS_TARGET_ORG type BUS_EI_MAIN
      !IT_DATASETS type MDS_CMPT_SYNC_DATASET_OPTION_T
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_BP_AS_SOURCE
    importing
      !IS_SOURCE_ST type BUS_EI_MAIN
      !IS_TARGET_ST type BUS_EI_MAIN
      !IS_TARGET_ORG type ANY
      !IT_DATASETS type MDS_CMPT_SYNC_DATASET_OPTION_T
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  class-methods GET_INSTANCE
    returning
      value(RR_INSTANCE) type ref to CL_MDS_CMPT_COMPARE .
protected section.
*"* protected components of class CL_MDS_CMPT_COMPARE
*"* do not include other source files here!!!
private section.
*"* private components of class CL_MDS_CMPT_COMPARE
*"* do not include other source files here!!!

  class-data GR_INSTANCE type ref to CL_MDS_CMPT_COMPARE .
  data GV_SOURCE_OBJECT type MDS_CMPT_CTRL_OBJ_SOURCE .
  data GV_TARGET_OBJECT type MDS_CMPT_CTRL_OBJ_TARGET .
  data GC_BP type CHAR2 value 'BP'. "#EC NOTEXT .
  data GC_CUSTOMER type CHAR8 value 'CUSTOMER'. "#EC NOTEXT .
  data GC_VENDOR type CHAR6 value 'VENDOR'. "#EC NOTEXT .
  data GC_TRUE type BOOLEAN value 'X'. "#EC NOTEXT .
  data GC_FALSE type BOOLEAN value ' '. "#EC NOTEXT .
  data GT_DFIES type MDS_CMPT_DFIES_T .
  data GV_CMP_ID type MDS_CMPT_PROCESS_ID .
  data:
    GT_MAP_FLD type table of mdse_cmp_map_fld .
  data:
    GT_CUST_CT_LINK TYPE TABLE OF CVI_CUST_CT_LINK .
  data GC_ERROR type C value 'E'. "#EC NOTEXT .
  data GC_CONSISTENT type C value 'C'. "#EC NOTEXT .
  data GC_INCONSISTENT type C value 'I'. "#EC NOTEXT .
  data GC_NOTMAINTAINED type C value 'N'. "#EC NOTEXT .
  data GC_ADDRESS type MDS_CMPT_DATASET_ID value 'DSET_01'. "#EC NOTEXT .
  data GC_BANK type MDS_CMPT_DATASET_ID value 'DSET_02'. "#EC NOTEXT .
  data GC_CCARD type MDS_CMPT_DATASET_ID value 'DSET_03'. "#EC NOTEXT .
  data GC_INDUSTRY type MDS_CMPT_DATASET_ID value 'DSET_04'. "#EC NOTEXT .
  data GC_RELATIONSHIP type MDS_CMPT_DATASET_ID value 'DSET_05'. "#EC NOTEXT .
  data GC_TAX type MDS_CMPT_DATASET_ID value 'DSET_06'. "#EC NOTEXT .

  methods COMPARE_CUST_AS_SRC_CT_ADD_VER
    importing
      !IT_SOURCE_ADD_VER type CVI_EI_VERSION_TYPE1_T
      !IT_TARGET_ADD_VER type CVI_EI_VERSION_TYPE1_T
      !IT_TARGET_ADD_VER_OR type BUS_EI_BUPA_VERSION_T
      !IV_DATASET type MDS_CMPT_DATASET_ID
    exporting
      !EV_INCONSISTENT type BOOLEAN
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_ST_RESULT_T .
  methods COMPARE_CUST_AS_SOURCE_COMREM
    importing
      !IT_SOURCE_ADD_COMREM type CVIS_EI_COMREM_T
      !IT_TARGET_ADD_COMREM type CVIS_EI_COMREM_T
      !IT_TARGET_ADD_COMREM_O type BUS_EI_BUPA_COMREM_T
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_ST_RESULT_T .
  methods COMPARE_VEND_AS_SOURCE_ADDRESS
    importing
      !IS_SOURCE_ADD type CVIS_EI_ADDRESS1
      !IS_TARGET_ADD type CVIS_EI_ADDRESS1
      !IT_TARGET_ADD_ORG type BUS_EI_EXTERN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_VEND_AS_SOURCE_BANK
    importing
      !IT_SOURCE_BNK type CVIS_EI_BANKDETAIL_T
      !IT_TARGET_BNK type CVIS_EI_BANKDETAIL_T
      !IT_TARGET_BNK_ORG type BUS_EI_EXTERN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_VEND_AS_SOURCE_GENERAL
    importing
      !IS_SOURCE_GEN type VMDS_EI_CENTRAL_DATA
      !IS_TARGET_GEN type VMDS_EI_CENTRAL_DATA
      !IT_TARGET_GEN_ORG type BUS_EI_EXTERN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_VEND_AS_SOURCE_IND
    importing
      !IS_SOURCE_IND type VMDS_EI_EXTERN
      !IS_TARGET_IND type VMDS_EI_EXTERN
      !IT_TARGET_IND_ORG type BUS_EI_EXTERN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_VEND_AS_SOURCE_TAX
    importing
      !IS_SOURCE_TAX type VMDS_EI_CENTRAL_DATA
      !IS_TARGET_TAX type VMDS_EI_CENTRAL_DATA
      !IT_TARGET_TAX_ORG type BUS_EI_EXTERN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_CUST_AS_SOURCE_ADDRESS
    importing
      !IS_SOURCE_ADD type CVIS_EI_ADDRESS1
      !IS_TARGET_ADD type CVIS_EI_ADDRESS1
      !IT_TARGET_ADD_ORG type BUS_EI_EXTERN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_CUST_AS_SOURCE_GENERAL
    importing
      !IS_SOURCE_GEN type CMDS_EI_CENTRAL_DATA
      !IS_TARGET_GEN type CMDS_EI_CENTRAL_DATA
      !IT_TARGET_GEN_ORG type BUS_EI_EXTERN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_BP_AS_SOURCE_ADDRESS
    importing
      !IT_SOURCE_ADD type BUS_EI_BUPA_ADDRESS_T
      !IT_TARGET_ADD type BUS_EI_BUPA_ADDRESS_T
      !IT_TARGET_ORG type ANY
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_BP_AS_SOURCE_COMM
    importing
      !IS_SOURCE_COMM type BUS_EI_COMMUNICATION
      !IS_TARGET_COMM type BUS_EI_COMMUNICATION
      !IS_TARGET_ORG type ANY
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_BP_AS_SOURCE_VERSION
    importing
      !IT_SOURCE_VER type BUS_EI_BUPA_VERSION_T
      !IT_TARGET_VER type BUS_EI_BUPA_VERSION_T
      !IT_TARGET_ORG type ANY
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_BP_AS_SOURCE_GENERAL
    importing
      !IS_SOURCE_GEN type BUS_EI_BUPA_CENTRAL
      !IS_TARGET_GEN type BUS_EI_BUPA_CENTRAL
      !IS_TARGET_ORG type ANY
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_BP_AS_SOURCE_BANK
    importing
      !IT_SOURCE_BNK type BUS_EI_BUPA_BANKDETAIL_T
      !IT_TARGET_BNK type BUS_EI_BUPA_BANKDETAIL_T
      !IT_TARGET_ORG type ANY
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_BP_AS_SOURCE_TAX
    importing
      !IV_STANDARD_COUNTRY type INTCA
      !IT_SOURCE_TAX type BUS_EI_BUPA_TAXNUMBER_T
      !IT_TARGET_TAX type BUS_EI_BUPA_TAXNUMBER_T
      !IT_TARGET_ORG type ANY
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_BP_AS_SOURCE_CREDIT
    importing
      !IT_SOURCE_CREDIT type BUS_EI_BUPA_CREDITCARD_T
      !IT_TARGET_CREDIT type BUS_EI_BUPA_CREDITCARD_T
      !IT_TARGET_ORG type ANY
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_BP_AS_SOURCE_INDUSTRY
    importing
      !IT_SOURCE_IND type BUS_EI_BUPA_INDUSTRYSECTOR_T
      !IT_TARGET_IND type BUS_EI_BUPA_INDUSTRYSECTOR_T
      !IT_TARGET_ORG type ANY
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_BP_AS_SOURCE_TPARTNER
    importing
      !IS_SOURCE_TRADING type FSBP_EI_STRUC_CENTRL
      !IS_TARGET_TRADING type FSBP_EI_STRUC_CENTRL
      !IS_TARGET_ORG type ANY
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_BP_AS_SOURCE_REL
    importing
      !IS_SOURCE_MAIN_PARTNER type BUS_EI_EXTERN
      !IS_SOURCE_REL_PARTNER type BUS_EI_EXTERN
      !IS_TARGET_MAIN_PARTNER type BUS_EI_EXTERN
      !IS_TARGET_REL_PARTNER type BUS_EI_EXTERN
      !IS_SOURCE_RELATIONSHIP type BURS_EI_EXTERN
      !IS_TARGET_RELATIONSHIP type BURS_EI_EXTERN
      !IS_CUST_CONTACT type CMDS_EI_CONTACTS
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISP_ST_RELATIONSHIP .
  methods COMPARE_BP_AS_SRC_REL_PVT_ADD
    importing
      !IT_SOURCE_ADDRESS type BUS_EI_BUPA_ADDRESS_T
      !IT_TARGET_ADDRESS type BUS_EI_BUPA_ADDRESS_T
      !IT_ORIGINAL_PVT_ADD type CVIS_EI_ADDRESS2
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISP_ST_RELATIONSHIP .
  methods COMPARE_BP_AS_SOURCE_REL_BH
    importing
      !IT_SOURCE_REL_BH type BUS_EI_BUPA_HOURS_T
      !IT_TARGET_REL_BH type BUS_EI_BUPA_HOURS_T
      !IT_TARGET_ORG type ANY
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_VEND_AS_SOURCE_COMM
    importing
      !IS_SOURCE_ADD_COMM type CVIS_EI_CVI_COMMUNICATION
      !IS_TARGET_ADD_COMM type CVIS_EI_CVI_COMMUNICATION
      !IS_TARGET_ADD_COMM_O type BUS_EI_COMMUNICATION
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISP_ST_COMM .
  methods COMPARE_CUST_AS_SOURCE_COMM
    importing
      !IS_SOURCE_ADD_COMM type CVIS_EI_CVI_COMMUNICATION
      !IS_TARGET_ADD_COMM type CVIS_EI_CVI_COMMUNICATION
      !IS_TARGET_ADD_COMM_O type BUS_EI_COMMUNICATION
      !IV_DATASET type MDS_CMPT_DATASET_ID
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISP_ST_COMM .
  methods COMPARE_VEND_AS_SOURCE_VERSION
    importing
      !IT_SOURCE_ADD_VER type CVI_EI_VERSION_TYPE1_T
      !IT_TARGET_ADD_VER type CVI_EI_VERSION_TYPE1_T
      !IT_TARGET_ADD_VER_OR type BUS_EI_BUPA_VERSION_T
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_ST_RESULT_T .
  methods COMPARE_CUST_AS_SOURCE_VERSION
    importing
      !IT_SOURCE_ADD_VER type CVI_EI_VERSION_TYPE1_T
      !IT_TARGET_ADD_VER type CVI_EI_VERSION_TYPE1_T
      !IT_TARGET_ADD_VER_OR type BUS_EI_BUPA_VERSION_T
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_ST_RESULT_T .
  methods COMPARE_CUST_AS_SOURCE_TAX
    importing
      !IS_SOURCE_TAX type CMDS_EI_CENTRAL_DATA
      !IS_TARGET_TAX type CMDS_EI_CENTRAL_DATA
      !IT_TARGET_TAX_ORG type BUS_EI_EXTERN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_CUST_AS_SOURCE_IND
    importing
      !IT_SOURCE_IND type CMDS_EI_EXTERN
      !IT_TARGET_IND type CMDS_EI_EXTERN
      !IT_TARGET_IND_ORG type BUS_EI_EXTERN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_CUST_AS_SOURCE_BANK
    importing
      !IT_SOURCE_BNK type CVIS_EI_BANKDETAIL_T
      !IT_TARGET_BNK type CVIS_EI_BANKDETAIL_T
      !IT_TARGET_BNK_ORG type BUS_EI_EXTERN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_CUST_AS_SOURCE_CREDIT
    importing
      !IT_SOURCE_CREDIT type CMDS_EI_CREDITCARD_T
      !IT_TARGET_CREDIT type CMDS_EI_CREDITCARD_T
      !IT_TARGET_CREDIT_ORG type BUS_EI_EXTERN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_CUST_AS_SOURCE_TRADING
    importing
      !IS_SOURCE_TRADING type CMDS_EI_CENTRAL_DATA
      !IS_TARGET_TRADING type CMDS_EI_CENTRAL_DATA
      !IS_TARGET_TRADING_OR type FSBP_EI_STRUC_CENTRL
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
    changing
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_CUST_AS_SOURCE_REL
    importing
      !IS_SOURCE_REL type CMDS_EI_CONTACTS
      !IS_TARGET_REL type CMDS_EI_CONTACTS
      !IS_TARGET_REL_ORG type BURS_EI_EXTERN
      !IS_TARGET_REL_PARTNER type BUS_EI_EXTERN
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISP_ST_RELATIONSHIP .
  methods COMPARE_CUST_AS_SOURCE_REL_GEN
    importing
      !IS_SOURCE_REL_GEN type CMDS_EI_CONTACTS
      !IS_TARGET_REL_GEN type CMDS_EI_CONTACTS
      !IS_TARGET_REL_GEN_OR type BURS_EI_EXTERN
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !CT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T .
  methods COMPARE_CUST_AS_SRC_REL_CT_ADR
    importing
      !IS_SOURCE_REL_CT_ADD type CVIS_EI_ADDRESS1
      !IS_TARGET_REL_CT_ADD type CVIS_EI_ADDRESS1
      !IT_TARGET_REL_ADD type BURS_EI_REL_ADDRESS_T
      !IT_TARGET_REL_PT_ADD type BUS_EI_BUPA_ADDRESS_T
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISP_ST_ADDRESS .
  methods COMPARE_CUST_AS_SRC_REL_PV_ADR
    importing
      !IS_SOURCE_REL_PVT_AD type CVIS_EI_ADDRESS2
      !IS_TARGET_REL_PVT_AD type CVIS_EI_ADDRESS2
      !IT_TARGET_REL_PVT_AD_ORG type BUS_EI_BUPA_ADDRESS_T
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISP_ST_ADDRESS .
  methods COMPARE_CUST_AS_SRC_REL_BUS_HR
    importing
      !IS_SOURCE_REL_BH type CMDS_EI_CONTACTS
      !IS_TARGET_REL_BH type CMDS_EI_CONTACTS
      !IT_TARGET_REL_BH_ORG type BAPIBUS1006_RULE_W_T
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_ST_RESULT_T .
  methods GET_FIELD_DESCRIPTION
    importing
      !TABNAME type TABNAME
      !FIELDNAME type FIELDNAME optional
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS .
  methods COMPARE_AND_FILL
    importing
      !IV_DATASET type MDS_CMPT_DATASET_ID
      !IS_SOURCE type ANY
      !IS_TARGET type ANY
      !IS_MAPPED_TARGET type ANY
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_RESULT_STRUCTURE type MDS_CMPT_DISPLAY_ST_RESULT_T .
  methods HANDLE_ERROR
    importing
      !IT_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
    changing
      !CT_MESSAGES type MDS_CTRLS_ERROR_OBJECTS .
  methods COMPARE_BP_AS_SRC_PVT_ADD_VER
    importing
      !IT_SOURCE_VER type BUS_EI_BUPA_VERSION_T
      !IT_TARGET_VER type BUS_EI_BUPA_VERSION_T
      !IT_CUST_VER type CVI_EI_VERSION_TYPE2_T
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISP_ST_RELATIONSHIP .
  methods COMPARE_BP_AS_SRC_REL_BUS_ADD
    importing
      !IT_SRC_PARTNER_ADDRESS type BUS_EI_BUPA_ADDRESS_T
      !IT_TAR_PARTNER_ADDRESS type BUS_EI_BUPA_ADDRESS_T
      !IT_SRC_REL_ADDRESS type BURS_EI_REL_ADDRESS_T
      !IT_TAR_REL_ADDRESS type BURS_EI_REL_ADDRESS_T
      !IT_ORG_BUS_ADDRESS type CVIS_EI_ADDRESS1
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISP_ST_RELATIONSHIP .
  methods COMPARE_BP_AS_SRC_REL_BUS_HOUR
    importing
      !IT_SOURCE_WEEKLY_BH type BAPIBUS1006_RULE_W_T
      !IT_TARGET_WEEKLY_BH type BAPIBUS1006_RULE_W_T
      !IS_CUST_CONTACT type CMDS_EI_CONTACTS
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISP_ST_RELATIONSHIP .
  methods COMPARE_BP_AS_SRC_REL_COMM
    importing
      !IS_SOURCE_COMM type BUS_EI_COMMUNICATION
      !IS_TARGET_COMM type BUS_EI_COMMUNICATION
      !IS_ORIGINAL_COMM type CVIS_EI_CVI_COMMUNICATION
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISP_ST_COMM .
  methods COMPARE_BP_AS_SRC_BUS_ADD_VER
    importing
      !IT_SOURCE_VER type BUS_EI_BUPA_VERSION_T
      !IT_TARGET_VER type BUS_EI_BUPA_VERSION_T
      !IT_CUST_VER type CVI_EI_VERSION_TYPE1_T
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISP_ST_RELATIONSHIP .
  methods COMPARE_CUST_AS_SOURCE_REM
    importing
      !IT_SOURCE_REM type CVIS_EI_REM_T
      !IT_TARGET_REM type CVIS_EI_REM_T
      !IT_TARGET_ORG_REM type BUS_EI_BUPA_ADDRESSREMARK_T
      !IV_DATASET type MDS_CMPT_DATASET_ID
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_ST_RESULT_T .
  methods COMPARE_CUST_AS_SRC_PT_ADD_VER
    importing
      !IT_SOURCE_ADD_VER type CVI_EI_VERSION_TYPE2_T
      !IT_TARGET_ADD_VER type CVI_EI_VERSION_TYPE2_T
      !IT_TARGET_ADD_VER_OR type BUS_EI_BUPA_VERSION_T
      !IV_DATASET type MDS_CMPT_DATASET_ID
    exporting
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS
      !EV_INCONSISTENT type BOOLEAN
    changing
      !CS_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_ST_RESULT_T .
ENDCLASS.



CLASS CL_MDS_CMPT_COMPARE IMPLEMENTATION.


METHOD compare_and_fill.
  DATA : lr_type_descr    TYPE REF TO cl_abap_typedescr,
         lv_temp          TYPE string,
         lv_type          TYPE string,
         ls_source        TYPE REF TO data,
         ls_target        TYPE REF TO data,
         ls_mapped_target TYPE REF TO data,
         lt_map_fld       LIKE gt_map_fld,
         ls_map_fld       LIKE LINE OF gt_map_fld,
         ls_result_st     TYPE mds_cmpt_display_st_result,
         lv_label         TYPE string,
         ls_message       TYPE bapiret2.

  CONSTANTS : lc_seperator TYPE c VALUE '='.

  FIELD-SYMBOLS : <ls_source>              TYPE any,
                  <ls_target>              TYPE any,
                  <ls_mapped_target>       TYPE any,
                  <lv_source_value>        TYPE any,
                  <lv_target_value>        TYPE any,
                  <lv_mapped_target_value> TYPE any.


*initialize exporting parameters
  CLEAR : et_messages , ev_inconsistent.

*Step 1 : Initialize types
*get the type of source structure
  CLEAR : lr_type_descr , lv_temp , lv_type.
  CALL METHOD cl_abap_typedescr=>describe_by_data
    EXPORTING
      p_data      = is_source
    RECEIVING
      p_descr_ref = lr_type_descr.

  SPLIT lr_type_descr->absolute_name
        AT lc_seperator
        INTO lv_temp lv_type.

  CREATE DATA ls_source TYPE (lv_type).
  ASSIGN ls_source->* TO <ls_source>.
  <ls_source> = is_source.

*get the type of target structure
  CLEAR : lr_type_descr , lv_temp , lv_type.
  CALL METHOD cl_abap_typedescr=>describe_by_data
    EXPORTING
      p_data      = is_target
    RECEIVING
      p_descr_ref = lr_type_descr.

  SPLIT lr_type_descr->absolute_name
        AT lc_seperator
        INTO lv_temp lv_type.

  CREATE DATA ls_target TYPE (lv_type).
  ASSIGN ls_target->* TO <ls_target>.
  <ls_target> = is_target.

*get the type of mapped target structure
  CLEAR : lr_type_descr , lv_temp , lv_type.
  CALL METHOD cl_abap_typedescr=>describe_by_data
    EXPORTING
      p_data      = is_mapped_target
    RECEIVING
      p_descr_ref = lr_type_descr.

  SPLIT lr_type_descr->absolute_name
        AT lc_seperator
        INTO lv_temp lv_type.

  CREATE DATA ls_mapped_target TYPE (lv_type).
  ASSIGN ls_mapped_target->* TO <ls_mapped_target>.
  <ls_mapped_target> = is_mapped_target.


*Step 2 : Fetch field mapping information from mdse_cmp_map_fld

  IF gt_map_fld IS INITIAL.
    SELECT * FROM mdse_cmp_map_fld INTO TABLE gt_map_fld.
  ENDIF.

*Step 3 : Compare and Fill
  IF gt_map_fld IS NOT INITIAL.
    LOOP AT gt_map_fld INTO ls_map_fld
         WHERE cmp_id = gv_cmp_id
           AND dataset_id = iv_dataset.

      CLEAR : ls_result_st , lv_label , ls_message.

      UNASSIGN <lv_source_value>.
      UNASSIGN <lv_mapped_target_value>.
      UNASSIGN <lv_target_value>.

      ls_result_st-source_table = ls_map_fld-source_table.
      ls_result_st-source_field = ls_map_fld-source_field.

      ls_result_st-target_table = ls_map_fld-target_table.
      ls_result_st-target_field = ls_map_fld-target_field.

      CALL FUNCTION 'DDIF_FIELDLABEL_GET'
        EXPORTING
          tabname        = ls_map_fld-source_table
          fieldname      = ls_map_fld-source_field
          langu          = sy-langu
        IMPORTING
          label          = lv_label
        EXCEPTIONS
          not_found      = 1
          internal_error = 2
          OTHERS         = 3.

      IF sy-subrc <> 0.
        CALL METHOD fsbp_generic_services=>new_message
          EXPORTING
            i_class_id = 'CVI_TOOLS_SUPPORT'
            i_type     = fsbp_generic_services=>msg_warning
            i_number   = '133'
          RECEIVING
            r_message  = ls_message.
        APPEND ls_message TO et_messages-messages.
      ENDIF.

      ls_result_st-field_descr = lv_label.

      TRY.

          ASSIGN COMPONENT ls_map_fld-source_str_field OF STRUCTURE <ls_source>
                                                       TO <lv_source_value>.

          ASSIGN COMPONENT ls_map_fld-source_str_field OF STRUCTURE <ls_mapped_target>
                                                       TO <lv_mapped_target_value>.

          ASSIGN COMPONENT ls_map_fld-target_str_field OF STRUCTURE <ls_target>
                                                       TO <lv_target_value>.

          IF <lv_source_value> IS ASSIGNED
           AND <lv_mapped_target_value> IS ASSIGNED
           AND <lv_target_value> IS ASSIGNED.

            IF <lv_source_value> = <lv_mapped_target_value>.
              ls_result_st-consistent = gc_true.
            ELSE.
              ls_result_st-consistent = gc_false.
              ev_inconsistent = gc_true.
            ENDIF.

            ls_result_st-source_value = <lv_source_value>.
            ls_result_st-target_value = <lv_target_value>.

            APPEND ls_result_st TO cs_result_structure.

          ENDIF.

        CATCH cx_root.
          CONTINUE.
      ENDTRY.

    ENDLOOP.
  ENDIF.
ENDMETHOD.


METHOD compare_bp_as_source.

  DATA : lr_type_descr        TYPE REF TO cl_abap_typedescr,
         lt_messages          TYPE mds_ctrls_error_objects,
         ls_message           TYPE bapiret2,
         ls_source_st         TYPE bus_ei_extern,
         ls_target_st         TYPE bus_ei_extern,
         ls_source_main_par   TYPE bus_ei_extern,
         ls_source_rel_par    TYPE bus_ei_extern,
         ls_target_main_par   TYPE bus_ei_extern,
         ls_target_rel_par    TYPE bus_ei_extern,
         ls_source_rel        TYPE burs_ei_extern,
         ls_target_rel        TYPE burs_ei_extern,
         ls_source_address    TYPE bus_ei_bupa_address,
         lt_target_org        TYPE REF TO data,
         lt_target_cust       TYPE cmds_ei_main,
         ls_target_cust       TYPE cmds_ei_extern,
         lt_target_vend       TYPE vmds_ei_main,
         ls_target_vend       TYPE vmds_ei_extern,
         ls_display_structure TYPE mds_cmpt_display_structure,
         lv_tabix             TYPE sy-tabix,
         lv_disp_st_index     TYPE sy-tabix,
         lv_inconsistent_temp TYPE boolean,
         lv_inconsistent      TYPE boolean,
         lv_country(2)        TYPE c,
         ls_cust_ct_link      LIKE LINE OF gt_cust_ct_link,
         ls_contact           TYPE cmds_ei_contacts,
         ls_rel_disp_st       TYPE mds_cmpt_disp_st_relationship.

  FIELD-SYMBOLS : <lt_target_org> TYPE any,
                  <ls_target_org> TYPE any.

*initialize exporting parameters
  CLEAR et_messages.

*get the type of original structure
  CALL METHOD cl_abap_typedescr=>describe_by_data
    EXPORTING
      p_data      = is_target_org
    RECEIVING
      p_descr_ref = lr_type_descr.

*set global source and target objects
  gv_source_object = gc_bp.

  IF lr_type_descr->absolute_name = '\TYPE=CMDS_EI_MAIN'.
    gv_target_object = gc_customer.
    CREATE DATA lt_target_org TYPE cmds_ei_main.
    ASSIGN lt_target_org->* TO <lt_target_org>.
    <lt_target_org> = is_target_org.
    lt_target_cust  = <lt_target_org>.
  ELSEIF lr_type_descr->absolute_name = '\TYPE=VMDS_EI_MAIN'.
    gv_target_object = gc_vendor.
    CREATE DATA lt_target_org TYPE vmds_ei_main.
    ASSIGN lt_target_org->* TO <lt_target_org>.
    <lt_target_org> = is_target_org.
    lt_target_vend  = <lt_target_org>.
  ENDIF.

* Store the compare process id
  IF gv_cmp_id IS INITIAL.
    SELECT SINGLE cmp_id FROM mdse_cmpt_proc INTO gv_cmp_id
                         WHERE source_object = gv_source_object
                           AND target_object = gv_target_object.

  ENDIF.
* Store the customer contact link
  IF gt_cust_ct_link IS INITIAL.
    SELECT * FROM cvi_cust_ct_link INTO TABLE gt_cust_ct_link.   "#EC CI_NOWHERE
  ENDIF.

*call individual compare methods
*STEP 1 : PROCESS PARTNER DATA
  LOOP AT is_source_st-partners INTO ls_source_st.
    lv_tabix = sy-tabix.
    READ TABLE is_target_st-partners INTO ls_target_st
         WITH KEY header-object_instance-bpartner = ls_source_st-header-object_instance-bpartner.
    IF gv_target_object = gc_customer.
      READ TABLE ct_display_structure INTO ls_display_structure
         WITH KEY source_object = ls_source_st-header-object_instance-bpartner.

      IF sy-subrc = 0.
        lv_disp_st_index = sy-tabix.
        READ TABLE lt_target_cust-customers ASSIGNING <ls_target_org>
           WITH KEY header-object_instance-kunnr = ls_display_structure-target_object.
        ls_target_cust = <ls_target_org>.
* these partners are relationship partners which do not have corresponding customers
* they are mapped to the contact persons of the customer
      ELSE.
        CLEAR : ls_source_st , ls_target_st.
        CONTINUE.
      ENDIF.
    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ct_display_structure INTO ls_display_structure
         WITH KEY source_object = ls_source_st-header-object_instance-bpartner.
      IF sy-subrc = 0.
        lv_disp_st_index = sy-tabix.
        READ TABLE lt_target_vend-vendors ASSIGNING <ls_target_org>
           WITH KEY header-object_instance-lifnr = ls_display_structure-target_object.
        ls_target_vend = <ls_target_org>.
* these partners are relationship partners which do not have corresponding vendors
* they are mapped to the contact persons of the vendors
      ELSE.
        CLEAR : ls_source_st , ls_target_st.
        CONTINUE.
      ENDIF.
    ENDIF.

    READ TABLE it_datasets WITH KEY datasetname = gc_address
                                           flag = gc_true
                           TRANSPORTING NO FIELDS.

    IF sy-subrc = 0.

*1 General data
      CLEAR lt_messages.
      CALL METHOD compare_bp_as_source_general(
        EXPORTING
          is_source_gen        = ls_source_st-central_data-common
          is_target_gen        = ls_target_st-central_data-common
          is_target_org        = <ls_target_org>
        IMPORTING
          et_messages          = lt_messages
          ev_inconsistent      = lv_inconsistent_temp
        CHANGING
          ct_display_structure = ct_display_structure
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

*2 Address data
      CLEAR lt_messages.
      CALL METHOD compare_bp_as_source_address(
        EXPORTING
          it_source_add        = ls_source_st-central_data-address-addresses
          it_target_add        = ls_target_st-central_data-address-addresses
          it_target_org        = <ls_target_org>
        IMPORTING
          et_messages          = lt_messages
          ev_inconsistent      = lv_inconsistent_temp
        CHANGING
          ct_display_structure = ct_display_structure
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ENDIF.

    READ TABLE it_datasets WITH KEY datasetname = gc_bank
                                           flag = gc_true
                           TRANSPORTING NO FIELDS.

    IF sy-subrc = 0.
*3 Bank
      CLEAR lt_messages.
      CALL METHOD compare_bp_as_source_bank(
        EXPORTING
          it_source_bnk        = ls_source_st-central_data-bankdetail-bankdetails
          it_target_bnk        = ls_target_st-central_data-bankdetail-bankdetails
          it_target_org        = <ls_target_org>
        IMPORTING
          et_messages          = lt_messages
          ev_inconsistent      = lv_inconsistent_temp
        CHANGING
          ct_display_structure = ct_display_structure
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ENDIF.

    READ TABLE it_datasets WITH KEY datasetname = gc_tax
                                           flag = gc_true
                           TRANSPORTING NO FIELDS.

    IF sy-subrc = 0.
*4 Tax
      CLEAR lt_messages.
* get bp standard country
      READ TABLE ls_source_st-central_data-address-addresses INTO ls_source_address
           WITH KEY data-postal-data-standardaddress = gc_true.

      IF sy-subrc = 0.

        CALL METHOD compare_bp_as_source_tax(
          EXPORTING
            iv_standard_country  = ls_source_address-data-postal-data-countryiso
            it_source_tax        = ls_source_st-central_data-taxnumber-taxnumbers
            it_target_tax        = ls_target_st-central_data-taxnumber-taxnumbers
            it_target_org        = <ls_target_org>
          IMPORTING
            et_messages          = lt_messages
            ev_inconsistent      = lv_inconsistent_temp
          CHANGING
            ct_display_structure = ct_display_structure
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

      ENDIF.

    ENDIF.

    READ TABLE it_datasets WITH KEY datasetname = gc_industry
                                           flag = gc_true
                           TRANSPORTING NO FIELDS.

    IF sy-subrc = 0.

*5 Industry
      CLEAR lt_messages.
      CALL METHOD compare_bp_as_source_industry(
        EXPORTING
          it_source_ind        = ls_source_st-central_data-industry-industries
          it_target_ind        = ls_target_st-central_data-industry-industries
          it_target_org        = <ls_target_org>
        IMPORTING
          et_messages          = lt_messages
          ev_inconsistent      = lv_inconsistent_temp
        CHANGING
          ct_display_structure = ct_display_structure
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ENDIF.

    READ TABLE it_datasets WITH KEY datasetname = gc_ccard
                                           flag = gc_true
                           TRANSPORTING NO FIELDS.

    IF sy-subrc = 0.

*6 Credit card
      CLEAR lt_messages.
      CALL METHOD compare_bp_as_source_credit(
        EXPORTING
          it_source_credit     = ls_source_st-central_data-paycard-paycards
          it_target_credit     = ls_target_st-central_data-paycard-paycards
          it_target_org        = <ls_target_org>
        IMPORTING
          et_messages          = lt_messages
          ev_inconsistent      = lv_inconsistent_temp
        CHANGING
          ct_display_structure = ct_display_structure
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ENDIF.


*7 Trading partner
    CLEAR lt_messages.
    CALL METHOD compare_bp_as_source_tpartner(
      EXPORTING
        is_source_trading    = ls_source_st-finserv_data-common-data-fsbp_centrl
        is_target_trading    = ls_target_st-finserv_data-common-data-fsbp_centrl
        is_target_org        = <ls_target_org>
      IMPORTING
        et_messages          = lt_messages
        ev_inconsistent      = lv_inconsistent_temp
      CHANGING
        ct_display_structure = ct_display_structure
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).


    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

    READ TABLE it_datasets WITH KEY datasetname = gc_relationship
                                           flag = gc_true
                           TRANSPORTING NO FIELDS.

    IF sy-subrc = 0.

*STEP 2: PROCESS RELATIONSHIP DATA
*8 Relationship
      CLEAR lt_messages.

      LOOP AT is_source_st-relations INTO ls_source_rel
           WHERE header-object_instance-partner1-bpartner = ls_source_st-header-object_instance-bpartner
              OR header-object_instance-partner2-bpartner = ls_source_st-header-object_instance-bpartner.
        lv_tabix = sy-tabix.

        IF sy-subrc = 0.
* set source relationship partner
          IF ls_source_rel-header-object_instance-partner1-bpartner = ls_source_st-header-object_instance-bpartner.

            READ TABLE is_source_st-partners INTO ls_source_rel_par
                 WITH KEY header-object_instance-bpartner = ls_source_rel-header-object_instance-partner2-bpartner.

            ls_source_main_par = ls_source_st.

          ELSEIF ls_source_rel-header-object_instance-partner2-bpartner = ls_source_st-header-object_instance-bpartner.

            READ TABLE is_source_st-partners INTO ls_source_rel_par
                 WITH KEY header-object_instance-bpartner = ls_source_rel-header-object_instance-partner1-bpartner.

            ls_source_main_par = ls_source_st.

          ENDIF.

* read corresponding target relationship
          READ TABLE is_target_st-relations INTO ls_target_rel
               WITH KEY header-object_instance-partner1-bpartner = ls_source_rel-header-object_instance-partner1-bpartner
                        header-object_instance-partner2-bpartner = ls_source_rel-header-object_instance-partner2-bpartner.

* set target relationship partner
          IF ls_target_rel-header-object_instance-partner1-bpartner = ls_source_st-header-object_instance-bpartner.

            READ TABLE is_target_st-partners INTO ls_target_rel_par
                 WITH KEY header-object_instance-bpartner = ls_source_rel-header-object_instance-partner2-bpartner.

            ls_target_main_par = ls_source_st.

          ELSEIF ls_target_rel-header-object_instance-partner2-bpartner = ls_source_st-header-object_instance-bpartner.

            READ TABLE is_target_st-partners INTO ls_target_rel_par
                 WITH KEY header-object_instance-bpartner = ls_source_rel-header-object_instance-partner1-bpartner.

            ls_target_main_par = ls_source_st.

          ENDIF.

* read corresponding customer contact data
          READ TABLE gt_cust_ct_link INTO ls_cust_ct_link
               WITH KEY partner_guid = ls_source_rel-header-object_instance-partner1-bpartnerguid.

          IF sy-subrc <> 0.
            READ TABLE gt_cust_ct_link INTO ls_cust_ct_link
                 WITH KEY partner_guid = ls_source_rel-header-object_instance-partner2-bpartnerguid.
          ENDIF.

          READ TABLE ls_target_cust-central_data-contact-contacts INTO ls_contact
            WITH KEY data_key-parnr = ls_cust_ct_link-customer_cont.

* prepare relationship display structure to be passed
          READ TABLE ls_display_structure-data-relationship-data
          INTO ls_rel_disp_st INDEX lv_tabix.

          ls_rel_disp_st-person_id    = ls_source_rel_par-header-object_instance-bpartner.
          ls_rel_disp_st-ct_person_id = ls_contact-data_key-parnr.

          CALL METHOD compare_bp_as_source_rel(
            EXPORTING
              is_source_main_partner = ls_source_main_par
              is_source_rel_partner  = ls_source_rel_par
              is_target_main_partner = ls_target_main_par
              is_target_rel_partner  = ls_target_rel_par
              is_source_relationship = ls_source_rel
              is_target_relationship = ls_target_rel
              is_cust_contact        = ls_contact
            IMPORTING
              et_messages            = lt_messages
              ev_inconsistent        = lv_inconsistent_temp
            CHANGING
              cs_display_structure   = ls_rel_disp_st
              ).

* handle error
          CALL METHOD handle_error(
            EXPORTING
              it_messages = lt_messages
            CHANGING
              ct_messages = et_messages
              ).

          IF lv_inconsistent_temp = gc_true.
            lv_inconsistent = gc_true.
          ENDIF.

          IF ls_target_rel IS INITIAL.
            ls_display_structure-data-relationship-status = gc_error.
          ELSEIF lv_inconsistent = gc_true.
            ls_display_structure-data-relationship-status = gc_inconsistent.
          ELSEIF lv_inconsistent = gc_false.
            ls_display_structure-data-relationship-status = gc_consistent.
          ENDIF.

        ELSE.
          ls_display_structure-data-relationship-status = gc_notmaintained.
        ENDIF. "end of sy-subrc

        IF ls_rel_disp_st IS NOT INITIAL.
          APPEND ls_rel_disp_st TO ls_display_structure-data-relationship-data.
        ENDIF.

        MODIFY ct_display_structure FROM ls_display_structure INDEX lv_disp_st_index
               TRANSPORTING data-relationship.

      ENDLOOP.

    ENDIF.
* set overall status for the record
    IF lv_inconsistent IS INITIAL.
      ls_display_structure-consistent = gc_true.
    ELSEIF lv_inconsistent = gc_true.
      ls_display_structure-consistent = gc_false.
    ENDIF.

    MODIFY ct_display_structure FROM ls_display_structure INDEX lv_disp_st_index
           TRANSPORTING consistent.

    CLEAR : lv_tabix,
            lv_disp_st_index,
            lv_inconsistent,
            lv_country.

  ENDLOOP.

ENDMETHOD.


METHOD compare_bp_as_source_address.
  DATA : ls_source_address        TYPE bus_ei_bupa_address,
         ls_target_address        TYPE bus_ei_bupa_address,
         ls_original_st           TYPE REF TO data,
         ls_cmds_ei_extern        TYPE cmds_ei_extern,
         ls_vmds_ei_extern        TYPE vmds_ei_extern,
         ls_cust_address          TYPE cvis_ei_address1,
         ls_vend_address          TYPE cvis_ei_address1,
         ls_source_remark         TYPE bus_ei_bupa_addressremark,
         ls_target_remark         TYPE bus_ei_bupa_addressremark,
         ls_cust_remark           TYPE cvis_ei_rem,
         ls_vend_remark           TYPE cvis_ei_rem,
         lv_tabix                 TYPE sy-tabix,
         lv_display_st_tabix      TYPE sy-tabix,
         ls_display_structure     TYPE mds_cmpt_display_structure,
         ls_result_st             TYPE mds_cmpt_display_st_result,
         lv_inconsistent_temp     TYPE boolean,
         lv_inconsistent          TYPE boolean,
         lt_messages              TYPE mds_ctrls_error_objects.

  FIELD-SYMBOLS : <ls_original_st> TYPE ANY.

* initialize exporting parameters
  CLEAR : et_messages , ev_inconsistent.

* create target data
  IF gv_target_object = gc_customer.
    CREATE DATA ls_original_st TYPE cmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = it_target_org.
    ls_cmds_ei_extern = <ls_original_st>.
    ls_cust_address   = ls_cmds_ei_extern-central_data-address.
    READ TABLE ct_display_structure INTO ls_display_structure
               with key target_object = ls_cmds_ei_extern-header-object_instance-kunnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ELSEIF gv_target_object = gc_vendor.
    CREATE DATA ls_original_st TYPE vmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = it_target_org.
    ls_vmds_ei_extern = <ls_original_st>.
    ls_vend_address   = ls_vmds_ei_extern-central_data-address.
    READ TABLE ct_display_structure INTO ls_display_structure
               with key target_object = ls_vmds_ei_extern-header-object_instance-lifnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ENDIF.

  IF it_source_add IS NOT INITIAL.
    READ TABLE it_source_add INTO ls_source_address
         with key data-postal-data-standardaddress = gc_true.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    READ TABLE it_target_add INTO ls_target_address INDEX 1.

    ls_result_st-sequence_number = 1.

    IF gv_target_object = gc_customer.

*Compare Postal data
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_address-data-postal-data
          is_target           = ls_cust_address-postal-data
          is_mapped_target    = ls_target_address-data-postal-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-postal
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).


      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

*Compare Remarks data
      LOOP AT ls_source_address-data-remark-remarks INTO ls_source_remark.
        lv_tabix = sy-tabix.
        READ TABLE ls_target_address-data-remark-remarks INTO ls_target_remark INDEX lv_tabix.
        READ TABLE ls_cust_address-remark-remarks INTO ls_cust_remark INDEX lv_tabix.

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = ls_source_remark
            is_target           = ls_cust_remark
            is_mapped_target    = ls_target_remark
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-remarks
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).


        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

        CLEAR : ls_source_remark , ls_target_remark , ls_cust_remark , lv_tabix.
      ENDLOOP.


    ELSEIF gv_target_object = gc_vendor.
*Compare Postal data
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_address-data-postal-data
          is_target           = ls_vend_address-postal-data
          is_mapped_target    = ls_target_address-data-postal-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-postal
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).


      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

*Compare Remarks data
      LOOP AT ls_source_address-data-remark-remarks INTO ls_source_remark.
        lv_tabix = sy-tabix.
        READ TABLE ls_target_address-data-remark-remarks INTO ls_target_remark INDEX lv_tabix.
        READ TABLE ls_vend_address-remark-remarks INTO ls_vend_remark INDEX lv_tabix.

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = ls_source_remark-data
            is_target           = ls_vend_remark-data
            is_mapped_target    = ls_target_remark-data
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-remarks
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).


        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

        CLEAR : ls_source_remark , ls_target_remark , ls_vend_remark , lv_tabix.
      ENDLOOP.

    ENDIF.

    IF ls_display_structure-data-address-postal IS NOT INITIAL.

      MODIFY ls_display_structure-data-address-postal FROM ls_result_st
                                      TRANSPORTING sequence_number
                                             WHERE sequence_number = 0.

    ENDIF.

    IF ls_display_structure-data-address-remarks IS NOT INITIAL.

      MODIFY ls_display_structure-data-address-remarks FROM ls_result_st
                                      TRANSPORTING sequence_number
                                             WHERE sequence_number = 0.

    ENDIF.

*version comparison
    CLEAR lt_messages.
    CALL METHOD compare_bp_as_source_version(
      EXPORTING
        it_source_ver        = ls_source_address-data-version-versions
        it_target_ver        = ls_target_address-data-version-versions
        it_target_org        = it_target_org
      IMPORTING
        et_messages          = lt_messages
        ev_inconsistent      = lv_inconsistent_temp
      CHANGING
        ct_display_structure = ct_display_structure
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

*communication comparison
    CLEAR lt_messages.
    CALL METHOD compare_bp_as_source_comm(
      EXPORTING
        is_source_comm       = ls_source_address-data-communication
        is_target_comm       = ls_target_address-data-communication
        is_target_org        = it_target_org
      IMPORTING
        et_messages          = lt_messages
        ev_inconsistent      = lv_inconsistent_temp
      CHANGING
        ct_display_structure = ct_display_structure
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

*  set status for the dataset
    IF it_target_add IS INITIAL.
      ls_display_structure-data-address-status = gc_error.
    ELSEIF lv_inconsistent = gc_true.
      ls_display_structure-data-address-status = gc_inconsistent.
    ELSEIF ls_display_structure-data-address-status NE gc_inconsistent.
      ls_display_structure-data-address-status = gc_consistent.
    ENDIF.

  ELSE.
    ls_display_structure-data-address-status = gc_notmaintained.
  ENDIF.

  ev_inconsistent = lv_inconsistent.
* modify display structure
  MODIFY ct_display_structure FROM ls_display_structure INDEX lv_display_st_tabix.
ENDMETHOD.


METHOD compare_bp_as_source_bank.

  DATA : ls_source_bnk        TYPE bus_ei_bupa_bankdetail,
         ls_target_bnk        TYPE bus_ei_bupa_bankdetail,
         ls_original_st       TYPE REF TO data,
         ls_cmds_ei_extern    TYPE cmds_ei_extern,
         ls_vmds_ei_extern    TYPE vmds_ei_extern,
         lt_cust_bank         TYPE cvis_ei_bankdetail_t,
         ls_cust_bank         TYPE cvis_ei_cvi_bankdetail,
         lt_vend_bank         TYPE cvis_ei_bankdetail_t,
         ls_vend_bank         TYPE cvis_ei_cvi_bankdetail,
         lv_tabix             TYPE sy-tabix,
         lv_display_st_tabix  TYPE sy-tabix,
         ls_display_structure TYPE mds_cmpt_display_structure,
         lt_temp_result       TYPE mds_cmpt_display_st_result_t,
         ls_result_st         TYPE mds_cmpt_display_st_result,
         lv_seq_number        TYPE i,
         lv_inconsistent_temp TYPE boolean,
         lv_inconsistent      TYPE boolean,
         lt_messages          TYPE mds_ctrls_error_objects.

  FIELD-SYMBOLS : <ls_original_st> TYPE ANY.

* initialize exporting parameters
  CLEAR et_messages.

* create target data
  IF gv_target_object = gc_customer.
    CREATE DATA ls_original_st TYPE cmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = it_target_org.
    ls_cmds_ei_extern = <ls_original_st>.
    lt_cust_bank      = ls_cmds_ei_extern-central_data-bankdetail-bankdetails.
    READ TABLE ct_display_structure INTO ls_display_structure
               with key target_object = ls_cmds_ei_extern-header-object_instance-kunnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ELSEIF gv_target_object = gc_vendor.
    CREATE DATA ls_original_st TYPE vmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = it_target_org.
    ls_vmds_ei_extern = <ls_original_st>.
    lt_vend_bank      = ls_vmds_ei_extern-central_data-bankdetail-bankdetails.
    READ TABLE ct_display_structure INTO ls_display_structure
               with key target_object = ls_vmds_ei_extern-header-object_instance-lifnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ENDIF.

  IF it_source_bnk IS NOT INITIAL.

    LOOP AT it_source_bnk INTO ls_source_bnk.
      lv_tabix                     = sy-tabix.
      lv_seq_number                = lv_seq_number + 1.
      ls_result_st-sequence_number = lv_seq_number.

*   read individual bank details
      READ TABLE it_target_bnk INTO ls_target_bnk
                               with key data-bank_ctry = ls_source_bnk-data-bank_ctry
                                        data-bank_key  = ls_source_bnk-data-bank_key
                                        data-bank_acct = ls_source_bnk-data-bank_acct.


      IF gv_target_object = gc_customer.
        READ TABLE lt_cust_bank INTO ls_cust_bank
                                with key data_key-banks = ls_source_bnk-data-bank_ctry
                                         data_key-bankl = ls_source_bnk-data-bank_key
                                         data_key-bankn = ls_source_bnk-data-bank_acct.

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_bank
            is_source           = ls_source_bnk-data
            is_target           = ls_cust_bank-data_key
            is_mapped_target    = ls_target_bnk-data
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-bank-data
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_bank
            is_source           = ls_source_bnk-data
            is_target           = ls_cust_bank-data
            is_mapped_target    = ls_target_bnk-data
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-bank-data
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

      ELSEIF gv_target_object = gc_vendor.
        READ TABLE lt_vend_bank INTO ls_vend_bank
                                with key data_key-banks = ls_source_bnk-data-bank_ctry
                                         data_key-bankl = ls_source_bnk-data-bank_key
                                         data_key-bankn = ls_source_bnk-data-bank_acct.


        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_bank
            is_source           = ls_source_bnk-data
            is_target           = ls_vend_bank-data_key
            is_mapped_target    = ls_target_bnk-data
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-bank-data
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_bank
            is_source           = ls_source_bnk-data
            is_target           = ls_vend_bank-data
            is_mapped_target    = ls_target_bnk-data
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-bank-data
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

      ENDIF.

      IF ls_display_structure-data-bank-data IS NOT INITIAL.
        MODIFY ls_display_structure-data-bank-data FROM ls_result_st
               TRANSPORTING sequence_number
               WHERE sequence_number = 0.
      ENDIF.

      IF ls_display_structure-data-bank-data IS NOT INITIAL.
        APPEND LINES OF ls_display_structure-data-bank-data TO lt_temp_result.
        CLEAR ls_display_structure-data-bank-data.
      ENDIF.
    ENDLOOP.
    CLEAR ls_display_structure-data-bank-data.

    IF lt_temp_result IS NOT INITIAL.
      APPEND LINES OF lt_temp_result TO ls_display_structure-data-bank-data.
    ENDIF.

*  set status for the dataset
    IF it_target_bnk IS INITIAL.
      ls_display_structure-data-bank-status = gc_error.
    ELSEIF lv_inconsistent = gc_true.
      ls_display_structure-data-bank-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-bank-status = gc_consistent.
    ENDIF.

  ELSE.
    ls_display_structure-data-bank-status = gc_notmaintained.
  ENDIF.

  ev_inconsistent = lv_inconsistent.
* modify the display structure
  MODIFY ct_display_structure INDEX lv_display_st_tabix FROM ls_display_structure.

ENDMETHOD.


METHOD compare_bp_as_source_comm.
  DATA : ls_source_phone      TYPE bus_ei_bupa_telephone,
         ls_target_phone      TYPE bus_ei_bupa_telephone,
         ls_ecc_phone         TYPE cvis_ei_phone_str,
         ls_source_fax        TYPE bus_ei_bupa_fax,
         ls_target_fax        TYPE bus_ei_bupa_fax,
         ls_ecc_fax           TYPE cvis_ei_fax_str,
         ls_source_ttx        TYPE bus_ei_bupa_ttx,
         ls_target_ttx        TYPE bus_ei_bupa_ttx,
         ls_ecc_ttx           TYPE cvis_ei_ttx_str,
         ls_source_tlx        TYPE bus_ei_bupa_tlx,
         ls_target_tlx        TYPE bus_ei_bupa_tlx,
         ls_ecc_tlx           TYPE cvis_ei_tlx_str,
         ls_source_smtp       TYPE bus_ei_bupa_smtp,
         ls_target_smtp       TYPE bus_ei_bupa_smtp,
         ls_ecc_smtp          TYPE cvis_ei_smtp_str,
         ls_source_rml        TYPE bus_ei_bupa_rml,
         ls_target_rml        TYPE bus_ei_bupa_rml,
         ls_ecc_rml           TYPE cvis_ei_rml_str,
         ls_source_x400       TYPE bus_ei_bupa_x400,
         ls_target_x400       TYPE bus_ei_bupa_x400,
         ls_ecc_x400          TYPE cvis_ei_x400_str,
         ls_source_rfc        TYPE bus_ei_bupa_rfc,
         ls_target_rfc        TYPE bus_ei_bupa_rfc,
         ls_ecc_rfc           TYPE cvis_ei_rfc_str,
         ls_source_prt        TYPE bus_ei_bupa_prt,
         ls_target_prt        TYPE bus_ei_bupa_prt,
         ls_ecc_prt           TYPE cvis_ei_prt_str,
         ls_source_ssf        TYPE bus_ei_bupa_ssf,
         ls_target_ssf        TYPE bus_ei_bupa_ssf,
         ls_ecc_ssf           TYPE cvis_ei_ssf_str,
         ls_source_uri        TYPE bus_ei_bupa_uri,
         ls_target_uri        TYPE bus_ei_bupa_uri,
         ls_ecc_uri           TYPE cvis_ei_uri_str,
         ls_source_pager      TYPE bus_ei_bupa_pag,
         ls_target_pager      TYPE bus_ei_bupa_pag,
         ls_ecc_pager         TYPE cvis_ei_pag_str,
         ls_original_st       TYPE REF TO data,
         ls_cmds_ei_extern    TYPE cmds_ei_extern,
         ls_vmds_ei_extern    TYPE vmds_ei_extern,
         lv_tabix             TYPE sy-tabix,
         lv_display_st_tabix  TYPE sy-tabix,
         ls_display_structure TYPE mds_cmpt_display_structure,
         ls_result_st         TYPE mds_cmpt_display_st_result,
         lv_inconsistent_temp TYPE boolean,
         lv_inconsistent      TYPE boolean,
         ls_source_remark     TYPE bus_ei_bupa_comrem,
         ls_target_remark     TYPE bus_ei_bupa_comrem,
         ls_original_remark   TYPE cvis_ei_comrem,
         lt_messages          TYPE mds_ctrls_error_objects.

  FIELD-SYMBOLS : <ls_original_st> TYPE ANY.

* initialize exporting parameters
  CLEAR : et_messages , ev_inconsistent.

* create target data
  IF gv_target_object = gc_customer.
    CREATE DATA ls_original_st TYPE cmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = is_target_org.
    ls_cmds_ei_extern = <ls_original_st>.
    READ TABLE ct_display_structure INTO ls_display_structure
               with key target_object = ls_cmds_ei_extern-header-object_instance-kunnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ELSEIF gv_target_object = gc_vendor.
    CREATE DATA ls_original_st TYPE vmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = is_target_org.
    ls_vmds_ei_extern = <ls_original_st>.
    READ TABLE ct_display_structure INTO ls_display_structure
               with key target_object = ls_vmds_ei_extern-header-object_instance-lifnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ENDIF.

* set sequence number
  ls_result_st-sequence_number = 1.

* compare communication fields
* phone
  LOOP AT is_source_comm-phone-phone INTO ls_source_phone.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-phone-phone INTO ls_target_phone INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE ls_cmds_ei_extern-central_data-address-communication-phone-phone
                 INTO ls_ecc_phone INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_phone-contact-data
          is_target           = ls_ecc_phone-contact-data
          is_mapped_target    = ls_target_phone-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-phone-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ls_vmds_ei_extern-central_data-address-communication-phone-phone
                 INTO ls_ecc_phone INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_phone-contact-data
          is_target           = ls_ecc_phone-contact-data
          is_mapped_target    = ls_target_phone-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-phone-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ENDIF.

* Remarks
    LOOP AT ls_source_phone-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_phone-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_phone-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-phone-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* fax
  LOOP AT is_source_comm-fax-fax INTO ls_source_fax.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-fax-fax INTO ls_target_fax INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE ls_cmds_ei_extern-central_data-address-communication-fax-fax
                 INTO ls_ecc_fax INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_fax-contact-data
          is_target           = ls_ecc_fax-contact-data
          is_mapped_target    = ls_target_fax-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-fax-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ls_vmds_ei_extern-central_data-address-communication-fax-fax
                 INTO ls_ecc_fax INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_fax-contact-data
          is_target           = ls_ecc_fax-contact-data
          is_mapped_target    = ls_target_fax-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-fax-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ENDIF.

* Remarks
    LOOP AT ls_source_fax-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_fax-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_fax-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-fax-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* ttx
  LOOP AT is_source_comm-ttx-ttx INTO ls_source_ttx.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-ttx-ttx INTO ls_target_ttx INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE ls_cmds_ei_extern-central_data-address-communication-ttx-ttx
                 INTO ls_ecc_ttx INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_ttx-contact-data
          is_target           = ls_ecc_ttx-contact-data
          is_mapped_target    = ls_target_ttx-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-ttx-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ls_vmds_ei_extern-central_data-address-communication-ttx-ttx
                 INTO ls_ecc_ttx INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_ttx-contact-data
          is_target           = ls_ecc_ttx-contact-data
          is_mapped_target    = ls_target_ttx-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-ttx-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDIF.

* Remarks
    LOOP AT ls_source_ttx-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_ttx-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_ttx-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-ttx-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* tlx
  LOOP AT is_source_comm-tlx-tlx INTO ls_source_tlx.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-tlx-tlx INTO ls_target_tlx INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE ls_cmds_ei_extern-central_data-address-communication-tlx-tlx
                 INTO ls_ecc_tlx INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_tlx-contact-data
          is_target           = ls_ecc_tlx-contact-data
          is_mapped_target    = ls_target_tlx-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-tlx-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ls_vmds_ei_extern-central_data-address-communication-tlx-tlx
                 INTO ls_ecc_tlx INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_tlx-contact-data
          is_target           = ls_ecc_tlx-contact-data
          is_mapped_target    = ls_target_tlx-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-tlx-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDIF.

* Remarks
    LOOP AT ls_source_tlx-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_tlx-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_tlx-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-tlx-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.


* smtp
  LOOP AT is_source_comm-smtp-smtp INTO ls_source_smtp.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-smtp-smtp INTO ls_target_smtp INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE ls_cmds_ei_extern-central_data-address-communication-smtp-smtp
                 INTO ls_ecc_smtp INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_smtp-contact-data
          is_target           = ls_ecc_smtp-contact-data
          is_mapped_target    = ls_target_smtp-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-smtp-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ls_vmds_ei_extern-central_data-address-communication-smtp-smtp
                 INTO ls_ecc_smtp INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_smtp-contact-data
          is_target           = ls_ecc_smtp-contact-data
          is_mapped_target    = ls_target_smtp-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-smtp-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDIF.

* Remarks
    LOOP AT ls_source_smtp-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_smtp-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_smtp-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-smtp-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* rml
  LOOP AT is_source_comm-rml-rml INTO ls_source_rml.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-rml-rml INTO ls_target_rml INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE ls_cmds_ei_extern-central_data-address-communication-rml-rml
                 INTO ls_ecc_rml INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_rml-contact-data
          is_target           = ls_ecc_rml-contact-data
          is_mapped_target    = ls_target_rml-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-remote_mail_add-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ls_vmds_ei_extern-central_data-address-communication-rml-rml
                 INTO ls_ecc_rml INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_rml-contact-data
          is_target           = ls_ecc_rml-contact-data
          is_mapped_target    = ls_target_rml-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-remote_mail_add-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDIF.

* Remarks
    LOOP AT ls_source_rml-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_rml-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_rml-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-remote_mail_add-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* x400
  LOOP AT is_source_comm-x400-x400 INTO ls_source_x400.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-x400-x400 INTO ls_target_x400 INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE ls_cmds_ei_extern-central_data-address-communication-x400-x400
                 INTO ls_ecc_x400 INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_x400-contact-data
          is_target           = ls_ecc_x400-contact-data
          is_mapped_target    = ls_target_x400-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-x400-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ls_vmds_ei_extern-central_data-address-communication-x400-x400
                 INTO ls_ecc_x400 INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_x400-contact-data
          is_target           = ls_ecc_x400-contact-data
          is_mapped_target    = ls_target_x400-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-x400-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDIF.

* Remarks
    LOOP AT ls_source_x400-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_x400-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_x400-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-x400-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* rfc
  LOOP AT is_source_comm-rfc-rfc INTO ls_source_rfc.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-rfc-rfc INTO ls_target_rfc INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE ls_cmds_ei_extern-central_data-address-communication-rfc-rfc
                 INTO ls_ecc_rfc INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_rfc-contact-data
          is_target           = ls_ecc_rfc-contact-data
          is_mapped_target    = ls_target_rfc-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-rfc-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ls_vmds_ei_extern-central_data-address-communication-rfc-rfc
                 INTO ls_ecc_rfc INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_rfc-contact-data
          is_target           = ls_ecc_rfc-contact-data
          is_mapped_target    = ls_target_rfc-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-rfc-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDIF.

* Remarks
    LOOP AT ls_source_rfc-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_rfc-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_rfc-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-rfc-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* prt
  LOOP AT is_source_comm-prt-prt INTO ls_source_prt.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-prt-prt INTO ls_target_prt INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE ls_cmds_ei_extern-central_data-address-communication-prt-prt
                 INTO ls_ecc_prt INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_prt-contact-data
          is_target           = ls_ecc_prt-contact-data
          is_mapped_target    = ls_target_prt-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-prt-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ls_vmds_ei_extern-central_data-address-communication-prt-prt
                 INTO ls_ecc_prt INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_prt-contact-data
          is_target           = ls_ecc_prt-contact-data
          is_mapped_target    = ls_target_prt-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-prt-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDIF.

* Remarks
    LOOP AT ls_source_prt-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_prt-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_prt-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-prt-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* ssf
  LOOP AT is_source_comm-ssf-ssf INTO ls_source_ssf.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-ssf-ssf INTO ls_target_ssf INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE ls_cmds_ei_extern-central_data-address-communication-ssf-ssf
                 INTO ls_ecc_ssf INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_ssf-contact-data
          is_target           = ls_ecc_ssf-contact-data
          is_mapped_target    = ls_target_ssf-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-ssf-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ls_vmds_ei_extern-central_data-address-communication-ssf-ssf
                 INTO ls_ecc_ssf INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_ssf-contact-data
          is_target           = ls_ecc_ssf-contact-data
          is_mapped_target    = ls_target_ssf-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-ssf-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDIF.

* Remarks
    LOOP AT ls_source_ssf-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_ssf-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_ssf-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-ssf-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* uri
  LOOP AT is_source_comm-uri-uri INTO ls_source_uri.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-uri-uri INTO ls_target_uri INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE ls_cmds_ei_extern-central_data-address-communication-uri-uri
                 INTO ls_ecc_uri INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_uri-contact-data
          is_target           = ls_ecc_uri-contact-data
          is_mapped_target    = ls_target_uri-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-uri-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ls_vmds_ei_extern-central_data-address-communication-uri-uri
                 INTO ls_ecc_uri INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_uri-contact-data
          is_target           = ls_ecc_uri-contact-data
          is_mapped_target    = ls_target_uri-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-uri-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDIF.

* Remarks
    LOOP AT ls_source_uri-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_uri-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_uri-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-uri-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* pager
  LOOP AT is_source_comm-pager-pager INTO ls_source_pager.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-pager-pager INTO ls_target_pager INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE ls_cmds_ei_extern-central_data-address-communication-pager-pager
                 INTO ls_ecc_pager INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_pager-contact-data
          is_target           = ls_ecc_pager-contact-data
          is_mapped_target    = ls_target_pager-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-pager-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      READ TABLE ls_vmds_ei_extern-central_data-address-communication-pager-pager
                 INTO ls_ecc_pager INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_pager-contact-data
          is_target           = ls_ecc_pager-contact-data
          is_mapped_target    = ls_target_pager-contact-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-pager-contact
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDIF.

* Remarks
    LOOP AT ls_source_pager-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_pager-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_pager-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-pager-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

  IF ls_display_structure-data-address-communication-phone-contact IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-phone-contact FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.
  IF ls_display_structure-data-address-communication-phone-remarks IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-phone-remarks FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.

  IF ls_display_structure-data-address-communication-fax-contact IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-fax-contact FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.
  IF ls_display_structure-data-address-communication-fax-remarks IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-fax-remarks FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.

  IF ls_display_structure-data-address-communication-ttx-contact IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-ttx-contact FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.
  IF ls_display_structure-data-address-communication-ttx-remarks IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-ttx-remarks FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.

  IF ls_display_structure-data-address-communication-tlx-contact IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-tlx-contact FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.
  IF ls_display_structure-data-address-communication-tlx-remarks IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-tlx-remarks FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.

  IF ls_display_structure-data-address-communication-smtp-contact IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-smtp-contact FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.
  IF ls_display_structure-data-address-communication-smtp-remarks IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-smtp-remarks FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.

  IF ls_display_structure-data-address-communication-remote_mail_add-contact IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-remote_mail_add-contact FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.
  IF ls_display_structure-data-address-communication-remote_mail_add-remarks IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-remote_mail_add-remarks FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.

  IF ls_display_structure-data-address-communication-x400-contact IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-x400-contact FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.
  IF ls_display_structure-data-address-communication-x400-remarks IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-x400-remarks FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.

  IF ls_display_structure-data-address-communication-rfc-contact IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-rfc-contact FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.
  IF ls_display_structure-data-address-communication-rfc-remarks IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-rfc-remarks FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.

  IF ls_display_structure-data-address-communication-ssf-contact IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-ssf-contact FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.
  IF ls_display_structure-data-address-communication-ssf-remarks IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-ssf-remarks FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.

  IF ls_display_structure-data-address-communication-prt-contact IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-prt-contact FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.
  IF ls_display_structure-data-address-communication-prt-remarks IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-prt-remarks FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.

  IF ls_display_structure-data-address-communication-uri-contact IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-uri-contact FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.
  IF ls_display_structure-data-address-communication-uri-remarks IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-uri-remarks FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.

  IF ls_display_structure-data-address-communication-pager-contact IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-pager-contact FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.
  IF ls_display_structure-data-address-communication-pager-remarks IS NOT INITIAL.
    MODIFY ls_display_structure-data-address-communication-pager-remarks FROM ls_result_st
            TRANSPORTING sequence_number
            WHERE sequence_number = 0.
  ENDIF.

  ev_inconsistent = lv_inconsistent.
* modify display structure
  MODIFY ct_display_structure FROM ls_display_structure INDEX lv_display_st_tabix.
ENDMETHOD.


METHOD compare_bp_as_source_credit.

  DATA : ls_source_credit     TYPE bus_ei_bupa_creditcard,
         ls_target_credit     TYPE bus_ei_bupa_creditcard,
         ls_original_st       TYPE REF TO data,
         ls_cmds_ei_extern    TYPE cmds_ei_extern,
         lt_cust_credit       TYPE cmds_ei_creditcard_t,
         ls_cust_credit       TYPE cmds_ei_creditcard,
         lv_display_st_tabix  TYPE sy-tabix,
         ls_display_structure TYPE mds_cmpt_display_structure,
         lt_temp_result       TYPE mds_cmpt_display_st_result_t,
         ls_result_st         TYPE mds_cmpt_display_st_result,
         lv_seq_number        TYPE i,
         lv_inconsistent_temp TYPE boolean,
         lv_inconsistent      TYPE boolean,
         lt_messages          TYPE mds_ctrls_error_objects.

  FIELD-SYMBOLS : <ls_original_st> TYPE any.

* initialize exporting parameters
  CLEAR et_messages.

* create target data
  CREATE DATA ls_original_st TYPE cmds_ei_extern.
  ASSIGN ls_original_st->* TO <ls_original_st>.
  <ls_original_st>  = it_target_org.
  ls_cmds_ei_extern = <ls_original_st>.
  lt_cust_credit    = ls_cmds_ei_extern-central_data-creditcard-creditcard.
  READ TABLE ct_display_structure INTO ls_display_structure
             WITH KEY target_object = ls_cmds_ei_extern-header-object_instance-kunnr.

  IF sy-subrc <> 0.
    RETURN.
  ENDIF.
  lv_display_st_tabix = sy-tabix.

  IF it_source_credit IS NOT INITIAL.

    LOOP AT it_source_credit INTO ls_source_credit.
      lv_seq_number = lv_seq_number + 1.
      ls_result_st-sequence_number = lv_seq_number.
*   read individual credit card details
      READ TABLE it_target_credit INTO ls_target_credit
                       WITH KEY data-card_type = ls_source_credit-data-card_type
                                data-card_number = ls_source_credit-data-card_number.


      READ TABLE lt_cust_credit INTO ls_cust_credit
                                WITH KEY data_key-ccnum = ls_source_credit-data-card_number.

*  compare fields of credit cards
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_ccard
          is_source           = ls_source_credit-data
          is_target           = ls_cust_credit-data_key
          is_mapped_target    = ls_target_credit-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-credit-data
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_ccard
          is_source           = ls_source_credit-data
          is_target           = ls_cust_credit-data
          is_mapped_target    = ls_target_credit-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-credit-data
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

      IF ls_display_structure-data-credit-data IS NOT INITIAL.
        MODIFY ls_display_structure-data-credit-data FROM ls_result_st
               TRANSPORTING sequence_number
               WHERE sequence_number = 0.
      ENDIF.

      APPEND LINES OF ls_display_structure-data-credit-data TO lt_temp_result.
      CLEAR ls_display_structure-data-credit-data.
    ENDLOOP.

    CLEAR ls_display_structure-data-credit-data.
    APPEND LINES OF lt_temp_result TO ls_display_structure-data-credit-data.

*  set status for the dataset
    IF it_target_credit IS INITIAL.
      ls_display_structure-data-credit-status = gc_error.
    ELSEIF lv_inconsistent = gc_true.
      ls_display_structure-data-credit-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-credit-status = gc_consistent.
    ENDIF.

  ELSE.
    ls_display_structure-data-credit-status = gc_notmaintained.
  ENDIF.

  ev_inconsistent = lv_inconsistent.
* modify the display structure
  MODIFY ct_display_structure INDEX lv_display_st_tabix FROM ls_display_structure.

ENDMETHOD.


METHOD compare_bp_as_source_general.

  DATA : ls_source_gen        TYPE bus_ei_bupa_central,
         ls_target_gen        TYPE bus_ei_bupa_central,
         ls_original_st       TYPE REF TO data,
         ls_cmds_ei_extern    TYPE cmds_ei_extern,
         ls_vmds_ei_extern    TYPE vmds_ei_extern,
         ls_cust_gen          TYPE cmds_ei_central_data,
         ls_vend_gen          TYPE vmds_ei_central_data,
         lv_tabix             TYPE sy-tabix,
         lv_display_st_tabix  TYPE sy-tabix,
         ls_display_structure TYPE mds_cmpt_display_structure,
         ls_result_st         TYPE mds_cmpt_display_st_result,
         lv_inconsistent_temp TYPE boolean,
         lv_inconsistent      TYPE boolean,
         lt_messages          TYPE mds_ctrls_error_objects,
         ls_message           TYPE bapiret2.

  CONSTANTS : lc_person TYPE c VALUE '1',
              lc_org    TYPE c VALUE '2',
              lc_group  TYPE c VALUE '3'.

  FIELD-SYMBOLS : <ls_original_st> TYPE ANY.

* initialize exporting parameters
  CLEAR et_messages.

* create target data
  IF gv_target_object = gc_customer.
    CREATE DATA ls_original_st TYPE cmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = is_target_org.
    ls_cmds_ei_extern = <ls_original_st>.
    ls_cust_gen       = ls_cmds_ei_extern-central_data.
    READ TABLE ct_display_structure INTO ls_display_structure
               with key target_object = ls_cmds_ei_extern-header-object_instance-kunnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ELSEIF gv_target_object = gc_vendor.
    CREATE DATA ls_original_st TYPE vmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = is_target_org.
    ls_vmds_ei_extern = <ls_original_st>.
    ls_vend_gen       = ls_vmds_ei_extern-central_data.
    READ TABLE ct_display_structure INTO ls_display_structure
               with key target_object = ls_vmds_ei_extern-header-object_instance-lifnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ENDIF.

  IF is_source_gen IS NOT INITIAL.
    ls_result_st-sequence_number = 1.

    IF gv_target_object = gc_customer.

* compare fields of general data
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = is_source_gen-data-bp_centraldata
          is_target           = ls_cust_gen-central-data
          is_mapped_target    = is_target_gen-data-bp_centraldata
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-general
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = is_source_gen-data-bp_centraldata
          is_target           = ls_cust_gen-address-postal-data
          is_mapped_target    = is_target_gen-data-bp_centraldata
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-general
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

      IF is_source_gen-data-bp_control-category = lc_person. "Person

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = is_source_gen-data-bp_person
            is_target           = ls_cust_gen-central-data
            is_mapped_target    = is_target_gen-data-bp_person
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-general
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).


        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = is_source_gen-data-bp_person
            is_target           = ls_cust_gen-address-postal-data
            is_mapped_target    = is_target_gen-data-bp_person
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-general
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

      ELSEIF is_source_gen-data-bp_control-category = lc_org. "Organization

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = is_source_gen-data-bp_organization
            is_target           = ls_cust_gen-central-data
            is_mapped_target    = is_target_gen-data-bp_organization
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-general
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = is_source_gen-data-bp_organization
            is_target           = ls_cust_gen-address-postal-data
            is_mapped_target    = is_target_gen-data-bp_organization
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-general
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

      ELSEIF is_source_gen-data-bp_control-category = lc_group. "Group

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = is_source_gen-data-bp_group
            is_target           = ls_cust_gen-central-data
            is_mapped_target    = is_target_gen-data-bp_group
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-general
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = is_source_gen-data-bp_group
            is_target           = ls_cust_gen-address-postal-data
            is_mapped_target    = is_target_gen-data-bp_group
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-general
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

      ENDIF.

    ELSEIF gv_target_object = gc_vendor.

* compare fields of general data
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = is_source_gen-data-bp_centraldata
          is_target           = ls_vend_gen-central-data
          is_mapped_target    = is_target_gen-data-bp_centraldata
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-general
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = is_source_gen-data-bp_centraldata
          is_target           = ls_vend_gen-address-postal-data
          is_mapped_target    = is_target_gen-data-bp_centraldata
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-general
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

      IF is_source_gen-data-bp_control-category = lc_person. "Person

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = is_source_gen-data-bp_person
            is_target           = ls_vend_gen-central-data
            is_mapped_target    = is_target_gen-data-bp_person
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-general
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = is_source_gen-data-bp_person
            is_target           = ls_vend_gen-address-postal-data
            is_mapped_target    = is_target_gen-data-bp_person
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-general
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

      ELSEIF is_source_gen-data-bp_control-category = lc_org. "Organization

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = is_source_gen-data-bp_organization
            is_target           = ls_vend_gen-central-data
            is_mapped_target    = is_target_gen-data-bp_organization
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-general
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = is_source_gen-data-bp_organization
            is_target           = ls_vend_gen-address-postal-data
            is_mapped_target    = is_target_gen-data-bp_organization
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-general
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

      ELSEIF is_source_gen-data-bp_control-category = lc_group. "Group

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = is_source_gen-data-bp_group
            is_target           = ls_vend_gen-central-data
            is_mapped_target    = is_target_gen-data-bp_group
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-general
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

        CALL METHOD compare_and_fill(
          EXPORTING
            iv_dataset          = gc_address
            is_source           = is_source_gen-data-bp_group
            is_target           = ls_vend_gen-address-postal-data
            is_mapped_target    = is_target_gen-data-bp_group
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent_temp
          CHANGING
            cs_result_structure = ls_display_structure-data-address-general
            ).

* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).

        IF lv_inconsistent_temp = gc_true.
          lv_inconsistent = gc_true.
        ENDIF.

      ENDIF.
    ENDIF.

    IF ls_display_structure-data-address-general IS NOT INITIAL.
      MODIFY ls_display_structure-data-address-general FROM ls_result_st
             TRANSPORTING sequence_number
             WHERE sequence_number = 0.
    ENDIF.

*  set status for the dataset
    IF is_target_gen IS INITIAL.
      ls_display_structure-data-address-status = gc_error.
    ELSEIF lv_inconsistent = gc_true.
      ls_display_structure-data-address-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-address-status = gc_consistent.
    ENDIF.

  ELSE.
    ls_display_structure-data-address-status = gc_notmaintained.
  ENDIF.

  ev_inconsistent = lv_inconsistent.
* modify the display structure
  MODIFY ct_display_structure INDEX lv_display_st_tabix FROM ls_display_structure.
ENDMETHOD.


METHOD compare_bp_as_source_industry.

  DATA : ls_source_ind        TYPE bus_ei_bupa_industrysector,
         ls_target_ind        TYPE bus_ei_bupa_industrysector,
         ls_original_st       TYPE REF TO data,
         ls_cmds_ei_extern    TYPE cmds_ei_extern,
         ls_vmds_ei_extern    TYPE vmds_ei_extern,
         ls_cust_ind          TYPE cmds_ei_vmd_central_data,
         ls_vend_ind          TYPE vmds_ei_vmd_central_data,
         lv_tabix             TYPE sy-tabix,
         lv_display_st_tabix  TYPE sy-tabix,
         ls_display_structure TYPE mds_cmpt_display_structure,
         ls_result_st         TYPE mds_cmpt_display_st_result,
         lv_inconsistent_temp TYPE boolean,
         lv_inconsistent      TYPE boolean,
         lt_messages          TYPE mds_ctrls_error_objects.


  FIELD-SYMBOLS : <ls_original_st> TYPE any.

* create target data
  IF gv_target_object = gc_customer.
    CREATE DATA ls_original_st TYPE cmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = it_target_org.
    ls_cmds_ei_extern = <ls_original_st>.
    ls_cust_ind       = ls_cmds_ei_extern-central_data-central-data.
    READ TABLE ct_display_structure INTO ls_display_structure
               WITH KEY target_object = ls_cmds_ei_extern-header-object_instance-kunnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ELSEIF gv_target_object = gc_vendor.
    CREATE DATA ls_original_st TYPE vmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = it_target_org.
    ls_vmds_ei_extern = <ls_original_st>.
    ls_vend_ind       = ls_vmds_ei_extern-central_data-central-data.
    READ TABLE ct_display_structure INTO ls_display_structure
               WITH KEY target_object = ls_vmds_ei_extern-header-object_instance-lifnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ENDIF.

  IF it_source_ind IS NOT INITIAL.

*   read individual Industry details
    READ TABLE it_source_ind INTO ls_source_ind
                             WITH KEY data-ind_default = gc_true.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    lv_tabix = sy-tabix.
    ls_result_st-sequence_number = 1.

    READ TABLE it_target_ind INTO ls_target_ind INDEX lv_tabix.

*  compare fields of industry sector
    IF gv_target_object = gc_customer.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_industry
          is_source           = ls_source_ind-data_key
          is_target           = ls_cust_ind
          is_mapped_target    = ls_target_ind-data_key
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-industry-data
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_industry
          is_source           = ls_source_ind-data_key
          is_target           = ls_vend_ind
          is_mapped_target    = ls_target_ind-data_key
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-industry-data
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ENDIF.
    IF ls_display_structure-data-industry-data IS NOT INITIAL.
      MODIFY ls_display_structure-data-industry-data FROM ls_result_st
             TRANSPORTING sequence_number
             WHERE sequence_number = 0.
    ENDIF.

*  set status for the dataset
    IF it_target_ind IS INITIAL.
      ls_display_structure-data-industry-status = gc_error.
    ELSEIF lv_inconsistent = gc_true.
      ls_display_structure-data-industry-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-industry-status = gc_consistent.
    ENDIF.

  ELSE.
    ls_display_structure-data-industry-status = gc_notmaintained.
  ENDIF.

  ev_inconsistent = lv_inconsistent.
* modify the display structure
  MODIFY ct_display_structure INDEX lv_display_st_tabix FROM ls_display_structure.
ENDMETHOD.


METHOD compare_bp_as_source_rel.
  DATA : lt_messages          TYPE mds_ctrls_error_objects,
         ls_message           TYPE bapiret2,
         lv_inconsistent_temp TYPE boolean,
         lv_inconsistent      TYPE boolean,
         ls_result_st         TYPE mds_cmpt_display_st_result,
         lv_seq_number        TYPE i,
         ls_src_business_hour TYPE bus_ei_bupa_hours,
         ls_tar_business_hour TYPE bus_ei_bupa_hours.

* initialize exporting parameters
  CLEAR : et_messages, ev_inconsistent.

  ls_result_st-sequence_number = 1.

* compare fields of general relationship data
  CLEAR lt_messages.
  CALL METHOD compare_and_fill(
    EXPORTING
      iv_dataset          = gc_relationship
      is_source           = is_source_rel_partner-central_data-common-data-bp_person
      is_target           = is_cust_contact-address_type_3-postal-data
      is_mapped_target    = is_target_rel_partner-central_data-common-data-bp_person
    IMPORTING
      et_messages         = lt_messages
      ev_inconsistent     = lv_inconsistent_temp
    CHANGING
      cs_result_structure = cs_display_structure-data-relationship_data
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.

  CLEAR lt_messages.
  CALL METHOD compare_and_fill(
    EXPORTING
      iv_dataset          = gc_relationship
      is_source           = is_source_rel_partner-central_data-common-data-bp_centraldata
      is_target           = is_cust_contact-address_type_3-postal-data
      is_mapped_target    = is_target_rel_partner-central_data-common-data-bp_centraldata
    IMPORTING
      et_messages         = lt_messages
      ev_inconsistent     = lv_inconsistent_temp
    CHANGING
      cs_result_structure = cs_display_structure-data-relationship_data
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.

  CLEAR lt_messages.
  CALL METHOD compare_and_fill(
    EXPORTING
      iv_dataset          = gc_relationship
      is_source           = is_source_relationship-central_data-contact-central_data-data
      is_target           = is_cust_contact-data
      is_mapped_target    = is_target_relationship-central_data-contact-central_data-data
    IMPORTING
      et_messages         = lt_messages
      ev_inconsistent     = lv_inconsistent_temp
    CHANGING
      cs_result_structure = cs_display_structure-data-relationship_data
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.

  CLEAR lt_messages.
  CALL METHOD compare_and_fill(
    EXPORTING
      iv_dataset          = gc_relationship
      is_source           = is_source_rel_partner-central_data-common-data-bp_centraldata
      is_target           = is_cust_contact-address_type_3-postal-data
      is_mapped_target    = is_target_rel_partner-central_data-common-data-bp_centraldata
    IMPORTING
      et_messages         = lt_messages
      ev_inconsistent     = lv_inconsistent_temp
    CHANGING
      cs_result_structure = cs_display_structure-data-relationship_data
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.

  CLEAR lt_messages.
  CALL METHOD compare_and_fill(
    EXPORTING
      iv_dataset          = gc_relationship
      is_source           = is_source_rel_partner-central_data-common-data-bp_person
      is_target           = is_cust_contact-data
      is_mapped_target    = is_target_rel_partner-central_data-common-data-bp_person
    IMPORTING
      et_messages         = lt_messages
      ev_inconsistent     = lv_inconsistent_temp
    CHANGING
      cs_result_structure = cs_display_structure-data-relationship_data
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.


* compare private address
  CLEAR lt_messages.
  CALL METHOD compare_bp_as_src_rel_pvt_add(
    EXPORTING
      it_source_address    = is_source_rel_partner-central_data-address-addresses
      it_target_address    = is_target_rel_partner-central_data-address-addresses
      it_original_pvt_add  = is_cust_contact-address_type_2
    IMPORTING
      et_messages          = lt_messages
      ev_inconsistent      = lv_inconsistent_temp
    CHANGING
      cs_display_structure = cs_display_structure
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.


* compare business address
  CLEAR lt_messages.
  CALL METHOD compare_bp_as_src_rel_bus_add(
    EXPORTING
      it_src_partner_address = is_source_main_partner-central_data-address-addresses
      it_tar_partner_address = is_target_main_partner-central_data-address-addresses
      it_src_rel_address     = is_source_relationship-central_data-address-addresses
      it_tar_rel_address     = is_target_relationship-central_data-address-addresses
      it_org_bus_address     = is_cust_contact-address_type_1
    IMPORTING
      et_messages            = lt_messages
      ev_inconsistent        = lv_inconsistent_temp
    CHANGING
      cs_display_structure   = cs_display_structure
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.

* compare business hours
  LOOP AT is_source_relationship-central_data-business_hour-business_hours
       INTO ls_src_business_hour.

    READ TABLE is_target_relationship-central_data-business_hour-business_hours
         INTO ls_tar_business_hour
         with key data_key-schedule_type = ls_src_business_hour-data_key-schedule_type.

    CLEAR lt_messages.
    CALL METHOD compare_bp_as_src_rel_bus_hour(
      EXPORTING
        it_source_weekly_bh  = ls_src_business_hour-data-weekly
        it_target_weekly_bh  = ls_tar_business_hour-data-weekly
        is_cust_contact      = is_cust_contact
      IMPORTING
        et_messages          = lt_messages
        ev_inconsistent      = lv_inconsistent_temp
      CHANGING
        cs_display_structure = cs_display_structure
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.
  ENDLOOP.

  IF cs_display_structure-data-relationship_data IS NOT INITIAL.
    MODIFY cs_display_structure-data-relationship_data FROM ls_result_st
      TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF lv_inconsistent = gc_false.
    cs_display_structure-consistent = gc_true.
  ENDIF.

  ev_inconsistent = lv_inconsistent.
ENDMETHOD.


method COMPARE_BP_AS_SOURCE_REL_BH.
return.
endmethod.


METHOD compare_bp_as_source_tax.
  DATA : ls_source_tax        TYPE bus_ei_bupa_taxnumber,
         ls_target_tax        TYPE bus_ei_bupa_taxnumber,
         ls_original_st       TYPE REF TO data,
         ls_cmds_ei_extern    TYPE cmds_ei_extern,
         ls_vmds_ei_extern    TYPE vmds_ei_extern,
         lv_tabix             TYPE sy-tabix,
         lv_display_st_tabix  TYPE sy-tabix,
         ls_display_structure TYPE mds_cmpt_display_structure,
         ls_result_st         TYPE mds_cmpt_display_st_result,
         lv_seq_number        TYPE i,
         lt_temp_result       TYPE mds_cmpt_display_st_result_t,
         lv_inconsistent_temp TYPE boolean,
         lv_inconsistent      TYPE boolean,
         lr_exception         TYPE REF TO cx_root,
         lt_messages          TYPE mds_ctrls_error_objects,
         ls_message           TYPE bapiret2.

  CONSTANTS : lc_bp_table(12) TYPE c VALUE 'DFKKBPTAXNUM',
              lc_cust_kna1(4) TYPE c VALUE 'KNA1',
              lc_cust_knas(4) TYPE c VALUE 'KNAS',
              lc_vend_lfa1(4) TYPE c VALUE 'LFA1',
              lc_vend_lfas(4) TYPE c VALUE 'LFAS'.

  FIELD-SYMBOLS : <ls_original_st> TYPE ANY.

* initialize exporting parameters
  CLEAR et_messages.

* create target data
  IF gv_target_object = gc_customer.
    CREATE DATA ls_original_st TYPE cmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = it_target_org.
    ls_cmds_ei_extern = <ls_original_st>.
    READ TABLE ct_display_structure INTO ls_display_structure
               with key target_object = ls_cmds_ei_extern-header-object_instance-kunnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ELSEIF gv_target_object = gc_vendor.
    CREATE DATA ls_original_st TYPE vmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = it_target_org.
    ls_vmds_ei_extern = <ls_original_st>.
    READ TABLE ct_display_structure INTO ls_display_structure
               with key target_object = ls_vmds_ei_extern-header-object_instance-lifnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ENDIF.



  IF it_source_tax IS NOT INITIAL.
    LOOP AT it_source_tax INTO ls_source_tax.
      lv_tabix                     = sy-tabix.
      lv_seq_number                = lv_seq_number + 1.
      ls_result_st-sequence_number = lv_seq_number.

      READ TABLE it_target_tax INTO ls_target_tax
           with key data_key-taxtype   = ls_source_tax-data_key-taxtype
                    data_key-taxnumber = ls_source_tax-data_key-taxnumber.

      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table    = lc_bp_table.
      ls_result_st-source_field    = 'TAXNUM'.
      ls_result_st-source_value    = ls_source_tax-data_key-taxnumber.

      IF ls_source_tax-data_key-taxnumber = ls_target_tax-data_key-taxnumber.
        ls_result_st-consistent = gc_true.
      ELSE.
        ls_result_st-consistent = gc_false.
        lv_inconsistent_temp = gc_true.
      ENDIF.

      IF ls_source_tax-data_key-taxtype(2) = iv_standard_country.
        IF gv_target_object = gc_customer.
          ls_result_st-target_table = lc_cust_kna1.
          CASE ls_source_tax-data_key-taxtype+2(1).
            WHEN '0'.
              ls_result_st-target_field = 'STCEG'.
              ls_result_st-target_value = ls_cmds_ei_extern-central_data-central-data-stceg.
            WHEN '1'.
              ls_result_st-target_field = 'STCD1'.
              ls_result_st-target_value = ls_cmds_ei_extern-central_data-central-data-stcd1.
            WHEN '2'.
              ls_result_st-target_field = 'STCD2'.
              ls_result_st-target_value = ls_cmds_ei_extern-central_data-central-data-stcd2.
            WHEN '3'.
              ls_result_st-target_field = 'STCD3'.
              ls_result_st-target_value = ls_cmds_ei_extern-central_data-central-data-stcd3.
            WHEN '4'.
              ls_result_st-target_field = 'STCD4'.
              ls_result_st-target_value = ls_cmds_ei_extern-central_data-central-data-stcd4.
          ENDCASE.

          IF ls_source_tax-data_key-taxtype(2) = 'AR'
              AND ls_source_tax-data_key-taxtype+2(1) = '1'.

            CASE ls_source_tax-data_key-taxtype+3(1).
              WHEN 'A'.
                IF ls_cmds_ei_extern-central_data-central-data-stcdt = '80'.
                  ls_result_st-consistent = gc_true.
                ELSE.
                  ls_result_st-consistent = gc_false.
                ENDIF.
              WHEN 'B'.
                IF ls_cmds_ei_extern-central_data-central-data-stcdt = '86'.
                  ls_result_st-consistent = gc_true.
                ELSE.
                  ls_result_st-consistent = gc_false.
                ENDIF.
            ENDCASE.
          ENDIF.

        ELSEIF gv_target_object = gc_vendor.
          ls_result_st-target_table = lc_vend_lfa1.
          IF iv_standard_country <> 'DE'.
            CASE ls_source_tax-data_key-taxtype+2(1).
              WHEN '0'.
                ls_result_st-target_field = 'STCEG'.
                ls_result_st-target_value = ls_vmds_ei_extern-central_data-central-data-stceg.
              WHEN '1'.
                ls_result_st-target_field = 'STCD1'.
                ls_result_st-target_value = ls_vmds_ei_extern-central_data-central-data-stcd1.
              WHEN '2'.
                ls_result_st-target_field = 'STCD2'.
                ls_result_st-target_value = ls_vmds_ei_extern-central_data-central-data-stcd2.
              WHEN '3'.
                ls_result_st-target_field = 'STCD3'.
                ls_result_st-target_value = ls_vmds_ei_extern-central_data-central-data-stcd3.
              WHEN '4'.
                ls_result_st-target_field = 'STCD4'.
                ls_result_st-target_value = ls_vmds_ei_extern-central_data-central-data-stcd4.
            ENDCASE.
          ELSE.
            CASE ls_source_tax-data_key-taxtype+2(1).
              WHEN '0'.
                ls_result_st-target_field = 'STCEG'.
                ls_result_st-target_value = ls_vmds_ei_extern-central_data-central-data-stceg.
              WHEN '1'.
                ls_result_st-target_field = 'STENR'.
                ls_result_st-target_value = ls_vmds_ei_extern-central_data-central-data-stenr.
              WHEN '2'.
                ls_result_st-target_field = 'STCD1'.
                ls_result_st-target_value = ls_vmds_ei_extern-central_data-central-data-stcd1.
              WHEN '3'.
                ls_result_st-target_field = 'STCD3'.
                ls_result_st-target_value = ls_vmds_ei_extern-central_data-central-data-stcd3.
              WHEN '4'.
                ls_result_st-target_field = 'STCD4'.
                ls_result_st-target_value = ls_vmds_ei_extern-central_data-central-data-stcd4.
              WHEN '5'.
                ls_result_st-target_field = 'STCD2'.
                ls_result_st-target_value = ls_vmds_ei_extern-central_data-central-data-stcd2.
            ENDCASE.
          ENDIF.

          IF ls_source_tax-data_key-taxtype(2) = 'AR'
              AND ls_source_tax-data_key-taxtype+2(1) = '1'.

            CASE ls_source_tax-data_key-taxtype+3(1).
              WHEN 'A'.
                IF ls_vmds_ei_extern-central_data-central-data-stcdt = '80'.
                  ls_result_st-consistent = gc_true.
                ELSE.
                  ls_result_st-consistent = gc_false.
                  lv_inconsistent_temp    = gc_true.
                ENDIF.
              WHEN 'B'.
                IF ls_vmds_ei_extern-central_data-central-data-stcdt = '86'.
                  ls_result_st-consistent = gc_true.
                ELSE.
                  ls_result_st-consistent = gc_false.
                  lv_inconsistent = gc_true.
                ENDIF.
            ENDCASE.
          ENDIF.

        ENDIF.

      ELSE.
        IF gv_target_object = gc_customer.
          ls_result_st-target_table = lc_cust_knas.
          IF ls_source_tax-data_key-taxtype+2(1) = '0'.
            ls_result_st-target_field = 'STCEG'.
            ls_result_st-target_value = ls_cmds_ei_extern-central_data-central-data-stceg.
          ENDIF.
        ELSEIF gv_target_object = gc_vendor.
          ls_result_st-target_table = lc_vend_lfas.
          IF ls_source_tax-data_key-taxtype+2(1) = '0'.
            ls_result_st-target_field = 'STCEG'.
            ls_result_st-target_value = ls_vmds_ei_extern-central_data-central-data-stceg.
          ENDIF.
        ENDIF.
      ENDIF.

      IF ls_display_structure-data-tax-data IS NOT INITIAL.
        MODIFY ls_display_structure-data-tax-data FROM ls_result_st.
      ENDIF.

      APPEND LINES OF ls_display_structure-data-tax-data TO lt_temp_result.
      CLEAR ls_display_structure-data-tax-data.

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ENDLOOP.
    CLEAR ls_display_structure-data-tax-data.
    APPEND LINES OF lt_temp_result TO ls_display_structure-data-tax-data.
*  set status for the dataset
    IF it_target_tax IS INITIAL.
      ls_display_structure-data-tax-status = gc_error.
    ELSEIF lv_inconsistent = gc_true.
      ls_display_structure-data-tax-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-tax-status = gc_consistent.
    ENDIF.
  ELSE.
    ls_display_structure-data-tax-status = gc_notmaintained.
  ENDIF.

  ev_inconsistent = lv_inconsistent.
ENDMETHOD.


method COMPARE_BP_AS_SOURCE_TPARTNER.
return.
endmethod.


METHOD compare_bp_as_source_version.
  DATA : ls_source_version        TYPE bus_ei_bupa_version,
         ls_target_version        TYPE bus_ei_bupa_version,
         ls_original_st           TYPE REF TO data,
         ls_cmds_ei_extern        TYPE cmds_ei_extern,
         ls_vmds_ei_extern        TYPE vmds_ei_extern,
         lt_cust_version          TYPE cvi_ei_version_type1_t,
         ls_cust_version          TYPE cvi_ei_version_type1,
         lt_vend_version          TYPE cvi_ei_version_type1_t,
         ls_vend_version          TYPE cvi_ei_version_type1,
         ls_result_st             TYPE mds_cmpt_display_st_result,
         lv_tabix                 TYPE sy-tabix,
         lv_display_st_tabix      TYPE sy-tabix,
         ls_display_structure     TYPE mds_cmpt_display_structure,
         lv_inconsistent_temp     TYPE boolean,
         lv_inconsistent          TYPE boolean,
         lt_messages              TYPE mds_ctrls_error_objects.

  FIELD-SYMBOLS : <ls_original_st> TYPE ANY.

* initialize exporting parameters
  CLEAR : et_messages , ev_inconsistent.

* create target data
  IF gv_target_object = gc_customer.
    CREATE DATA ls_original_st TYPE cmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = it_target_org.
    ls_cmds_ei_extern = <ls_original_st>.
    lt_cust_version   = ls_cmds_ei_extern-central_data-address-version-versions.
    READ TABLE ct_display_structure INTO ls_display_structure
               with key target_object = ls_cmds_ei_extern-header-object_instance-kunnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ELSEIF gv_target_object = gc_vendor.
    CREATE DATA ls_original_st TYPE vmds_ei_extern.
    ASSIGN ls_original_st->* TO <ls_original_st>.
    <ls_original_st>  = it_target_org.
    ls_vmds_ei_extern = <ls_original_st>.
    lt_vend_version   = ls_vmds_ei_extern-central_data-address-version-versions.
    READ TABLE ct_display_structure INTO ls_display_structure
               with key target_object = ls_vmds_ei_extern-header-object_instance-lifnr.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    lv_display_st_tabix = sy-tabix.

  ENDIF.

* set sequence number = 1 (since only standard address is compared)

  ls_result_st-sequence_number = 1.

  LOOP AT it_source_ver INTO ls_source_version.
    lv_tabix = sy-tabix.

    READ TABLE it_target_ver INTO ls_target_version INDEX lv_tabix.

    IF gv_target_object = gc_customer.
      READ TABLE lt_cust_version INTO ls_cust_version INDEX lv_tabix.

*compare version fields
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_version-data-organization
          is_target           = ls_cust_version-data
          is_mapped_target    = ls_target_version-data-organization
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-versions
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_version-data-person
          is_target           = ls_cust_version-data
          is_mapped_target    = ls_target_version-data-person
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-versions
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ELSEIF gv_target_object = gc_vendor.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_version-data-organization
          is_target           = ls_vend_version-data
          is_mapped_target    = ls_target_version-data-organization
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-versions
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_version-data-person
          is_target           = ls_vend_version-data
          is_mapped_target    = ls_target_version-data-person
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = ls_display_structure-data-address-versions
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.

    ENDIF.

  ENDLOOP.

  IF ls_display_structure-data-address-versions IS NOT INITIAL.

    MODIFY ls_display_structure-data-address-versions FROM ls_result_st
                                 TRANSPORTING sequence_number
                                       WHERE  sequence_number = 0.

  ENDIF.

  ev_inconsistent = lv_inconsistent.

* modify display structure
  MODIFY ct_display_structure FROM ls_display_structure INDEX lv_display_st_tabix.
ENDMETHOD.


METHOD compare_bp_as_src_bus_add_ver.
  DATA : ls_source_version        TYPE bus_ei_bupa_version,
         ls_target_version        TYPE bus_ei_bupa_version,
         ls_cust_version          TYPE cvi_ei_version_type1,
         ls_result_st             TYPE mds_cmpt_display_st_result,
         lv_tabix                 TYPE sy-tabix,
         lv_inconsistent_temp     TYPE boolean,
         lv_inconsistent          TYPE boolean,
         lt_messages              TYPE mds_ctrls_error_objects.

* initialize exporting parameters
  CLEAR : et_messages , ev_inconsistent.

  ls_result_st-sequence_number = 1.

  LOOP AT it_source_ver INTO ls_source_version.
    lv_tabix = sy-tabix.

    READ TABLE it_target_ver INTO ls_target_version INDEX lv_tabix.

    READ TABLE it_cust_ver INTO ls_cust_version INDEX lv_tabix.

*compare version fields
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_version-data-person
        is_target           = ls_cust_version-data
        is_mapped_target    = ls_target_version-data-person
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-data-business_address-versions
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.
  ENDLOOP.

  IF cs_display_structure-data-home_address-versions IS NOT INITIAL.
    MODIFY cs_display_structure-data-business_address-versions FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  ev_inconsistent = lv_inconsistent.
ENDMETHOD.


METHOD compare_bp_as_src_pvt_add_ver.
  DATA : ls_source_version        TYPE bus_ei_bupa_version,
         ls_target_version        TYPE bus_ei_bupa_version,
         ls_cust_version          TYPE cvi_ei_version_type2,
         ls_result_st             TYPE mds_cmpt_display_st_result,
         lv_tabix                 TYPE sy-tabix,
         lv_inconsistent_temp     TYPE boolean,
         lv_inconsistent          TYPE boolean,
         lt_messages              TYPE mds_ctrls_error_objects.

* initialize exporting parameters
  CLEAR : et_messages , ev_inconsistent.

  ls_result_st-sequence_number = 1.

  LOOP AT it_source_ver INTO ls_source_version.
    lv_tabix = sy-tabix.

    READ TABLE it_target_ver INTO ls_target_version INDEX lv_tabix.

    READ TABLE it_cust_ver INTO ls_cust_version INDEX lv_tabix.

*compare version fields
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_version-data-person
        is_target           = ls_cust_version-data
        is_mapped_target    = ls_target_version-data-person
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-data-home_address-versions
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.
  ENDLOOP.

  IF cs_display_structure-data-home_address-versions IS NOT INITIAL.
    MODIFY cs_display_structure-data-home_address-versions FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  ev_inconsistent = lv_inconsistent.

ENDMETHOD.


METHOD compare_bp_as_src_rel_bus_add.
  DATA : ls_src_partner_address   TYPE bus_ei_bupa_address,
         ls_tar_partner_address   TYPE bus_ei_bupa_address,
         ls_src_rel_address       TYPE burs_ei_rel_address,
         ls_tar_rel_address       TYPE burs_ei_rel_address,
         ls_source_remark         TYPE bus_ei_bupa_addressremark,
         ls_target_remark         TYPE bus_ei_bupa_addressremark,
         ls_cust_remark           TYPE cvis_ei_rem,
         ls_result_st             TYPE mds_cmpt_display_st_result,
         lv_tabix                 TYPE sy-tabix,
         lv_inconsistent_temp     TYPE boolean,
         lv_inconsistent          TYPE boolean,
         lt_messages              TYPE mds_ctrls_error_objects.

* initialize exporting parameters
  CLEAR : et_messages , ev_inconsistent.

* return if customer does not have business address
  IF it_org_bus_address IS INITIAL.
    RETURN.
  ENDIF.

* read source relationship standard address (if business address exists, it will be
* relationship standard address)
  READ TABLE it_src_rel_address INTO ls_src_rel_address
       with key data-postal-data-standardaddress =  gc_true.

* read source partners address with the guid of standard relationship address
  READ TABLE it_src_partner_address INTO ls_src_partner_address
       with key data_key-guid = ls_src_rel_address-data_key-guid.

* read target relationship with the guid of source standard relationship address
  READ TABLE it_tar_rel_address INTO ls_tar_rel_address
       with key data_key-guid = ls_src_rel_address-data_key-guid.

* read target partner address with the guid of source standard relationship address
  READ TABLE it_tar_partner_address INTO ls_tar_partner_address
       with key data_key-guid = ls_src_rel_address-data_key-guid.


  ls_result_st-sequence_number = 1.

* compare postal data
  CALL METHOD compare_and_fill(
    EXPORTING
      iv_dataset          = gc_relationship
      is_source           = ls_src_partner_address-data-postal-data
      is_target           = it_org_bus_address-postal-data
      is_mapped_target    = ls_tar_partner_address-data-postal-data
    IMPORTING
      et_messages         = lt_messages
      ev_inconsistent     = lv_inconsistent_temp
    CHANGING
      cs_result_structure = cs_display_structure-data-business_address-postal
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.

*Compare Remarks data
  LOOP AT ls_src_partner_address-data-remark-remarks INTO ls_source_remark.
    lv_tabix = sy-tabix.
    READ TABLE ls_tar_partner_address-data-remark-remarks INTO ls_target_remark INDEX lv_tabix.
    READ TABLE it_org_bus_address-remark-remarks INTO ls_cust_remark INDEX lv_tabix.

    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_remark-data
        is_target           = ls_cust_remark-data
        is_mapped_target    = ls_target_remark-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-data-business_address-remarks
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.
    CLEAR : ls_source_remark , ls_target_remark , ls_cust_remark , lv_tabix.
  ENDLOOP.

* compare version data
  CALL METHOD compare_bp_as_src_bus_add_ver(
    EXPORTING
      it_source_ver        = ls_src_partner_address-data-version-versions
      it_target_ver        = ls_tar_partner_address-data-version-versions
      it_cust_ver          = it_org_bus_address-version-versions
    IMPORTING
      et_messages          = lt_messages
      ev_inconsistent      = lv_inconsistent_temp
    CHANGING
      cs_display_structure = cs_display_structure
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.

* compare communication data
  CALL METHOD compare_bp_as_src_rel_comm(
    EXPORTING
      is_source_comm       = ls_src_partner_address-data-communication
      is_target_comm       = ls_tar_partner_address-data-communication
      is_original_comm     = it_org_bus_address-communication
    IMPORTING
      et_messages          = lt_messages
      ev_inconsistent      = lv_inconsistent_temp
    CHANGING
      cs_display_structure = cs_display_structure-data-business_address-communication
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.

  IF cs_display_structure-data-business_address-postal IS NOT INITIAL.
    MODIFY cs_display_structure-data-business_address-postal FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-data-business_address-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-data-business_address-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  ev_inconsistent = lv_inconsistent.

ENDMETHOD.


METHOD compare_bp_as_src_rel_bus_hour.
  TYPES : BEGIN OF lty_business_hours,
          monday_from TYPE char255,
          monday_to   TYPE char255,
          tuesday_from TYPE char255,
          tuesday_to   TYPE char255,
          wednesday_from TYPE char255,
          wednesday_to   TYPE char255,
          thursday_from  TYPE char255,
          thursday_to    TYPE char255,
          friday_from    TYPE char255,
          friday_to      TYPE char255,
          saturday_from  TYPE char255,
          saturday_to    TYPE char255,
          sunday_from    TYPE char255,
          sunday_to      TYPE char255.
  TYPES : END OF lty_business_hours.

  DATA : ls_source_weekly_bh  TYPE bapibus1006_rule_w,
         ls_target_weekly_bh  TYPE bapibus1006_rule_w,
         lv_inconsistent_temp TYPE boolean,
         lv_inconsistent      TYPE boolean,
         ls_result_st         TYPE mds_cmpt_display_st_result,
         lv_seq_number        TYPE i,
         lv_index             TYPE sy-index,
         ls_business_hours    TYPE lty_business_hours,
         lt_messages          TYPE mds_ctrls_error_objects,
         ls_message           TYPE bapiret2.

  CONSTANTS : lc_bp_table(7)   TYPE c VALUE 'SCRULES',
              lc_cust_table(4) TYPE c VALUE 'KNVK',
              lc_noon(6)       TYPE c VALUE '120000',
              lc_initial(6)    TYPE c VALUE '000000'.

* initialize exporting parameters
  CLEAR : et_messages , ev_inconsistent.

  lv_seq_number                = lv_seq_number + 1.

  DO 2 TIMES.
    lv_index = sy-index.

    READ TABLE it_source_weekly_bh INTO ls_source_weekly_bh INDEX lv_index.
    READ TABLE it_target_weekly_bh INTO ls_target_weekly_bh INDEX lv_index.

* monday from
    IF ls_business_hours-monday_from = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'MONDAY_FROM'.
      ls_result_st-source_value = ls_source_weekly_bh-monda_from.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'MOAB1/MOAB2'.

      IF ls_source_weekly_bh-monda_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-moab1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-moab2.
      ENDIF.

      IF ls_source_weekly_bh-monda_from = ls_target_weekly_bh-monda_from.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-monday_from = ls_source_weekly_bh-monda_from.
    ENDIF.
* monday to
    IF ls_business_hours-monday_to = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'MONDAY_TO'.
      ls_result_st-source_value = ls_source_weekly_bh-monday_to.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'MOBI1/MOBI2'.

      IF ls_source_weekly_bh-monda_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-mobi1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-mobi2.
      ENDIF.

      IF ls_source_weekly_bh-monday_to = ls_target_weekly_bh-monday_to.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-monday_to = ls_source_weekly_bh-monday_to.
    ENDIF.

* tuesday from
    IF ls_business_hours-tuesday_from = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'TUESDAY_FROM'.
      ls_result_st-source_value = ls_source_weekly_bh-tuesd_from.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'DIAB1/DIAB2'.

      IF ls_source_weekly_bh-tuesd_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-diab1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-diab2.
      ENDIF.

      IF ls_source_weekly_bh-tuesd_from = ls_target_weekly_bh-tuesd_from.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-tuesday_from = ls_source_weekly_bh-tuesd_from.
    ENDIF.

* tuesday to
    IF ls_business_hours-tuesday_to = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'TUESDAY_TO'.
      ls_result_st-source_value = ls_source_weekly_bh-tuesday_to.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'DIBI1/DIBI2'.

      IF ls_source_weekly_bh-tuesd_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-dibi1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-dibi2.
      ENDIF.

      IF ls_source_weekly_bh-tuesday_to = ls_target_weekly_bh-tuesday_to.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-tuesday_to = ls_source_weekly_bh-tuesday_to.
    ENDIF.

* wednesday from
    IF ls_business_hours-wednesday_from = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'WEDNESDAY_FROM'.
      ls_result_st-source_value = ls_source_weekly_bh-wedne_from.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'MIAB1/MIAB2'.

      IF ls_source_weekly_bh-wedne_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-miab1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-miab2.
      ENDIF.

      IF ls_source_weekly_bh-wedne_from = ls_target_weekly_bh-wedne_from.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-wednesday_from = ls_source_weekly_bh-wedne_from.
    ENDIF.

* wednesday to
    IF ls_business_hours-wednesday_to = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'WEDNESDAY_TO'.
      ls_result_st-source_value = ls_source_weekly_bh-wednesd_to.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'MIBI1/MIBI2'.

      IF ls_source_weekly_bh-wedne_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-mibi1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-mibi2.
      ENDIF.

      IF ls_source_weekly_bh-wednesd_to = ls_target_weekly_bh-wednesd_to.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-wednesday_to = ls_source_weekly_bh-wednesd_to.
    ENDIF.

* Thursday from
    IF ls_business_hours-thursday_from = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'THURSDAY_FROM'.
      ls_result_st-source_value = ls_source_weekly_bh-thurs_from.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'DOAB1/DOAB2'.

      IF ls_source_weekly_bh-thurs_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-doab1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-doab2.
      ENDIF.

      IF ls_source_weekly_bh-thurs_from = ls_target_weekly_bh-thurs_from.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-thursday_from = ls_source_weekly_bh-thurs_from.
    ENDIF.

* Thursday to
    IF ls_business_hours-thursday_to = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'THURSDAY_TO'.
      ls_result_st-source_value = ls_source_weekly_bh-thursda_to.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'DOBI1/DOBI2'.

      IF ls_source_weekly_bh-thurs_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-dobi1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-dobi2.
      ENDIF.

      IF ls_source_weekly_bh-thursda_to = ls_target_weekly_bh-thursda_to.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-thursday_to = ls_source_weekly_bh-thursda_to.
    ENDIF.

* Friday from
    IF ls_business_hours-friday_from = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'FRIDAY_FROM'.
      ls_result_st-source_value = ls_source_weekly_bh-frida_from.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'FRAB1/FRAB2'.

      IF ls_source_weekly_bh-frida_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-frab1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-frab2.
      ENDIF.

      IF ls_source_weekly_bh-frida_from = ls_target_weekly_bh-frida_from.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-friday_from = ls_source_weekly_bh-thurs_from.
    ENDIF.

* Friday to
    IF ls_business_hours-friday_to = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'FRIDAY_TO'.
      ls_result_st-source_value = ls_source_weekly_bh-friday_to.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'FRBI1/FRBI2'.

      IF ls_source_weekly_bh-frida_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-frbi1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-frbi2.
      ENDIF.

      IF ls_source_weekly_bh-friday_to = ls_target_weekly_bh-friday_to.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-friday_to = ls_source_weekly_bh-friday_to.
    ENDIF.

* Saturday from
    IF ls_business_hours-saturday_from = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'SATURDAY_FROM'.
      ls_result_st-source_value = ls_source_weekly_bh-satur_from.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'SAAB1/SAAB2'.

      IF ls_source_weekly_bh-satur_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-saab1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-saab2.
      ENDIF.

      IF ls_source_weekly_bh-satur_from = ls_target_weekly_bh-satur_from.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-saturday_from = ls_source_weekly_bh-satur_from.
    ENDIF.

* Saturday to
    IF ls_business_hours-saturday_to = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'SATURDAY_TO'.
      ls_result_st-source_value = ls_source_weekly_bh-saturda_to.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'SABI1/SABI2'.

      IF ls_source_weekly_bh-satur_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-sabi1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-sabi2.
      ENDIF.

      IF ls_source_weekly_bh-saturda_to = ls_target_weekly_bh-saturda_to.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-saturday_to = ls_source_weekly_bh-saturda_to.
    ENDIF.

* Sunday from
    IF ls_business_hours-sunday_from = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'SUNDAY_FROM'.
      ls_result_st-source_value = ls_source_weekly_bh-sunda_from.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'SOAB1/SOAB2'.

      IF ls_source_weekly_bh-sunda_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-soab1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-soab2.
      ENDIF.

      IF ls_source_weekly_bh-sunda_from = ls_target_weekly_bh-sunda_from.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-sunday_from = ls_source_weekly_bh-sunda_from.
    ENDIF.

* Sunday to
    IF ls_business_hours-sunday_to = lc_initial.
      ls_result_st-sequence_number = lv_seq_number.
      ls_result_st-source_table = lc_bp_table.
      ls_result_st-source_field = 'SUNDAY_TO'.
      ls_result_st-source_value = ls_source_weekly_bh-sunday_to.
      ls_result_st-target_table = lc_cust_table.
      ls_result_st-target_field = 'SOBI1/SOBI2'.

      IF ls_source_weekly_bh-sunda_from < lc_noon.
        ls_result_st-target_value = is_cust_contact-data-sobi1.
      ELSE.
        ls_result_st-target_value = is_cust_contact-data-sobi2.
      ENDIF.

      IF ls_source_weekly_bh-sunday_to = ls_target_weekly_bh-sunday_to.
        ls_result_st-consistent = gc_true.
      ENDIF.

      APPEND ls_result_st TO cs_display_structure-data-business_hours.
      CLEAR ls_result_st.

      ls_business_hours-sunday_to = ls_source_weekly_bh-sunday_to.
    ENDIF.

    CLEAR : ls_source_weekly_bh , ls_target_weekly_bh.

  ENDDO.
ENDMETHOD.


METHOD compare_bp_as_src_rel_comm.
  DATA : ls_source_phone      TYPE bus_ei_bupa_telephone,
         ls_target_phone      TYPE bus_ei_bupa_telephone,
         ls_ecc_phone         TYPE cvis_ei_phone_str,
         ls_source_fax        TYPE bus_ei_bupa_fax,
         ls_target_fax        TYPE bus_ei_bupa_fax,
         ls_ecc_fax           TYPE cvis_ei_fax_str,
         ls_source_ttx        TYPE bus_ei_bupa_ttx,
         ls_target_ttx        TYPE bus_ei_bupa_ttx,
         ls_ecc_ttx           TYPE cvis_ei_ttx_str,
         ls_source_tlx        TYPE bus_ei_bupa_tlx,
         ls_target_tlx        TYPE bus_ei_bupa_tlx,
         ls_ecc_tlx           TYPE cvis_ei_tlx_str,
         ls_source_smtp       TYPE bus_ei_bupa_smtp,
         ls_target_smtp       TYPE bus_ei_bupa_smtp,
         ls_ecc_smtp          TYPE cvis_ei_smtp_str,
         ls_source_rml        TYPE bus_ei_bupa_rml,
         ls_target_rml        TYPE bus_ei_bupa_rml,
         ls_ecc_rml           TYPE cvis_ei_rml_str,
         ls_source_x400       TYPE bus_ei_bupa_x400,
         ls_target_x400       TYPE bus_ei_bupa_x400,
         ls_ecc_x400          TYPE cvis_ei_x400_str,
         ls_source_rfc        TYPE bus_ei_bupa_rfc,
         ls_target_rfc        TYPE bus_ei_bupa_rfc,
         ls_ecc_rfc           TYPE cvis_ei_rfc_str,
         ls_source_prt        TYPE bus_ei_bupa_prt,
         ls_target_prt        TYPE bus_ei_bupa_prt,
         ls_ecc_prt           TYPE cvis_ei_prt_str,
         ls_source_ssf        TYPE bus_ei_bupa_ssf,
         ls_target_ssf        TYPE bus_ei_bupa_ssf,
         ls_ecc_ssf           TYPE cvis_ei_ssf_str,
         ls_source_uri        TYPE bus_ei_bupa_uri,
         ls_target_uri        TYPE bus_ei_bupa_uri,
         ls_ecc_uri           TYPE cvis_ei_uri_str,
         ls_source_pager      TYPE bus_ei_bupa_pag,
         ls_target_pager      TYPE bus_ei_bupa_pag,
         ls_ecc_pager         TYPE cvis_ei_pag_str,
         ls_original_st       TYPE REF TO data,
         ls_cmds_ei_extern    TYPE cmds_ei_extern,
         ls_vmds_ei_extern    TYPE vmds_ei_extern,
         lv_tabix             TYPE sy-tabix,
         lv_display_st_tabix  TYPE sy-tabix,
         ls_display_structure TYPE mds_cmpt_display_structure,
         ls_result_st         TYPE mds_cmpt_display_st_result,
         lv_seq_number        TYPE i,
         lv_inconsistent_temp TYPE boolean,
         lv_inconsistent      TYPE boolean,
         ls_source_remark     TYPE bus_ei_bupa_comrem,
         ls_target_remark     TYPE bus_ei_bupa_comrem,
         ls_original_remark   TYPE cvis_ei_comrem,
         lt_messages          TYPE mds_ctrls_error_objects,
         ls_message           TYPE bapiret2.

* initialize exporting parameters
  CLEAR : et_messages , ev_inconsistent.

* set sequence number
  ls_result_st-sequence_number = 1.

* compare communication fields
* phone
  LOOP AT is_source_comm-phone-phone INTO ls_source_phone.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-phone-phone INTO ls_target_phone INDEX lv_tabix.

    READ TABLE is_original_comm-phone-phone
                 INTO ls_ecc_phone INDEX lv_tabix.

    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_phone-contact-data
        is_target           = ls_ecc_phone-contact-data
        is_mapped_target    = ls_target_phone-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-phone-contact
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

* Remarks
    LOOP AT ls_source_phone-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_phone-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_phone-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = cs_display_structure-phone-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* fax
  LOOP AT is_source_comm-fax-fax INTO ls_source_fax.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-fax-fax INTO ls_target_fax INDEX lv_tabix.

    READ TABLE is_original_comm-fax-fax
               INTO ls_ecc_fax INDEX lv_tabix.
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_fax-contact-data
        is_target           = ls_ecc_fax-contact-data
        is_mapped_target    = ls_target_fax-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-fax-contact
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

* Remarks
    LOOP AT ls_source_fax-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_fax-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_fax-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = cs_display_structure-fax-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* ttx
  LOOP AT is_source_comm-ttx-ttx INTO ls_source_ttx.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-ttx-ttx INTO ls_target_ttx INDEX lv_tabix.

    READ TABLE is_original_comm-ttx-ttx
               INTO ls_ecc_ttx INDEX lv_tabix.
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_ttx-contact-data
        is_target           = ls_ecc_ttx-contact-data
        is_mapped_target    = ls_target_ttx-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-ttx-contact
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

* Remarks
    LOOP AT ls_source_ttx-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_ttx-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_ttx-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = cs_display_structure-ttx-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* tlx
  LOOP AT is_source_comm-tlx-tlx INTO ls_source_tlx.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-tlx-tlx INTO ls_target_tlx INDEX lv_tabix.

    READ TABLE is_original_comm-tlx-tlx
               INTO ls_ecc_tlx INDEX lv_tabix.
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_tlx-contact-data
        is_target           = ls_ecc_tlx-contact-data
        is_mapped_target    = ls_target_tlx-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-tlx-contact
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

* Remarks
    LOOP AT ls_source_tlx-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_tlx-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_tlx-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = cs_display_structure-tlx-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.


* smtp
  LOOP AT is_source_comm-smtp-smtp INTO ls_source_smtp.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-smtp-smtp INTO ls_target_smtp INDEX lv_tabix.

    READ TABLE is_original_comm-smtp-smtp
               INTO ls_ecc_smtp INDEX lv_tabix.
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_smtp-contact-data
        is_target           = ls_ecc_smtp-contact-data
        is_mapped_target    = ls_target_smtp-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-smtp-contact
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

* Remarks
    LOOP AT ls_source_smtp-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_smtp-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_smtp-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = cs_display_structure-smtp-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* rml
  LOOP AT is_source_comm-rml-rml INTO ls_source_rml.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-rml-rml INTO ls_target_rml INDEX lv_tabix.

    READ TABLE is_original_comm-rml-rml
               INTO ls_ecc_rml INDEX lv_tabix.
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_rml-contact-data
        is_target           = ls_ecc_rml-contact-data
        is_mapped_target    = ls_target_rml-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-remote_mail_add-contact
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

* Remarks
    LOOP AT ls_source_rml-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_rml-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_rml-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = cs_display_structure-remote_mail_add-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* x400
  LOOP AT is_source_comm-x400-x400 INTO ls_source_x400.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-x400-x400 INTO ls_target_x400 INDEX lv_tabix.

    READ TABLE is_original_comm-x400-x400
               INTO ls_ecc_x400 INDEX lv_tabix.
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_x400-contact-data
        is_target           = ls_ecc_x400-contact-data
        is_mapped_target    = ls_target_x400-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-x400-contact
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

* Remarks
    LOOP AT ls_source_x400-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_x400-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_x400-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = cs_display_structure-x400-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* rfc
  LOOP AT is_source_comm-rfc-rfc INTO ls_source_rfc.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-rfc-rfc INTO ls_target_rfc INDEX lv_tabix.

    READ TABLE is_original_comm-rfc-rfc
               INTO ls_ecc_rfc INDEX lv_tabix.
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_rfc-contact-data
        is_target           = ls_ecc_rfc-contact-data
        is_mapped_target    = ls_target_rfc-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-rfc-contact
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

* Remarks
    LOOP AT ls_source_rfc-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_rfc-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_rfc-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = cs_display_structure-rfc-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* prt
  LOOP AT is_source_comm-prt-prt INTO ls_source_prt.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-prt-prt INTO ls_target_prt INDEX lv_tabix.

    READ TABLE is_original_comm-prt-prt
               INTO ls_ecc_prt INDEX lv_tabix.
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_prt-contact-data
        is_target           = ls_ecc_prt-contact-data
        is_mapped_target    = ls_target_prt-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-prt-contact
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

* Remarks
    LOOP AT ls_source_prt-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_prt-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_prt-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = cs_display_structure-prt-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* ssf
  LOOP AT is_source_comm-ssf-ssf INTO ls_source_ssf.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-ssf-ssf INTO ls_target_ssf INDEX lv_tabix.

    READ TABLE is_original_comm-ssf-ssf
               INTO ls_ecc_ssf INDEX lv_tabix.
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_ssf-contact-data
        is_target           = ls_ecc_ssf-contact-data
        is_mapped_target    = ls_target_ssf-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-ssf-contact
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

* Remarks
    LOOP AT ls_source_ssf-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_ssf-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_ssf-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = cs_display_structure-ssf-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* uri
  LOOP AT is_source_comm-uri-uri INTO ls_source_uri.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-uri-uri INTO ls_target_uri INDEX lv_tabix.

    READ TABLE is_original_comm-uri-uri
               INTO ls_ecc_uri INDEX lv_tabix.
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_uri-contact-data
        is_target           = ls_ecc_uri-contact-data
        is_mapped_target    = ls_target_uri-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-uri-contact
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

* Remarks
    LOOP AT ls_source_uri-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_uri-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_uri-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = cs_display_structure-uri-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

* pager
  LOOP AT is_source_comm-pager-pager INTO ls_source_pager.
    lv_tabix = sy-tabix.

    READ TABLE is_target_comm-pager-pager INTO ls_target_pager INDEX lv_tabix.

    READ TABLE is_original_comm-pager-pager
               INTO ls_ecc_pager INDEX lv_tabix.
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_pager-contact-data
        is_target           = ls_ecc_pager-contact-data
        is_mapped_target    = ls_target_pager-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-pager-contact
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.

* Remarks
    LOOP AT ls_source_pager-remark-remarks INTO ls_source_remark.
      lv_tabix = sy-tabix.
      READ TABLE ls_target_pager-remark-remarks INTO ls_target_remark INDEX lv_tabix.
      READ TABLE ls_ecc_pager-remark-remarks INTO ls_original_remark INDEX lv_tabix.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_original_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent_temp
        CHANGING
          cs_result_structure = cs_display_structure-pager-remarks
          ).

* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent_temp = gc_true.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

  IF cs_display_structure-phone-contact IS NOT INITIAL.
    MODIFY cs_display_structure-phone-contact FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  IF cs_display_structure-phone-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-phone-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-fax-contact IS NOT INITIAL.
    MODIFY cs_display_structure-fax-contact FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  IF cs_display_structure-fax-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-fax-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-ttx-contact IS NOT INITIAL.
    MODIFY cs_display_structure-ttx-contact FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  IF cs_display_structure-ttx-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-ttx-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-tlx-contact IS NOT INITIAL.
    MODIFY cs_display_structure-tlx-contact FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  IF cs_display_structure-tlx-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-tlx-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-smtp-contact IS NOT INITIAL.
    MODIFY cs_display_structure-smtp-contact FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  IF cs_display_structure-smtp-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-smtp-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-remote_mail_add-contact IS NOT INITIAL.
    MODIFY cs_display_structure-remote_mail_add-contact FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  IF cs_display_structure-remote_mail_add-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-remote_mail_add-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-x400-contact IS NOT INITIAL.
    MODIFY cs_display_structure-x400-contact FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  IF cs_display_structure-x400-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-x400-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-rfc-contact IS NOT INITIAL.
    MODIFY cs_display_structure-rfc-contact FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  IF cs_display_structure-rfc-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-rfc-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-prt-contact IS NOT INITIAL.
    MODIFY cs_display_structure-prt-contact FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  IF cs_display_structure-prt-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-prt-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-ssf-contact IS NOT INITIAL.
    MODIFY cs_display_structure-ssf-contact FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  IF cs_display_structure-ssf-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-ssf-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-uri-contact IS NOT INITIAL.
    MODIFY cs_display_structure-uri-contact FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  IF cs_display_structure-uri-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-uri-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-pager-contact IS NOT INITIAL.
    MODIFY cs_display_structure-pager-contact FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  IF cs_display_structure-pager-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-pager-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  ev_inconsistent = lv_inconsistent.
ENDMETHOD.


METHOD compare_bp_as_src_rel_pvt_add.
  DATA : ls_source_address        TYPE bus_ei_bupa_address,
         ls_target_address        TYPE bus_ei_bupa_address,
         ls_source_remark         TYPE bus_ei_bupa_addressremark,
         ls_target_remark         TYPE bus_ei_bupa_addressremark,
         ls_cust_remark           TYPE cvis_ei_rem,
         lv_tabix                 TYPE sy-tabix,
         lv_display_st_tabix      TYPE sy-tabix,
         ls_display_structure     TYPE mds_cmpt_display_structure,
         ls_result_st             TYPE mds_cmpt_display_st_result,
         lv_inconsistent_temp     TYPE boolean,
         lv_inconsistent          TYPE boolean,
         lt_messages              TYPE mds_ctrls_error_objects.


* initialize exporting parameters
  CLEAR : et_messages , ev_inconsistent.


  READ TABLE it_source_address INTO ls_source_address
       with key data-postal-data-standardaddress = gc_true.

  READ TABLE it_target_address INTO ls_target_address INDEX 1.

  ls_result_st-sequence_number = 1.

* compare postal data
  CALL METHOD compare_and_fill(
    EXPORTING
      iv_dataset          = gc_relationship
      is_source           = ls_source_address-data-postal-data
      is_target           = it_original_pvt_add-postal-data
      is_mapped_target    = ls_target_address-data-postal-data
    IMPORTING
      et_messages         = lt_messages
      ev_inconsistent     = lv_inconsistent_temp
    CHANGING
      cs_result_structure = cs_display_structure-data-home_address-postal
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.

*Compare Remarks data
  LOOP AT ls_source_address-data-remark-remarks INTO ls_source_remark.
    lv_tabix = sy-tabix.
    READ TABLE ls_target_address-data-remark-remarks INTO ls_target_remark INDEX lv_tabix.
    READ TABLE it_original_pvt_add-remark-remarks INTO ls_cust_remark INDEX lv_tabix.

    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_remark-data
        is_target           = ls_cust_remark-data
        is_mapped_target    = ls_target_remark-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent_temp
      CHANGING
        cs_result_structure = cs_display_structure-data-home_address-remarks
        ).

* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent_temp = gc_true.
      lv_inconsistent = gc_true.
    ENDIF.
    CLEAR : ls_source_remark , ls_target_remark , ls_cust_remark , lv_tabix.
  ENDLOOP.

* compare version data
  CALL METHOD compare_bp_as_src_pvt_add_ver(
    EXPORTING
      it_source_ver        = ls_source_address-data-version-versions
      it_target_ver        = ls_target_address-data-version-versions
      it_cust_ver          = it_original_pvt_add-version-versions
    IMPORTING
      et_messages          = lt_messages
      ev_inconsistent      = lv_inconsistent_temp
    CHANGING
      cs_display_structure = cs_display_structure
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.

* compare communication data
  CALL METHOD compare_bp_as_src_rel_comm(
    EXPORTING
      is_source_comm       = ls_source_address-data-communication
      is_target_comm       = ls_target_address-data-communication
      is_original_comm     = it_original_pvt_add-communication
    IMPORTING
      et_messages          = lt_messages
      ev_inconsistent      = lv_inconsistent_temp
    CHANGING
      cs_display_structure = cs_display_structure-data-home_address-communication
      ).

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent_temp = gc_true.
    lv_inconsistent = gc_true.
  ENDIF.

  IF cs_display_structure-data-home_address-postal IS NOT INITIAL.
    MODIFY cs_display_structure-data-home_address-postal FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  IF cs_display_structure-data-home_address-remarks IS NOT INITIAL.
    MODIFY cs_display_structure-data-home_address-remarks FROM ls_result_st
           TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.

  ev_inconsistent = lv_inconsistent.
ENDMETHOD.


METHOD compare_customer_as_source.

  DATA:   ls_source_st         TYPE cmds_ei_extern,
          ls_target_st         TYPE cmds_ei_extern,
          ls_target_org        TYPE bus_ei_extern,
          lv_tabix             TYPE sy-tabix,
          ls_message           TYPE bapiret2,
          lt_messages          TYPE mds_ctrls_error_objects,
          ls_source_contact    TYPE cmds_ei_contacts,
          ls_target_contact    TYPE cmds_ei_contacts,
          ls_target_rel_org    TYPE burs_ei_extern,
          lv_inconsistent      TYPE boolean,
          lv_inconsistent_obj TYPE boolean,
          ls_display_structure TYPE mds_cmpt_display_structure,
          lv_display_index     TYPE sy-tabix,
          lv_target_object     TYPE mds_cmpt_target_object_id,
          ls_source_rel        TYPE cmds_ei_contacts,
          ls_target_rel        TYPE cmds_ei_contacts,
          ls_bp_rel            TYPE burs_ei_extern,
          ls_bp_rel_partner    TYPE bus_ei_extern,
          lv_rel_index         TYPE sy-tabix,
          ls_rel_disp_st       TYPE mds_cmpt_disp_st_relationship.

*Initialization
  CLEAR: lt_messages.

* Store the compare process id
  gv_source_object = gc_customer.
  gv_target_object = gc_bp.

  IF gv_cmp_id IS INITIAL.
    SELECT SINGLE cmp_id FROM mdse_cmpt_proc INTO gv_cmp_id
                         WHERE source_object = gv_source_object
                           AND target_object = gv_target_object.
    CHECK Sy-subrc EQ 0.
  ENDIF.

  LOOP AT is_source_st-customers INTO ls_source_st.
    lv_tabix = sy-tabix.
    READ TABLE ct_display_structure INTO ls_display_structure with key
                                    source_object = ls_source_st-header-object_instance-kunnr.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    lv_display_index = sy-tabix.
    lv_target_object = ls_display_structure-target_object.
    READ TABLE is_target_st-customers INTO ls_target_st with key header-object_instance-kunnr = ls_source_st-header-object_instance-kunnr.

    READ TABLE is_target_org-partners INTO ls_target_org with key header-object_instance-bpartner = lv_target_object.

    READ TABLE is_target_org-relations INTO ls_target_rel_org with key header-object_instance-partner1 = lv_target_object. "#EC ENHOK
    IF sy-subrc IS NOT INITIAL.
      READ TABLE is_target_org-relations INTO ls_target_rel_org with key header-object_instance-partner2 = lv_target_object. "#EC ENHOK
    ENDIF.

* Central data
    READ TABLE it_datasets with key datasetname = gc_address
                                           flag = gc_true
                           TRANSPORTING no fields.

    IF sy-subrc = 0.

      CALL METHOD me->compare_cust_as_source_general
        EXPORTING
          is_source_gen        = ls_source_st-central_data
          is_target_gen        = ls_target_st-central_data
          it_target_gen_org    = ls_target_org
        IMPORTING
          et_messages          = lt_messages
          ev_inconsistent      = lv_inconsistent
        CHANGING
          ct_display_structure = ct_display_structure.

      IF lv_inconsistent = gc_true AND lv_inconsistent_obj = gc_false.
        lv_inconsistent_obj = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.

* Address data
      CALL METHOD me->compare_cust_as_source_address
        EXPORTING
          is_source_add        = ls_source_st-central_data-address
          is_target_add        = ls_target_st-central_data-address
          it_target_add_org    = ls_target_org
        IMPORTING
          et_messages          = lt_messages
          ev_inconsistent      = lv_inconsistent
        CHANGING
          ct_display_structure = ct_display_structure.

      IF lv_inconsistent = gc_true AND lv_inconsistent_obj = gc_false.
        lv_inconsistent_obj = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDIF.

*Bank details
    READ TABLE it_datasets with key datasetname = gc_bank
                                           flag = gc_true
                           TRANSPORTING no fields.

    IF sy-subrc = 0.

      CALL METHOD me->compare_cust_as_source_bank
        EXPORTING
          it_source_bnk        = ls_source_st-central_data-bankdetail-bankdetails
          it_target_bnk        = ls_target_st-central_data-bankdetail-bankdetails
          it_target_bnk_org    = ls_target_org
        IMPORTING
          et_messages          = lt_messages
          ev_inconsistent      = lv_inconsistent
        CHANGING
          ct_display_structure = ct_display_structure.

      IF lv_inconsistent = gc_true AND lv_inconsistent_obj = gc_false.
        lv_inconsistent_obj = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDIF.

*credit card
    READ TABLE it_datasets with key datasetname = gc_ccard
                                           flag = gc_true
                           TRANSPORTING no fields.

    IF sy-subrc = 0.

      CALL METHOD me->compare_cust_as_source_credit
        EXPORTING
          it_source_credit     = ls_source_st-central_data-creditcard-creditcard
          it_target_credit     = ls_target_st-central_data-creditcard-creditcard
          it_target_credit_org = ls_target_org
        IMPORTING
          et_messages          = lt_messages
          ev_inconsistent      = lv_inconsistent
        CHANGING
          ct_display_structure = ct_display_structure.

      IF lv_inconsistent = gc_true AND lv_inconsistent_obj = gc_false.
        lv_inconsistent_obj = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDIF.

*Tax
    READ TABLE it_datasets with key datasetname = gc_tax
                                           flag = gc_true
                           TRANSPORTING no fields.

    IF sy-subrc = 0.
      CALL METHOD me->compare_cust_as_source_tax
        EXPORTING
          is_source_tax        = ls_source_st-central_data
          is_target_tax        = ls_target_st-central_data
          it_target_tax_org    = ls_target_org
        IMPORTING
          et_messages          = lt_messages
          ev_inconsistent      = lv_inconsistent
        CHANGING
          ct_display_structure = ct_display_structure.

      IF lv_inconsistent = gc_true AND lv_inconsistent_obj = gc_false.
        lv_inconsistent_obj = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDIF.

*Industry Sector
    READ TABLE it_datasets with key datasetname = gc_industry
                                           flag = gc_true
                           TRANSPORTING no fields.

    IF sy-subrc = 0.
      CALL METHOD me->compare_cust_as_source_ind
        EXPORTING
          it_source_ind        = ls_source_st
          it_target_ind        = ls_target_st
          it_target_ind_org    = ls_target_org
        IMPORTING
          et_messages          = lt_messages
          ev_inconsistent      = lv_inconsistent
        CHANGING
          ct_display_structure = ct_display_structure.

      IF lv_inconsistent = gc_true AND lv_inconsistent_obj = gc_false.
        lv_inconsistent_obj = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDIF.

*Contact Partner
    READ TABLE it_datasets with key datasetname = gc_relationship
                                           flag = gc_true
                           TRANSPORTING no fields.

    IF sy-subrc = 0.

      LOOP AT ls_source_st-central_data-contact-contacts INTO ls_source_rel.
        lv_rel_index = sy-index.
        IF sy-subrc = 0.
*     Customer Contact data
          READ TABLE ls_target_st-central_data-contact-contacts INTO ls_target_rel INDEX lv_rel_index.
*     BP relationship data
          READ TABLE is_target_org-relations INTO ls_bp_rel
                    with key header-object_instance-partner1 = ls_source_st-header-object_instance-kunnr
                    header-object_instance-partner2 = ls_source_rel-data_key-parnr.
          IF sy-subrc <> 0.
            READ TABLE is_target_org-relations INTO ls_bp_rel
               with key header-object_instance-partner1 = ls_source_rel-data_key-parnr
               header-object_instance-partner2 = ls_source_st-header-object_instance-kunnr.
          ENDIF.
*     Partner data
          IF ls_bp_rel-header-object_instance-partner1 = ls_source_st-header-object_instance-kunnr.
            READ TABLE is_target_org-partners INTO ls_bp_rel_partner with key
                    header-object_instance-bpartner = ls_bp_rel-header-object_instance-partner2.
          ELSEIF ls_bp_rel-header-object_instance-partner2 = ls_source_st-header-object_instance-kunnr.
            READ TABLE is_target_org-partners INTO ls_bp_rel_partner with key
                     header-object_instance-bpartner = ls_bp_rel-header-object_instance-partner1.
          ENDIF.
*     Relationship Display structure
          READ TABLE ls_display_structure-data-relationship-data INTO ls_rel_disp_st INDEX lv_display_index.
          ls_rel_disp_st-person_id    = ls_source_st-header-object_instance-kunnr.
          ls_rel_disp_st-ct_person_id = ls_source_rel-data_key-parnr.

          CALL METHOD me->compare_cust_as_source_rel
            EXPORTING
              is_source_rel         = ls_source_rel
              is_target_rel         = ls_target_rel
              is_target_rel_org     = ls_bp_rel
              is_target_rel_partner = ls_bp_rel_partner
            IMPORTING
              et_messages           = lt_messages
              ev_inconsistent       = lv_inconsistent
            CHANGING
              cs_display_structure  = ls_rel_disp_st.

          IF lv_inconsistent = gc_true AND lv_inconsistent_obj = gc_false.
            lv_inconsistent_obj = gc_true.
            CLEAR lv_inconsistent.
          ENDIF.

          IF ls_target_rel IS INITIAL.
            ls_display_structure-data-relationship-status = gc_error.
          ELSEIF lv_inconsistent = gc_true.
            ls_display_structure-data-relationship-status = gc_inconsistent.
          ELSEIF lv_inconsistent = gc_false.
            ls_display_structure-data-relationship-status = gc_consistent.
          ENDIF.
        ELSE.
          ls_display_structure-data-relationship-status = gc_notmaintained.
        ENDIF.

        IF ls_rel_disp_st IS NOT INITIAL.
          APPEND ls_rel_disp_st TO ls_display_structure-data-relationship-data.
        ENDIF.

        MODIFY ct_display_structure FROM ls_display_structure
                                    INDEX lv_display_index TRANSPORTING data-relationship.
      ENDLOOP.
    ENDIF.



    IF lv_inconsistent_obj IS INITIAL.
      ls_display_structure-consistent = gc_true.
    ELSEIF lv_inconsistent_obj = gc_true.
      ls_display_structure-consistent = gc_false.
    ENDIF.

    MODIFY ct_display_structure FROM ls_display_structure INDEX lv_display_index
           TRANSPORTING consistent.
    CLEAR: lv_inconsistent_obj,
           lv_inconsistent.
  ENDLOOP.

ENDMETHOD.


METHOD compare_cust_as_source_address.

  TYPE-POOLS: list.

  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lv_display_index      TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_dfies              LIKE LINE OF gt_dfies,
        lv_sequence_number    TYPE i,
        lv_inconsistent       TYPE boolean,
        lv_inconsistent_add    TYPE boolean,
        ls_source_add_postal  TYPE cvis_ei_1vl, "CVIS_EI_ADDRESS1,
        ls_target_add_postal  TYPE cvis_ei_1vl, "CVIS_EI_ADDRESS1,
        lt_bp_add             TYPE bus_ei_bupa_address_t,
        ls_bp_add             TYPE bus_ei_bupa_address,
        lt_source_remarks     TYPE cvis_ei_rem_t,
        lt_target_remarks     TYPE cvis_ei_rem_t,
        ls_bp_remarks         TYPE bus_ei_bupa_addressremark,
        ls_source_remarks     TYPE cvis_ei_rem,
        ls_target_remarks     TYPE cvis_ei_rem,
        lv_index              TYPE sy-index,
        ls_bp_comm            TYPE bus_ei_communication.
*

* Initialize
  CLEAR: et_messages,
         lt_messages.
* Read display structure for partner Index
  READ TABLE ct_display_structure INTO ls_display_structure
            with key target_object = it_target_add_org-header-object_instance-bpartner.
  lv_display_index = sy-tabix.
*
  IF is_source_add IS NOT INITIAL.
*
* Read source and mapped target data
    ls_source_add_postal = is_source_add-postal-data.
    ls_target_add_postal = is_target_add-postal-data.
*
* Read original target data
    lt_bp_add = it_target_add_org-central_data-address-addresses.
    READ TABLE lt_bp_add INTO ls_bp_add with key
                            data-postal-data-standardaddress = gc_true.
* Abort if standard address not found.
    ls_result-sequence_number = 1.

*Postal data
    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_add_postal
        is_target           = ls_bp_add-data-postal-data
        is_mapped_target    = ls_target_add_postal
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-postal.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    TRY.
        MODIFY ls_display_structure-data-address-postal FROM ls_result
                                        TRANSPORTING sequence_number
                                               WHERE sequence_number IS INITIAL.

      CATCH cx_root.   "#EC NO_HANDLER
    ENDTRY.

    IF lv_inconsistent = gc_true and lv_inconsistent_add = gc_false.
      lv_inconsistent_add = lv_inconsistent.
      CLEAR lv_inconsistent.
    ENDIF.

*Remarks
    lt_source_remarks = is_source_add-remark-remarks.
    lt_target_remarks = is_target_add-remark-remarks.

    CALL METHOD me->compare_cust_as_source_rem
      EXPORTING
        it_source_rem        = lt_source_remarks
        it_target_rem        = lt_target_remarks
        it_target_org_rem    = ls_bp_add-data-remark-remarks
        iv_dataset           = gc_address
      IMPORTING
        ET_MESSAGES          = lt_messages
        EV_INCONSISTENT      = lv_inconsistent
      changing
        cs_display_structure = ls_display_structure-data-address-remarks
        .
* handle error
          CALL METHOD handle_error(
            EXPORTING
              it_messages = lt_messages
            CHANGING
              ct_messages = et_messages
              ).

    IF lv_inconsistent = gc_true and lv_inconsistent_add = gc_false.
      lv_inconsistent_add = lv_inconsistent.
      CLEAR lv_inconsistent.
    ENDIF.

*


*Versions
    CALL METHOD me->compare_cust_as_source_version
      EXPORTING
        it_source_add_ver    = is_source_add-version-versions
        it_target_add_ver    = is_target_add-version-versions
        it_target_add_ver_or = ls_bp_add-data-version-versions
      IMPORTING
        et_messages          = lt_messages
        ev_inconsistent      = lv_inconsistent
      CHANGING
        cs_display_structure = ls_display_structure-data-address-versions.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_add = gc_false.
      lv_inconsistent_add = lv_inconsistent.
      CLEAR lv_inconsistent.
    ENDIF.

*Communication
    ls_bp_comm = it_target_add_org-central_data-communication.

    CALL METHOD me->compare_cust_as_source_comm
      EXPORTING
        is_source_add_comm   = is_source_add-communication
        is_target_add_comm   = is_target_add-communication
        is_target_add_comm_o = ls_bp_comm
        iv_dataset           = gc_address
      IMPORTING
        et_messages          = et_messages
        ev_inconsistent      = lv_inconsistent
      CHANGING
        cs_display_structure = ls_display_structure-data-address-communication.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_add = gc_false.
      lv_inconsistent_add = lv_inconsistent.
      CLEAR lv_inconsistent.
    ENDIF.


    IF is_target_add IS INITIAL.
      ls_display_structure-data-address-status = gc_error.
    ELSEIF lv_inconsistent_add = gc_true.
      ls_display_structure-data-address-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-address-status = gc_consistent.
    ENDIF.
  ELSE.
    ls_display_structure-data-address-status = gc_notmaintained.
  ENDIF.

  MODIFY ct_display_structure INDEX lv_display_index FROM ls_display_structure.
  ev_inconsistent = lv_inconsistent_add.
ENDMETHOD.


METHOD compare_cust_as_source_bank.
  TYPE-POOLS: list.
  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lt_temp_result        type mds_cmpt_display_st_result_t,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        lv_inconsistent       TYPE boolean,
        lv_inconsistent_bank  TYPE boolean,
        lv_display_index      TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        ls_source_bank        TYPE cvis_ei_cvi_bankdetail,
        ls_target_bank        TYPE cvis_ei_cvi_bankdetail,
        lt_bp_bank            TYPE bus_ei_bupa_bankdetail_t,
        ls_bp_bank            TYPE bus_ei_bupa_bankdetail,
        lv_sequence_number    TYPE i,
        lt_dfies              LIKE LINE OF gt_dfies.
*

*
  CLEAR: et_messages,
         lt_messages.
*
  READ TABLE ct_display_structure INTO ls_display_structure
            with key target_object = it_target_bnk_org-header-object_instance-bpartner.
  lv_display_index = sy-tabix.
*
  IF it_source_bnk IS NOT INITIAL.
*
    lt_bp_bank = it_target_bnk_org-central_data-bankdetail-bankdetails.
*
    LOOP AT it_source_bnk INTO ls_source_bank.
      READ TABLE it_target_bnk INTO ls_target_bank with key
                                data_key-bankn = ls_source_bank-data_key-bankn
                                data_key-banks = ls_source_bank-data_key-banks
                                data_key-bankl = ls_source_bank-data_key-bankl.

      READ TABLE lt_bp_bank INTO ls_bp_bank with key
                                data-bank_acct = ls_source_bank-data_key-bankn
                                data-bank_ctry = ls_source_bank-data_key-banks
                                data-bank_key  = ls_source_bank-data_key-bankl.

*
      lv_sequence_number        = lv_sequence_number  + 1.
      ls_result-sequence_number = lv_sequence_number .

*   Compare fields
        CALL METHOD me->compare_and_fill
          EXPORTING
            iv_dataset          = gc_bank
            is_source           = ls_source_bank-data_key
            is_target           = ls_bp_bank-data
            is_mapped_target    = ls_target_bank-data_key
          IMPORTING
            ET_MESSAGES         = lt_messages
            EV_INCONSISTENT     = lv_inconsistent
          changing
            cs_result_structure = ls_display_structure-data-bank-data
            .
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true AND lv_inconsistent_bank = gc_false.
        lv_inconsistent_bank = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.

        CALL METHOD me->compare_and_fill
          EXPORTING
            iv_dataset          = gc_bank
            is_source           = ls_source_bank-data
            is_target           = ls_bp_bank-data
            is_mapped_target    = ls_target_bank-data
          IMPORTING
            ET_MESSAGES         = lt_messages
            EV_INCONSISTENT     = lv_inconsistent
          changing
            cs_result_structure = ls_display_structure-data-bank-data.
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true AND lv_inconsistent_bank = gc_false.
        lv_inconsistent_bank = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.

      TRY.
          MODIFY ls_display_structure-data-bank-data FROM ls_result
                 TRANSPORTING sequence_number
                 WHERE sequence_number IS INITIAL.
        CATCH cx_root. "#EC NO_HANDLER
      ENDTRY.

      APPEND LINES OF ls_display_structure-data-bank-data TO lt_temp_result.
      CLEAR ls_display_structure-data-bank-data.
    ENDLOOP.
    APPEND LINES OF lt_temp_result TO ls_display_structure-data-bank-data.
*
    IF it_target_bnk IS INITIAL.
      ls_display_structure-data-bank-status = gc_error.
    ELSEIF lv_inconsistent_bank = gc_true.
      ls_display_structure-data-bank-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-bank-status = gc_consistent.
    ENDIF.
  ELSE.
    ls_display_structure-data-bank-status = gc_notmaintained.
  ENDIF.
*
  MODIFY ct_display_structure INDEX lv_display_index FROM ls_display_structure.
  ev_inconsistent = lv_inconsistent_bank.

  clear lv_inconsistent_bank.
ENDMETHOD.


METHOD compare_cust_as_source_comm.

  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lv_index              TYPE sy-tabix,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_dfies              LIKE LINE OF gt_dfies,
        lv_sequence_number    TYPE i,
        lv_inconsistent       TYPE boolean,
        lv_inconsistent_comm  TYPE boolean,
        lv_inconsistent_add   TYPE boolean,
        ls_source_phone       TYPE cvis_ei_phone_str,
        ls_target_phone       TYPE cvis_ei_phone_str,
        ls_bp_phone           TYPE bus_ei_bupa_telephone,
        ls_source_fax         TYPE cvis_ei_fax_str,
        ls_target_fax         TYPE cvis_ei_fax_str,
        ls_bp_fax             TYPE bus_ei_bupa_fax,
        ls_source_ttx         TYPE cvis_ei_ttx_str,
        ls_target_ttx         TYPE cvis_ei_ttx_str,
        ls_bp_ttx             TYPE bus_ei_bupa_ttx,
        ls_source_tlx         TYPE cvis_ei_tlx_str,
        ls_target_tlx         TYPE cvis_ei_tlx_str,
        ls_bp_tlx             TYPE bus_ei_bupa_tlx,
        ls_source_smtp        TYPE cvis_ei_smtp_str,
        ls_target_smtp        TYPE cvis_ei_smtp_str,
        ls_bp_smtp            TYPE bus_ei_bupa_smtp,
        ls_source_rml         TYPE cvis_ei_rml_str,
        ls_target_rml         TYPE cvis_ei_rml_str,
        ls_bp_rml             TYPE bus_ei_bupa_rml,
        ls_source_x400        TYPE cvis_ei_x400_str,
        ls_target_x400        TYPE cvis_ei_x400_str,
        ls_bp_x400            TYPE bus_ei_bupa_x400,
        ls_source_rfc         TYPE cvis_ei_rfc_str,
        ls_target_rfc         TYPE cvis_ei_rfc_str,
        ls_bp_rfc             TYPE bus_ei_bupa_rfc,
        ls_source_prt         TYPE cvis_ei_prt_str,
        ls_target_prt         TYPE cvis_ei_prt_str,
        ls_bp_prt             TYPE bus_ei_bupa_prt,
        ls_source_ssf         TYPE cvis_ei_ssf_str,
        ls_target_ssf         TYPE cvis_ei_ssf_str,
        ls_bp_ssf             TYPE bus_ei_bupa_ssf,
        ls_source_uri         TYPE cvis_ei_uri_str,
        ls_target_uri         TYPE cvis_ei_uri_str,
        ls_bp_uri             TYPE bus_ei_bupa_uri,
        ls_source_pager       TYPE cvis_ei_pag_str,
        ls_target_pager       TYPE cvis_ei_pag_str,
        ls_bp_pager           TYPE bus_ei_bupa_pag,
        lt_source_remarks     TYPE cvis_ei_comrem_t,
        lt_target_remarks     TYPE cvis_ei_comrem_t,
        lt_bp_remarks         TYPE bus_ei_bupa_comrem_t,
        ls_bp_remark          TYPE bus_ei_bupa_comrem,
        ls_source_remark      type cvis_ei_comrem,
        ls_target_remark      type cvis_ei_comrem.

* set sequence number
  ls_result-sequence_number = 1.
* Phone
  LOOP AT is_source_add_comm-phone-phone INTO ls_source_phone .
    lv_index = sy-tabix.
* Contact Data
    READ TABLE is_target_add_comm-phone-phone INTO ls_target_phone INDEX lv_index.
    READ TABLE is_target_add_comm_o-phone-phone INTO ls_bp_phone INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = iv_dataset
        is_source           = ls_source_phone-contact-data
        is_target           = ls_bp_phone-contact-data
        is_mapped_target    = ls_target_phone-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure-phone-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_phone-remark-remarks.
    lt_target_remarks = ls_target_phone-remark-remarks.
    lt_bp_remarks     = ls_bp_phone-remark-remarks.


    LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = iv_dataset
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = cs_display_structure-phone-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.
*Fax
  LOOP AT is_source_add_comm-fax-fax INTO ls_source_fax .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-fax-fax INTO ls_target_fax INDEX lv_index.
    READ TABLE is_target_add_comm_o-fax-fax INTO ls_bp_fax INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = iv_dataset
        is_source           = ls_source_fax-contact-data
        is_target           = ls_bp_fax-contact-data
        is_mapped_target    = ls_target_fax-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure-fax-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_fax-remark-remarks.
    lt_target_remarks = ls_target_fax-remark-remarks.
    lt_bp_remarks     = ls_bp_fax-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = iv_dataset
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = cs_display_structure-fax-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*TTX
  LOOP AT is_source_add_comm-ttx-ttx INTO ls_source_ttx .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-ttx-ttx INTO ls_target_ttx INDEX lv_index.
    READ TABLE is_target_add_comm_o-ttx-ttx INTO ls_bp_ttx INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = iv_dataset
        is_source           = ls_source_ttx-contact-data
        is_target           = ls_bp_ttx-contact-data
        is_mapped_target    = ls_target_ttx-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure-ttx-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_ttx-remark-remarks.
    lt_target_remarks = ls_target_ttx-remark-remarks.
    lt_bp_remarks     = ls_bp_ttx-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = iv_dataset
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = cs_display_structure-ttx-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*TLX
  LOOP AT is_source_add_comm-tlx-tlx INTO ls_source_tlx .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-tlx-tlx INTO ls_target_tlx INDEX lv_index.
    READ TABLE is_target_add_comm_o-tlx-tlx INTO ls_bp_tlx INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = iv_dataset
        is_source           = ls_source_tlx-contact-data
        is_target           = ls_bp_tlx-contact-data
        is_mapped_target    = ls_target_tlx-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure-tlx-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_tlx-remark-remarks.
    lt_target_remarks = ls_target_tlx-remark-remarks.
    lt_bp_remarks     = ls_bp_tlx-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = iv_dataset
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = cs_display_structure-tlx-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*SMTP
  LOOP AT is_source_add_comm-smtp-smtp INTO ls_source_smtp .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-smtp-smtp INTO ls_target_smtp INDEX lv_index.
    READ TABLE is_target_add_comm_o-smtp-smtp INTO ls_bp_smtp INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = iv_dataset
        is_source           = ls_source_smtp-contact-data
        is_target           = ls_bp_smtp-contact-data
        is_mapped_target    = ls_target_smtp-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure-smtp-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_smtp-remark-remarks.
    lt_target_remarks = ls_target_smtp-remark-remarks.
    lt_bp_remarks     = ls_bp_smtp-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = iv_dataset
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = cs_display_structure-smtp-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*RML
  LOOP AT is_source_add_comm-rml-rml INTO ls_source_rml .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-rml-rml INTO ls_target_rml INDEX lv_index.
    READ TABLE is_target_add_comm_o-rml-rml INTO ls_bp_rml INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = iv_dataset
        is_source           = ls_source_rml-contact-data
        is_target           = ls_bp_rml-contact-data
        is_mapped_target    = ls_target_rml-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure-remote_mail_add-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_rml-remark-remarks.
    lt_target_remarks = ls_target_rml-remark-remarks.
    lt_bp_remarks     = ls_bp_rml-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = iv_dataset
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = cs_display_structure-remote_mail_add-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*X400
  LOOP AT is_source_add_comm-x400-x400 INTO ls_source_x400 .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-x400-x400 INTO ls_target_x400 INDEX lv_index.
    READ TABLE is_target_add_comm_o-x400-x400 INTO ls_bp_x400 INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = iv_dataset
        is_source           = ls_source_x400-contact-data
        is_target           = ls_bp_x400-contact-data
        is_mapped_target    = ls_target_x400-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure-x400-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_x400-remark-remarks.
    lt_target_remarks = ls_target_x400-remark-remarks.
    lt_bp_remarks     = ls_bp_x400-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = iv_dataset
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = cs_display_structure-x400-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

* RFC
  LOOP AT is_source_add_comm-rfc-rfc INTO ls_source_rfc .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-rfc-rfc INTO ls_target_rfc INDEX lv_index.
    READ TABLE is_target_add_comm_o-rfc-rfc INTO ls_bp_rfc INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = iv_dataset
        is_source           = ls_source_rfc-contact-data
        is_target           = ls_bp_rfc-contact-data
        is_mapped_target    = ls_target_rfc-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure-rfc-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_rfc-remark-remarks.
    lt_target_remarks = ls_target_rfc-remark-remarks.
    lt_bp_remarks     = ls_bp_rfc-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = iv_dataset
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = cs_display_structure-rfc-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*  PRT
  LOOP AT is_source_add_comm-prt-prt INTO ls_source_prt .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-prt-prt INTO ls_target_prt INDEX lv_index.
    READ TABLE is_target_add_comm_o-prt-prt INTO ls_bp_prt INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = iv_dataset
        is_source           = ls_source_prt-contact-data
        is_target           = ls_bp_prt-contact-data
        is_mapped_target    = ls_target_prt-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure-prt-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_prt-remark-remarks.
    lt_target_remarks = ls_target_prt-remark-remarks.
    lt_bp_remarks     = ls_bp_prt-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = iv_dataset
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = cs_display_structure-prt-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*  SSF
  LOOP AT is_source_add_comm-ssf-ssf INTO ls_source_ssf .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-ssf-ssf INTO ls_target_ssf INDEX lv_index.
    READ TABLE is_target_add_comm_o-ssf-ssf INTO ls_bp_ssf INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = iv_dataset
        is_source           = ls_source_ssf-contact-data
        is_target           = ls_bp_ssf-contact-data
        is_mapped_target    = ls_target_ssf-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure-ssf-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_ssf-remark-remarks.
    lt_target_remarks = ls_target_ssf-remark-remarks.
    lt_bp_remarks     = ls_bp_ssf-remark-remarks.

  LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = iv_dataset
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = cs_display_structure-ssf-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.


*    URI
  LOOP AT is_source_add_comm-uri-uri INTO ls_source_uri .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-uri-uri INTO ls_target_uri INDEX lv_index.
    READ TABLE is_target_add_comm_o-uri-uri INTO ls_bp_uri INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = iv_dataset
        is_source           = ls_source_uri-contact-data
        is_target           = ls_bp_uri-contact-data
        is_mapped_target    = ls_target_uri-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure-uri-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_uri-remark-remarks.
    lt_target_remarks = ls_target_uri-remark-remarks.
    lt_bp_remarks     = ls_bp_uri-remark-remarks.

   LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = iv_dataset
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = cs_display_structure-uri-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

*    PAGER
  LOOP AT is_source_add_comm-pager-pager INTO ls_source_pager .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-pager-pager INTO ls_target_pager INDEX lv_index.
    READ TABLE is_target_add_comm_o-pager-pager INTO ls_bp_pager INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = iv_dataset
        is_source           = ls_source_pager-contact-data
        is_target           = ls_bp_pager-contact-data
        is_mapped_target    = ls_target_pager-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure-pager-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_pager-remark-remarks.
    lt_target_remarks = ls_target_pager-remark-remarks.
    lt_bp_remarks     = ls_bp_pager-remark-remarks.

  LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = iv_dataset
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = cs_display_structure-pager-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

  TRY.
      MODIFY cs_display_structure-phone-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY cs_display_structure-phone-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY cs_display_structure-fax-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY cs_display_structure-fax-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.


      MODIFY cs_display_structure-ttx-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY cs_display_structure-ttx-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.


      MODIFY cs_display_structure-tlx-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY cs_display_structure-tlx-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY cs_display_structure-smtp-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY cs_display_structure-smtp-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY cs_display_structure-remote_mail_add-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY cs_display_structure-remote_mail_add-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY cs_display_structure-x400-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY cs_display_structure-x400-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY cs_display_structure-rfc-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY cs_display_structure-rfc-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY cs_display_structure-ssf-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY cs_display_structure-ssf-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY cs_display_structure-prt-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY cs_display_structure-prt-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY cs_display_structure-uri-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY cs_display_structure-uri-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY cs_display_structure-pager-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY cs_display_structure-pager-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
    CATCH cx_root. "#EC NO_HANDLER
  ENDTRY.

  ev_inconsistent = lv_inconsistent_comm.

ENDMETHOD.


METHOD compare_cust_as_source_comrem.
  DATA:
  ls_bp_remark          TYPE bus_ei_bupa_comrem,
  ls_display_structure  TYPE mds_cmpt_display_structure,
  ls_source_remark      type cvis_ei_comrem,
  ls_target_remark      type cvis_ei_comrem,
  lv_index              TYPE sy-tabix,
  lv_inconsistent       type boolean,
  lv_inconsistent_rem   type boolean,
  lt_messages           type mds_ctrls_error_objects,
  ls_result             type mds_cmpt_display_st_result.

* set sequence number
  ls_result-sequence_number = 1.
  LOOP AT it_source_add_comrem INTO ls_source_remark.
    lv_index = sy-tabix.
    READ TABLE it_target_add_comrem INTO ls_target_remark INDEX lv_index.
    READ TABLE it_target_add_comrem_o INTO ls_bp_remark INDEX lv_index.
    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = 'DSET_01'
        is_source           = ls_source_remark-data
        is_target           = ls_bp_remark-data
        is_mapped_target    = ls_target_remark-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-phone-remarks.
*     handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true.
      lv_inconsistent_rem = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
  ENDLOOP.

TRY.
      MODIFY ls_display_structure-data-address-communication-phone-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
catch cx_root. "#EC NO_HANDLER
endtry.
ev_inconsistent = lv_inconsistent_rem.

cs_display_structure = ls_display_structure-data-address-communication-phone-remarks.

ENDMETHOD.


METHOD compare_cust_as_source_credit.

  TYPE-POOLS : list.

  DATA: lt_messages               TYPE mds_ctrls_error_objects,
        ls_message                TYPE bapiret2,
        ls_source_credit          TYPE cmds_ei_creditcard,
        ls_target_credit          TYPE cmds_ei_creditcard,
        lv_tabix                  TYPE sy-tabix,
        ls_display_structure      TYPE mds_cmpt_display_structure,
        ls_result                 TYPE mds_cmpt_display_st_result,
        lt_temp_result            TYPE mds_cmpt_display_st_result_t,
        lt_dfies                  LIKE LINE OF gt_dfies,
        lv_sequence_number        TYPE i,
        lt_bp_credit              TYPE bus_ei_bupa_creditcard_t,
        ls_bp_credit              TYPE bus_ei_bupa_creditcard,
        lv_inconsistent           TYPE boolean,
        lv_inconsistent_credit    TYPE boolean,
        lv_display_index          TYPE sy-tabix,
        lv_tabname                TYPE tabname.

  CONSTANTS: lc_but0cc(6) TYPE c VALUE 'BUT0CC',
             lc_ccard(5)  TYPE c VALUE 'CCARD',
             lc_vcnum(5)  TYPE c VALUE 'VCNUM',
             lc_vckun(5)  TYPE c VALUE 'VCKUN'.

  CLEAR: et_messages,
         lt_messages,
         lv_tabix.

* Get the display strcture index.
  READ TABLE ct_display_structure INTO ls_display_structure
            with key target_object = it_target_credit_org-header-object_instance-bpartner.
  IF sy-subrc <> 0.
    RETURN. " Ideally this condition should not occur!!
  ENDIF.
  lv_display_index = sy-tabix.

* Get Target data.
  lt_bp_credit = it_target_credit_org-central_data-paycard-paycards.

  IF it_source_credit IS NOT INITIAL.
    LOOP AT it_source_credit INTO ls_source_credit.
      lv_tabix = sy-tabix.
      lv_sequence_number = lv_sequence_number + 1.
      ls_result-sequence_number = lv_sequence_number.

      READ TABLE it_target_credit INTO ls_target_credit with key
                                              data_key-ccins = ls_source_credit-data_key-ccins
                                              data_key-ccnum = ls_source_credit-data_key-ccnum.
      READ TABLE lt_bp_credit INTO ls_bp_credit with key
                                              data-card_type   = ls_source_credit-data_key-ccins
                                              data-card_number = ls_source_credit-data_key-ccnum.
*  compare fields of credit cards
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_ccard
          is_source           = ls_source_credit-data_key
          is_target           = ls_bp_credit-data
          is_mapped_target    = ls_target_credit-data_key
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-credit-data
          ).
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true AND lv_inconsistent_credit = gc_false.
        lv_inconsistent_credit = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.

      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_ccard
          is_source           = ls_source_credit-data
          is_target           = ls_bp_credit-data
          is_mapped_target    = ls_target_credit-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-credit-data
          ).
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true AND lv_inconsistent_credit = gc_false.
        lv_inconsistent_credit = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.

      try.
          MODIFY ls_display_structure-data-credit-data FROM ls_result
                 TRANSPORTING sequence_number
                 WHERE sequence_number IS INITIAL.
      catch cx_root. "#EC NO_HANDLER
      ENDTRY.
      APPEND LINES OF ls_display_structure-data-credit-data TO lt_temp_result.
      CLEAR ls_display_structure-data-credit-data.
    ENDLOOP.
    APPEND LINES OF lt_temp_result TO ls_display_structure-data-credit-data.
*  set status for the dataset
    IF it_target_credit IS INITIAL.
      ls_display_structure-data-credit-status = gc_error.
    ELSEIF lv_inconsistent_credit = gc_true.
      ls_display_structure-data-credit-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-credit-status = gc_consistent.
    ENDIF.
  ELSE.
    ls_display_structure-data-credit-status = gc_notmaintained.
  ENDIF.


* modify the display structure
  MODIFY ct_display_structure INDEX lv_display_index FROM ls_display_structure.
  ev_inconsistent = lv_inconsistent_credit.
ENDMETHOD.


METHOD compare_cust_as_source_general.

  TYPE-POOLS: list.
  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lv_display_index      TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        ls_source_gen         TYPE cmds_ei_central_data,
        ls_target_gen         TYPE cmds_ei_central_data,
        ls_bp_gen             TYPE bus_ei_bupa_central_data,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_dfies              LIKE LINE OF gt_dfies,
        lv_sequence_number    TYPE i,
        lv_inconsistent       TYPE boolean,
        lv_inconsistent_gen   TYPE boolean,
        ls_bp_gen_central     TYPE bus_ei_struc_central,
        ls_bp_gen_person      TYPE bus_ei_struc_central_person,
        ls_bp_gen_organ       TYPE bus_ei_struc_central_organ,
        lt_target             type ref to data.
*
field-symbols: <lt_target> type any.
** Initialize.
  CLEAR: et_messages,
         lt_messages.

** Read Partner index of the display structure
  READ TABLE ct_display_structure INTO ls_display_structure
            with key target_object = it_target_gen_org-header-object_instance-bpartner.
  lv_display_index = sy-tabix.
*

  IF is_source_gen IS NOT INITIAL.
    lv_sequence_number        = lv_sequence_number + 1.
    ls_result-sequence_number = lv_sequence_number.

*   Compare Fields
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = is_source_gen-central-data
          is_target           = it_target_gen_org-central_data-common-data-bp_centraldata
          is_mapped_target    = is_target_gen-central-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-general
          ).
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true AND lv_inconsistent_gen = gc_false.
        lv_inconsistent_gen = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.

     CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = is_source_gen-address-postal-data
          is_target           = it_target_gen_org-central_data-common-data-bp_centraldata
          is_mapped_target    = is_target_gen-address-postal-data
       IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-general
          ).
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true AND lv_inconsistent_gen = gc_false.
        lv_inconsistent_gen = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.

* Target BP is Person
     if it_target_gen_org-central_data-common-data-bp_control-category = '1'.
        create data lt_target type BUS_EI_STRUC_CENTRAL_PERSON.
        assign lt_target->* to <lt_target>.
        <lt_target> = it_target_gen_org-central_data-common-data-bp_person.

* Target BP is Organization
     Elseif it_target_gen_org-central_data-common-data-bp_control-category = '2'.
        create data lt_target type BUS_EI_STRUC_CENTRAL_ORGAN.
        assign lt_target->* to <lt_target>.
        <lt_target> = it_target_gen_org-central_data-common-data-bp_organization.

* Target BP is Group
     Elseif it_target_gen_org-central_data-common-data-bp_control-category = '3'.
        create data lt_target type BUS_EI_STRUC_CENTRAL_GROUP.
        assign lt_target->* to <lt_target>.
        <lt_target> = it_target_gen_org-central_data-common-data-bp_group.
     endif.
IF <lt_target> is assigned.
      CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = is_source_gen-central-data
          is_target           = <lt_target>
          is_mapped_target    = is_target_gen-central-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-general
          ).
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).
endif.

      IF lv_inconsistent = gc_true AND lv_inconsistent_gen = gc_false.
        lv_inconsistent_gen = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
IF <lt_target> is assigned.
     CALL METHOD compare_and_fill(
        EXPORTING
          iv_dataset          = gc_address
          is_source           = is_source_gen-address-postal-data
          is_target           = <lt_target>
          is_mapped_target    = is_target_gen-address-postal-data
       IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-general
          ).
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).
endif.

      IF lv_inconsistent = gc_true AND lv_inconsistent_gen = gc_false.
        lv_inconsistent_gen = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
*
    IF is_target_gen IS INITIAL.
      ls_display_structure-data-address-status = gc_error.
    ELSEIF lv_inconsistent_gen = gc_true.
      ls_display_structure-data-address-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-address-status = gc_consistent.
    ENDIF.

  ELSE. " Source is empty.
    ls_display_structure-data-address-status = gc_notmaintained.
  ENDIF.

  MODIFY ct_display_structure INDEX lv_display_index FROM ls_display_structure.
  ev_inconsistent = lv_inconsistent_gen.
ENDMETHOD.


METHOD compare_cust_as_source_ind.

  TYPE-POOLS : list.
*
  DATA: lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        lv_tabix              TYPE sy-tabix,
        ls_display_structure  TYPE mds_cmpt_display_structure,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_dfies              LIKE LINE OF gt_dfies,
        lv_sequence_number    TYPE i,
        lv_inconsistent       TYPE boolean,
        lv_display_index      TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        ls_source_ind         TYPE cmds_ei_vmd_central_data,
        ls_target_ind         TYPE cmds_ei_vmd_central_data,
        lt_bp_ind             TYPE bus_ei_bupa_industrysector_t,
        ls_bp_ind             TYPE bus_ei_bupa_industrysector.
*

*
  CLEAR: et_messages,
         lt_messages.
*
* Get The Partner index in Display Structure
  READ TABLE ct_display_structure INTO ls_display_structure
            with key target_object = it_target_ind_org-header-object_instance-bpartner.
  lv_display_index = sy-tabix.
*
  ls_source_ind = it_source_ind-central_data-central-data.
  ls_target_ind = it_target_ind-central_data-central-data.
*
  IF ls_source_ind-brsch IS NOT INITIAL.
* Read original Target structure
    lt_bp_ind = it_target_ind_org-central_data-industry-industries.
    READ TABLE lt_bp_ind INTO ls_bp_ind with key data-ind_default = gc_true.
*
    lv_sequence_number        = lv_sequence_number  + 1.
    ls_result-sequence_number = lv_sequence_number .

    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = 'DSET_04'
        is_source           = ls_source_ind
        is_target           = ls_bp_ind-data_key
        is_mapped_target    = ls_target_ind
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-industry-data
        ).
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).
    TRY.
        MODIFY ls_display_structure-data-industry-data FROM ls_result
               TRANSPORTING sequence_number
               WHERE sequence_number IS INITIAL.
      CATCH cx_root.   "#EC NO_HANDLER
    ENDTRY.
*
    IF ls_target_ind-brsch IS INITIAL.
      ls_display_structure-data-industry-status = gc_error.
    ELSEIF lv_inconsistent = gc_true.
      ls_display_structure-data-industry-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-industry-status = gc_consistent.
    ENDIF.
  ELSE. "source is empty
    ls_display_structure-data-industry-status = gc_notmaintained.
  ENDIF.
  MODIFY ct_display_structure INDEX lv_display_index FROM ls_display_structure .
  ev_inconsistent = lv_inconsistent.
ENDMETHOD.


METHOD compare_cust_as_source_rel.

  DATA: ls_source_rel        TYPE cmds_ei_contacts,
        ls_target_rel        TYPE cmds_ei_contacts,
        lv_index             TYPE sy-index,
        lv_display_index     TYPE sy-index,
        ls_display_structure TYPE mds_cmpt_display_structure,
        lv_inconsistent      TYPE boolean,
        lv_inconsistent_rel  TYPE boolean,
        ls_bp_rel            TYPE burs_ei_extern,
        ls_bp_rel_partner    TYPE bus_ei_extern,
        lt_messages          TYPE mds_ctrls_error_objects,
        ls_business_hour     TYPE bus_ei_bupa_hours,
        ls_result            TYPE mds_cmpt_display_st_result,
        lv_sequence_number   TYPE i.

  lv_sequence_number = lv_sequence_number + 1.
  ls_result-sequence_number = lv_sequence_number.

*     Compare fields of Relationship -General
  CALL METHOD me->compare_and_fill
    EXPORTING
      iv_dataset          = 'DSET_05'
      is_source           = is_source_rel-data
      is_target           = is_target_rel_org-central_data-contact-central_data-data
      is_mapped_target    = is_target_rel-data
    IMPORTING
      et_messages         = lt_messages
      ev_inconsistent     = lv_inconsistent
    CHANGING
      cs_result_structure = cs_display_structure-data-relationship_data.
* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent = gc_true AND lv_inconsistent_rel = gc_false.
    lv_inconsistent_rel = gc_true.
    CLEAR lv_inconsistent.
  ENDIF.

  CALL METHOD me->compare_and_fill
    EXPORTING
      iv_dataset          = 'DSET_05'
      is_source           = is_source_rel-address_type_3-postal-data
      is_target           = is_target_rel_partner-central_data-common-data-bp_centraldata
      is_mapped_target    = is_target_rel-address_type_3-postal-data
    IMPORTING
      et_messages         = lt_messages
      ev_inconsistent     = lv_inconsistent
    CHANGING
      cs_result_structure = cs_display_structure-data-relationship_data.
* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent = gc_true AND lv_inconsistent_rel = gc_false.
    lv_inconsistent_rel = gc_true.
    CLEAR lv_inconsistent.
  ENDIF.

  CALL METHOD me->compare_and_fill
    EXPORTING
      iv_dataset          = 'DSET_05'
      is_source           = is_source_rel-data
      is_target           = is_target_rel_partner-central_data-common-data-bp_person
      is_mapped_target    = is_target_rel-data
    IMPORTING
      et_messages         = lt_messages
      ev_inconsistent     = lv_inconsistent
    CHANGING
      cs_result_structure = cs_display_structure-data-relationship_data.
* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent = gc_true AND lv_inconsistent_rel = gc_false.
    lv_inconsistent_rel = gc_true.
    CLEAR lv_inconsistent.
  ENDIF.

  CALL METHOD me->compare_and_fill
    EXPORTING
      iv_dataset          = 'DSET_05'
      is_source           = is_source_rel-address_type_3-postal-data
      is_target           = is_target_rel_partner-central_data-common-data-bp_person
      is_mapped_target    = is_target_rel-address_type_3-postal-data
    IMPORTING
      et_messages         = lt_messages
      ev_inconsistent     = lv_inconsistent
    CHANGING
      cs_result_structure = cs_display_structure-data-relationship_data.

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent = gc_true AND lv_inconsistent_rel = gc_false.
    lv_inconsistent_rel = gc_true.
    CLEAR lv_inconsistent.
  ENDIF.
*****************************************
*   Contact Address
*****************************************
  CALL METHOD me->compare_and_fill
    EXPORTING
      iv_dataset          = 'DSET_05'
      is_source           = is_source_rel-address_type_3-postal-data
      is_target           = is_target_rel_org
      is_mapped_target    = is_target_rel-address_type_3-postal-data
    IMPORTING
      et_messages         = lt_messages
      ev_inconsistent     = lv_inconsistent
    CHANGING
      cs_result_structure = cs_display_structure-data-relationship_data.

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent = gc_true AND lv_inconsistent_rel = gc_false.
    lv_inconsistent_rel = gc_true.
    CLEAR lv_inconsistent.
  ENDIF.

*******************************************
* Private Address
*******************************************
  CALL METHOD me->compare_cust_as_src_rel_pv_adr
    EXPORTING
      is_source_rel_pvt_ad     = is_source_rel-address_type_2
      is_target_rel_pvt_ad     = is_target_rel-address_type_2
      it_target_rel_pvt_ad_org = is_target_rel_partner-central_data-address-addresses
    IMPORTING
      et_messages              = lt_messages
      ev_inconsistent          = lv_inconsistent
    CHANGING
      cs_display_structure     = cs_display_structure-data-home_address.

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent = gc_true AND lv_inconsistent_rel = gc_false.
    lv_inconsistent_rel = gc_true.
    CLEAR lv_inconsistent.
  ENDIF.

*******************************************
* Business Address
*******************************************
  CALL METHOD me->compare_cust_as_src_rel_ct_adr
    EXPORTING
      is_source_rel_ct_add = is_source_rel-address_type_1
      is_target_rel_ct_add = is_target_rel-address_type_1
      it_target_rel_add    = is_target_rel_org-central_data-address-addresses
      it_target_rel_pt_add = is_target_rel_partner-central_data-address-addresses
    IMPORTING
      et_messages          = lt_messages
      ev_inconsistent      = lv_inconsistent
    CHANGING
      cs_display_structure = cs_display_structure-data-business_address.

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent = gc_true AND lv_inconsistent_rel = gc_false.
    lv_inconsistent_rel = gc_true.
    CLEAR lv_inconsistent.
  ENDIF.

*******************************************
*Business Hour
*******************************************
  READ TABLE is_target_rel_org-central_data-business_hour-business_hours INTO ls_business_hour
                with key data_key-schedule_type = 'C'.

  CALL METHOD me->compare_cust_as_src_rel_bus_hr
    EXPORTING
      is_source_rel_bh     = is_source_rel
      is_target_rel_bh     = is_target_rel
      it_target_rel_bh_org = ls_business_hour-data-weekly
    IMPORTING
      et_messages          = lt_messages
      ev_inconsistent      = lv_inconsistent
    CHANGING
      cs_display_structure = cs_display_structure-data-business_hours.

* handle error
  CALL METHOD handle_error(
    EXPORTING
      it_messages = lt_messages
    CHANGING
      ct_messages = et_messages
      ).

  IF lv_inconsistent = gc_true AND lv_inconsistent_rel = gc_false.
    lv_inconsistent_rel = gc_true.
    CLEAR lv_inconsistent.
  ENDIF.


  IF cs_display_structure-data-relationship_data IS NOT INITIAL.
    MODIFY cs_display_structure-data-relationship_data FROM ls_result
      TRANSPORTING sequence_number WHERE sequence_number = 0.
  ENDIF.
  ev_inconsistent = lv_inconsistent_rel.
ENDMETHOD.


method COMPARE_CUST_AS_SOURCE_REL_GEN.
endmethod.


METHOD compare_cust_as_source_rem.

  DATA:   ls_bp_remarks         TYPE bus_ei_bupa_addressremark,
          ls_source_remarks     TYPE cvis_ei_rem,
          ls_target_remarks     TYPE cvis_ei_rem,
          lv_index              TYPE sy-index,
          lt_messages           TYPE mds_ctrls_error_objects,
          lv_inconsistent       TYPE boolean,
          ls_display_structure  TYPE mds_cmpt_display_st_result_t,
          lv_inconsistent_rem   TYPE boolean,
          ls_result             TYPE mds_cmpt_display_st_result.

* set sequence number = 1 (since only standard address is compared)
  ls_result-sequence_number = 1.

  LOOP AT it_source_rem INTO ls_source_remarks.
    lv_index = sy-tabix.
    READ TABLE it_target_rem INTO ls_target_remarks INDEX lv_index.
    IF sy-subrc = 0.
      READ TABLE it_target_org_rem INTO ls_bp_remarks INDEX lv_index.
      IF sy-subrc = 0.
        CALL METHOD me->compare_and_fill
          EXPORTING
            iv_dataset          = iv_dataset
            is_source           = ls_source_remarks-data
            is_target           = ls_bp_remarks-data
            is_mapped_target    = ls_target_remarks-data
          IMPORTING
            et_messages         = lt_messages
            ev_inconsistent     = lv_inconsistent
          CHANGING
            cs_result_structure = cs_display_structure.
* handle error
        CALL METHOD handle_error(
          EXPORTING
            it_messages = lt_messages
          CHANGING
            ct_messages = et_messages
            ).
      ELSE.
        lv_inconsistent = gc_true.
      ENDIF.
    ELSE.
*   remarks not present - source has more remarks than Target.
      lv_inconsistent = gc_true.
    ENDIF.
    IF lv_inconsistent = gc_true and lv_inconsistent_rem = gc_false.
      lv_inconsistent_rem = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.

  ENDLOOP.

  TRY.
      MODIFY cs_display_structure FROM ls_result
                                      TRANSPORTING sequence_number
                                             WHERE sequence_number IS INITIAL.

    CATCH cx_root.   "#EC NO_HANDLER
  ENDTRY.
  ev_inconsistent = lv_inconsistent_rem.
ENDMETHOD.


METHOD compare_cust_as_source_tax.

  TYPE-POOLS: list.
  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lt_temp_result        TYPE mds_cmpt_display_st_result_t,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        lv_inconsistent       TYPE boolean,
        lv_display_index      TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        ls_source_tax         TYPE cmds_ei_vmd_central_data,
        ls_target_tax         TYPE cmds_ei_vmd_central_data,
        ls_bp_tax             TYPE bus_ei_bupa_taxnumber,
        lv_sequence_number    TYPE i,
        lt_dfies              LIKE LINE OF gt_dfies.

  CONSTANTS: lc_kna1(4) TYPE c VALUE 'KNA1',
             lc_knas(4) TYPE c VALUE 'KNAS',
             lc_bp_table(12) TYPE c VALUE 'DFKKBPTAXNUM',
             con_0(1)    TYPE c VALUE '0',
             con_1(1)    TYPE c VALUE '1',
             con_2(1)    TYPE c VALUE '2',
             con_3(1)    TYPE c VALUE '3',
             con_4(1)    TYPE c VALUE '4'.

  READ TABLE ct_display_structure INTO ls_display_structure
            with key target_object = it_target_tax_org-header-object_instance-bpartner.
  lv_display_index = sy-tabix.

  IF is_source_tax-central-data-stceg IS NOT INITIAL OR
     is_source_tax-central-data-stcd1 IS NOT INITIAL OR
     is_source_tax-central-data-stcd2 IS NOT INITIAL OR
     is_source_tax-central-data-stcd3 IS NOT INITIAL OR
     is_source_tax-central-data-stcd4 IS NOT INITIAL .

    ls_source_tax = is_source_tax-central-data.
    ls_target_tax = is_target_tax-central-data.
*    Check the Index (???)
    READ TABLE it_target_tax_org-central_data-taxnumber-taxnumbers INTO ls_bp_tax INDEX 1.

    lv_sequence_number        = lv_sequence_number + 1.
    ls_result-sequence_number = lv_sequence_number.
    ls_result-target_table    = lc_bp_table.

* STCEG
    IF ls_source_tax-stceg IS NOT INITIAL.
      ls_result-source_field  = 'STCEG'.
      ls_result-source_value  = ls_source_tax-stceg.
      ls_result-target_field  = 'TAXNUM'.
      ls_result-target_value  = ls_bp_tax-data_key-taxnumber.
      IF ls_source_tax-stceg(2) = is_source_tax-address-postal-data-country.
        ls_result-source_table    = lc_kna1.
      ELSE.
        ls_result-source_table    = lc_knas.
      ENDIF.
      IF ls_source_tax-stceg  = ls_target_tax-stceg.
        IF NOT ls_bp_tax-data_key-taxtype+2(1) EQ con_0.
          lv_inconsistent = gc_true.
        ENDIF.
      ELSE.
        lv_inconsistent = gc_true.
      ENDIF.
* STCD1
    ELSEIF ls_source_tax-stcd1 IS NOT INITIAL.
      ls_result-source_field  = 'stcd1'.
      ls_result-source_value  = ls_source_tax-stcd1.
      ls_result-target_field  = 'TAXNUM'.
      ls_result-target_value  = ls_bp_tax-data_key-taxnumber.
      IF ls_source_tax-stcd1(2) = is_source_tax-address-postal-data-country.
        ls_result-source_table    = lc_kna1.
      ENDIF.
      IF ls_source_tax-stcd1  = ls_target_tax-stcd1.
        IF ls_bp_tax-data_key-taxtype+2(1) EQ con_1.
          ls_result-consistent = gc_true.
        ELSE.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
        ENDIF.
      ELSE.
        lv_inconsistent = gc_true.
      ENDIF.
*      Country Argentina
      IF ls_bp_tax-data_key-taxtype+2(1) EQ con_1 AND
            is_source_tax-address-postal-data-country = 'AR'.
        CASE ls_source_tax-stcdt.
          WHEN '80'.
            IF ls_bp_tax-data_key-taxtype+3(1) = 'A'.
              ls_result-consistent = gc_true.
            ELSE.
              ls_result-consistent = gc_false.
            ENDIF.
          WHEN '86'.
            IF ls_bp_tax-data_key-taxtype+3(1) = 'B'.
              ls_result-consistent = gc_true.
            ELSE.
              ls_result-consistent = gc_false.
              lv_inconsistent = gc_true.
            ENDIF.
          WHEN OTHERS.
            ls_result-consistent = gc_false.
            lv_inconsistent = gc_true.
        ENDCASE.
      ENDIF.

    ELSEIF ls_source_tax-stcd2 IS NOT INITIAL.
      ls_result-source_field  = 'stcd2'.
      ls_result-source_value  = ls_source_tax-stcd2.
      ls_result-target_field  = 'TAXNUM'.
      ls_result-target_value  = ls_bp_tax-data_key-taxnumber.
      IF ls_source_tax-stcd2(2) = is_source_tax-address-postal-data-country.
        ls_result-source_table    = lc_kna1.
      ENDIF.
      IF ls_source_tax-stcd2  = ls_target_tax-stcd2.
        IF ls_bp_tax-data_key-taxtype+2(1) EQ con_2.
          ls_result-consistent = gc_true.
        ELSE.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
        ENDIF.
      ELSE.
        lv_inconsistent = gc_true.
      ENDIF.
*    STCD3
    ELSEIF ls_source_tax-stcd3 IS NOT INITIAL.
      ls_result-source_field  = 'stcd3'.
      ls_result-source_value  = ls_source_tax-stcd3.
      ls_result-target_field  = 'TAXNUM'.
      ls_result-target_value  = ls_bp_tax-data_key-taxnumber.
      IF ls_source_tax-stcd3(2) = is_source_tax-address-postal-data-country.
        ls_result-source_table    = lc_kna1.
      ENDIF.
      IF ls_source_tax-stcd3  = ls_target_tax-stcd3.
        IF ls_bp_tax-data_key-taxtype+2(1) EQ con_3.
          ls_result-consistent = gc_true.
        ELSE.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
        ENDIF.
      ELSE.
        lv_inconsistent = gc_true.
      ENDIF.
*STCD4
    ELSEIF ls_source_tax-stcd4 IS NOT INITIAL.
      ls_result-source_field  = 'stcd4'.
      ls_result-source_value  = ls_source_tax-stcd4.
      ls_result-target_field  = 'TAXNUM'.
      ls_result-target_value  = ls_bp_tax-data_key-taxnumber.
      IF ls_source_tax-stcd4(2) = is_source_tax-address-postal-data-country.
        ls_result-source_table    = lc_kna1.
      ENDIF.
      IF ls_source_tax-stcd4  = ls_target_tax-stcd4.
        IF ls_bp_tax-data_key-taxtype+2(1) EQ con_4.
          ls_result-consistent = gc_true.
        ELSE.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
        ENDIF.
      ELSE.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDIF.
    APPEND ls_result TO ls_display_structure-data-tax-data.

    IF is_target_tax IS INITIAL.
      ls_display_structure-data-tax-status = gc_error.
    ELSEIF lv_inconsistent = gc_true.
      ls_display_structure-data-tax-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-tax-status = gc_consistent.
    ENDIF.
  ELSE.
    ls_display_structure-data-tax-status = gc_notmaintained.

  ENDIF.
  MODIFY ct_display_structure FROM ls_display_structure INDEX lv_display_index.
  ev_inconsistent = lv_inconsistent.


ENDMETHOD.


method COMPARE_CUST_AS_SOURCE_TRADING.
endmethod.


METHOD compare_cust_as_source_version.

  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lv_index              TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_dfies              LIKE LINE OF gt_dfies,
        lv_sequence_number    TYPE i,
        lv_inconsistent       TYPE boolean,
        lv_inconsistent_ver   TYPE boolean,
        ls_source_ver         TYPE cvi_ei_version_type1,
        ls_target_ver         TYPE cvi_ei_version_type1,
        ls_bp_ver             TYPE bus_ei_bupa_version.


* set sequence number = 1 (since only standard address is compared)
  ls_result-sequence_number = 1.

  LOOP AT it_source_add_ver INTO ls_source_ver.
    lv_index = sy-tabix.

    READ TABLE it_target_add_ver INTO ls_target_ver INDEX lv_index.
    READ TABLE it_target_add_ver_or INTO ls_bp_ver INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_ver-data
        is_target           = ls_bp_ver-data
        is_mapped_target    = ls_target_ver-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = cs_display_structure.
    IF lv_inconsistent = gc_true AND lv_inconsistent_ver = gc_false.
      lv_inconsistent_ver = lv_inconsistent.
      CLEAR lv_inconsistent.
    ENDIF.

  ENDLOOP.

*  MODIFY ls_display_structure-data-address-versions FROM ls_result
*                               TRANSPORTING sequence_number
*                                     WHERE  sequence_number IS INITIAL.
  TRY.
      MODIFY cs_display_structure FROM ls_result
                                   TRANSPORTING sequence_number
                                         WHERE  sequence_number IS INITIAL.
    CATCH cx_root. "#EC NO_HANDLER
  ENDTRY.
  ev_inconsistent = lv_inconsistent_ver.

ENDMETHOD.


method COMPARE_CUST_AS_SRC_CT_ADD_VER.

  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lv_index              TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_dfies              LIKE LINE OF gt_dfies,
        lv_sequence_number    TYPE i,
        lv_inconsistent       TYPE boolean,
        lv_inconsistent_ver   TYPE boolean,
        ls_source_ver         TYPE cvi_ei_version_type1,
        ls_target_ver         TYPE cvi_ei_version_type1,
        ls_bp_ver             TYPE bus_ei_bupa_version.


* set sequence number = 1 (since only standard address is compared)
  ls_result-sequence_number = 1.

  LOOP AT it_source_add_ver INTO ls_source_ver.  "#EC
    lv_index = sy-tabix.

    READ TABLE it_target_add_ver INTO ls_target_ver INDEX lv_index.  "#EC
    READ TABLE it_target_add_ver_or INTO ls_bp_ver INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = 'DSET_05'
        is_source           = ls_source_ver-data
        is_target           = ls_bp_ver-data
        is_mapped_target    = ls_target_ver-data
      IMPORTING
        ET_MESSAGES         = lt_messages
        EV_INCONSISTENT     = lv_inconsistent
      changing
        cs_result_structure = cs_display_structure.
      IF lv_inconsistent = gc_true.
        lv_inconsistent_ver = lv_inconsistent.
        CLEAR lv_inconsistent.
      endif.

  ENDLOOP.

  MODIFY cs_display_structure FROM ls_result
                               TRANSPORTING sequence_number
                                     WHERE  sequence_number IS INITIAL.

  ev_inconsistent = lv_inconsistent_ver.
endmethod.


method COMPARE_CUST_AS_SRC_PT_ADD_VER.

  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lv_index              TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_dfies              LIKE LINE OF gt_dfies,
        lv_sequence_number    TYPE i,
        lv_inconsistent       TYPE boolean,
        lv_inconsistent_ver   TYPE boolean,
        ls_source_ver         TYPE cvi_ei_version_type2,
        ls_target_ver         TYPE cvi_ei_version_type2,
        ls_bp_ver             TYPE bus_ei_bupa_version.


* set sequence number = 1 (since only standard address is compared)
  ls_result-sequence_number = 1.

  LOOP AT it_source_add_ver INTO ls_source_ver.
    lv_index = sy-tabix.

    READ TABLE it_target_add_ver INTO ls_target_ver INDEX lv_index.
    READ TABLE it_target_add_ver_or INTO ls_bp_ver INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = 'DSET_05'
        is_source           = ls_source_ver-data
        is_target           = ls_bp_ver-data
        is_mapped_target    = ls_target_ver-data
      IMPORTING
        ET_MESSAGES         = lt_messages
        EV_INCONSISTENT     = lv_inconsistent
      changing
        cs_result_structure = cs_display_structure.
      IF lv_inconsistent = gc_true.
        lv_inconsistent_ver = lv_inconsistent.
        CLEAR lv_inconsistent.
      endif.

  ENDLOOP.

  MODIFY cs_display_structure FROM ls_result
                               TRANSPORTING sequence_number
                                     WHERE  sequence_number IS INITIAL.

  ev_inconsistent = lv_inconsistent_ver.
endmethod.


METHOD compare_cust_as_src_rel_bus_hr.

  DATA : ls_bp_bh_m           TYPE bapibus1006_rule_w,
         ls_bp_bh_n           TYPE bapibus1006_rule_w,
         lv_inconsistent      TYPE boolean,
         ls_result            TYPE mds_cmpt_display_st_result,
         lv_sequence_number   TYPE i,
         lv_index             TYPE sy-index.

  CONSTANTS : lc_bp_table(7)   TYPE c VALUE 'SCRULES',
              lc_cust_table(4) TYPE c VALUE 'KNVK'.

  IF is_source_rel_bh-data-moab1 IS NOT INITIAL OR
     is_source_rel_bh-data-mobi1 IS NOT INITIAL OR
     is_source_rel_bh-data-diab1 IS NOT INITIAL OR
     is_source_rel_bh-data-dibi1 IS NOT INITIAL OR
     is_source_rel_bh-data-miab1 IS NOT INITIAL OR
     is_source_rel_bh-data-mibi1 IS NOT INITIAL OR
     is_source_rel_bh-data-doab1 IS NOT INITIAL OR
     is_source_rel_bh-data-dobi1 IS NOT INITIAL OR
     is_source_rel_bh-data-frab1 IS NOT INITIAL OR
     is_source_rel_bh-data-frbi1 IS NOT INITIAL OR
     is_source_rel_bh-data-saab1 IS NOT INITIAL OR
     is_source_rel_bh-data-sabi1 IS NOT INITIAL OR
     is_source_rel_bh-data-soab1 IS NOT INITIAL OR
     is_source_rel_bh-data-sobi1 IS NOT INITIAL OR
     is_source_rel_bh-data-moab2 IS NOT INITIAL OR
     is_source_rel_bh-data-mobi2 IS NOT INITIAL OR
     is_source_rel_bh-data-diab2 IS NOT INITIAL OR
     is_source_rel_bh-data-dibi2 IS NOT INITIAL OR
     is_source_rel_bh-data-miab2 IS NOT INITIAL OR
     is_source_rel_bh-data-mibi2 IS NOT INITIAL OR
     is_source_rel_bh-data-doab2 IS NOT INITIAL OR
     is_source_rel_bh-data-dobi2 IS NOT INITIAL OR
     is_source_rel_bh-data-frab2 IS NOT INITIAL OR
     is_source_rel_bh-data-frbi2 IS NOT INITIAL OR
     is_source_rel_bh-data-saab2 IS NOT INITIAL OR
     is_source_rel_bh-data-sabi2 IS NOT INITIAL OR
     is_source_rel_bh-data-soab2 IS NOT INITIAL OR
     is_source_rel_bh-data-sobi2 IS NOT INITIAL.

    READ TABLE it_target_rel_bh_org INTO ls_bp_bh_m INDEX 1. " Morning
    IF Sy-subrc <> 0. " Exists only on the source side - Inconsistent
      lv_inconsistent = gc_true.
    ELSE.
      READ TABLE it_target_rel_bh_org INTO ls_bp_bh_n INDEX 2. " Afternoon
      if sy-subrc <> 0.
        lv_inconsistent = gc_true.
      endif.
    endif.
*      Monday From
    IF is_source_rel_bh-data-moab1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'MOAB1'.
      ls_result-source_value = is_source_rel_bh-data-moab1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'MONDAY_FROM'.
      ls_result-target_value = ls_bp_bh_m-monda_From.
      if is_source_rel_bh-data-moab1 = is_source_rel_bh-data-moab1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-moab2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'MOAB2'.
      ls_result-source_value = is_source_rel_bh-data-moab2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'MONDAY_FROM'.
      ls_result-target_value = ls_bp_bh_n-monda_From.
      if is_source_rel_bh-data-moab2 = is_source_rel_bh-data-moab2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      Monday to
    IF is_source_rel_bh-data-mobi1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'MOBI1'.
      ls_result-source_value = is_source_rel_bh-data-moBi1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'MONDAY_TO'.
      ls_result-target_value = ls_bp_bh_m-monday_to.
      if is_source_rel_bh-data-mobi1 = is_source_rel_bh-data-mobi1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-mobi2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'MOBI2'.
      ls_result-source_value = is_source_rel_bh-data-mobi2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'MONDAY_TO'.
      ls_result-target_value = ls_bp_bh_n-monday_to.
      if is_source_rel_bh-data-mobi2 = is_source_rel_bh-data-mobi2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      Tuesday From
    IF is_source_rel_bh-data-diab1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'DIAB1'.
      ls_result-source_value = is_source_rel_bh-data-diab1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'TUESDAY_FROM'.
      ls_result-target_value = ls_bp_bh_m-tuesd_From.
      if is_source_rel_bh-data-diab1 = is_source_rel_bh-data-diab1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-diab2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'DIAB2'.
      ls_result-source_value = is_source_rel_bh-data-diab2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'TUESDAY_FROM'.
      ls_result-target_value = ls_bp_bh_n-tuesd_From.
      if is_source_rel_bh-data-diab2 = is_source_rel_bh-data-diab2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      tuesday to
    IF is_source_rel_bh-data-dibi1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'DIBI1'.
      ls_result-source_value = is_source_rel_bh-data-diBi1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'TUESDAY_TO'.
      ls_result-target_value = ls_bp_bh_m-tuesday_to.
      if is_source_rel_bh-data-dibi1 = is_source_rel_bh-data-dibi1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-dibi2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'DIBI2'.
      ls_result-source_value = is_source_rel_bh-data-dibi2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'TUESDAY_TO'.
      ls_result-target_value = ls_bp_bh_n-tuesday_to.
      if is_source_rel_bh-data-dibi2 = is_source_rel_bh-data-dibi2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      Wednesday
    IF is_source_rel_bh-data-miab1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'MIAB1'.
      ls_result-source_value = is_source_rel_bh-data-miab1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'WEDNE_FROM'.
      ls_result-target_value = ls_bp_bh_m-wedne_From.
      if is_source_rel_bh-data-miab1 = is_source_rel_bh-data-miab1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-miab2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'MIAB2'.
      ls_result-source_value = is_source_rel_bh-data-miab2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'WEDNE_FROM'.
      ls_result-target_value = ls_bp_bh_n-wedne_From.
      if is_source_rel_bh-data-miab2 = is_source_rel_bh-data-miab2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      wednesday to
    IF is_source_rel_bh-data-mibi1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'MIBI1'.
      ls_result-source_value = is_source_rel_bh-data-miBi1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'WEDNESD_TO'.
      ls_result-target_value = ls_bp_bh_m-wednesd_to.
      if is_source_rel_bh-data-mibi1 = is_source_rel_bh-data-mibi1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-mibi2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'MIBI2'.
      ls_result-source_value = is_source_rel_bh-data-mibi2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'WEDNESD_TO'.
      ls_result-target_value = ls_bp_bh_n-wednesd_to.
      if is_source_rel_bh-data-mibi2 = is_source_rel_bh-data-mibi2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      Thursday From
    IF is_source_rel_bh-data-doab1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'DOAB1'.
      ls_result-source_value = is_source_rel_bh-data-doab1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'THURS_FROM'.
      ls_result-target_value = ls_bp_bh_m-thurs_From.
      if is_source_rel_bh-data-doab1 = is_source_rel_bh-data-doab1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-doab2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'DOAB2'.
      ls_result-source_value = is_source_rel_bh-data-doab2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'THURS_FROM'.
      ls_result-target_value = ls_bp_bh_n-thurs_From.
      if is_source_rel_bh-data-doab2 = is_source_rel_bh-data-doab2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      thursday to
    IF is_source_rel_bh-data-dobi1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'DOBI1'.
      ls_result-source_value = is_source_rel_bh-data-doBi1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'THURSDA_TO'.
      ls_result-target_value = ls_bp_bh_m-thursda_to.
      if is_source_rel_bh-data-dobi1 = is_source_rel_bh-data-dobi1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-dobi2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'DOBI2'.
      ls_result-source_value = is_source_rel_bh-data-dobi2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'THURSSDA_TO'.
      ls_result-target_value = ls_bp_bh_n-thursda_to.
      if is_source_rel_bh-data-dobi2 = is_source_rel_bh-data-dobi2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      Friday from
    IF is_source_rel_bh-data-frab1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'FRAB1'.
      ls_result-source_value = is_source_rel_bh-data-frab1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'FRIDA_FROM'.
      ls_result-target_value = ls_bp_bh_m-frida_From.
      if is_source_rel_bh-data-frab1 = is_source_rel_bh-data-frab1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-frab2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'FRAB2'.
      ls_result-source_value = is_source_rel_bh-data-frab2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'FRIDA_FROM'.
      ls_result-target_value = ls_bp_bh_n-frida_From.
      if is_source_rel_bh-data-frab2 = is_source_rel_bh-data-frab2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      Friday to
    IF is_source_rel_bh-data-frbi1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'FRBI1'.
      ls_result-source_value = is_source_rel_bh-data-frBi1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'FRIDAY_TO'.
      ls_result-target_value = ls_bp_bh_m-friday_to.
      if is_source_rel_bh-data-frbi1 = is_source_rel_bh-data-frbi1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-frbi2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'FRBI2'.
      ls_result-source_value = is_source_rel_bh-data-frbi2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'FRIDAY_TO'.
      ls_result-target_value = ls_bp_bh_n-friday_to.
      if is_source_rel_bh-data-frbi2 = is_source_rel_bh-data-frbi2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      Saturday From
    IF is_source_rel_bh-data-saab1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'SAAB1'.
      ls_result-source_value = is_source_rel_bh-data-saab1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'SATURD_FROM'.
      ls_result-target_value = ls_bp_bh_m-satur_From.
      if is_source_rel_bh-data-saab1 = is_source_rel_bh-data-saab1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-saab2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'SAAB2'.
      ls_result-source_value = is_source_rel_bh-data-saab2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'SATUR_FROM'.
      ls_result-target_value = ls_bp_bh_n-satur_From.
      if is_source_rel_bh-data-saab2 = is_source_rel_bh-data-saab2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      Saturday to
    IF is_source_rel_bh-data-sabi1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'SABI1'.
      ls_result-source_value = is_source_rel_bh-data-saBi1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'SATURDA_TO'.
      ls_result-target_value = ls_bp_bh_m-saturda_to.
      if is_source_rel_bh-data-sabi1 = is_source_rel_bh-data-sabi1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-sabi2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'SABI2'.
      ls_result-source_value = is_source_rel_bh-data-sabi2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'SATURDA_TO'.
      ls_result-target_value = ls_bp_bh_n-saturda_to.
      if is_source_rel_bh-data-sabi2 = is_source_rel_bh-data-sabi2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      Sunday From
    IF is_source_rel_bh-data-soab1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'SOAB1'.
      ls_result-source_value = is_source_rel_bh-data-soab1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'SUNDA_FROM'.
      ls_result-target_value = ls_bp_bh_m-sunda_From.
      if is_source_rel_bh-data-soab1 = is_source_rel_bh-data-soab1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-soab2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'SOAB2'.
      ls_result-source_value = is_source_rel_bh-data-soab2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'SUNDA_FROM'.
      ls_result-target_value = ls_bp_bh_n-sunda_From.
      if is_source_rel_bh-data-soab2 = is_source_rel_bh-data-soab2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
*      Sunday to
    IF is_source_rel_bh-data-dibi1 IS NOT INITIAL.
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'DIBI1'.
      ls_result-source_value = is_source_rel_bh-data-diBi1.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'TUESDAY_TO'.
      ls_result-target_value = ls_bp_bh_m-tuesday_to.
      if is_source_rel_bh-data-dibi1 = is_source_rel_bh-data-dibi1.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ELSEIF is_source_rel_bh-data-dibi2 is not initial .
      ls_result-sequence_number = lv_sequence_number.
      ls_result-source_table = lc_cust_table.
      ls_result-source_field = 'DIBI2'.
      ls_result-source_value = is_source_rel_bh-data-dibi2.
      ls_result-target_table = lc_bp_table.
      ls_result-target_field = 'TUESDAY_TO'.
      ls_result-target_value = ls_bp_bh_n-tuesday_to.
      if is_source_rel_bh-data-dibi2 = is_source_rel_bh-data-dibi2.
          ls_result-consistent = gc_true.
      else.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
      endif.
      APPEND ls_result TO cs_display_structure.
    ENDIF.
  ELSE.
    RETURN.
  ENDIF.
ENDMETHOD.


METHOD compare_cust_as_src_rel_ct_adr.

  DATA: ls_rel_add               TYPE burs_ei_rel_address,
        lv_inconsistent          TYPE boolean,
        lt_messages              TYPE mds_ctrls_error_objects,
        ls_message               TYPE bapiret2,
        ls_result                TYPE mds_cmpt_display_st_result,
        lv_sequence_number       TYPE i,
        ls_partner_add           TYPE bus_ei_bupa_address.

  IF is_source_rel_ct_add IS INITIAL.
    RETURN.
  ENDIF.

  READ TABLE it_target_rel_add INTO ls_rel_add with key data-postal-data-standardaddress = gc_true.

  READ TABLE it_target_rel_pt_add INTO ls_partner_add with key data_key-guid = ls_rel_add-data_key-guid.

  lv_sequence_number        = lv_sequence_number  + 1.
  ls_result-sequence_number = lv_sequence_number.

*   Compare fields of Relationship -Postal Address
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = 'DSET_05'
          is_source           = is_source_rel_ct_add-postal-data
          is_target           = ls_partner_add-data-postal-data
          is_mapped_target    = is_target_rel_ct_add-postal-data
        IMPORTING
          ET_MESSAGES         = lt_messages
          EV_INCONSISTENT     = lv_inconsistent
        changing
          cs_result_structure = cs_display_structure-postal
          .
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

       MODIFY cs_display_structure-postal FROM ls_result
           TRANSPORTING sequence_number WHERE sequence_number = 0.

*   Compare fields of Relationship -Remarks

  CALL METHOD me->compare_cust_as_source_rem
    EXPORTING
      it_source_rem        = is_source_rel_ct_add-remark-remarks
      it_target_rem        = is_target_rel_ct_add-remark-remarks
      it_target_org_rem    = ls_partner_add-data-remark-remarks
      iv_dataset           = 'DSET_05'
    IMPORTING
      ET_MESSAGES          = lt_messages
      EV_INCONSISTENT      = lv_inconsistent
    changing
      cs_display_structure = cs_display_structure-remarks
      .
    MODIFY cs_display_structure-remarks FROM ls_result
           TRANSPORTING sequence_number WHERE sequence_number = 0.

*  Versions
  CALL METHOD me->compare_cust_as_src_ct_add_ver
    EXPORTING
      it_source_add_ver    = is_source_rel_ct_add-version-versions
      it_target_add_ver    = is_target_rel_ct_add-version-versions
      it_target_add_ver_or = ls_partner_add-data-version-versions
      iv_dataset           = 'DSET_05'
    IMPORTING
      ET_MESSAGES          = lt_messages
      EV_INCONSISTENT      = lv_inconsistent
    changing
      cs_display_structure = cs_display_structure-versions
      .

    MODIFY cs_display_structure-versions FROM ls_result
           TRANSPORTING sequence_number WHERE sequence_number = 0.

*  Communication
  CALL METHOD me->compare_cust_as_source_comm
    EXPORTING
      is_source_add_comm   = is_source_rel_ct_add-communication
      is_target_add_comm   = is_target_rel_ct_add-communication
      is_target_add_comm_o = ls_partner_add-data-communication
      iv_dataset           = 'DSET_05'
    IMPORTING
      ET_MESSAGES          = lt_messages
      EV_INCONSISTENT      = lv_inconsistent
    changing
      cs_display_structure = cs_display_structure-communication
      .


ENDMETHOD.


METHOD compare_cust_as_src_rel_pv_adr.

  DATA: lv_inconsistent                TYPE boolean,
        lt_messages                    TYPE mds_ctrls_error_objects,
        lv_inconsistent_temp           TYPE boolean,
        ls_source_rel_pvt_ad_postal    TYPE CVIS_EI_2VL,
        ls_target_rel_pvt_ad_postal    TYPE CVIS_EI_2VL,
        lt_source_rel_pvt_ad_versions  type CVI_EI_VERSION_TYPE2_T,
        lt_target_rel_pvt_ad_versions  type CVI_EI_VERSION_TYPE2_T,
        lt_source_rel_pvt_ad_remarks   type CVIS_EI_REM_T,
        lt_target_rel_pvt_ad_remarks   type CVIS_EI_REM_T,
        ls_source_rel_pvt_ad_comm      type CVIS_EI_CVI_COMMUNICATION,
        ls_target_rel_pvt_ad_comm      type CVIS_EI_CVI_COMMUNICATION,
        ls_bp_rel_pvt_add              type BUS_EI_BUPA_ADDRESS,
        lv_sequence_number             TYPE i,
        ls_result                      type mds_cmpt_display_st_result,
        ls_rel_disp_st                 type mds_cmpt_disp_st_relationship.

  ls_source_rel_pvt_ad_postal = is_source_rel_pvt_ad-postal.
  ls_target_rel_pvt_ad_postal = is_target_rel_pvt_ad-postal.

  read table it_target_rel_pvt_ad_org INTO ls_bp_rel_pvt_add WITH KEY data-postal-data-standardaddress = gc_true.

  lv_sequence_number        = lv_sequence_number  + 1.
  ls_result-sequence_number = lv_sequence_number.

*   Compare fields of Relationship -Postal Address
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = 'DSET_05'
          is_source           = ls_source_rel_pvt_ad_postal-data
          is_target           = ls_bp_rel_pvt_add-data-postal-data
          is_mapped_target    = ls_target_rel_pvt_ad_postal-data
        IMPORTING
          ET_MESSAGES         = lt_messages
          EV_INCONSISTENT     = lv_inconsistent
        changing
          cs_result_structure = cs_display_structure-postal
          .
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

       MODIFY cs_display_structure-postal FROM ls_result
           TRANSPORTING sequence_number WHERE sequence_number = 0.

*   Compare fields of Relationship -Versions
  lt_source_rel_pvt_ad_versions = is_source_rel_pvt_ad-version-versions.
  lt_target_rel_pvt_ad_versions = is_target_rel_pvt_ad-version-versions.
  CALL METHOD me->compare_cust_as_src_pt_add_ver
    EXPORTING
      it_source_add_ver    = lt_source_rel_pvt_ad_versions
      it_target_add_ver    = lt_target_rel_pvt_ad_versions
      it_target_add_ver_or = ls_bp_rel_pvt_add-data-version-versions
      iv_dataset           = 'DSET_05'
    IMPORTING
      ET_MESSAGES          = lt_messages
      EV_INCONSISTENT      = lv_inconsistent
    changing
      cs_display_structure = cs_display_structure-versions.
      .
    MODIFY cs_display_structure-versions FROM ls_result
           TRANSPORTING sequence_number WHERE sequence_number = 0.

*  Compare fields of Relationship -Remarks
  lt_source_rel_pvt_ad_remarks  = is_source_rel_pvt_ad-remark-remarks.
  lt_target_rel_pvt_ad_remarks  = is_target_rel_pvt_ad-remark-remarks.

  CALL METHOD me->compare_cust_as_source_rem
    EXPORTING
      it_source_rem        = lt_source_rel_pvt_ad_remarks
      it_target_rem        = lt_target_rel_pvt_ad_remarks
      it_target_org_rem    = ls_bp_rel_pvt_add-data-remark-remarks
      iv_dataset           = 'DSET_05'
    IMPORTING
      ET_MESSAGES          = lt_messages
      EV_INCONSISTENT      = lv_inconsistent
    changing
      cs_display_structure = cs_display_structure-remarks
      .
    MODIFY cs_display_structure-remarks FROM ls_result
           TRANSPORTING sequence_number WHERE sequence_number = 0.

*  Compare fields of Relationship -Communication
  ls_source_rel_pvt_ad_comm    = is_source_rel_pvt_ad-communication.
  ls_target_rel_pvt_ad_comm    = is_target_rel_pvt_ad-communication.

  CALL METHOD me->compare_cust_as_source_comm
    EXPORTING
      is_source_add_comm   = ls_source_rel_pvt_ad_comm
      is_target_add_comm   = ls_target_rel_pvt_ad_comm
      is_target_add_comm_o = ls_bp_rel_pvt_add-data-communication
      iv_dataset           = 'DSET_05'
    IMPORTING
      ET_MESSAGES          = lt_messages
      EV_INCONSISTENT      = lv_inconsistent
    changing
      cs_display_structure = cs_display_structure-communication
      .

  ev_inconsistent = lv_inconsistent.
  ENDMETHOD.


METHOD compare_vendor_as_source.

  DATA:   ls_source_st         TYPE vmds_ei_extern,
          ls_target_st         TYPE vmds_ei_extern,
          ls_target_org        TYPE bus_ei_extern,
          lv_tabix             TYPE sy-tabix,
          ls_message           TYPE bapiret2,
          lt_messages          TYPE mds_ctrls_error_objects,
          lv_inconsistent      TYPE boolean,
          lv_inconsistent_obj TYPE boolean,
          ls_display_structure TYPE mds_cmpt_display_structure,
          lv_display_index     TYPE sy-tabix.

*Initialization
  CLEAR: lt_messages.

* Store the compare process id
  gv_source_object = gc_vendor.
  gv_target_object = gc_bp.

  IF gv_cmp_id IS INITIAL.
    SELECT SINGLE cmp_id FROM mdse_cmpt_proc INTO gv_cmp_id
                         WHERE source_object = gv_source_object
                           AND target_object = gv_target_object.

  ENDIF.
  LOOP AT is_source_st-vendors INTO ls_source_st.
    lv_tabix = sy-tabix.
    READ TABLE ct_display_structure INTO ls_display_structure with key
                                    source_object = ls_source_st-header-object_instance-lifnr.
    lv_display_index = sy-tabix.
    READ TABLE is_target_st-vendors INTO ls_target_st INDEX lv_tabix.
    READ TABLE is_target_org-partners INTO ls_target_org INDEX lv_tabix.

* Central data
    CALL METHOD me->compare_vend_as_source_general
      EXPORTING
        is_source_gen        = ls_source_st-central_data
        is_target_gen        = ls_target_st-central_data
        it_target_gen_org    = ls_target_org
      IMPORTING
        et_messages          = lt_messages
        ev_inconsistent      = lv_inconsistent
      CHANGING
        ct_display_structure = ct_display_structure.

    IF lv_inconsistent = gc_true and lv_inconsistent_obj = gc_false.
      lv_inconsistent_obj = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
* Address data
    CALL METHOD me->compare_vend_as_source_address
      EXPORTING
        is_source_add        = ls_source_st-central_data-address
        is_target_add        = ls_target_st-central_data-address
        it_target_add_org    = ls_target_org
      IMPORTING
        et_messages          = lt_messages
        ev_inconsistent      = lv_inconsistent
      CHANGING
        ct_display_structure = ct_display_structure.

    IF lv_inconsistent = gc_true and lv_inconsistent_obj = gc_false.
      lv_inconsistent_obj = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.

*Bank details
    CALL METHOD me->compare_vend_as_source_bank
      EXPORTING
        it_source_bnk        = ls_source_st-central_data-bankdetail-bankdetails
        it_target_bnk        = ls_target_st-central_data-bankdetail-bankdetails
        it_target_bnk_org    = ls_target_org
      IMPORTING
        et_messages          = lt_messages
        ev_inconsistent      = lv_inconsistent
      CHANGING
        ct_display_structure = ct_display_structure.

    IF lv_inconsistent = gc_true and lv_inconsistent_obj = gc_false.
      lv_inconsistent_obj = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.

*Tax
    CALL METHOD me->compare_vend_as_source_tax
      EXPORTING
        is_source_tax        = ls_source_st-central_data
        is_target_tax        = ls_target_st-central_data
        it_target_tax_org    = ls_target_org
      IMPORTING
        et_messages          = lt_messages
        ev_inconsistent      = lv_inconsistent
      CHANGING
        ct_display_structure = ct_display_structure.

    IF lv_inconsistent = gc_true and lv_inconsistent_obj = gc_false.
      lv_inconsistent_obj = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.

*Industry Sector
    CALL METHOD me->compare_vend_as_source_ind
      EXPORTING
        is_source_ind        = ls_source_st
        is_target_ind        = ls_target_st
        it_target_ind_org    = ls_target_org
      IMPORTING
        et_messages          = lt_messages
        ev_inconsistent      = lv_inconsistent
      CHANGING
        ct_display_structure = ct_display_structure.

    IF lv_inconsistent = gc_true and lv_inconsistent_obj = gc_false.
      lv_inconsistent_obj = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.

    IF lv_inconsistent_obj IS INITIAL.
      ls_display_structure-consistent = gc_true.
    ELSEIF lv_inconsistent_obj = gc_true.
      ls_display_structure-consistent = gc_false.
    ENDIF.

    MODIFY ct_display_structure FROM ls_display_structure INDEX lv_display_index
           TRANSPORTING consistent.
    CLEAR: lv_inconsistent_obj.
  ENDLOOP.
ENDMETHOD.


METHOD compare_vend_as_source_address.
  TYPE-POOLS: list.

  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lv_display_index      TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_dfies              LIKE LINE OF gt_dfies,
        lv_sequence_number    TYPE i,
        lv_inconsistent       TYPE boolean,
        lv_inconsistent_add    TYPE boolean,
        ls_source_add_postal  TYPE cvis_ei_1vl, "CVIS_EI_ADDRESS1,
        ls_target_add_postal  TYPE cvis_ei_1vl, "CVIS_EI_ADDRESS1,
        lt_bp_add             TYPE bus_ei_bupa_address_t,
        ls_bp_add             TYPE bus_ei_bupa_address,
        lt_source_remarks     TYPE cvis_ei_rem_t,
        lt_target_remarks     TYPE cvis_ei_rem_t,
        ls_bp_remarks         TYPE bus_ei_bupa_addressremark,
        ls_source_remarks     TYPE cvis_ei_rem,
        ls_target_remarks     TYPE cvis_ei_rem,
        lv_index              TYPE sy-index,
        ls_bp_comm            TYPE bus_ei_communication.
*

* Initialize
  CLEAR: et_messages,
         lt_messages.
* Read display structure for partner Index
  READ TABLE ct_display_structure INTO ls_display_structure
            with key target_object = it_target_add_org-header-object_instance-bpartner.
  lv_display_index = sy-tabix.
*
  IF is_source_add IS NOT INITIAL.
*
* Read source and mapped target data
    ls_source_add_postal = is_source_add-postal-data.
    ls_target_add_postal = is_target_add-postal-data.
*
* Read original target data
    lt_bp_add = it_target_add_org-central_data-address-addresses.
    READ TABLE lt_bp_add INTO ls_bp_add with key
                            data-postal-data-standardaddress = gc_true.

    lv_sequence_number = lv_sequence_number + 1.
    ls_result-sequence_number = lv_sequence_number.

*Postal data
    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_add_postal
        is_target           = ls_bp_add-data-postal-data
        is_mapped_target    = ls_target_add_postal
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-postal.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    TRY.
        MODIFY ls_display_structure-data-address-postal FROM ls_result
                                        TRANSPORTING sequence_number
                                               WHERE sequence_number IS INITIAL.

      CATCH cx_root.   "#EC NO_HANDLER
    ENDTRY.
    IF lv_inconsistent = gc_true.
      lv_inconsistent_add = lv_inconsistent.
      CLEAR lv_inconsistent.
    ENDIF.

*Remarks
    lt_source_remarks = is_source_add-remark-remarks.
    lt_target_remarks = is_target_add-remark-remarks.

    LOOP AT lt_source_remarks INTO ls_source_remarks.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remarks INDEX lv_index.
      READ TABLE ls_bp_add-data-remark-remarks INTO ls_bp_remarks INDEX lv_index.

      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remarks-data
          is_target           = ls_bp_remarks-data
          is_mapped_target    = ls_target_remarks-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-remarks.
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true.
        lv_inconsistent_add = lv_inconsistent.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.
    TRY.
        MODIFY ls_display_structure-data-address-postal FROM ls_result
                                        TRANSPORTING sequence_number
                                               WHERE sequence_number IS INITIAL.

      CATCH cx_root.  "#EC NO_HANDLER
    ENDTRY.

*Versions
    CALL METHOD me->compare_vend_as_source_version
      EXPORTING
        it_source_add_ver    = is_source_add-version-versions
        it_target_add_ver    = is_target_add-version-versions
        it_target_add_ver_or = ls_bp_add-data-version-versions
      IMPORTING
        et_messages          = lt_messages
        ev_inconsistent      = lv_inconsistent
      CHANGING
        cs_display_structure = ls_display_structure-data-address-versions.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_add = gc_false.
      lv_inconsistent_add = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.

*Communication
    ls_bp_comm = it_target_add_org-central_data-communication.

    CALL METHOD me->compare_vend_as_source_comm
      EXPORTING
        is_source_add_comm   = is_source_add-communication
        is_target_add_comm   = is_target_add-communication
        is_target_add_comm_o = ls_bp_comm
      IMPORTING
        et_messages          = et_messages
        ev_inconsistent      = lv_inconsistent
      CHANGING
        cs_display_structure = ls_display_structure-data-address-communication.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_add = gc_false.
      lv_inconsistent_add = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.


    IF is_target_add IS INITIAL.
      ls_display_structure-data-address-status = gc_error.
    ELSEIF lv_inconsistent_add = gc_true.
      ls_display_structure-data-address-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-address-status = gc_consistent.
    ENDIF.
  ELSE.
    ls_display_structure-data-address-status = gc_notmaintained.
  ENDIF.

  MODIFY ct_display_structure INDEX lv_display_index FROM ls_display_structure.
  ev_inconsistent      = lv_inconsistent_add.
ENDMETHOD.


METHOD compare_vend_as_source_bank.

  TYPE-POOLS: list.
  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lt_temp_result        TYPE mds_cmpt_display_st_result_t,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        lv_inconsistent       TYPE boolean,
        lv_inconsistent_bank  TYPE boolean,
        lv_display_index      TYPE sy-tabix,
        ls_source_bank        TYPE cvis_ei_cvi_bankdetail,
        ls_target_bank        TYPE cvis_ei_cvi_bankdetail,
        lt_bp_bank            TYPE bus_ei_bupa_bankdetail_t,
        ls_bp_bank            TYPE bus_ei_bupa_bankdetail,
        lv_sequence_number    TYPE i.
*

*
  CLEAR: et_messages,
         lt_messages.
*
  READ TABLE ct_display_structure INTO ls_display_structure
            with key target_object = it_target_bnk_org-header-object_instance-bpartner.
  lv_display_index = sy-tabix.
*
  IF it_source_bnk IS NOT INITIAL.
*
    lt_bp_bank = it_target_bnk_org-central_data-bankdetail-bankdetails.
*
    LOOP AT it_source_bnk INTO ls_source_bank.
      READ TABLE it_target_bnk INTO ls_target_bank with key
                                data_key-bankn = ls_source_bank-data_key-bankn
                                data_key-banks = ls_source_bank-data_key-banks
                                data_key-bankl = ls_source_bank-data_key-bankl.

      READ TABLE lt_bp_bank INTO ls_bp_bank with key
                                data_key = ls_source_bank-data-bvtyp.

*
      lv_sequence_number        = lv_sequence_number  + 1.
      ls_result-sequence_number = lv_sequence_number .

*   Compare fields
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_bank
          is_source           = ls_source_bank-data_key
          is_target           = ls_bp_bank-data
          is_mapped_target    = ls_target_bank-data_key
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-bank-data.
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true AND lv_inconsistent_bank = gc_false.
        lv_inconsistent_bank = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.

      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_bank
          is_source           = ls_source_bank-data
          is_target           = ls_bp_bank-data
          is_mapped_target    = ls_target_bank-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-bank-data.
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true AND lv_inconsistent_bank = gc_false.
        lv_inconsistent_bank = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.

      TRY.
          MODIFY ls_display_structure-data-bank-data FROM ls_result
                 TRANSPORTING sequence_number
                 WHERE sequence_number IS INITIAL.
        CATCH cx_root.  "#EC NO_HANDLER
      ENDTRY.
      APPEND LINES OF ls_display_structure-data-bank-data TO lt_temp_result.
      CLEAR ls_display_structure-data-bank-data.
    ENDLOOP.
    APPEND LINES OF lt_temp_result TO ls_display_structure-data-bank-data.
*
    IF it_target_bnk IS INITIAL.
      ls_display_structure-data-bank-status = gc_error.
    ELSEIF lv_inconsistent_bank = gc_true.
      ls_display_structure-data-bank-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-bank-status = gc_consistent.
    ENDIF.
  ELSE.
    ls_display_structure-data-bank-status = gc_notmaintained.
  ENDIF.
*
  MODIFY ct_display_structure INDEX lv_display_index FROM ls_display_structure.
  ev_inconsistent      = lv_inconsistent_bank.

  clear lv_inconsistent_bank.

ENDMETHOD.


METHOD COMPARE_VEND_AS_SOURCE_COMM.

DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lv_index              TYPE sy-tabix,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_dfies              LIKE LINE OF gt_dfies,
        lv_sequence_number    TYPE i,
        lv_inconsistent       TYPE boolean,
        lv_inconsistent_comm  TYPE boolean,
        lv_inconsistent_add   TYPE boolean,
        ls_source_phone       TYPE cvis_ei_phone_str,
        ls_target_phone       TYPE cvis_ei_phone_str,
        ls_bp_phone           TYPE bus_ei_bupa_telephone,
        ls_source_fax         TYPE cvis_ei_fax_str,
        ls_target_fax         TYPE cvis_ei_fax_str,
        ls_bp_fax             TYPE bus_ei_bupa_fax,
        ls_source_ttx         TYPE cvis_ei_ttx_str,
        ls_target_ttx         TYPE cvis_ei_ttx_str,
        ls_bp_ttx             TYPE bus_ei_bupa_ttx,
        ls_source_tlx         TYPE cvis_ei_tlx_str,
        ls_target_tlx         TYPE cvis_ei_tlx_str,
        ls_bp_tlx             TYPE bus_ei_bupa_tlx,
        ls_source_smtp        TYPE cvis_ei_smtp_str,
        ls_target_smtp        TYPE cvis_ei_smtp_str,
        ls_bp_smtp            TYPE bus_ei_bupa_smtp,
        ls_source_rml         TYPE cvis_ei_rml_str,
        ls_target_rml         TYPE cvis_ei_rml_str,
        ls_bp_rml             TYPE bus_ei_bupa_rml,
        ls_source_x400        TYPE cvis_ei_x400_str,
        ls_target_x400        TYPE cvis_ei_x400_str,
        ls_bp_x400            TYPE bus_ei_bupa_x400,
        ls_source_rfc         TYPE cvis_ei_rfc_str,
        ls_target_rfc         TYPE cvis_ei_rfc_str,
        ls_bp_rfc             TYPE bus_ei_bupa_rfc,
        ls_source_prt         TYPE cvis_ei_prt_str,
        ls_target_prt         TYPE cvis_ei_prt_str,
        ls_bp_prt             TYPE bus_ei_bupa_prt,
        ls_source_ssf         TYPE cvis_ei_ssf_str,
        ls_target_ssf         TYPE cvis_ei_ssf_str,
        ls_bp_ssf             TYPE bus_ei_bupa_ssf,
        ls_source_uri         TYPE cvis_ei_uri_str,
        ls_target_uri         TYPE cvis_ei_uri_str,
        ls_bp_uri             TYPE bus_ei_bupa_uri,
        ls_source_pager       TYPE cvis_ei_pag_str,
        ls_target_pager       TYPE cvis_ei_pag_str,
        ls_bp_pager           TYPE bus_ei_bupa_pag,
        lt_source_remarks     TYPE cvis_ei_comrem_t,
        lt_target_remarks     TYPE cvis_ei_comrem_t,
        lt_bp_remarks         TYPE bus_ei_bupa_comrem_t,
        ls_bp_remark          TYPE bus_ei_bupa_comrem,
        ls_source_remark      type cvis_ei_comrem,
        ls_target_remark      type cvis_ei_comrem.

* set sequence number
  ls_result-sequence_number = 1.
* Phone
  LOOP AT is_source_add_comm-phone-phone INTO ls_source_phone .
    lv_index = sy-tabix.
* Contact Data
    READ TABLE is_target_add_comm-phone-phone INTO ls_target_phone INDEX lv_index.
    READ TABLE is_target_add_comm_o-phone-phone INTO ls_bp_phone INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_phone-contact-data
        is_target           = ls_bp_phone-contact-data
        is_mapped_target    = ls_target_phone-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-phone-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_phone-remark-remarks.
    lt_target_remarks = ls_target_phone-remark-remarks.
    lt_bp_remarks     = ls_bp_phone-remark-remarks.


    LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-phone-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.
*Fax
  LOOP AT is_source_add_comm-fax-fax INTO ls_source_fax .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-fax-fax INTO ls_target_fax INDEX lv_index.
    READ TABLE is_target_add_comm_o-fax-fax INTO ls_bp_fax INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_fax-contact-data
        is_target           = ls_bp_fax-contact-data
        is_mapped_target    = ls_target_fax-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-fax-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_fax-remark-remarks.
    lt_target_remarks = ls_target_fax-remark-remarks.
    lt_bp_remarks     = ls_bp_fax-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-fax-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*TTX
  LOOP AT is_source_add_comm-ttx-ttx INTO ls_source_ttx .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-ttx-ttx INTO ls_target_ttx INDEX lv_index.
    READ TABLE is_target_add_comm_o-ttx-ttx INTO ls_bp_ttx INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_ttx-contact-data
        is_target           = ls_bp_ttx-contact-data
        is_mapped_target    = ls_target_ttx-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-ttx-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_ttx-remark-remarks.
    lt_target_remarks = ls_target_ttx-remark-remarks.
    lt_bp_remarks     = ls_bp_ttx-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-ttx-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*TLX
  LOOP AT is_source_add_comm-tlx-tlx INTO ls_source_tlx .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-tlx-tlx INTO ls_target_tlx INDEX lv_index.
    READ TABLE is_target_add_comm_o-tlx-tlx INTO ls_bp_tlx INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_tlx-contact-data
        is_target           = ls_bp_tlx-contact-data
        is_mapped_target    = ls_target_tlx-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-tlx-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_tlx-remark-remarks.
    lt_target_remarks = ls_target_tlx-remark-remarks.
    lt_bp_remarks     = ls_bp_tlx-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-tlx-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*SMTP
  LOOP AT is_source_add_comm-smtp-smtp INTO ls_source_smtp .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-smtp-smtp INTO ls_target_smtp INDEX lv_index.
    READ TABLE is_target_add_comm_o-smtp-smtp INTO ls_bp_smtp INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_smtp-contact-data
        is_target           = ls_bp_smtp-contact-data
        is_mapped_target    = ls_target_smtp-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-smtp-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_smtp-remark-remarks.
    lt_target_remarks = ls_target_smtp-remark-remarks.
    lt_bp_remarks     = ls_bp_smtp-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-smtp-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*RML
  LOOP AT is_source_add_comm-rml-rml INTO ls_source_rml .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-rml-rml INTO ls_target_rml INDEX lv_index.
    READ TABLE is_target_add_comm_o-rml-rml INTO ls_bp_rml INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_rml-contact-data
        is_target           = ls_bp_rml-contact-data
        is_mapped_target    = ls_target_rml-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-remote_mail_add-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_rml-remark-remarks.
    lt_target_remarks = ls_target_rml-remark-remarks.
    lt_bp_remarks     = ls_bp_rml-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-remote_mail_add-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*X400
  LOOP AT is_source_add_comm-x400-x400 INTO ls_source_x400 .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-x400-x400 INTO ls_target_x400 INDEX lv_index.
    READ TABLE is_target_add_comm_o-x400-x400 INTO ls_bp_x400 INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_x400-contact-data
        is_target           = ls_bp_x400-contact-data
        is_mapped_target    = ls_target_x400-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-x400-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_x400-remark-remarks.
    lt_target_remarks = ls_target_x400-remark-remarks.
    lt_bp_remarks     = ls_bp_x400-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-x400-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

* RFC
  LOOP AT is_source_add_comm-rfc-rfc INTO ls_source_rfc .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-rfc-rfc INTO ls_target_rfc INDEX lv_index.
    READ TABLE is_target_add_comm_o-rfc-rfc INTO ls_bp_rfc INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_rfc-contact-data
        is_target           = ls_bp_rfc-contact-data
        is_mapped_target    = ls_target_rfc-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-rfc-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_rfc-remark-remarks.
    lt_target_remarks = ls_target_rfc-remark-remarks.
    lt_bp_remarks     = ls_bp_rfc-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-rfc-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*  PRT
  LOOP AT is_source_add_comm-prt-prt INTO ls_source_prt .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-prt-prt INTO ls_target_prt INDEX lv_index.
    READ TABLE is_target_add_comm_o-prt-prt INTO ls_bp_prt INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_prt-contact-data
        is_target           = ls_bp_prt-contact-data
        is_mapped_target    = ls_target_prt-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-prt-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_prt-remark-remarks.
    lt_target_remarks = ls_target_prt-remark-remarks.
    lt_bp_remarks     = ls_bp_prt-remark-remarks.

 LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-prt-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*  SSF
  LOOP AT is_source_add_comm-ssf-ssf INTO ls_source_ssf .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-ssf-ssf INTO ls_target_ssf INDEX lv_index.
    READ TABLE is_target_add_comm_o-ssf-ssf INTO ls_bp_ssf INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_ssf-contact-data
        is_target           = ls_bp_ssf-contact-data
        is_mapped_target    = ls_target_ssf-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-ssf-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_ssf-remark-remarks.
    lt_target_remarks = ls_target_ssf-remark-remarks.
    lt_bp_remarks     = ls_bp_ssf-remark-remarks.

  LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-ssf-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

*  SSF
*  LOOP AT is_source_add_comm-ssf-ssf INTO ls_source_ssf .
*    lv_index = sy-tabix.
*    READ TABLE is_target_add_comm-ssf-ssf INTO ls_target_ssf INDEX lv_index.
*    READ TABLE is_target_add_comm_o-ssf-ssf INTO ls_bp_ssf INDEX lv_index.
*
*    CALL METHOD me->compare_and_fill
*      EXPORTING
*        iv_dataset          = gc_address
*        is_source           = ls_source_ssf-contact-data
*        is_target           = ls_bp_ssf-contact-data
*        is_mapped_target    = ls_target_ssf-contact-data
*      IMPORTING
*        et_messages         = lt_messages
*        ev_inconsistent     = lv_inconsistent
*      CHANGING
*        cs_result_structure = ls_display_structure-data-address-communication-ssf-contact.
** handle error
*      CALL METHOD handle_error(
*        EXPORTING
*          it_messages = lt_messages
*        CHANGING
*          ct_messages = et_messages
*          ).
*
*    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
*      lv_inconsistent_comm = gc_true.
*      CLEAR lv_inconsistent.
*    ENDIF.
*  ENDLOOP.

*    URI
  LOOP AT is_source_add_comm-uri-uri INTO ls_source_uri .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-uri-uri INTO ls_target_uri INDEX lv_index.
    READ TABLE is_target_add_comm_o-uri-uri INTO ls_bp_uri INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_uri-contact-data
        is_target           = ls_bp_uri-contact-data
        is_mapped_target    = ls_target_uri-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-uri-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_uri-remark-remarks.
    lt_target_remarks = ls_target_uri-remark-remarks.
    lt_bp_remarks     = ls_bp_uri-remark-remarks.

   LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-uri-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.
  ENDLOOP.

*    PAGER
  LOOP AT is_source_add_comm-pager-pager INTO ls_source_pager .
    lv_index = sy-tabix.
    READ TABLE is_target_add_comm-pager-pager INTO ls_target_pager INDEX lv_index.
    READ TABLE is_target_add_comm_o-pager-pager INTO ls_bp_pager INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_pager-contact-data
        is_target           = ls_bp_pager-contact-data
        is_mapped_target    = ls_target_pager-contact-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-communication-pager-contact.
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
      lv_inconsistent_comm = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*   Remarks
    CLEAR: lt_source_remarks,
           lt_target_remarks,
           lt_bp_remarks.
    lt_source_remarks = ls_source_pager-remark-remarks.
    lt_target_remarks = ls_target_pager-remark-remarks.
    lt_bp_remarks     = ls_bp_pager-remark-remarks.

  LOOP AT lt_source_remarks INTO ls_source_remark.
      lv_index = sy-tabix.
      READ TABLE lt_target_remarks INTO ls_target_remark INDEX lv_index.
      READ TABLE lt_bp_remarks INTO ls_bp_remark INDEX lv_index.
      CALL METHOD me->compare_and_fill
        EXPORTING
          iv_dataset          = gc_address
          is_source           = ls_source_remark-data
          is_target           = ls_bp_remark-data
          is_mapped_target    = ls_target_remark-data
        IMPORTING
          et_messages         = lt_messages
          ev_inconsistent     = lv_inconsistent
        CHANGING
          cs_result_structure = ls_display_structure-data-address-communication-pager-remarks.
*     handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_comm = gc_false.
        lv_inconsistent_comm = gc_true.
        CLEAR lv_inconsistent.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

  TRY.
      MODIFY ls_display_structure-data-address-communication-phone-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY ls_display_structure-data-address-communication-phone-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY ls_display_structure-data-address-communication-fax-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY ls_display_structure-data-address-communication-fax-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.


      MODIFY ls_display_structure-data-address-communication-ttx-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY ls_display_structure-data-address-communication-ttx-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.


      MODIFY ls_display_structure-data-address-communication-tlx-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY ls_display_structure-data-address-communication-tlx-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY ls_display_structure-data-address-communication-smtp-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY ls_display_structure-data-address-communication-smtp-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY ls_display_structure-data-address-communication-remote_mail_add-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY ls_display_structure-data-address-communication-remote_mail_add-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY ls_display_structure-data-address-communication-x400-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY ls_display_structure-data-address-communication-x400-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY ls_display_structure-data-address-communication-rfc-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY ls_display_structure-data-address-communication-rfc-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY ls_display_structure-data-address-communication-ssf-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY ls_display_structure-data-address-communication-ssf-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY ls_display_structure-data-address-communication-prt-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY ls_display_structure-data-address-communication-prt-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY ls_display_structure-data-address-communication-uri-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY ls_display_structure-data-address-communication-uri-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.

      MODIFY ls_display_structure-data-address-communication-pager-contact FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
      MODIFY ls_display_structure-data-address-communication-pager-remarks FROM ls_result
              TRANSPORTING sequence_number
              WHERE sequence_number IS INITIAL.
    CATCH cx_root.   "#EC NO_HANDLER
  ENDTRY.

  ev_inconsistent = lv_inconsistent_comm.

* Display structure - Communication - CHeck this again!!!!!!!!!!!!
*modify cs_display_structure from ls_display_structure index lv_index.
cs_display_structure = ls_display_structure-data-address-communication.

  ENDMETHOD.


METHOD compare_vend_as_source_general.
  TYPE-POOLS: list.
  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lv_display_index      TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        ls_source_gen         TYPE vmds_ei_central_data,
        ls_target_gen         TYPE vmds_ei_central_data,
        ls_bp_gen             TYPE bus_ei_bupa_central_data,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_dfies              LIKE LINE OF gt_dfies,
        lv_sequence_number    TYPE i,
        lv_inconsistent       TYPE boolean,
        lv_inconsistent_gen   TYPE boolean,
        ls_bp_gen_central     TYPE bus_ei_struc_central,
        ls_bp_gen_person      TYPE bus_ei_struc_central_person,
        ls_bp_gen_organ       TYPE bus_ei_struc_central_organ,
        lt_target             TYPE REF TO data.
*
  FIELD-SYMBOLS: <lt_target> TYPE ANY.
** Initialize.
  CLEAR: et_messages,
         lt_messages.

** Read Partner index of the display structure
  READ TABLE ct_display_structure INTO ls_display_structure
            with key target_object = it_target_gen_org-header-object_instance-bpartner.
  lv_display_index = sy-tabix.
*

  IF is_source_gen IS NOT INITIAL.
    lv_sequence_number        = lv_sequence_number + 1.
    ls_result-sequence_number = lv_sequence_number.

*   Compare Fields
    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = is_source_gen-central-data
        is_target           = it_target_gen_org-central_data-common-data-bp_centraldata
        is_mapped_target    = is_target_gen-central-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-general
        ).
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true AND lv_inconsistent_gen = gc_false.
      lv_inconsistent_gen = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.

    CALL METHOD compare_and_fill(
       EXPORTING
         iv_dataset          = gc_address
         is_source           = is_source_gen-address-postal-data
         is_target           = it_target_gen_org-central_data-common-data-bp_centraldata
         is_mapped_target    = is_target_gen-address-postal-data
      IMPORTING
         et_messages         = lt_messages
         ev_inconsistent     = lv_inconsistent
       CHANGING
         cs_result_structure = ls_display_structure-data-address-general
         ).
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true AND lv_inconsistent_gen = gc_false.
      lv_inconsistent_gen = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.

* Target BP is Person
    IF it_target_gen_org-central_data-common-data-bp_control-category = '1'.
      CREATE DATA lt_target TYPE bus_ei_struc_central_person.
      ASSIGN lt_target->* TO <lt_target>.
      <lt_target> = it_target_gen_org-central_data-common-data-bp_person.

* Target BP is Organization
    ELSEIF it_target_gen_org-central_data-common-data-bp_control-category = '2'.
      CREATE DATA lt_target TYPE bus_ei_struc_central_organ.
      ASSIGN lt_target->* TO <lt_target>.
      <lt_target> = it_target_gen_org-central_data-common-data-bp_organization.

* Target BP is Group
    ELSEIF it_target_gen_org-central_data-common-data-bp_control-category = '3'.
      CREATE DATA lt_target TYPE bus_ei_struc_central_group.
      ASSIGN lt_target->* TO <lt_target>.
      <lt_target> = it_target_gen_org-central_data-common-data-bp_group.
    ENDIF.

    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_address
        is_source           = is_source_gen-central-data
        is_target           = <lt_target>
        is_mapped_target    = is_target_gen-central-data
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-address-general
        ).
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).


    IF lv_inconsistent = gc_true AND lv_inconsistent_gen = gc_false.
      lv_inconsistent_gen = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.

    CALL METHOD compare_and_fill(
       EXPORTING
         iv_dataset          = 'DSET_01'
         is_source           = is_source_gen-address-postal-data
         is_target           = <lt_target>
         is_mapped_target    = is_target_gen-address-postal-data
      IMPORTING
         et_messages         = lt_messages
         ev_inconsistent     = lv_inconsistent
       CHANGING
         cs_result_structure = ls_display_structure-data-address-general
         ).
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).

    IF lv_inconsistent = gc_true AND lv_inconsistent_gen = gc_false.
      lv_inconsistent_gen = gc_true.
      CLEAR lv_inconsistent.
    ENDIF.
*
    IF is_target_gen IS INITIAL.
      ls_display_structure-data-address-status = gc_error.
    ELSEIF lv_inconsistent = gc_true.
      ls_display_structure-data-address-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-address-status = gc_consistent.
    ENDIF.
    CLEAR: ls_result, lt_dfies,lv_inconsistent.
  ELSE. " Source is empty.
    ls_display_structure-data-address-status = gc_notmaintained.
  ENDIF.

  MODIFY ct_display_structure INDEX lv_display_index FROM ls_display_structure.
  ev_inconsistent = lv_inconsistent.
ENDMETHOD.


METHOD compare_vend_as_source_ind.
  TYPE-POOLS : list.
*
  DATA: lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        lv_tabix              TYPE sy-tabix,
        ls_display_structure  TYPE mds_cmpt_display_structure,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_dfies              LIKE LINE OF gt_dfies,
        lv_sequence_number    TYPE i,
        lv_inconsistent       TYPE boolean,
        lv_display_index      TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        ls_source_ind         TYPE vmds_ei_vmd_central_data,
        ls_target_ind         TYPE vmds_ei_vmd_central_data,
        lt_bp_ind             TYPE bus_ei_bupa_industrysector_t,
        ls_bp_ind             TYPE bus_ei_bupa_industrysector.
*

*
  CLEAR: et_messages,
         lt_messages.
*
* Get The Partner index in Display Structure
  READ TABLE ct_display_structure INTO ls_display_structure
            with key target_object = it_target_ind_org-header-object_instance-bpartner.
  lv_display_index = sy-tabix.
*
  IF is_source_ind-central_data-central-data-brsch IS NOT INITIAL.

    ls_source_ind = is_source_ind-central_data-central-data.
    ls_target_ind = is_target_ind-central_data-central-data.
*
* Read original Target structure
    lt_bp_ind = it_target_ind_org-central_data-industry-industries.
    READ TABLE lt_bp_ind INTO ls_bp_ind with key data-ind_default = gc_true.
*
    lv_sequence_number        = lv_sequence_number  + 1.
    ls_result-sequence_number = lv_sequence_number .

    CALL METHOD compare_and_fill(
      EXPORTING
        iv_dataset          = gc_industry
        is_source           = ls_source_ind
        is_target           = ls_bp_ind-data_key
        is_mapped_target    = ls_target_ind
      IMPORTING
        et_messages         = lt_messages
        ev_inconsistent     = lv_inconsistent
      CHANGING
        cs_result_structure = ls_display_structure-data-industry-data
        ).
* handle error
    CALL METHOD handle_error(
      EXPORTING
        it_messages = lt_messages
      CHANGING
        ct_messages = et_messages
        ).
    TRY.
        MODIFY ls_display_structure-data-bank-data FROM ls_result
               TRANSPORTING sequence_number
               WHERE sequence_number IS INITIAL.
      CATCH cx_root.  "#EC NO_HANDLER
    ENDTRY.
*
    IF is_target_ind IS INITIAL.
      ls_display_structure-data-industry-status = gc_error.
    ELSEIF lv_inconsistent = gc_true.
      ls_display_structure-data-industry-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-industry-status = gc_consistent.
    ENDIF.
  ELSE. "source is empty
    ls_display_structure-data-industry-status = gc_notmaintained.
  ENDIF.

  MODIFY ct_display_structure INDEX lv_display_index FROM ls_display_structure .
  ev_inconsistent      = lv_inconsistent.
ENDMETHOD.


method COMPARE_VEND_AS_SOURCE_TAX.

  TYPE-POOLS: list.
  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lt_temp_result        TYPE mds_cmpt_display_st_result_t,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        lv_inconsistent       TYPE boolean,
        lv_display_index      TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        ls_source_tax         TYPE vmds_ei_vmd_central_data,
        ls_target_tax         TYPE vmds_ei_vmd_central_data,
        ls_bp_tax             TYPE bus_ei_bupa_taxnumber,
        lv_sequence_number    TYPE i.

  CONSTANTS: lc_lfa1(4) TYPE c VALUE 'LFA1',
             lc_lfas(4) TYPE c VALUE 'LFAS',
             lc_bp_table(12) TYPE c VALUE 'DFKKBPTAXNUM',
             con_0(1)    TYPE c VALUE '0',
             con_1(1)    TYPE c VALUE '1',
             con_2(1)    TYPE c VALUE '2',
             con_3(1)    TYPE c VALUE '3',
             con_4(1)    TYPE c VALUE '4'.

* initialize exporting parameters
  CLEAR: et_messages,
        ev_inconsistent.

  READ TABLE ct_display_structure INTO ls_display_structure
            with key target_object = it_target_tax_org-header-object_instance-bpartner.
  lv_display_index = sy-tabix.

   IF is_source_tax-central-data-stceg IS NOT INITIAL OR
     is_source_tax-central-data-stcd1 IS NOT INITIAL OR
     is_source_tax-central-data-stcd2 IS NOT INITIAL OR
     is_source_tax-central-data-stcd3 IS NOT INITIAL OR
     is_source_tax-central-data-stcd4 IS NOT INITIAL .

    ls_source_tax = is_source_tax-central-data.
    ls_target_tax = is_target_tax-central-data.
*    Check the Index (???)
    READ TABLE it_target_tax_org-central_data-taxnumber-taxnumbers INTO ls_bp_tax INDEX 1.

    lv_sequence_number        = lv_sequence_number + 1.
    ls_result-sequence_number = lv_sequence_number.
    ls_result-target_table    = lc_bp_table.

* STCEG
    IF ls_source_tax-stceg IS NOT INITIAL.
      ls_result-source_field  = 'STCEG'.
      ls_result-source_value  = ls_source_tax-stceg.
      ls_result-target_field  = 'TAXNUM'.
      ls_result-target_value  = ls_bp_tax-data_key-taxnumber.
      IF ls_source_tax-stceg(2) = is_source_tax-address-postal-data-country.
        ls_result-source_table    = lc_lfa1.
      ELSE.
        ls_result-source_table    = lc_lfas.
      ENDIF.
      IF ls_source_tax-stceg  = ls_target_tax-stceg.
        IF ls_bp_tax-data_key-taxtype+2(1) EQ con_0.
          ls_result-consistent = GC_TRUE.
        ELSE.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
        ENDIF.
      ELSE.
        lv_inconsistent = gc_true.
      ENDIF.
* STCD1
    ELSEIF ls_source_tax-stcd1 IS NOT INITIAL.
      ls_result-source_field  = 'stcd1'.
      ls_result-source_value  = ls_source_tax-stcd1.
      ls_result-target_field  = 'TAXNUM'.
      ls_result-target_value  = ls_bp_tax-data_key-taxnumber.
      IF ls_source_tax-stcd1(2) = is_source_tax-address-postal-data-country.
        ls_result-source_table    = lc_lfa1.
      ENDIF.
      IF ls_source_tax-stcd1  = ls_target_tax-stcd1.
        IF ls_bp_tax-data_key-taxtype+2(1) EQ con_1.
          ls_result-consistent = gc_true.
        ELSE.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
        ENDIF.
      ELSE.
        lv_inconsistent = gc_true.
      ENDIF.
*      Country Argentina
      IF ls_bp_tax-data_key-taxtype+2(1) EQ con_1 AND
            is_source_tax-address-postal-data-country = 'AR'.
        CASE ls_source_tax-stcdt.
          WHEN '80'.
            IF ls_bp_tax-data_key-taxtype+3(1) = 'A'.
              ls_result-consistent = gc_true.
            ELSE.
              ls_result-consistent = gc_false.
            ENDIF.
          WHEN '86'.
            IF ls_bp_tax-data_key-taxtype+3(1) = 'B'.
              ls_result-consistent = gc_true.
            ELSE.
              ls_result-consistent = gc_false.
              lv_inconsistent = gc_true.
            ENDIF.
          WHEN OTHERS.
            ls_result-consistent = gc_false.
            lv_inconsistent = gc_true.
        ENDCASE.
      ENDIF.

    ELSEIF ls_source_tax-stcd2 IS NOT INITIAL.
      ls_result-source_field  = 'stcd2'.
      ls_result-source_value  = ls_source_tax-stcd2.
      ls_result-target_field  = 'TAXNUM'.
      ls_result-target_value  = ls_bp_tax-data_key-taxnumber.
      IF ls_source_tax-stcd2(2) = is_source_tax-address-postal-data-country.
        ls_result-source_table    = lc_lfa1.
      ENDIF.
      IF ls_source_tax-stcd2  = ls_target_tax-stcd2.
        IF ls_bp_tax-data_key-taxtype+2(1) EQ con_2.
          ls_result-consistent = gc_true.
        ELSE.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
        ENDIF.
      ELSE.
        lv_inconsistent = gc_true.
      ENDIF.
*    STCD3
    ELSEIF ls_source_tax-stcd3 IS NOT INITIAL.
      ls_result-source_field  = 'stcd3'.
      ls_result-source_value  = ls_source_tax-stcd3.
      ls_result-target_field  = 'TAXNUM'.
      ls_result-target_value  = ls_bp_tax-data_key-taxnumber.
      IF ls_source_tax-stcd3(2) = is_source_tax-address-postal-data-country.
        ls_result-source_table    = lc_lfa1.
      ENDIF.
      IF ls_source_tax-stcd3  = ls_target_tax-stcd3.
        IF ls_bp_tax-data_key-taxtype+2(1) EQ con_3.
          ls_result-consistent = gc_true.
        ELSE.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
        ENDIF.
      ELSE.
        lv_inconsistent = gc_true.
      ENDIF.
*STCD4
    ELSEIF ls_source_tax-stcd4 IS NOT INITIAL.
      ls_result-source_field  = 'stcd4'.
      ls_result-source_value  = ls_source_tax-stcd4.
      ls_result-target_field  = 'TAXNUM'.
      ls_result-target_value  = ls_bp_tax-data_key-taxnumber.
      IF ls_source_tax-stcd4(2) = is_source_tax-address-postal-data-country.
        ls_result-source_table    = lc_lfa1.
      ENDIF.
      IF ls_source_tax-stcd4  = ls_target_tax-stcd4.
        IF ls_bp_tax-data_key-taxtype+2(1) EQ con_4.
          ls_result-consistent = gc_true.
        ELSE.
          ls_result-consistent = gc_false.
          lv_inconsistent = gc_true.
        ENDIF.
      ELSE.
        lv_inconsistent = gc_true.
      ENDIF.
    ENDIF.
      append ls_result to ls_display_structure-data-tax-data.

    IF is_target_tax IS INITIAL.
      ls_display_structure-data-tax-status = gc_error.
    ELSEIF lv_inconsistent = gc_true.
      ls_display_structure-data-tax-status = gc_inconsistent.
    ELSE.
      ls_display_structure-data-tax-status = gc_consistent.
    ENDIF.
  ELSE.
    ls_display_structure-data-tax-status = gc_notmaintained.

  ENdIF.
  modify ct_display_structure from ls_display_structure index lv_display_index.
  ev_inconsistent = lv_inconsistent.
  clear lv_inconsistent.

ENDMETHOD.


METHOD COMPARE_VEND_AS_SOURCE_VERSION.

  DATA: ls_display_structure  TYPE mds_cmpt_display_structure,
        lv_index              TYPE sy-tabix,
        lv_tabname            TYPE tabname,
        lt_messages           TYPE mds_ctrls_error_objects,
        ls_message            TYPE bapiret2,
        ls_result             TYPE mds_cmpt_display_st_result,
        lt_dfies              LIKE LINE OF gt_dfies,
        lv_sequence_number    TYPE i,
        lv_inconsistent       TYPE boolean,
        lv_inconsistent_ver   TYPE boolean,
        ls_source_ver         TYPE cvi_ei_version_type1,
        ls_target_ver         TYPE cvi_ei_version_type1,
        ls_bp_ver             TYPE bus_ei_bupa_version.


* set sequence number = 1 (since only standard address is compared)
  ls_result-sequence_number = 1.

  LOOP AT it_source_add_ver INTO ls_source_ver.
    lv_index = sy-tabix.

    READ TABLE it_target_add_ver INTO ls_target_ver INDEX lv_index.
    READ TABLE it_target_add_ver_or INTO ls_bp_ver INDEX lv_index.

    CALL METHOD me->compare_and_fill
      EXPORTING
        iv_dataset          = gc_address
        is_source           = ls_source_ver-data
        is_target           = ls_bp_ver-data
        is_mapped_target    = ls_target_ver-data
      IMPORTING
        ET_MESSAGES         = lt_messages
        EV_INCONSISTENT     = lv_inconsistent
      changing
        cs_result_structure = ls_display_structure-data-address-versions
        .
* handle error
      CALL METHOD handle_error(
        EXPORTING
          it_messages = lt_messages
        CHANGING
          ct_messages = et_messages
          ).

      IF lv_inconsistent = gc_true and lv_inconsistent_ver = gc_false.
        lv_inconsistent_ver = gc_true.
        CLEAR lv_inconsistent.
      endif.

  ENDLOOP.

  MODIFY ls_display_structure-data-address-versions FROM ls_result
                               TRANSPORTING sequence_number
                                     WHERE  sequence_number IS INITIAL.

* check If this is ok???
  cs_display_structure = ls_display_structure-data-address-versions.

  ev_inconsistent = lv_inconsistent_ver.

ENDMETHOD.


METHOD get_field_description.
  DATA : lt_dfies_temp TYPE dfies_table,
         ls_dfies_temp LIKE LINE OF lt_dfies_temp,
         ls_dfies      LIKE LINE OF gt_dfies,
         ls_message    TYPE bapiret2.

  READ TABLE gt_dfies with key tabname = tabname
                      TRANSPORTING no fields.

  IF sy-subrc <> 0.
    CALL FUNCTION 'DDIF_FIELDINFO_GET'
      EXPORTING
        tabname        = tabname
        fieldname      = fieldname
      TABLES
        dfies_tab      = lt_dfies_temp
      EXCEPTIONS
        not_found      = 1
        internal_error = 2
        OTHERS         = 3.
    IF sy-subrc <> 0.
      CALL METHOD fsbp_generic_services=>new_message
        EXPORTING
          i_class_id = 'CVI_TOOLS_SUPPORT'
          i_type     = fsbp_generic_services=>msg_warning
          i_number   = '133'
        RECEIVING
          r_message  = ls_message.
      APPEND ls_message TO et_messages-messages.
    ENDIF.

    LOOP AT lt_dfies_temp INTO ls_dfies_temp.
      ls_dfies-tabname   = tabname.
      ls_dfies-fieldname = ls_dfies_temp-fieldname.
      ls_dfies-fieldtext = ls_dfies_temp-fieldtext.
      APPEND ls_dfies TO gt_dfies.
    ENDLOOP.
  ENDIF.
ENDMETHOD.


METHOD get_instance.
  IF gr_instance IS INITIAL.
    CREATE OBJECT gr_instance.
  ENDIF.
  rr_instance = gr_instance.
ENDMETHOD.


METHOD handle_error.
  DATA : ls_message TYPE bapiret2.

* Common error messages
  IF it_messages-is_error = gc_true.
    ct_messages-is_error = gc_true.
  ENDIF.
  LOOP AT it_messages-messages INTO ls_message.
    APPEND ls_message TO ct_messages-messages.
  ENDLOOP.

* Object specific error messages
  IF it_messages-is_error_objects = gc_true.
    ct_messages-is_error_objects = gc_true.
    APPEND LINES OF it_messages-objects TO ct_messages-objects.
  ENDIF.
ENDMETHOD.
ENDCLASS.
