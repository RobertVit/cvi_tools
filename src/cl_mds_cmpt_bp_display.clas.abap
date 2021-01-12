class CL_MDS_CMPT_BP_DISPLAY definition
  public
  final
  create public .

public section.
*"* public components of class CL_MDS_CMPT_BP_DISPLAY
*"* do not include other source files here!!!

  interfaces IF_MDS_CMPT_PREPARE .
  interfaces IF_MDS_CMPT_PREP_INST .
protected section.
*"* protected components of class CL_MDS_CMPT_BP_DISPLAY
*"* do not include other source files here!!!
private section.
*"* private components of class CL_MDS_CMPT_BP_DISPLAY
*"* do not include other source files here!!!

  aliases GET_INSTANCE
    for IF_MDS_CMPT_PREP_INST~GET_INSTANCE .
  aliases PREPARE_DATASET_LIST
    for IF_MDS_CMPT_PREPARE~PREPARE_DATASET_LIST .
  aliases PREPARE_FIELD_LIST
    for IF_MDS_CMPT_PREPARE~PREPARE_FIELD_LIST .
  aliases PREPARE_OBJECT_LIST
    for IF_MDS_CMPT_PREPARE~PREPARE_OBJECT_LIST .

  class-data GR_INSTANCE type ref to CL_MDS_CMPT_BP_DISPLAY .
  data GC_TRUE type BOOLEAN value 'X'. "#EC NOTEXT .
  data GC_FALSE type BOOLEAN value ' '. "#EC NOTEXT .
  data GC_ADDRESS type CHAR7 value 'DSET_01'. "#EC NOTEXT .
  data GC_BANK type CHAR7 value 'DSET_02'. "#EC NOTEXT .
  data GC_CREDIT type CHAR7 value 'DSET_03'. "#EC NOTEXT .
  data GC_INDUSTRY type CHAR7 value 'DSET_04'. "#EC NOTEXT .
  data GC_RELATIONSHIP type CHAR7 value 'DSET_05'. "#EC NOTEXT .
  data GC_TAX type CHAR7 value 'DSET_06'. "#EC NOTEXT .
  data GC_C type C value 'C'. "#EC NOTEXT .
  data GC_I type C value 'I'. "#EC NOTEXT .
  data GC_E type C value 'E'. "#EC NOTEXT .

  methods PREPARE_FIELD_FOR_DISPLAY
    importing
      !IT_RESULT type MDS_CMPT_DISPLAY_ST_RESULT_T
    changing
      !CT_FIELDS type MDS_CMPT_FIELD_LIST_T
      !CT_MESSAGES type MDS_CMPT_FIELD_DESCR_T .
ENDCLASS.



CLASS CL_MDS_CMPT_BP_DISPLAY IMPLEMENTATION.


METHOD if_mds_cmpt_prepare~prepare_dataset_list.
  TYPE-POOLS : list.
  DATA : ls_display_structure    TYPE mds_cmpt_display_structure,
         ls_inconsistent_dataset TYPE mds_cmpt_dataset_list,
         ls_dataset              TYPE mds_cmpt_selected_datasets.

*initialize exporting parameters
  CLEAR et_datasets.

*Read the display structure for the selected object
  READ TABLE it_display_structure with key source_object = iv_object
                                  INTO ls_display_structure.

*check standard datasets for their status
*1: Address dataset (DSET_01)
  CASE ls_display_structure-data-address-status.
    WHEN gc_c.
      ls_inconsistent_dataset-status = icon_green_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_address.
      ls_inconsistent_dataset-dataset = gc_address.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN gc_i.
      ls_inconsistent_dataset-status = icon_yellow_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_address.
      ls_inconsistent_dataset-dataset = gc_address.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN gc_e.
      ls_inconsistent_dataset-status = icon_red_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_address.
      ls_inconsistent_dataset-dataset = gc_address.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN 'OTHERS'.
*do nothing
  ENDCASE.

*2: Tax dataset
  CASE ls_display_structure-data-tax-status.
    WHEN gc_c.
      ls_inconsistent_dataset-status = icon_green_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_tax.
      ls_inconsistent_dataset-dataset = gc_tax.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN gc_i.
      ls_inconsistent_dataset-status = icon_yellow_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_tax.
      ls_inconsistent_dataset-dataset = gc_tax.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN gc_e.
      ls_inconsistent_dataset-status = icon_red_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_tax.
      ls_inconsistent_dataset-dataset = gc_tax.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN 'OTHERS'.
*do nothing
  ENDCASE.

*3: Bank dataset
  CASE ls_display_structure-data-bank-status.
    WHEN gc_c.
      ls_inconsistent_dataset-status = icon_green_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_bank.
      ls_inconsistent_dataset-dataset = gc_bank.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN gc_i.
      ls_inconsistent_dataset-status = icon_yellow_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_bank.
      ls_inconsistent_dataset-dataset = gc_bank.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN gc_e.
      ls_inconsistent_dataset-status = icon_red_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_bank.
      ls_inconsistent_dataset-dataset = gc_bank.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN 'OTHERS'.
*do nothing
  ENDCASE.

*4: Credit card dataset
  CASE ls_display_structure-data-credit-status.
    WHEN gc_c.
      ls_inconsistent_dataset-status = icon_green_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_credit.
      ls_inconsistent_dataset-dataset = gc_credit.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN gc_i.
      ls_inconsistent_dataset-status = icon_yellow_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_credit.
      ls_inconsistent_dataset-dataset = gc_credit.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN gc_e.
      ls_inconsistent_dataset-status = icon_red_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_credit.
      ls_inconsistent_dataset-dataset = gc_credit.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN 'OTHERS'.
*do nothing
  ENDCASE.

*5: Industry dataset
  CASE ls_display_structure-data-industry-status.
    WHEN gc_c.
      ls_inconsistent_dataset-status = icon_green_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_industry.
      ls_inconsistent_dataset-dataset = gc_industry.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN gc_i.
      ls_inconsistent_dataset-status = icon_yellow_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_industry.
      ls_inconsistent_dataset-dataset = gc_industry.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN gc_e.
      ls_inconsistent_dataset-status = icon_red_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_industry.
      ls_inconsistent_dataset-dataset = gc_industry.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN 'OTHERS'.
*do nothing
  ENDCASE.

*6: Relationship dataset
  CASE ls_display_structure-data-relationship-status.
    WHEN gc_c.
      ls_inconsistent_dataset-status = icon_green_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_relationship.
      ls_inconsistent_dataset-dataset = gc_relationship.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN gc_i.
      ls_inconsistent_dataset-status = icon_yellow_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_relationship.
      ls_inconsistent_dataset-dataset = gc_relationship.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN gc_e.
      ls_inconsistent_dataset-status = icon_red_light.
      READ TABLE it_datasets INTO ls_dataset with key dataset = gc_relationship.
      ls_inconsistent_dataset-dataset = gc_relationship.
      ls_inconsistent_dataset-description = ls_dataset-description.
      APPEND ls_inconsistent_dataset TO et_datasets.

    WHEN 'OTHERS'.
*do nothing
  ENDCASE.

ENDMETHOD.


METHOD if_mds_cmpt_prepare~prepare_field_list.

  DATA : ls_display_structure    TYPE mds_cmpt_display_structure,
         ls_relationship         TYPE mds_cmpt_disp_st_relationship,
         ls_stylerow             TYPE lvc_s_styl.

  FIELD-SYMBOLS : <fs_field_row> TYPE mds_cmpt_field_list.

*clear exporting parameters
  CLEAR et_fields.

  READ TABLE it_display_structure INTO ls_display_structure
                                  with key source_object = iv_object.


* resolve standard datasets
  CASE iv_dataset.
    WHEN gc_address.
*1: GENERAL sub-structure
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-general
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

*2: POSTAL sub-structure
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-postal
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

*3: REMARKS sub-structure
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

*4: VERSIONS sub-structure
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-versions
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

*2: COMMUNICATION sub-structure
*   PHONE
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-phone-contact
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-phone-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).
*   FAX
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-fax-contact
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-fax-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).
*   TTX
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-ttx-contact
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-ttx-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).
*   TLX
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-tlx-contact
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-tlx-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).
*   SMTP
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-smtp-contact
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-smtp-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).
*   REMOTE MAIL ADD
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-remote_mail_add-contact
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-remote_mail_add-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).
*   X400
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-x400-contact
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-x400-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).
*   RFC
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-rfc-contact
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-rfc-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).
*   PRT
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-prt-contact
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-prt-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).
*   SSF
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-ssf-contact
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-ssf-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).
*   URI
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-uri-contact
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-uri-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).
*   PAGER
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-pager-contact
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-address-communication-pager-remarks
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

    WHEN gc_tax.
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-tax-data
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

    WHEN gc_credit.
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-credit-data
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

    WHEN gc_bank.
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-bank-data
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

    WHEN gc_industry.
      prepare_field_for_display(
      EXPORTING
      it_result = ls_display_structure-data-industry-data
      CHANGING
      ct_fields = et_fields
      ct_messages = et_messages
      ).

    WHEN gc_relationship.
      LOOP AT ls_display_structure-data-relationship-data INTO ls_relationship.
*1: Relationship data
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-relationship_data
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

*2: Home address
*GENERAL
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-general
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

*POSTAL
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-postal
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

*REMARKS
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

*VERSIONS
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-versions
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

*COMMUNICATION
*PHONE
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-phone-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-phone-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

*FAX
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-fax-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-fax-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*TTX
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-ttx-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-ttx-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*TLX
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-tlx-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-tlx-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*SMTP
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-smtp-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-smtp-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*RML
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-remote_mail_add-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-remote_mail_add-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*X400
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-x400-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-x400-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*RFC
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-rfc-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-rfc-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*PRT
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-prt-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-prt-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*SSF
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-ssf-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-ssf-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*URI
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-uri-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-uri-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*PAGER
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-pager-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-home_address-communication-pager-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).


*3: Business address
*GENERAL
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-general
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

*POSTAL
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-postal
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

*REMARKS
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

*VERSIONS
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-versions
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

*COMMUNICATION
*PHONE
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-phone-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-phone-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

*FAX
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-fax-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-fax-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*TTX
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-ttx-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-ttx-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*TLX
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-tlx-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-tlx-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*SMTP
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-smtp-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-smtp-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*RML
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-remote_mail_add-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-remote_mail_add-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*X400
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-x400-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-x400-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*RFC
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-rfc-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-rfc-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*PRT
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-prt-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-prt-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*SSF
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-ssf-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-ssf-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*URI
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-uri-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-uri-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).
*PAGER
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-pager-contact
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_address-communication-pager-remarks
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

*4: Business hours
        prepare_field_for_display(
        EXPORTING
        it_result = ls_relationship-data-business_hours
        CHANGING
        ct_fields = et_fields
        ct_messages = et_messages
        ).

      ENDLOOP.
  ENDCASE.

*  enable button for message field
  ls_stylerow-fieldname = 'MESSAGE'.
  ls_stylerow-style     =  cl_gui_alv_grid=>mc_style_button.

  LOOP AT et_fields ASSIGNING <fs_field_row>.
    APPEND ls_stylerow TO <fs_field_row>-cellstyles.
    MODIFY et_fields FROM <fs_field_row> INDEX sy-tabix
      TRANSPORTING cellstyles.
  ENDLOOP.

ENDMETHOD.


METHOD if_mds_cmpt_prepare~prepare_object_list.
  TYPE-POOLS : list.
  DATA : ls_display_structure TYPE mds_cmpt_display_structure,
         ls_objects           TYPE mds_cmpt_object_list.

  LOOP AT it_display_structure INTO ls_display_structure.
*prepare error objects
    IF ls_display_structure-source_object IS NOT INITIAL
       AND ls_display_structure-target_object IS INITIAL.
      CLEAR ls_objects.
      ls_objects-status = icon_red_light.
      ls_objects-source_object = ls_display_structure-source_object.
      ls_objects-target_object = ls_display_structure-target_object.
      APPEND ls_objects TO et_error_objects.

*prepare consistent objects
    ELSEIF ls_display_structure-source_object IS NOT INITIAL
       AND ls_display_structure-target_object IS NOT INITIAL
       AND ls_display_structure-consistent = gc_true.
      CLEAR ls_objects.
      ls_objects-status = icon_green_light.
      ls_objects-source_object = ls_display_structure-source_object.
      ls_objects-target_object = ls_display_structure-target_object.
      APPEND ls_objects TO et_consistent_objects.

*prepare inconsistent objects
    ELSEIF ls_display_structure-source_object IS NOT INITIAL
       AND ls_display_structure-target_object IS NOT INITIAL
       AND ls_display_structure-consistent IS INITIAL.
      CLEAR ls_objects.
      ls_objects-status = icon_yellow_light.
      ls_objects-source_object = ls_display_structure-source_object.
      ls_objects-target_object = ls_display_structure-target_object.
      APPEND ls_objects TO et_inconsistent_objects.
    ENDIF.
    CLEAR ls_display_structure.
  ENDLOOP.
ENDMETHOD.


METHOD if_mds_cmpt_prep_inst~get_instance.
  IF gr_instance IS INITIAL.
    CREATE OBJECT gr_instance.
  ENDIF.
  rr_instance = gr_instance.
ENDMETHOD.


METHOD prepare_field_for_display.

  TYPE-POOLS: list.
  DATA : lv_sequence_number     TYPE mds_cmpt_sort_sequence,
         ls_result              TYPE mds_cmpt_display_st_result,
         ls_inconsistent_fields TYPE mds_cmpt_field_list,
         ls_message             TYPE mds_cmpt_field_descr,
         lv_row_colour(4)       TYPE c.

  CONSTANTS : lc_colour1(4) TYPE c VALUE 'C300',
              lc_colour2(4) TYPE c VALUE 'C500'.

  lv_row_colour = lc_colour1.
  DO.
    lv_sequence_number = lv_sequence_number + 1.

    IF lv_row_colour = lc_colour1.
      lv_row_colour = lc_colour2.
    ELSEIF lv_row_colour = lc_colour2.
      lv_row_colour = lc_colour1.
    ENDIF.

    LOOP AT it_result INTO ls_result
     WHERE sequence_number = lv_sequence_number.

      MOVE-CORRESPONDING ls_result TO ls_inconsistent_fields.
      MOVE ls_result-field_descr TO ls_message.
      ls_inconsistent_fields-message = icon_display.

      IF ls_inconsistent_fields-consistent IS INITIAL.
        ls_inconsistent_fields-consistent = icon_led_red.
      ELSEIF ls_inconsistent_fields-consistent = gc_true.
        ls_inconsistent_fields-consistent = icon_led_green.
      ENDIF.

      ls_inconsistent_fields-rowcolour = lv_row_colour.

      APPEND ls_inconsistent_fields TO ct_fields.
      APPEND ls_message TO ct_messages.

    ENDLOOP.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

  ENDDO.
ENDMETHOD.
ENDCLASS.
