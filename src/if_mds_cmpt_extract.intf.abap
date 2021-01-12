*"* components of interface IF_MDS_CMPT_EXTRACT
interface IF_MDS_CMPT_EXTRACT
  public .


  interfaces IF_BADI_INTERFACE .

  methods EXTRACT_DATA
    importing
      !IS_CONTROL type MDS_CMPT_SYNC_PARAMETER
      !IT_OUTPUT type MDS_CMPT_DISPLAY_STRUCTURE_T
    changing
      !CS_SOURCE_DATA type ref to DATA
      !CS_TARGET_DATA type ref to DATA
      !CT_MESSAGES type MDS_CTRLS_ERROR_OBJECTS .
endinterface.
