class CL_MDS_VENDOR_CMPTOOL definition
  public
  inheriting from CL_MDS_CMPTOOL_ABSTRACT
  final
  create protected .

public section.
*"* public components of class CL_MDS_VENDOR_CMPTOOL
*"* do not include other source files here!!!

  interfaces IF_MDS_CMPTOOL_INST .

  methods CONSTRUCTOR .

  methods COMPARE_SOURCE_TARGET
    redefinition .
  methods EXTRACT_DATA
    redefinition .
  methods IF_MDS_CMPTOOL~EXTRACT_ID
    redefinition .
  methods IF_MDS_CMPTOOL~GET_LINK_IDS
    redefinition .
  methods IF_MDS_CMPTOOL~GET_VALID_SYNC_IDS
    redefinition .
  methods MAP_TARGET_TO_SOURCE
    redefinition .
  methods IF_MDS_CMPTOOL~FINALIZE
    redefinition .
protected section.
*"* protected components of class CL_MDS_VENDOR_CMPTOOL
*"* do not include other source files here!!!

  constants GC_PRIMARY_KEY type FIELDNAME value 'LIFNR'. "#EC NOTEXT
  constants GC_SOURCE_OBJECT type MDS_CMPT_CTRL_OBJ_SOURCE value 'VENDOR'. "#EC NOTEXT
  class-data GR_INSTANCE type ref to CL_MDS_VENDOR_CMPTOOL .
private section.
*"* private components of class CL_MDS_VENDOR_CMPTOOL
*"* do not include other source files here!!!

  constants GC_TRUE type BOOLEAN value 'X'. "#EC NOTEXT
ENDCLASS.



CLASS CL_MDS_VENDOR_CMPTOOL IMPLEMENTATION.


METHOD compare_source_target.

  DATA: lr_instance TYPE REF TO cl_mds_cmpt_compare,
        lr_source_data  TYPE REF TO data,
        lr_target_data TYPE REF TO data,
        lr_target_org TYPE REF TO data,
        ls_source TYPE vmds_ei_main,
        ls_target TYPE vmds_ei_main,
        ls_target_org TYPE bus_ei_main,
        ls_error TYPE mds_ctrls_error,
        ls_message TYPE bapiret2,
        lt_messages    TYPE   mds_ctrls_error_objects.

  FIELD-SYMBOLS: <ls_source_data> TYPE ANY,
                  <ls_target_data> TYPE ANY,
                  <ls_target_org> TYPE ANY.

  CREATE DATA lr_source_data TYPE vmds_ei_main.
  ASSIGN lr_source_data->* TO <ls_source_data>.
  <ls_source_data> = is_source_data.
  ls_source = <ls_source_data>.

  CREATE DATA lr_target_data TYPE vmds_ei_main.
  ASSIGN lr_target_data->* TO <ls_target_data>.
  <ls_target_data> = IS_MAPPED_TARGET_DATA.
  ls_target = <ls_target_data>.

  CREATE DATA lr_target_org TYPE bus_ei_main.
  ASSIGN lr_target_org->* TO <ls_target_org>.
  <ls_target_org> = IS_TARGET_DATA.
  ls_target_org = <ls_target_org>.

* Get Instance of Compare class
  CALL METHOD cl_mds_cmpt_compare=>get_instance
    RECEIVING
      rr_instance = lr_instance.

* Compare the source and target structures
  CALL METHOD lr_instance->compare_vendor_as_source
    EXPORTING
      is_source_st         = ls_source
      is_target_st         = ls_target
      is_target_org        = ls_target_org
    IMPORTING
      et_messages          = lt_messages
    CHANGING
      ct_display_structure = ct_output.

*  Common error messages
  IF lt_messages-is_error = gc_true.
    et_messages-is_error = gc_true.
  ENDIF.
  LOOP AT lt_messages-messages INTO ls_message.
    APPEND ls_message TO et_messages-messages.
  ENDLOOP.

* Object specific error messages
  IF lt_messages-is_error_objects = gc_true.
    et_messages-is_error_objects = gc_true.
    et_messages-objects = lt_messages-objects.
  ENDIF.

* Set the method execute flag
  gv_compare_called = gc_true.
ENDMETHOD.


method CONSTRUCTOR.

* call super contructor:
  CALL METHOD super->constructor( ).

* set source object and primary key field name:
  gv_source_object = gc_source_object.
  gv_primary_key   = gc_primary_key.

endmethod.


METHOD extract_data.

  DATA:  lt_id_list     TYPE   mds_cmpt_source_target_t,
         ls_id_list     TYPE   mds_cmpt_source_target,
         lt_messages    TYPE   mds_ctrls_error_objects,
         ls_source_data TYPE   vmds_ei_main,
         ls_target_data TYPE   bus_ei_main,
         ls_vend_id     TYPE   mds_cmpt_object,
         lt_vend_ids    TYPE   mds_cmpt_object_t,
         ls_bp_id       TYPE   mds_cmpt_object,
         lt_bp_ids      TYPE   mds_cmpt_object_t,
         ls_message     TYPE   bapiret2.

* Get references for output
  DATA: lr_source TYPE REF TO data,
        lr_target TYPE REF TO data.
  FIELD-SYMBOLS: <ls_source>   TYPE   ANY,
                  <ls_target>  TYPE   ANY.

* Get list of IDs to Extract
  CALL METHOD cl_mds_cmptool_extract=>prepare_id_list
    EXPORTING
      it_display_structure = it_output
    IMPORTING
      et_id_list           = lt_id_list
      et_messages          = lt_messages.

*  Common error messages
  IF lt_messages-is_error = gc_true.
    et_messages-is_error = gc_true.
  ENDIF.
  LOOP AT lt_messages-messages INTO ls_message.
    APPEND ls_message TO et_messages-messages.
  ENDLOOP.

* Object specific error messages
  IF lt_messages-is_error_objects = gc_true.
    et_messages-is_error_objects = gc_true.
    et_messages-objects = lt_messages-objects.
  ENDIF.

  LOOP AT lt_id_list INTO ls_id_list.
    ls_vend_id = ls_id_list-source_object.
    ls_bp_id = ls_id_list-target_object.
    APPEND ls_vend_id TO lt_vend_ids.
    APPEND ls_bp_id TO lt_bp_ids.
  ENDLOOP.

*Extract source data - Vendor
  CALL METHOD cl_mds_cmptool_extract=>extract_vend_data
    EXPORTING
      is_control  = is_control
      it_id_list  = lt_vend_ids
    IMPORTING
      et_data     = ls_source_data
      et_messages = lt_messages.

*  Common error messages
  IF lt_messages-is_error = gc_true.
    et_messages-is_error = gc_true.
  ENDIF.
  LOOP AT lt_messages-messages INTO ls_message.
    APPEND ls_message TO et_messages-messages.
  ENDLOOP.

* Object specific error messages
  IF lt_messages-is_error_objects = gc_true.
    et_messages-is_error_objects = gc_true.
    et_messages-objects = lt_messages-objects.
  ENDIF.

  IF NOT ls_source_data IS INITIAL.
    CREATE DATA lr_source TYPE vmds_ei_main.
    ASSIGN lr_source->* TO <ls_source>.
    <ls_source> = ls_source_data.
    es_source_data = lr_source.
  ENDIF.

*Extract Target data - BP
  CALL METHOD cl_mds_cmptool_extract=>extract_bp_data
    EXPORTING
      is_control  = is_control
      it_id_list  = lt_bp_ids
    IMPORTING
      et_data     = ls_target_data
      et_messages = lt_messages.

*  Common error messages
  IF lt_messages-is_error = gc_true.
    et_messages-is_error = gc_true.
  ENDIF.
  LOOP AT lt_messages-messages INTO ls_message.
    APPEND ls_message TO et_messages-messages.
  ENDLOOP.

* Object specific error messages
  IF lt_messages-is_error_objects = gc_true.
    et_messages-is_error_objects = gc_true.
    et_messages-objects = lt_messages-objects.
  ENDIF.

  IF NOT ls_target_data IS INITIAL.
    CREATE DATA lr_target TYPE bus_ei_main.
    ASSIGN lr_target->* TO <ls_target>.
    <ls_target> = ls_target_data.
    es_target_data = lr_target.
  ENDIF.
ENDMETHOD.


method IF_MDS_CMPTOOL_INST~GET_INSTANCE.

IF gr_instance IS INITIAL.
   CREATE OBJECT gr_instance.
ENDIF.
rr_instance = gr_instance.

endmethod.


METHOD if_mds_cmptool~extract_id.

  DATA: lt_lifnr                   TYPE TABLE OF vmds_vendor_number,
        lt_part_of_site            TYPE vmds_vendor_numbers_s_t,
        ls_vmds_vendor_number      TYPE vmds_vendor_number,
        ld_message                 TYPE sy-entry,
        ls_bapiret2                TYPE bapiret2,
        ls_error_objects           TYPE mds_ctrls_error_objects,
        ls_error_obj_line          TYPE mds_ctrls_error_obj_line,
        ls_id_messages             TYPE mds_ctrls_obj_id_messages,
        lt_object_id               TYPE mdst_sync_object_id_tab.

  TRY.
      CALL METHOD super->if_mds_cmptool~extract_id
        IMPORTING
          et_object_id = lt_object_id
          et_messages  = ls_error_objects.

*     Common error messages
      IF ls_error_objects-is_error = 'X'.
        LOOP AT ls_error_objects-messages INTO ls_bapiret2 WHERE type CA 'EAX'.
          MESSAGE ID ls_bapiret2-id
                  TYPE 'E'
                  NUMBER ls_bapiret2-number
                  WITH ls_bapiret2-message_v1
                       ls_bapiret2-message_v2
                       ls_bapiret2-message_v3
                       ls_bapiret2-message_v4.
          RETURN.
        ENDLOOP.
      ENDIF.

*     Object specific error messages
      IF ls_error_objects-is_error_objects = 'X'.
        READ TABLE ls_error_objects-objects INTO ls_error_obj_line INDEX 1.
        READ TABLE ls_error_obj_line-id_messages INTO ls_id_messages INDEX 1.
        LOOP AT ls_error_objects-messages INTO ls_bapiret2 WHERE type CA 'EAX'.
          MESSAGE ID ls_bapiret2-id
                  TYPE 'E'
                  NUMBER ls_bapiret2-number
                  WITH ls_bapiret2-message_v1
                       ls_bapiret2-message_v2
                       ls_bapiret2-message_v3
                       ls_bapiret2-message_v4.
          RETURN.
        ENDLOOP.
      ENDIF.

    CATCH cx_sy_dyn_call_illegal_method.
*      MESSAGE x002 WITH 'extract_id' is_control-source-compare_class.
    CATCH cx_sy_dyn_call_illegal_class.
*      MESSAGE x005 WITH is_control-source-compare_class.
    CATCH cx_mds_extractor.
*      MESSAGE x006 WITH 'CX_MDS_EXTRACTOR' 'extract_id' is_control-source-compare_class.
  ENDTRY.

  lt_lifnr = lt_object_id.

* Exclution of vendors who are part of a retail site
  CALL METHOD vmd_ei_api_check=>check_vend_part_of_retail_site
    EXPORTING
      it_keys         = lt_lifnr
    IMPORTING
      et_part_of_site = lt_part_of_site.

  IF NOT lt_part_of_site[] IS INITIAL.
    SORT lt_lifnr BY lifnr.
    LOOP AT lt_part_of_site INTO ls_vmds_vendor_number.
      READ TABLE lt_lifnr
                WITH KEY lifnr = ls_vmds_vendor_number-lifnr
           BINARY SEARCH
           TRANSPORTING NO FIELDS.
      IF sy-subrc = 0.
        DELETE lt_lifnr INDEX sy-tabix.
      ENDIF.
    ENDLOOP.
  ENDIF.

  et_object_id = lt_lifnr.
  et_messages = ls_error_objects.
ENDMETHOD.


method IF_MDS_CMPTOOL~FINALIZE.

* call super finalize method:
  CALL METHOD super->finalize( ).

* Release the memory for the instance
  FREE:
    gr_instance.

endmethod.


method IF_MDS_CMPTOOL~GET_LINK_IDS.

TYPES: begin of lty_ids,
         partner_guid type bu_partner_guid,
         source_id    type char10,
         target_id    type char10,
       end of lty_ids.

DATA:
  lt_ids1          TYPE MDST_SYNC_OBJECT_ID_TAB,
  lt_ids4          TYPE MDS_cmpt_link_IDs_T,
  lv_partner       TYPE bu_partner,
  lv_partner_guid  TYPE bu_partner_guid,
  ls_query_ids     TYPE lty_ids,
  lt_query_ids     TYPE TABLE OF lty_ids,
  ls_ids4_guid     TYPE lty_ids,
  lt_ids4_guid     TYPE TABLE OF lty_ids,
  ls_ids4_target   TYPE lty_ids,
  lt_ids4_target   TYPE TABLE OF lty_ids,
  ls_message       TYPE bapiret2,
  ls_ids4          TYPE MDS_CMPT_LINK_IDS.

FIELD-SYMBOLS:
  <ls_ids>         TYPE MDST_SYNC_OBJECT_ID.

CONSTANTS business_partner(2) TYPE C VALUE 'BP'.

  IF gv_source_object <> iv_source_object OR gv_target_object <> iv_target_object.
    CALL METHOD fsbp_generic_services=>new_message
      EXPORTING
        i_class_id = 'CVI_TOOLS_SUPPORT'
        i_type     = fsbp_generic_services=>msg_error
        i_number   = '127'
      RECEIVING
        r_message  = ls_message.

    et_messages-is_error = 'X'.
    APPEND ls_message TO et_messages-messages.
    RETURN.
  ENDIF.

* Initialization
  LOOP AT it_object_ids ASSIGNING <ls_ids>.
    ls_query_ids-source_id = <ls_ids>.
    APPEND ls_query_ids TO lt_query_ids.
  ENDLOOP.

  CASE iv_target_object.
    WHEN business_partner.
      SELECT partner_guid vendor FROM cvi_vend_link
                      INTO TABLE lt_ids4_guid
                      FOR ALL ENTRIES IN lt_query_ids
                      WHERE vendor = lt_query_ids-source_id.

      IF NOT lt_ids4_guid IS INITIAL.
       SORT lt_ids4_guid by source_id.
       SELECT partner_guid partner INTO TABLE lt_ids4_target FROM but000
                        FOR ALL ENTRIES IN lt_ids4_guid
                        WHERE partner_guid = lt_ids4_guid-partner_guid.

       LOOP AT lt_ids4_guid INTO ls_ids4_guid.
         READ TABLE lt_ids4_target INTO ls_ids4_target
                                   WITH KEY partner_guid = ls_ids4_guid-partner_guid.
         ls_ids4-target_id = ls_ids4_target-source_id.
         ls_ids4-source_id = ls_ids4_guid-source_id.
         APPEND ls_ids4 TO lt_ids4.
         CLEAR ls_ids4.
       ENDLOOP.
      ENDIF.

     WHEN OTHERS.
*    do nothing.
  ENDCASE.
et_link_ids[] = lt_ids4[].
endmethod.


method IF_MDS_CMPTOOL~GET_VALID_SYNC_IDS.

DATA : lv_ktokk                TYPE ktokk,
       ls_message              TYPE bapiret2,
       ls_object_id            TYPE mdst_sync_object_id,
       lt_accountgroups        TYPE TABLE OF lfa1-ktokk,
       lt_valid_accountgroups  TYPE TABLE OF lfa1-ktokk.

*Step 1: Get all valid account groups from account group <-> grouping mapping
  SELECT account_group FROM cvic_vend_to_bp1 INTO TABLE lt_accountgroups.
  IF sy-subrc <> 0.
    CALL METHOD fsbp_generic_services=>new_message
      EXPORTING
        i_class_id = 'CVI_TOOLS_SUPPORT'
        i_type     = fsbp_generic_services=>msg_error
        i_number   = '141'
      RECEIVING
        r_message  = ls_message.
    et_messages-is_error = 'X'.
    APPEND ls_message TO et_messages-messages.
    RETURN.
  ENDIF.

 lt_valid_accountgroups = lt_accountgroups.
 REFRESH lt_accountgroups.
*Step 2: Get all valid account groups from account group <-> role mapping
  SELECT account_group FROM cvic_vend_to_bp2 INTO TABLE lt_accountgroups.
  IF sy-subrc <> 0.
    CALL METHOD fsbp_generic_services=>new_message
      EXPORTING
        i_class_id = 'CVI_TOOLS_SUPPORT'
        i_type     = fsbp_generic_services=>msg_error
        i_number   = '142'
      RECEIVING
        r_message  = ls_message.
    et_messages-is_error = 'X'.
    APPEND ls_message TO et_messages-messages.
    RETURN.
  ENDIF.

 APPEND LINES OF lt_accountgroups TO lt_valid_accountgroups.
 SORT lt_valid_accountgroups.
 DELETE ADJACENT DUPLICATES FROM lt_valid_accountgroups.

*Step 3: For the ids, check if they are valid for synchronization
  LOOP AT it_object_ids INTO ls_object_id.
    clear lv_ktokk.
*   get the object's account group and check if its valid for sync
    SELECT SINGLE ktokk FROM lfa1 INTO lv_ktokk WHERE lifnr = ls_object_id.
    READ TABLE lt_valid_accountgroups FROM lv_ktokk
                                      TRANSPORTING NO FIELDS.
    IF sy-subrc  = 0.
       APPEND ls_object_id TO et_valid_sync_ids.
    ENDIF.
   ENDLOOP.

*    .
endmethod.


method MAP_TARGET_TO_SOURCE.
DATA:
    lr_ref_mapper    TYPE REF TO cvi_mapper,
    lv_msgtext(72)   TYPE c,                                "#EC NEEDED
    ls_bus_ei_main   TYPE bus_ei_main,
    ls_vendors       tyPE vmds_ei_main,
    ls_mapped_data   TYPE REF TO data,
    ls_error         TYPE mds_ctrls_error,
    ls_message       TYPE bapiret2,
    lt_messages      TYPE mds_ctrls_error_objects.

  FIELD-SYMBOLS: <ls_vend> TYPE ANY.

* Get instance for mapper class
  lr_ref_mapper = cvi_mapper=>get_instance( ).

  CASE gv_target_object.
    WHEN 'BP'.
* Type casting for data container
      ls_bus_ei_main = is_target_data.

* Map business partners to vendors -> target to Source
      CALL METHOD lr_ref_mapper->map_bps_to_vendors
        EXPORTING
          i_partners  = ls_bus_ei_main
        IMPORTING
          e_vendors = ls_vendors-vendors
          e_errors    = ls_error.

    WHEN OTHERS.
* Do nothing
      endcase.

* Common error messages
  IF ls_error-is_error = gc_true.
    et_messages-is_error = gc_true.
  ENDIF.

  LOOP AT ls_error-messages INTO ls_message.
    APPEND ls_message TO et_messages-messages.
  ENDLOOP.
*     Mapped target structure
      CREATE DATA ls_mapped_data TYPE vmds_ei_main.
      ASSIGN ls_mapped_data->* TO <ls_vend>.
      <ls_vend> = ls_vendors.
      es_mapped_target_data = ls_mapped_data.


endmethod.
ENDCLASS.
