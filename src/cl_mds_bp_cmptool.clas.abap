class CL_MDS_BP_CMPTOOL definition
  public
  inheriting from CL_MDS_CMPTOOL_ABSTRACT
  final
  create protected .

public section.
*"* public components of class CL_MDS_BP_CMPTOOL
*"* do not include other source files here!!!

  interfaces IF_MDS_CMPTOOL_INST .

  methods CONSTRUCTOR .

  methods COMPARE_SOURCE_TARGET
    redefinition .
  methods EXTRACT_DATA
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
*"* protected components of class CL_MDS_BP_CMPTOOL
*"* do not include other source files here!!!

  constants GC_PRIMARY_KEY type FIELDNAME value 'PARTNER'. "#EC NOTEXT
  constants GC_SOURCE_OBJECT type MDS_CMPT_CTRL_OBJ_SOURCE value 'BP'. "#EC NOTEXT
  class-data GR_INSTANCE type ref to CL_MDS_BP_CMPTOOL .

  methods SELECT_OBJECT_DATA
    redefinition .
private section.
*"* private components of class CL_MDS_BP_CMPTOOL
*"* do not include other source files here!!!

  constants GC_TRUE type BOOLEAN value 'X'. "#EC NOTEXT
  constants GC_FALSE type BOOLEAN value ' '. "#EC NEEDED
  constants CUSTOMER type CHAR8 value 'CUSTOMER'. "#EC NOTEXT
  constants VENDOR type CHAR6 value 'VENDOR'. "#EC NOTEXT
ENDCLASS.



CLASS CL_MDS_BP_CMPTOOL IMPLEMENTATION.


METHOD compare_source_target.
  DATA : ls_source_data   TYPE REF TO data,
         ls_target_data   TYPE REF TO data,
         ls_mapped_target TYPE REF TO data,
         ls_source        TYPE bus_ei_main,
         ls_target        TYPE bus_ei_main,
         lr_instance      TYPE REF TO cl_mds_cmpt_compare.

  FIELD-SYMBOLS : <ls_source_data>   TYPE ANY,
                  <ls_target_data>   TYPE ANY,
                  <ls_mapped_target> TYPE ANY.

* Prepare data

  CREATE DATA ls_source_data TYPE bus_ei_main.
  ASSIGN ls_source_data->* TO <ls_source_data>.
  <ls_source_data> = is_source_data.
  ls_source = <ls_source_data>.

  CREATE DATA ls_mapped_target TYPE bus_ei_main.
  ASSIGN ls_mapped_target->* TO <ls_mapped_target>.
  <ls_mapped_target> = is_mapped_target_data.
  ls_target = <ls_mapped_target>.

  CASE gv_target_object.
    WHEN customer.
      CREATE DATA ls_target_data TYPE cmds_ei_main.
      ASSIGN ls_target_data->* TO <ls_target_data>.
      <ls_target_data> = is_target_data.

    WHEN vendor.
      CREATE DATA ls_target_data TYPE vmds_ei_main.
      ASSIGN ls_target_data->* TO <ls_target_data>.
      <ls_target_data> = is_target_data.
  ENDCASE.

* Execute respective comparision
  CALL METHOD cl_mds_cmpt_compare=>get_instance
    RECEIVING
      rr_instance = lr_instance.

  CALL METHOD lr_instance->compare_bp_as_source
    EXPORTING
      is_source_st         = ls_source
      is_target_st         = ls_target
      is_target_org        = <ls_target_data>
      it_datasets          = gt_dataset_entries
    IMPORTING
      et_messages          = et_messages
    CHANGING
      ct_display_structure = ct_output.

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
  DATA : ls_source_data   TYPE REF TO data,
         ls_target_data   TYPE REF TO data,
         ls_bus_ei_main   TYPE bus_ei_main,
         ls_cmds_ei_main  TYPE cmds_ei_main,
         ls_vmds_ei_main  TYPE vmds_ei_main,
         lt_id_list       TYPE mds_cmpt_source_target_t,
         ls_id_list       LIKE LINE OF lt_id_list,
         lt_bp_ids        TYPE mds_cmpt_object_t,
         lt_ecc_ids       TYPE mds_cmpt_object_t,
         ls_extract_id    LIKE LINE OF lt_bp_ids,
         lt_messages      TYPE mds_ctrls_error_objects,
         ls_message       TYPE bapiret2.

  FIELD-SYMBOLS:
         <f_bus_ei_main>  TYPE ANY,
         <f_cmds_ei_main> TYPE ANY,
         <f_vmds_ei_main> TYPE ANY.

*step 1: prepare id list to be extracted
  CALL METHOD cl_mds_cmptool_extract=>prepare_id_list
    EXPORTING
      it_display_structure = it_output
    IMPORTING
      et_id_list           = lt_id_list
      et_messages          = lt_messages.

* Common error messages
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

  IF lt_id_list IS INITIAL.
    RETURN.
  ENDIF.

*step 2: Extract BP data
  CREATE DATA ls_source_data TYPE bus_ei_main.
  ASSIGN ls_source_data->* TO <f_bus_ei_main>.

  LOOP AT lt_id_list INTO ls_id_list.
    ls_extract_id = ls_id_list-source_object.
    APPEND ls_extract_id TO lt_bp_ids.
    CLEAR ls_extract_id.
    ls_extract_id = ls_id_list-target_object.
    APPEND ls_extract_id TO lt_ecc_ids.
    CLEAR ls_extract_id.
  ENDLOOP.

  CLEAR lt_messages.
  CALL METHOD cl_mds_cmptool_extract=>extract_bp_data
    EXPORTING
      is_control  = is_control
      it_id_list  = lt_bp_ids
    IMPORTING
      et_data     = ls_bus_ei_main
      et_messages = lt_messages.

* Common error messages
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

  <f_bus_ei_main> = ls_bus_ei_main.
  es_source_data  = ls_source_data.

* Step 3: Extract Customer/Vendor data
  CASE gv_target_object.
    WHEN customer.
      CREATE DATA ls_target_data TYPE cmds_ei_main.
      ASSIGN ls_target_data->* TO <f_cmds_ei_main>.

      CLEAR lt_messages.
      CALL METHOD cl_mds_cmptool_extract=>extract_cust_data
        EXPORTING
          is_control  = is_control
          it_id_list  = lt_ecc_ids
        IMPORTING
          et_data     = ls_cmds_ei_main
          et_messages = lt_messages.

      <f_cmds_ei_main> = ls_cmds_ei_main.
      es_target_data = ls_target_data.

    WHEN vendor.
      CREATE DATA ls_target_data TYPE vmds_ei_main.
      ASSIGN ls_target_data->* TO <f_vmds_ei_main>.

      CLEAR lt_messages.
      CALL METHOD cl_mds_cmptool_extract=>extract_vend_data
        EXPORTING
          is_control  = is_control
          it_id_list  = lt_ecc_ids
        IMPORTING
          et_data     = ls_vmds_ei_main
          et_messages = lt_messages.

      <f_vmds_ei_main> = ls_vmds_ei_main.
      es_target_data = ls_target_data.
  ENDCASE.

* Common error messages for the target object
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

ENDMETHOD.


method IF_MDS_CMPTOOL_INST~GET_INSTANCE.

IF gr_instance IS INITIAL.
   CREATE OBJECT gr_instance.
ENDIF.
rr_instance = gr_instance.

endmethod.


method IF_MDS_CMPTOOL~FINALIZE.

* call super finalize method:
  CALL METHOD super->finalize( ).

* Release the memory for the instance
  FREE:
    gr_instance.

endmethod.


METHOD if_mds_cmptool~get_link_ids.

TYPES: begin of lty_ids,
         partner_guid type bu_partner_guid,
         source_id    type char10,
         target_id    type char10,
       end of lty_ids.

DATA:
  lv_partner       TYPE bu_partner,
  lv_partner_guid  TYPE bu_partner_guid,
  ls_ids4          TYPE mds_cmpt_link_ids,
  ls_message       TYPE bapiret2,
  ls_query_ids     TYPE lty_ids,
  ls_ids4_guid     TYPE lty_ids,
  lt_ids1          TYPE mdst_sync_object_id_tab,
  lt_ids4          TYPE mds_cmpt_link_ids_t,
  lt_query_ids     TYPE TABLE OF lty_ids,
  lt_ids4_guid     TYPE TABLE OF lty_ids,
  ls_ids4_target   TYPE lty_ids,
  lt_ids4_target   TYPE TABLE OF lty_ids.


FIELD-SYMBOLS:
  <ls_ids>         TYPE MDST_SYNC_OBJECT_ID.


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
  lt_ids1  = it_object_ids.

* Convert all the partner ids in IDS1 to the partner guid format.
  LOOP AT lt_ids1 ASSIGNING <ls_ids>.
    clear: lv_partner,
           lv_partner_guid.
    lv_partner = <ls_ids>.
    CALL FUNCTION 'BUPA_NUMBERS_GET'
      EXPORTING
        iv_partner = lv_partner
      IMPORTING
        ev_partner_guid  = lv_partner_guid.

    IF lv_partner_guid IS NOT INITIAL.
       ls_query_ids-partner_guid = lv_partner_guid.
       APPEND ls_query_ids TO lt_query_ids.
    ENDIF.
  ENDLOOP.

  CASE iv_target_object.
    WHEN customer.
      SELECT partner_guid customer FROM cvi_cust_link
                      INTO TABLE lt_ids4_guid
                      FOR ALL ENTRIES IN lt_query_ids
                      WHERE partner_guid = lt_query_ids-partner_guid.

     IF NOT lt_ids4_guid IS INITIAL.
       SORT lt_ids4_guid by source_id.
       SELECT partner_guid partner INTO TABLE lt_ids4_target FROM but000
                          FOR ALL ENTRIES IN lt_ids4_guid
                          WHERE partner_guid = lt_ids4_guid-partner_guid.

       LOOP AT lt_ids4_guid INTO ls_ids4_guid.
         READ TABLE lt_ids4_target INTO ls_ids4_target
                                   WITH KEY partner_guid = ls_ids4_guid-partner_guid.
         ls_ids4-source_id = ls_ids4_target-source_id.
         ls_ids4-target_id = ls_ids4_guid-source_id.
         APPEND ls_ids4 TO lt_ids4.
         CLEAR ls_ids4.
       ENDLOOP.
      ENDIF.

    WHEN vendor.
      SELECT partner_guid vendor FROM cvi_vend_link
                      INTO TABLE lt_ids4_guid
                      FOR ALL ENTRIES IN lt_query_ids
                      WHERE partner_guid = lt_query_ids-partner_guid.

      IF NOT lt_ids4_guid IS INITIAL.
        SORT lt_ids4_guid by source_id.
        SELECT partner_guid partner INTO TABLE lt_ids4_target FROM but000
                          FOR ALL ENTRIES IN lt_ids4_guid
                          WHERE partner_guid = lt_ids4_guid-partner_guid.

       LOOP AT lt_ids4_guid INTO ls_ids4_guid.
         READ TABLE lt_ids4_target INTO ls_ids4_target
                                   WITH KEY partner_guid = ls_ids4_guid-partner_guid.
         ls_ids4-source_id = ls_ids4_target-source_id.
         ls_ids4-target_id = ls_ids4_guid-source_id.
         APPEND ls_ids4 TO lt_ids4.
         CLEAR ls_ids4.
       ENDLOOP.
      ENDIF.
     WHEN OTHERS.
*    do nothing.
  ENDCASE.

et_link_ids[] = lt_ids4[].

ENDMETHOD.


METHOD if_mds_cmptool~get_valid_sync_ids.

  TYPES : BEGIN OF lty_bp_grouping,
          partner  TYPE bu_partner,
          grouping TYPE bu_group.
  TYPES : END OF lty_bp_grouping.

  TYPES : BEGIN OF lty_bp_role,
          partner TYPE bu_partner,
          role    TYPE bu_partnerrole.
  TYPES : END OF lty_bp_role.

  TYPES : BEGIN OF lty_object_id,
          partner TYPE bu_partner.
  TYPES : END OF lty_object_id.

  DATA : lt_valid_grouping           TYPE TABLE OF but000-bu_group,
         lt_valid_role_categories    TYPE TABLE OF tb003-rolecategory,
         lt_bp_roles                 TYPE TABLE OF lty_bp_role,
         ls_bp_role                  LIKE LINE OF lt_bp_roles,
         lt_roles                    TYPE TABLE OF but100-rltyp,
         ls_role                     LIKE LINE OF lt_roles,
         lt_bp_role_categories       TYPE TABLE OF tb003-rolecategory,
         ls_bp_role_category         LIKE LINE OF lt_bp_role_categories,
         lt_role_categories          TYPE TABLE OF tb003,
         ls_role_category            LIKE LINE OF lt_role_categories,
         lt_bp_groupings             TYPE TABLE OF lty_bp_grouping,
         ls_bp_grouping              LIKE LINE OF lt_bp_groupings,
         lv_object_id                TYPE mdst_sync_object_id,
         lt_object_ids               TYPE TABLE OF lty_object_id,
         ls_message                  TYPE bapiret2.

  lt_object_ids = it_object_ids.

  CASE gv_target_object.
    WHEN customer.
*     Get all valid grouping
      SELECT bu_group FROM tbd001 INTO TABLE lt_valid_grouping.

      IF lt_valid_grouping IS INITIAL.

        CALL METHOD fsbp_generic_services=>new_message
          EXPORTING
            i_class_id = 'CVI_TOOLS_SUPPORT'
            i_type     = fsbp_generic_services=>msg_error
            i_number   = '126'
          RECEIVING
            r_message  = ls_message.

        et_messages-is_error = 'X'.

        APPEND ls_message TO et_messages-messages.

      ENDIF.

*     Get all valid role categories
      SELECT rltyp FROM tbd002 INTO TABLE lt_valid_role_categories.

      IF lt_valid_role_categories IS INITIAL.
        CALL METHOD fsbp_generic_services=>new_message
          EXPORTING
            i_class_id = 'CVI_TOOLS_SUPPORT'
            i_type     = fsbp_generic_services=>msg_error
            i_number   = '125'
          RECEIVING
            r_message  = ls_message.

        et_messages-is_error = 'X'.

        APPEND ls_message TO et_messages-messages.

      ENDIF.

    WHEN vendor.
*     Get all valid grouping
      SELECT bu_group FROM tbc001 INTO TABLE lt_valid_grouping.

      IF lt_valid_grouping IS INITIAL.

        CALL METHOD fsbp_generic_services=>new_message
          EXPORTING
            i_class_id = 'CVI_TOOLS_SUPPORT'
            i_type     = fsbp_generic_services=>msg_error
            i_number   = '142'
          RECEIVING
            r_message  = ls_message.

        et_messages-is_error = 'X'.

        APPEND ls_message TO et_messages-messages.

      ENDIF.

*     Get all valid role categories
      SELECT rltyp FROM tbc002 INTO TABLE lt_valid_role_categories.

      IF lt_valid_role_categories IS INITIAL.
        CALL METHOD fsbp_generic_services=>new_message
          EXPORTING
            i_class_id = 'CVI_TOOLS_SUPPORT'
            i_type     = fsbp_generic_services=>msg_error
            i_number   = '141'
          RECEIVING
            r_message  = ls_message.

        et_messages-is_error = 'X'.

        APPEND ls_message TO et_messages-messages.

      ENDIF.

    WHEN OTHERS.
* do nothing
  ENDCASE.

  IF et_messages-is_error = 'X'.
    RETURN.
  ENDIF.

* Initializations
  IF lt_object_ids IS NOT INITIAL.

    SELECT partner bu_group FROM but000 INTO TABLE lt_bp_groupings
       FOR ALL ENTRIES IN lt_object_ids WHERE partner = lt_object_ids-partner.

    SELECT partner rltyp FROM but100 INTO TABLE lt_bp_roles
       FOR ALL ENTRIES IN lt_object_ids WHERE partner = lt_object_ids-partner.

  ENDIF.

  SELECT * FROM tb003 INTO TABLE lt_role_categories.

  LOOP AT it_object_ids INTO lv_object_id.
*   select bp grouping
    CLEAR ls_bp_grouping.
    READ TABLE lt_bp_groupings INTO ls_bp_grouping with key partner = lv_object_id.

*   select bp role categories from roles
    REFRESH lt_roles.
    LOOP AT lt_bp_roles INTO ls_bp_role WHERE partner = lv_object_id.
      APPEND ls_bp_role-role TO lt_roles.
    ENDLOOP.

    REFRESH lt_bp_role_categories.
    LOOP AT lt_roles INTO ls_role.
      READ TABLE lt_role_categories INTO ls_role_category with key role = ls_role.
      APPEND ls_role_category-rolecategory TO lt_bp_role_categories.
      CLEAR ls_role_category.
    ENDLOOP.

    SORT lt_bp_role_categories.
    DELETE ADJACENT DUPLICATES FROM lt_bp_role_categories.

    READ TABLE lt_valid_grouping FROM ls_bp_grouping-grouping TRANSPORTING no fields.
    IF sy-subrc = 0.
      LOOP AT lt_bp_role_categories INTO ls_bp_role_category.
        READ TABLE lt_valid_role_categories FROM ls_bp_role_category TRANSPORTING no fields.
        IF sy-subrc = 0.
          APPEND lv_object_id TO et_valid_sync_ids.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDLOOP.
  SORT et_valid_sync_ids.
  DELETE ADJACENT DUPLICATES FROM et_valid_sync_ids.
ENDMETHOD.


method MAP_TARGET_TO_SOURCE.

DATA: lr_ref_mapper     TYPE REF TO cvi_mapper,
      ls_mapped_data    TYPE REF TO data,
      ls_bps            TYPE bus_ei_main,
      ls_bps_in         TYPE bus_ei_main,
      ls_customers      TYPE cmds_ei_main,
      ls_vendors        TYPE vmds_ei_main,
      ls_partners       TYPE bus_ei_extern,
      ls_partners_in    TYPE bus_ei_extern,
      ls_relations      TYPE burs_ei_extern,
      ls_relations_in   TYPE burs_ei_extern.

DATA: ls_error          TYPE mds_ctrls_error,
      ls_message        TYPE bapiret2.

CONSTANTS:
      current_state     TYPE C VALUE 'C'.

FIELD-SYMBOLS:
      <f_bps>           TYPE ANY.

* Get instance for mapper class
  lr_ref_mapper = cvi_mapper=>get_instance( ).

* Get the source data
  ls_bps_in = is_source_data.

  CASE gv_target_object.
    WHEN customer.
*   Get the target data that needs to be mapped
    ls_customers = is_target_data.

*   Map customers to business partners -> target to Source
    CALL METHOD lr_ref_mapper->map_customers_to_bps
      EXPORTING
        i_customers = ls_customers-customers
      IMPORTING
        e_partners = ls_bps
        e_errors   = ls_error.

    WHEN vendor.
*   Get the target data that needs to be mapped
    ls_vendors = is_target_data.

*   Map vendors to business partners -> target to Source
    CALL METHOD lr_ref_mapper->map_vendors_to_bps
      EXPORTING
        i_vendors  = ls_vendors-vendors
      IMPORTING
        e_partners = ls_bps
        e_errors   = ls_error.

    WHEN OTHERS.
*   do nothing
  ENDCASE.

* Common error messages
  IF ls_error-is_error = gc_true.
    et_messages-is_error = gc_true.
  ENDIF.

  LOOP AT ls_error-messages INTO ls_message.
    APPEND ls_message TO et_messages-messages.
  ENDLOOP.

  IF ls_bps <> ls_bps_in.
*    Check the partner structure
     LOOP AT ls_bps-partners INTO ls_partners.
       LOOP AT ls_bps_in-partners INTO ls_partners_in.
        IF ls_partners-header-object_instance-bpartnerguid = ls_partners_in-header-object_instance-bpartnerguid.
           move-corresponding ls_partners_in-header TO ls_partners-header.
           ls_partners-header-object_task = current_state.
           MODIFY ls_bps-partners FROM ls_partners.
           EXIT.
        ENDIF.
       ENDLOOP.
     ENDLOOP.

*    Check the relations structure
     LOOP AT ls_bps-relations INTO ls_relations.
       LOOP AT ls_bps_in-relations INTO ls_relations_in.
        IF ls_relations-header-object_instance-partner1-bpartnerguid = ls_relations_in-header-object_instance-partner1-bpartnerguid AND
           ls_relations-header-object_instance-partner2-bpartnerguid = ls_relations_in-header-object_instance-partner2-bpartnerguid AND
           ls_relations-header-object_instance-relat_category = ls_relations_in-header-object_instance-relat_category.

            move-corresponding ls_relations_in-header TO ls_relations-header.
            ls_relations-header-object_task = current_state.
            MODIFY ls_bps-relations FROM ls_relations.
            EXIT.
        ENDIF.
       ENDLOOP.
     ENDLOOP.
  ENDIF.

* Return the Mapped Target data
  CREATE DATA ls_mapped_data TYPE bus_ei_main.
  ASSIGN ls_mapped_data->* TO <f_bps>.
  <f_bps> = ls_bps.
  es_mapped_target_data = ls_mapped_data.

endmethod.


method SELECT_OBJECT_DATA.

* Transfer ID selection to container to use it further

  DATA : ls_container TYPE mdst_sync_data_container,
         lt_container TYPE mdst_sync_data_container_tab.

  FIELD-SYMBOLS:
    <lt_guid>         TYPE ANY TABLE.


  TRY.
      CREATE DATA ls_container-data TYPE mdst_sync_object_id_tab.
      ASSIGN ls_container-data->* TO <lt_guid>.
      IF sy-subrc = 0.
        <lt_guid> = it_object_id.
      ENDIF.
      APPEND ls_container TO lt_container.
      ct_container = lt_container.
    CATCH cx_sy_create_data_error.   "#EC NO_HANDLER
  ENDTRY.
endmethod.
ENDCLASS.
