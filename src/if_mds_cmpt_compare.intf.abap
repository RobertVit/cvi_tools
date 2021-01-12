*"* components of interface IF_MDS_CMPT_COMPARE
interface IF_MDS_CMPT_COMPARE
  public .


  interfaces IF_BADI_INTERFACE .

  methods COMPARE_DATA
    importing
      !IS_SOURCE_DATA type DATA
      !IS_TARGET_DATA type DATA
      !IS_MAPPED_TARGET_DAT type DATA
    changing
      !CT_OUTPUT type MDS_CMPT_DISPLAY_STRUCTURE_T
      !CT_MESSAGES type MDS_CTRLS_ERROR_OBJECTS .
endinterface.
