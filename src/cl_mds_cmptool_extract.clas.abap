class CL_MDS_CMPTOOL_EXTRACT definition
  public
  final
  create public .

public section.
*"* public components of class CL_MDS_CMPTOOL_EXTRACT
*"* do not include other source files here!!!

  class-methods PREPARE_ID_LIST
    importing
      !IT_DISPLAY_STRUCTURE type MDS_CMPT_DISPLAY_STRUCTURE_T
    exporting
      !ET_ID_LIST type MDS_CMPT_SOURCE_TARGET_T
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS .
  class-methods EXTRACT_BP_DATA
    importing
      !IS_CONTROL type MDS_CMPT_SYNC_PARAMETER
      !IT_ID_LIST type MDS_CMPT_OBJECT_T
    exporting
      !ET_DATA type BUS_EI_MAIN
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS .
  class-methods EXTRACT_CUST_DATA
    importing
      !IS_CONTROL type MDS_CMPT_SYNC_PARAMETER
      !IT_ID_LIST type MDS_CMPT_OBJECT_T
    exporting
      !ET_DATA type CMDS_EI_MAIN
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS .
  class-methods EXTRACT_VEND_DATA
    importing
      !IS_CONTROL type MDS_CMPT_SYNC_PARAMETER
      !IT_ID_LIST type MDS_CMPT_OBJECT_T
    exporting
      !ET_DATA type VMDS_EI_MAIN
      !ET_MESSAGES type MDS_CTRLS_ERROR_OBJECTS .
protected section.
*"* protected components of class CL_MDS_CMPTOOL_EXTRACT
*"* do not include other source files here!!!
private section.
*"* private components of class CL_MDS_CMPTOOL_EXTRACT
*"* do not include other source files here!!!

  constants BP type CHAR2 value 'BP'. "#EC NOTEXT
  constants CUSTOMER type CHAR8 value 'CUSTOMER'. "#EC NOTEXT
  constants VENDOR type CHAR6 value 'VENDOR'. "#EC NOTEXT
  constants GC_TRUE type BOOLEAN value 'X'. "#EC NOTEXT
  constants GC_FALSE type BOOLEAN value ' '. "#EC NOTEXT
  constants GC_ADDRESS_DSET type CHAR7 value 'DSET_01'. "#EC NOTEXT
  constants GC_BANK_DSET type CHAR7 value 'DSET_02'. "#EC NOTEXT
  constants GC_CCARD_DSET type CHAR7 value 'DSET_03'. "#EC NOTEXT
  constants GC_INDUSTRY_DSET type CHAR7 value 'DSET_04'. "#EC NOTEXT
  constants GC_RELATIONSHIP_DSET type CHAR7 value 'DSET_05'. "#EC NOTEXT
  constants GC_TAX_DSET type CHAR7 value 'DSET_06'. "#EC NOTEXT
  constants GC_TPARTNER_DSET type CHAR7 value 'DSET_07'. "#EC NOTEXT

  class-methods PREPARE_SCOPE
    importing
      !IS_CONTROL type MDS_CMPT_SYNC_PARAMETER
      !IV_SCOPE_OBJECT type MDS_CMPT_OBJECT
    exporting
      !ET_SCOPE type BUS_EI_FRAGMENT_T .
  class-methods MAP_COMMUNICATION_DATA
    importing
      !IS_ADDR_COMPLETE type ANY
      !ID_ADDR_TYPE type N
    changing
      !CS_ADDRESS_DATA type CVIS_EI_EXTRACT_ADDRESS_DATA .
  methods READ_AND_MAP_VEND_ADDR_DATA
    changing
      !CS_DATA type VMDS_EI_EXTRACT .
  methods READ_AND_MAP_CUST_ADDR_DATA
    changing
      !CS_DATA type CMDS_EI_EXTRACT .
  class-methods READ_ADDRESSES
    importing
      !IS_KNA1 type KNA1
      !IS_KNVK type KNVK optional
    exporting
      !ES_ADDRESS type GSY_KNA1_ADDR1
      !ES_CONTACT_ADDRESS type GSY_KNVK_ADDR .
ENDCLASS.



CLASS CL_MDS_CMPTOOL_EXTRACT IMPLEMENTATION.


METHOD extract_bp_data.

  TYPES: BEGIN OF ty_rel,
          dftval   TYPE bu_dftval ,
          partner1 TYPE bu_partner,
          partner2 TYPE bu_partner,
          date_to  TYPE bu_datto ,
          reltyp   TYPE bu_reltyp ,
         END OF ty_rel.

  DATA: lt_bp_ids         TYPE bus_ei_instance_t,
        ls_bp_id          TYPE bus_ei_instance,
        lt_rels           TYPE TABLE OF ty_rel,
        ls_rel            TYPE ty_rel,
        lt_idlist_rel     TYPE TABLE OF bus_bupr_instance,
        ls_idlist_rel     TYPE bus_bupr_instance,
        ls_id_list        TYPE mds_cmpt_source_target,
        ls_bp             TYPE bus_ei_main,
        lt_scope          TYPE bus_ei_fragment_t,
        lt_messages       TYPE mds_ctrls_error_objects,
        ls_message        TYPE bapiret2,
        ls_dataset        TYPE mds_cmpt_sync_dataset_options,
        lv_result         TYPE cvi_map_contact,
        lv_extract_rel    TYPE boolean,
        lv_scope          TYPE mds_cmpt_object.

  CONSTANTS : lc_relat_category(6) TYPE c VALUE 'BUR001'.

*initialize exporting parameters
  CLEAR : et_data , et_messages.

* Processing not required if id list is empty
  IF it_id_list IS INITIAL.
    RETURN.
  ENDIF.

*step 1: prepare the scope of extraction
  lv_scope = bp.
  CALL METHOD cl_mds_cmptool_extract=>prepare_scope
    EXPORTING
      is_control      = is_control
      iv_scope_object = lv_scope
    IMPORTING
      et_scope        = lt_scope.


*step 2: prepare bp list to be extracted
  LOOP AT it_id_list INTO ls_id_list.
    ls_bp_id-bpartner = ls_id_list.
    APPEND ls_bp_id TO lt_bp_ids.
    CLEAR : ls_id_list,
            ls_bp_id.
  ENDLOOP.

*step 3: extract bp relationship data
  READ TABLE is_control-dataset_selection INTO ls_dataset
             with key datasetname = gc_relationship_dset
                             flag = gc_true.


  IF sy-subrc <> 0.
    IF is_control-dataset_selection IS INITIAL.
      lv_extract_rel = gc_true.
    ELSE.
      lv_extract_rel = gc_false.
    ENDIF.
  ELSE.
    lv_extract_rel = gc_true.
  ENDIF.

  IF lv_extract_rel = gc_true.
*check if contact person mapping is active
    SELECT SINGLE map_contact FROM cvic_map_contact INTO lv_result.

    IF lv_result = gc_true.
      SELECT dftval partner1 partner2 date_to reltyp
                  FROM but050
                  INTO TABLE lt_rels
                  FOR ALL ENTRIES IN lt_bp_ids WHERE (
                     partner1 = lt_bp_ids-bpartner OR
                     partner2 = lt_bp_ids-bpartner AND reltyp = lc_relat_category ).

      LOOP AT lt_rels INTO ls_rel.
        MOVE ls_rel-dftval TO ls_idlist_rel-difftypevalue .
        MOVE ls_rel-partner1 TO ls_idlist_rel-partner1 .
        MOVE ls_rel-partner2 TO ls_idlist_rel-partner2 .
        MOVE ls_rel-reltyp TO ls_idlist_rel-relat_category .
        MOVE ls_rel-date_to TO ls_idlist_rel-date_to .
        APPEND ls_idlist_rel TO lt_idlist_rel .
      ENDLOOP.

      IF lt_idlist_rel IS NOT INITIAL.

        SORT lt_idlist_rel BY partner1 partner2 relat_category date_to.
        DELETE ADJACENT DUPLICATES FROM lt_idlist_rel.

        CALL FUNCTION 'BUPA_OUTBOUND_GET_REL'
          IMPORTING
            et_bupa_rel_extern = ls_bp-relations
          TABLES
            it_idlist          = lt_idlist_rel
            it_fragments       = lt_scope
          EXCEPTIONS
            bprel_not_found    = 1
            OTHERS             = 2.
        IF sy-subrc <> 0 AND sy-subrc <> 1.
          CLEAR ls_message.
          CALL FUNCTION 'BALW_BAPIRETURN_GET2'
            EXPORTING
              type   = sy-msgty
              cl     = sy-msgid
              number = sy-msgno
              par1   = sy-msgv1
              par2   = sy-msgv2
              par3   = sy-msgv3
              par4   = sy-msgv4
            IMPORTING
              return = ls_message.

          et_messages-is_error = gc_true.
          APPEND ls_message TO et_messages-messages.
        ENDIF.
        APPEND LINES OF ls_bp-relations TO et_data-relations.
      ENDIF.
    ELSE.
      CLEAR ls_message.
      CALL METHOD fsbp_generic_services=>new_message
        EXPORTING
          i_class_id = 'CVI_TOOLS_SUPPORT'
          i_type     = fsbp_generic_services=>msg_error
          i_number   = '128'
        RECEIVING
          r_message  = ls_message.

      et_messages-is_error = gc_true.

      APPEND ls_message TO et_messages-messages.

    ENDIF.
  ENDIF.

  LOOP AT lt_rels INTO ls_rel.
    ls_bp_id-bpartner = ls_rel-partner1.
    APPEND ls_bp_id TO lt_bp_ids.
    ls_bp_id-bpartner = ls_rel-partner2.
    APPEND ls_bp_id TO lt_bp_ids.
  ENDLOOP.

  SORT lt_bp_ids BY bpartner.
  DELETE ADJACENT DUPLICATES FROM lt_bp_ids.

*step 4: extract bp partners data
  CALL FUNCTION 'BUPA_OUTBOUND_GET_MAIN'
    IMPORTING
      et_bupa_extern = ls_bp-partners
    TABLES
      it_idlist      = lt_bp_ids
      it_fragments   = lt_scope
    EXCEPTIONS
      bp_not_found   = 1
      OTHERS         = 2.
  IF sy-subrc <> 0.
    CLEAR ls_message.
    CALL FUNCTION 'BALW_BAPIRETURN_GET2'
      EXPORTING
        type   = sy-msgty
        cl     = sy-msgid
        number = sy-msgno
        par1   = sy-msgv1
        par2   = sy-msgv2
        par3   = sy-msgv3
        par4   = sy-msgv4
      IMPORTING
        return = ls_message.

    et_messages-is_error = gc_true.
    APPEND ls_message TO et_messages-messages.
  ENDIF.
  APPEND LINES OF ls_bp-partners TO et_data-partners.
ENDMETHOD.


METHOD extract_cust_data.

  DATA: lt_scope        TYPE bus_ei_fragment_t,
        lt_table_list   TYPE TABLE OF tabname_md,
        lt_message      TYPE mds_ctrls_error_objects,
        lt_kna1         TYPE TABLE OF kna1, "general data
        lt_knbk         TYPE TABLE OF knbk, "bank details
        lt_knvk         TYPE TABLE OF knvk, "Contact partner related data
        lt_knas         TYPE TABLE OF knas, "VAT reg nos.
        lt_vckuns       TYPE TABLE OF vckuns, "Credit cards
        ld_message      TYPE sy-entry,
        ls_bapiret2     TYPE bapiret2,
        ls_data         TYPE cmds_ei_extract,
        ls_data_extern  TYPE cmds_ei_extern,
        lt_data_extern  TYPE cmds_ei_main,
        ls_text         TYPE fkuntxt,
        ls_addr1        TYPE bapiaddr1,
        ls_addr2        TYPE bapiaddr2,
        ls_addr3        TYPE bapiaddr3,
        ls_vckun        TYPE vckun,
        ls_vcnum        TYPE vcnum,
        lv_dset_flag    TYPE mds_cmpt_flag,
        lcl_mapper      TYPE REF TO cvi_mapper,
        lr_instance     TYPE REF TO cl_mds_cmptool_extract,
        lv_scope        TYPE mds_cmpt_object,
        lt_messages     TYPE mds_ctrls_error_objects,
        ls_message      TYPE bapiret2,
        lv_block_size   TYPE mds_ctrl_block_size,
        lt_id_list      TYPE TABLE OF kund01,
        ls_id_list_ext  TYPE mds_cmpt_object,
        ls_id_list_int  TYPE kund01.

  FIELD-SYMBOLS:
    <ls_kna1>   TYPE kna1,
    <ls_knbk>   TYPE knbk,
    <ls_knvk>   TYPE knvk,
    <ls_knas>   TYPE knas,
    <ls_vckuns> TYPE vckuns.


* Get the Table List from the data sets selected.
  lv_scope = customer.

  CALL METHOD cl_mds_cmptool_extract=>prepare_scope
    EXPORTING
      is_control      = is_control
      iv_scope_object = lv_scope
    IMPORTING
      et_scope        = lt_scope.

  MOVE lt_scope TO lt_table_list.


* Extract customer Data.
  DESCRIBE TABLE it_id_list LINES lv_block_size.
  LOOP AT it_id_list INTO ls_id_list_ext.
    ls_id_list_int-kunnr = ls_id_list_ext.
    APPEND ls_id_list_int TO lt_id_list.
    CLEAR ls_id_list_int.
  ENDLOOP.

  SORT lt_id_list.

  CALL FUNCTION 'CUSTOMER_INIT_SELECT_DATA'
    EXPORTING
      blocksize_data       = lv_block_size
      blocksize_id         = 0
      select_tablename     = 'KNA1'
    TABLES
      in_table_list        = lt_table_list
      in_id_list           = lt_id_list
    EXCEPTIONS
      function_call_failed = 1
      table_not_supported  = 2
      OTHERS               = 3.

  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno INTO ld_message
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ls_bapiret2 = cvi_ei_api=>tool_fill_bapiret2( ).
    et_messages-is_error = gc_true.
    APPEND ls_bapiret2 TO et_messages-messages.
  ENDIF.

  CALL FUNCTION 'CUSTOMER_SELECT_NEXT_DATA'
    TABLES
      out_kna1_tab         = lt_kna1
      out_knbk_tab         = lt_knbk
      out_knvk_tab         = lt_knvk
      out_knas_tab         = lt_knas
      out_vckuns_tab       = lt_vckuns
    EXCEPTIONS
      function_missing     = 1
      function_call_failed = 2
      OTHERS               = 3.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno INTO ld_message
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ls_bapiret2 = cvi_ei_api=>tool_fill_bapiret2( ).
    et_messages-is_error = gc_true.
    APPEND ls_bapiret2 TO et_messages-messages.
  ENDIF.

  CREATE OBJECT lr_instance.

  LOOP AT lt_kna1 ASSIGNING <ls_kna1>.
    CLEAR ls_data.
    MOVE-CORRESPONDING <ls_kna1> TO ls_data-kna1.
*   Text
    CLEAR ls_text.
    ls_text-kunnr = <ls_kna1>-kunnr.
    ls_text-upd_a = 'X'.
    INSERT ls_text INTO TABLE ls_data-t_upd_txt.

    LOOP AT lt_knbk ASSIGNING <ls_knbk>
    WHERE kunnr = <ls_kna1>-kunnr.
      INSERT <ls_knbk> INTO TABLE ls_data-knbk.
    ENDLOOP.

**   Check if mapping of contact partners is active. if not delete table KNVK.
**    lcl_mapper = cvi_mapper=>get_instance( ).
*    IF ( lcl_mapper->is_mapping_for_contact_active( ) IS INITIAL ).
*      DELETE lt_knvk FROM 1.
*    ENDIF.

    LOOP AT lt_knvk ASSIGNING <ls_knvk>
    WHERE kunnr = <ls_kna1>-kunnr.
      INSERT <ls_knvk> INTO TABLE ls_data-knvk.
*     Text
      CLEAR ls_text.
      ls_text-kunnr = <ls_kna1>-kunnr.
      ls_text-parnr = <ls_knvk>-parnr.
      ls_text-upd_ap = 'X'.
      INSERT ls_text INTO TABLE ls_data-t_upd_txt.
    ENDLOOP.


    LOOP AT lt_knas ASSIGNING <ls_knas>
    WHERE kunnr = <ls_kna1>-kunnr.
      INSERT <ls_knas> INTO TABLE ls_data-knas.
    ENDLOOP.

    LOOP AT lt_vckuns ASSIGNING <ls_vckuns>
    WHERE kunnr = <ls_kna1>-kunnr.
      MOVE-CORRESPONDING <ls_vckuns> TO ls_vckun.
      MOVE-CORRESPONDING <ls_vckuns> TO ls_vcnum.
      INSERT ls_vckun INTO TABLE ls_data-vckun.
      INSERT ls_vcnum INTO TABLE ls_data-vcnum.
    ENDLOOP.

*   Read and Map customer address data.
    CALL METHOD lr_instance->read_and_map_cust_addr_data
      CHANGING
        cs_data = ls_data.


*   convert the cmds_ei_extract structure to the cmds_ei_extern structure
    CALL METHOD cmd_ei_api_map_structure=>ecc_to_extern
      EXPORTING
        is_master_data_ecc    = ls_data
      IMPORTING
        es_master_data_extern = ls_data_extern.


    IF NOT ls_data_extern IS INITIAL.
*   set header task and current_state flags
      ls_data_extern-header-object_task = 'C'.

      INSERT ls_data_extern INTO TABLE lt_data_extern-customers.
    ENDIF.
  ENDLOOP.

  et_data = lt_data_extern.
ENDMETHOD.


METHOD extract_vend_data.

  DATA: lt_scope       TYPE bus_ei_fragment_t,
        lt_message     TYPE mds_ctrls_error_objects,
        lt_table_list  TYPE TABLE OF tabname_md,
        ld_message     TYPE sy-entry,
        ls_bapiret2    TYPE bapiret2,
        lt_lfa1        TYPE TABLE OF lfa1,
        ls_lfa1        TYPE lfa1,
        lt_lfbk        TYPE TABLE OF lfbk,
        lt_lfas        TYPE TABLE OF lfas,
        ls_data        TYPE vmds_ei_extract,
        ls_data_extern TYPE vmds_ei_extern,
        lt_data_extern TYPE vmds_ei_main,
        lr_instance    TYPE REF TO cl_mds_cmptool_extract,
        lv_scope       TYPE mds_cmpt_object,
        lv_block_size  TYPE mds_ctrl_block_size,
        lt_id_list     TYPE TABLE OF lief01,
        ls_id_list_ext TYPE mds_cmpt_object,
        ls_id_list_int TYPE lief01.


  FIELD-SYMBOLS:
    <ls_lfa1>   TYPE lfa1,
    <ls_lfbk>   TYPE lfbk,
    <ls_lfas>   TYPE lfas.

  IF it_id_list IS INITIAL.
* Error Message ???
    RETURN.
  ENDIF.

  lv_scope = vendor.

* Get the Table List from the data sets selected.
  CALL METHOD cl_mds_cmptool_extract=>prepare_scope
    EXPORTING
      is_control      = is_control
      iv_scope_object = lv_scope
    IMPORTING
      et_scope        = lt_scope.

  MOVE lt_scope TO lt_table_list.

  LOOP AT it_id_list INTO ls_id_list_ext.
    ls_id_list_int-lifnr = ls_id_list_ext.
    APPEND ls_id_list_int TO lt_id_list.
    CLEAR ls_id_list_int.
  ENDLOOP.

  SORT lt_id_list.

* Extract vendor Data.
  DESCRIBE TABLE it_id_list LINES lv_block_size.
  CALL FUNCTION 'VENDOR_INIT_SELECT_DATA'
    EXPORTING
      blocksize_data       = lv_block_size
      select_tablename     = 'LFA1'
    TABLES
      in_table_list        = lt_table_list
      in_id_list           = lt_id_list
    EXCEPTIONS
      function_call_failed = 1
      table_not_supported  = 2
      OTHERS               = 3.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno INTO ld_message
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ls_bapiret2 = cvi_ei_api=>tool_fill_bapiret2( ).
    et_messages-is_error = gc_true.
    APPEND ls_bapiret2 TO et_messages-messages.
  ENDIF.

  CALL FUNCTION 'VENDOR_SELECT_NEXT_DATA'
   TABLES
     out_lfa1_tab                 = lt_lfa1
     out_lfbk_tab                 = lt_lfbk
     out_lfas_tab                 = lt_lfas
*   OUT_LFAT_TAB                 =
   EXCEPTIONS
     function_missing             = 1
     function_call_failed         = 2
     OTHERS                       = 3
            .
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno INTO ld_message
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ls_bapiret2 = cvi_ei_api=>tool_fill_bapiret2( ).
    et_messages-is_error = gc_true.
    APPEND ls_bapiret2 TO et_messages-messages.
  ENDIF.


  CREATE OBJECT lr_instance.

  LOOP AT lt_lfa1 ASSIGNING <ls_lfa1>.
    CLEAR ls_data.

    MOVE-CORRESPONDING <ls_lfa1> TO ls_data-lfa1.

    LOOP AT lt_lfbk ASSIGNING <ls_lfbk>
   WHERE lifnr = <ls_lfa1>-lifnr.
      INSERT <ls_lfbk> INTO TABLE ls_data-lfbk.
    ENDLOOP.

    LOOP AT lt_lfas ASSIGNING <ls_lfas>
   WHERE lifnr = <ls_lfa1>-lifnr.
      INSERT <ls_lfas> INTO TABLE ls_data-lfas.
    ENDLOOP.

*   Read addresses data from DB and map them
    CALL METHOD lr_instance->read_and_map_vend_addr_data
      CHANGING
        cs_data = ls_data.

    CALL METHOD vmd_ei_api_map_structure=>ecc_to_extern
      EXPORTING
        is_master_data_ecc    = ls_data
      IMPORTING
        es_master_data_extern = ls_data_extern.

    IF NOT ls_data_extern IS INITIAL.
*    set header task and current_state flags
      ls_data_extern-header-object_task = 'C'.
      INSERT ls_data_extern INTO TABLE lt_data_extern-vendors.
    ENDIF.

  ENDLOOP.

  et_data = lt_data_extern.

ENDMETHOD.


method MAP_COMMUNICATION_DATA.

  FIELD-SYMBOLS: <ls_adx> TYPE ANY,
                 <ls_adx2> TYPE ANY,
                 <lt_addrx> TYPE ANY TABLE,
                 <lt_tx_adrx> TYPE ANY TABLE,
                 <ld_uflag> TYPE ANY,
                 <ld_kz> TYPE ANY,
                 <ld_number> TYPE ANY,
                 <ld_number2> TYPE ANY.

  DATA: ld_tabix TYPE c LENGTH 2,
        ld_structype TYPE typename,
        ld_component TYPE string,
        ld_index TYPE syindex.

* to get the right fields like telefonnumbers,.. with ld_index
  IF id_addr_type = 1.
    ld_index = 4.
  ELSE.
    ld_index = 6.
  ENDIF.

  DO.
*   read each component starting with tel. numbers
    ASSIGN COMPONENT ld_index OF STRUCTURE is_addr_complete
      TO <lt_addrx>.
    IF sy-subrc <> 0.
      EXIT.
    ENDIF.
    IF <lt_addrx> IS INITIAL.
      ld_index = ld_index + 1.
      CONTINUE.
    ENDIF.

*   get the right typename
    IF id_addr_type = 1.
      ld_tabix = ld_index - 2.
    ELSE.
      ld_tabix = ld_index - 4.
    ENDIF.

    IF ld_tabix < 14.
      CONCATENATE 'T' id_addr_type '_ADR' ld_tabix INTO ld_component.
      CONCATENATE 'ADR' ld_tabix '_TAB' INTO ld_structype.
*        CONCATENATE 'T1_ADR' ld_tabix INTO ld_component.
*        CONCATENATE 'ADR' ld_tabix '_TAB' INTO ld_structype.
    ELSEIF ld_tabix = 14 AND id_addr_type <> 3..
      CONCATENATE 'T' id_addr_type '_ADRCT' INTO ld_component.
      ld_structype = 'ADRCT_TAB'.
*        ld_component = 'T1_ADRCT'.
*        ld_structype = 'ADRCT_TAB'.
    ELSEIF ( ld_tabix = 15 AND id_addr_type <> 3 )
    OR ( ld_tabix = 14 AND id_addr_type = 3 ).
      CONCATENATE 'T' id_addr_type '_ADRT' INTO ld_component.
      ld_structype = 'ADRT_TAB'.
*        ld_component = 'T1_ADRT'.
*        ld_structype = 'ADRT_TAB'.
    ELSE.
      EXIT.
    ENDIF.

*   assign the corresponding component of output strucutre
    FIELD-SYMBOLS: <ls_adrx> TYPE ANY.
    DATA: ls_adrx TYPE REF TO data.
    CREATE DATA ls_adrx TYPE LINE OF (ld_structype).
    ASSIGN ls_adrx->* TO <ls_adrx>.

    ASSIGN COMPONENT ld_component OF STRUCTURE cs_address_data
     TO <lt_tx_adrx>.

*   loop at importing component and do the mapping
    LOOP AT <lt_addrx> ASSIGNING  <ls_adx>.
      MOVE-CORRESPONDING <ls_adx> TO <ls_adrx>.
      ASSIGN COMPONENT 2 OF STRUCTURE <ls_adx> TO <ls_adx2>.
      IF sy-subrc = 0.
        MOVE-CORRESPONDING <ls_adx2> TO <ls_adrx>.
      ELSE.
        ASSIGN COMPONENT 1 OF STRUCTURE <ls_adx> TO <ls_adx2>.
        MOVE-CORRESPONDING <ls_adx2> TO <ls_adrx>.
      ENDIF.
      ASSIGN COMPONENT 'ADDRNUMBER' OF STRUCTURE <ls_adrx>
       TO <ld_number>.
      ASSIGN COMPONENT 'ADDRNUMBER' OF STRUCTURE is_addr_complete
        TO <ld_number2>.
      <ld_number> = <ld_number2>.
*??
      IF id_addr_type <> 1.
        ASSIGN COMPONENT 'PERSNUMBER' OF STRUCTURE <ls_adrx>
         TO <ld_number>.
        ASSIGN COMPONENT 'PERSNUMBER' OF STRUCTURE is_addr_complete
          TO <ld_number2>.
        <ld_number> = <ld_number2>.
      ENDIF.
*???

      ASSIGN COMPONENT 'UPDATEFLAG' OF STRUCTURE <ls_adx2>
        TO <ld_uflag>.
      IF sy-subrc = 0.
        ASSIGN COMPONENT 'KZ' OF STRUCTURE <ls_adrx> TO <ld_kz>.
        <ld_kz> = <ld_uflag>.
      ENDIF.
      INSERT <ls_adrx> INTO TABLE <lt_tx_adrx>.
      CLEAR: <ls_adrx>.
    ENDLOOP.

    ld_index = ld_index + 1.
  ENDDO.

endmethod.


METHOD prepare_id_list.

  DATA: ls_display_struc TYPE mds_cmpt_display_structure,
        lt_id_list TYPE mds_cmpt_source_target_t,
        ls_id_list TYPE mds_cmpt_source_target.

*Prepare the Source-Target list of objects
  LOOP AT it_display_structure INTO ls_display_struc.
    IF ls_display_struc-source_object IS NOT INITIAL  AND
       ls_display_struc-target_object IS NOT INITIAL .
*    move-corresponding ls_display_struc to ls_id_list.
      MOVE ls_display_struc-source_object TO ls_id_list-source_object.
      MOVE ls_display_struc-target_object TO ls_id_list-target_object.
      APPEND ls_id_list TO lt_id_list.
    ENDIF.

  ENDLOOP.

  et_id_list = lt_id_list.
ENDMETHOD.


METHOD prepare_scope.

  DATA: ls_source TYPE mds_cmpt_ctrl_obj_source,
        lt_extract_cust_tables TYPE TABLE OF tabname_md,
        ls_extract_cust_tables LIKE LINE OF lt_extract_cust_tables,
        lt_extract_vend_tables TYPE TABLE OF tabname_md,
        ls_extract_vend_tables LIKE LINE OF lt_extract_cust_tables,
        lt_scope TYPE bus_ei_fragment_t,
        ls_dataset TYPE mds_cmpt_sync_dataset_options,
        lcl_mapper TYPE REF TO cvi_mapper.

* Initialize exporting Parametes
  CLEAR et_scope.
*  ls_source = is_control-source-cmp_obj_source.
  CASE iv_scope_object.
    WHEN customer.
      REFRESH lt_extract_cust_tables.
      ls_extract_cust_tables = 'KNA1'. "General Data
      APPEND ls_extract_cust_tables TO lt_extract_cust_tables.

      LOOP AT is_control-dataset_selection INTO ls_dataset.
        CASE ls_dataset-datasetname.
          WHEN gc_address_dset. "Address
*            Do nothing - Will be done later

          WHEN gc_bank_dset. "Bank Details
            IF ls_dataset-flag IS NOT INITIAL.
              ls_extract_cust_tables = 'KNBK'. "Bank
              APPEND ls_extract_cust_tables TO lt_extract_cust_tables.
            ENDIF.

          WHEN gc_ccard_dset. "	Credit Card Details
            IF ls_dataset-flag IS NOT INITIAL.
              ls_extract_cust_tables = 'VCKUN'. "Credit card
              APPEND ls_extract_cust_tables TO lt_extract_cust_tables.
              ls_extract_cust_tables = 'VCNUM'. "Credit ccard
              APPEND ls_extract_cust_tables TO lt_extract_cust_tables.
            ENDIF.

          WHEN gc_industry_dset. " Industries
*               Do nothing - Already filled in KNA1.


          WHEN gc_relationship_dset. " Relationships
            IF ls_dataset-flag IS NOT INITIAL.
              lcl_mapper = cvi_mapper=>get_instance( ).
              IF ( lcl_mapper->is_mapping_for_contact_active( ) IS NOT INITIAL ).
                ls_extract_cust_tables = 'KNVK'. "Contact Partner
                APPEND ls_extract_cust_tables TO lt_extract_cust_tables.
              ENDIF.
            ENDIF.

          WHEN gc_tax_dset. " Tax Details
            IF ls_dataset-flag IS NOT INITIAL.
              ls_extract_cust_tables = 'KNAS'. " Withholding Tax
              APPEND ls_extract_cust_tables TO lt_extract_cust_tables.
            ENDIF.


          WHEN OTHERS.

        ENDCASE.
      ENDLOOP.
      et_scope = lt_extract_cust_tables.

    WHEN vendor.
      REFRESH lt_extract_vend_tables.
      ls_extract_vend_tables = 'LFA1'. "General Data
      APPEND ls_extract_vend_tables TO lt_extract_vend_tables.

      LOOP AT is_control-dataset_selection INTO ls_dataset.
        CASE ls_dataset-datasetname.
          WHEN gc_address_dset. "Address
*         Do nothing
          WHEN gc_bank_dset.
            IF ls_dataset-flag IS NOT INITIAL.
              ls_extract_vend_tables = 'LFBK'. "Bank
              APPEND ls_extract_vend_tables TO lt_extract_vend_tables.
            ENDIF.

          WHEN gc_industry_dset.
**               Do nothing - Already filled in LFA1.

          WHEN gc_tax_dset.
            IF ls_dataset-flag IS NOT INITIAL.
              ls_extract_vend_tables = 'LFAS'. " Withholding Tax
              APPEND ls_extract_vend_tables TO lt_extract_vend_tables.
            ENDIF.
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.
      et_scope = lt_extract_vend_tables.

    WHEN bp.
*     always extract common data and role data
      APPEND 'BUP010' TO lt_scope.
      APPEND 'BUP080' TO lt_scope.
*     also always extract relationship data since its required for customer contact person
*     relationship address
      APPEND 'BUP220' TO lt_scope.
*     contact person details
      APPEND 'BUP410' TO lt_scope.
*     sharehold informatio
      APPEND 'BUP420' TO lt_scope.

      LOOP AT is_control-dataset_selection INTO ls_dataset.
        CASE ls_dataset-datasetname.
          WHEN gc_address_dset. "Address
*           address main data
            APPEND 'BUP210' TO lt_scope.
*           communication data
            APPEND 'BUP200' TO lt_scope.
*           business hours data
            APPEND 'BUP070' TO lt_scope.
*           status data
            APPEND 'BUP160' TO lt_scope.

          WHEN gc_bank_dset. "Bank details
            APPEND 'BUP020' TO lt_scope.

          WHEN gc_ccard_dset. "Credit card details
            APPEND 'BUP030' TO lt_scope.

          WHEN gc_industry_dset.  "Industries
            APPEND 'BUP060' TO lt_scope.

          WHEN gc_tax_dset. "Tax data
            APPEND 'BUP190' TO lt_scope.

          WHEN gc_tpartner_dset. "Trading partner details
*         do nothing...will be handled in extraction
          WHEN 'OTHERS'.
*         do nothing
        ENDCASE.
        CLEAR ls_dataset.
      ENDLOOP.
      et_scope = lt_scope.
    WHEN OTHERS.
  ENDCASE.

ENDMETHOD.


METHOD READ_ADDRESSES.
*=

* Initialize exporting parameters
  CLEAR: es_address, es_contact_address.

  IF is_knvk IS INITIAL.
*   get address data type 1
    CALL FUNCTION 'ADDR_GET_COMPLETE_ALL_TYPES'
      EXPORTING
        addrnumber                 = is_kna1-adrnr
*       PERSNUMBER                 =
        address_object_type        = '1'
*       IV_CURRENT_COMM_DATA       = 'X'
     IMPORTING
        addr1_complete             = es_address-addr1_complete
     EXCEPTIONS
        parameter_error            = 1
        address_not_exist          = 2
        person_not_exist           = 3
        internal_error             = 4
        OTHERS                     = 5.

    IF sy-subrc = 0.
      es_address-kunnr                     = is_kna1-kunnr.
      es_address-addr1_complete-addrnumber = is_kna1-adrnr.
      CLEAR es_address-addr1_complete-addrhandle.
    ENDIF.

  ELSE.
*   contact update
*   get contact address data type 1
    CALL FUNCTION 'ADDR_GET_COMPLETE_ALL_TYPES'
      EXPORTING
        addrnumber          = is_knvk-adrnd
        address_object_type = '1'
      IMPORTING
        addr1_complete      = es_contact_address-addr1_complete
      EXCEPTIONS
        parameter_error     = 1
        address_not_exist   = 2
        person_not_exist    = 3
        internal_error      = 4
        OTHERS              = 5.

    IF sy-subrc = 0.
      es_contact_address-addr1_complete-addrnumber = is_knvk-adrnd.
    ENDIF.

*   get contact address data type 2
    CALL FUNCTION 'ADDR_GET_COMPLETE_ALL_TYPES'
      EXPORTING
        addrnumber          = is_knvk-adrnp_2
        persnumber          = is_knvk-prsnr
        address_object_type = '2'
      IMPORTING
        addr2_complete      = es_contact_address-addr2_complete
      EXCEPTIONS
        parameter_error     = 1
        address_not_exist   = 2
        person_not_exist    = 3
        internal_error      = 4
        OTHERS              = 5.

    IF sy-subrc = 0.
      es_contact_address-addr2_complete-addrnumber = is_knvk-adrnp_2.
      es_contact_address-addr2_complete-persnumber = is_knvk-prsnr.
    ENDIF.

*   get contact address data type 3
    CALL FUNCTION 'ADDR_GET_COMPLETE_ALL_TYPES'
      EXPORTING
        addrnumber          = is_kna1-adrnr
        persnumber          = is_knvk-prsnr
        address_object_type = '3'
      IMPORTING
        addr3_complete      = es_contact_address-addr3_complete
      EXCEPTIONS
        parameter_error     = 1
        address_not_exist   = 2
        person_not_exist    = 3
        internal_error      = 4
        OTHERS              = 5.

    IF sy-subrc = 0.
      es_contact_address-addr3_complete-addrnumber = is_kna1-adrnr.
      es_contact_address-addr3_complete-persnumber = is_knvk-prsnr.
    ENDIF.

*   general contact address
    es_contact_address-kunnr = is_kna1-kunnr.
    es_contact_address-parnr = is_knvk-parnr.
  ENDIF.

ENDMETHOD.


METHOD READ_AND_MAP_CUST_ADDR_DATA.

*READ ADRESS DATA FROM DATABASE

*mapping from szadr_.. into BAPI-strucutre adrx_tab because of simular
*structure. then the mapping of ecc_to_extern can be used

  DATA: ls_address TYPE gsy_kna1_addr1,
        ls_contact_address TYPE gsy_knvk_addr,
        ls_address_data TYPE cvis_ei_extract_address_data,
        ls_address_t2 TYPE cvis_ei_extract_address_data_2,
        ls_address_t3 TYPE cvis_ei_extract_address_data_3.

  FIELD-SYMBOLS: <ls_knvk> TYPE knvk.

* //read Address type 1 from database
  CALL METHOD cl_mds_cmptool_extract=>read_addresses
    EXPORTING
      is_kna1            = cs_data-kna1
*    IS_KNVK            =
    IMPORTING
      es_address         = ls_address
*    ES_CONTACT_ADDRESS =
      .

* //Map Data into Structre needed für mapping-method
* T1_ADRC
  CALL METHOD cmd_ei_api_extract=>map_address_addrx_to_adx
    EXPORTING
      is_complex_addr1 = ls_address-addr1_complete
    CHANGING
      cs_ad1           = ls_address_data-t1_adrc.

* mapping of communication data and remarks
  CALL METHOD map_communication_data
    EXPORTING
      is_addr_complete = ls_address-addr1_complete
      id_addr_type     = '1'
    CHANGING
      cs_address_data  = ls_address_data.


* /CONTACT
*// read contact addresses from DB
  LOOP AT cs_data-knvk ASSIGNING <ls_knvk>.
*  //read contact addresses for one contact for all adress types
*    from database
    CALL METHOD me->read_addresses
      EXPORTING
        is_kna1            = cs_data-kna1
        is_knvk            = <ls_knvk>
      IMPORTING
*    ES_ADDRESS         =
        es_contact_address = ls_contact_address.

*   Map addr1, addr2 and addr3
    CALL METHOD cmd_ei_api_extract=>map_address_addrx_to_adx
      EXPORTING
        is_complex_addr1 = ls_contact_address-addr1_complete
        is_complex_addr2 = ls_contact_address-addr2_complete
        is_complex_addr3 = ls_contact_address-addr3_complete
      CHANGING
        cs_ad1           = ls_address_data-t1_adrc
        cs_ad2           = ls_address_t2
        cs_ad3           = ls_address_t3.

    MOVE-CORRESPONDING: ls_address_t2 TO ls_address_data,
                        ls_address_t3 TO ls_address_data.

*   //mapping of type 1 communication data and remarks
    CALL METHOD map_communication_data
      EXPORTING
        is_addr_complete = ls_contact_address-addr1_complete
        id_addr_type     = '1'
      CHANGING
        cs_address_data  = ls_address_data.

*   //mapping of type 2 communication data and remarks
    CALL METHOD map_communication_data
      EXPORTING
        is_addr_complete = ls_contact_address-addr2_complete
        id_addr_type     = '2'
      CHANGING
        cs_address_data  = ls_address_data.

*   //mapping of type 3 communication data and remarks
    CALL METHOD map_communication_data
      EXPORTING
        is_addr_complete = ls_contact_address-addr3_complete
        id_addr_type     = '3'
      CHANGING
        cs_address_data  = ls_address_data.
  ENDLOOP.

  MOVE-CORRESPONDING ls_address_data TO cs_data.

ENDMETHOD.


method READ_AND_MAP_VEND_ADDR_DATA.

*READ ADRESS DATA FROM DATABASE

*mapping from szadr_.. into BAPI-strucutre adrx_tab because of simular
*structure. then the mapping of ecc_to_extern can be used

  DATA: ls_address TYPE SZADR_ADDR1_COMPLETE.
  DATA: ls_address_data TYPE cvis_ei_extract_address_data.

*   //read Address type 1 from database
  CALL METHOD vmd_ei_api_map_structure=>read_organization_address
    EXPORTING
      is_lfa1            = cs_data-lfa1
    IMPORTING
      es_address         = ls_address
*    ES_CONTACT_ADDRESS =
      .

*   //Map Data into Structre needed für mapping-method
*    T1_ADRC
  DATA: ls_addr1 TYPE szadr_addr1_line,
        ls_adrc TYPE vadrc.

  LOOP AT ls_address-addr1_tab INTO ls_addr1.
    MOVE-CORRESPONDING ls_addr1 TO ls_adrc.
    MOVE-CORRESPONDING ls_addr1-data TO ls_adrc.
    ls_adrc-addrnumber = ls_address-addrnumber.
    INSERT ls_adrc INTO TABLE ls_address_data-t1_adrc.
  ENDLOOP.

*   mapping of communication data and remarks
  CALL METHOD me->map_communication_data
    EXPORTING
      is_addr_complete = ls_address
      id_addr_type     = '1'
    CHANGING
      cs_address_data  = ls_address_data.

  MOVE-CORRESPONDING ls_address_data TO cs_data.

endmethod.
ENDCLASS.
