*&---------------------------------------------------------------------*
*& Report  CVI_CUSTOMIZING_CHECK
*&
*&---------------------------------------------------------------------*

REPORT cvi_customizing_check MESSAGE-ID cvi_tools_support.

DATA: g_ok_code      TYPE sy-ucomm,
      lv_return_code TYPE i.


START-OF-SELECTION.

  CALL SCREEN '0100'.


*----------------------------------------------------------------------*
*       CLASS lcl_application DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_application DEFINITION.


  PUBLIC SECTION.

    CLASS-METHODS:
      class_constructor,
      main,
      handle_button_click FOR EVENT button_click
                          OF        cl_list_tree_model
                          IMPORTING node_key item_name,     "#EC NEEDED
      print,
      init,
      refresh,
      add_node IMPORTING node_key           TYPE tm_nodekey
                         relative_node_key  TYPE tm_nodekey OPTIONAL
                         relationship       TYPE i          OPTIONAL
                         isfolder           TYPE as4flag
                         item_table         TYPE treemlitab,
        expand_all_nodes,
        collapse_all_nodes,
        add_push_button,
        add_icon IMPORTING iv_image TYPE tv_image,
        check_crmc_but_call_fu IMPORTING iv_ztpkt TYPE crmt_bu_ztpkt
                                         iv_objap TYPE crmt_bu_objap
                                         iv_fname TYPE bu_fname,
      init_tree,
      add_root_node,
      add_main_node1                 IMPORTING iv_key TYPE string,
      add_main_node1_ppo             IMPORTING iv_key TYPE string,
      add_main_node1_ppo_status      IMPORTING iv_key TYPE string,
      add_main_node1_badis           IMPORTING iv_key TYPE string,
*      add_main_node1_sync_cockpit    importing iv_key type string,
      add_main_node1_mapping         IMPORTING iv_key TYPE string,
      add_main_node1_mapping_branch  IMPORTING iv_key TYPE string,
      add_main_node2                 IMPORTING iv_key TYPE string,
      add_main_node2_obj             IMPORTING iv_key TYPE string,
      add_main_node2_bp_outbound     IMPORTING iv_key TYPE string,
      add_main_node2_cust_pay_cards  IMPORTING iv_key TYPE string,
      main_node2_cust_pay_card_rec   IMPORTING iv_key TYPE string,
      add_main_node2_cust_contact    IMPORTING iv_key TYPE string,
      add_main_node2_bte_outbound    IMPORTING iv_key TYPE string,
      main_node2_cust_contact_ind    IMPORTING iv_key TYPE string,
      main_node2_cust_contact_ind_v  IMPORTING iv_key TYPE string,
      main_node2_cust_vend_views     IMPORTING iv_key TYPE string,
      main_node2_bp_outbound_con     IMPORTING iv_key TYPE string,
      main_node2_bp_outbound_con_fu  IMPORTING iv_key TYPE string,
      main_node2_bp_outbound_comp    IMPORTING iv_key TYPE string,
      main_node2_bp_outbound_comp_fu IMPORTING iv_key TYPE string,
      main_node2_bp_outbound_bas     IMPORTING iv_key TYPE string,
      main_node2_bp_outbound_bas_fu  IMPORTING iv_key TYPE string,
      add_main_node2_options         IMPORTING iv_key TYPE string iv_source_obj TYPE mds_ctrl_obj_source,
      add_main_node2_options_sync    IMPORTING iv_key TYPE string iv_source_obj TYPE mds_ctrl_obj_source
                                                                  iv_target_obj TYPE mds_ctrl_obj_target
                                     EXPORTING ev_sync_active TYPE xfeld,
      add_main_node2_options_ppo     IMPORTING iv_key TYPE string iv_source_obj TYPE mds_ctrl_obj_source
                                                                  iv_target_obj TYPE mds_ctrl_obj_target
                                     EXPORTING ev_ppo_active TYPE xfeld,
      add_main_node2_options_wf      IMPORTING iv_key TYPE string iv_source_obj TYPE mds_ctrl_obj_source
                                               iv_header_key TYPE string
                                               iv_target_obj TYPE mds_ctrl_obj_target
                                               iv_ppo_active TYPE xfeld
                                               iv_business_process TYPE /sappo/dte_business_process,
      add_main_node2_options_groups  IMPORTING iv_key TYPE string iv_source_obj TYPE mds_ctrl_obj_source
                                                                  iv_target_obj TYPE mds_ctrl_obj_target,
      add_main_node2_options_roles   IMPORTING iv_key TYPE string iv_source_obj TYPE mds_ctrl_obj_source
                                                                  iv_target_obj TYPE mds_ctrl_obj_target,
      add_main_node2_options_gro_rec IMPORTING iv_key TYPE string iv_source_obj TYPE mds_ctrl_obj_source
                                                                  iv_target_obj TYPE mds_ctrl_obj_target,
      add_main_node2_options_rol_rec IMPORTING iv_key TYPE string iv_source_obj TYPE mds_ctrl_obj_source
                                                                  iv_target_obj TYPE mds_ctrl_obj_target.


    TYPE-POOLS: icon.

    TYPES: lty_area TYPE char40.


    CLASS-DATA: gr_custom_container TYPE REF TO cl_gui_custom_container,
          gr_tree TYPE REF TO cl_list_tree_model.

    CLASS-DATA: BEGIN OF ls_main1,
          ident(1),
          area TYPE lty_area,
          view          TYPE vim_name,
          free(200),
          counter(10),
          END   OF ls_main1.


    CLASS-DATA: BEGIN OF ls_main2,
          ident(1),
          area TYPE lty_area,
          object        TYPE mds_ctrl_object,
          source_object TYPE mds_ctrl_obj_source,
          target_object TYPE mds_ctrl_obj_target,
          account_group TYPE ktokd,
          grouping      TYPE bu_group,
          role          TYPE bu_partnerrole,
          ppo_test      TYPE xfeld,
          view          TYPE vim_name,
          free(200),
          counter(10),
          END   OF ls_main2.

    CLASS-DATA: gs_item TYPE treemlitem,
          gt_item_table TYPE treemlitab.

    CLASS-DATA: gt_object_types TYPE mds_ctrls_object_type_t,
                gt_options TYPE mds_ctrls_opt_t.


    CLASS-DATA: gv_ppo_for_bp_active(1),
                gv_contact_person_mapping_act(1),
                gv_counter(10).

    CLASS-DATA: gc_bp        TYPE mds_ctrl_object      VALUE 'BP',
                gc_customer  TYPE mds_ctrl_object      VALUE 'CUSTOMER',
                gc_vendor    TYPE mds_ctrl_object      VALUE 'VENDOR',
                gc_component TYPE /sappo/dte_component VALUE 'AP-MD'.

    CLASS-DATA: gc_traffic_sign   TYPE tv_itmname VALUE '2',
                gc_item_name_text TYPE tv_itmname VALUE '3',
                gc_push_button    TYPE tv_itmname VALUE '1'.

    CLASS-DATA: gc_show_traffic_signs(1) VALUE ' '.


ENDCLASS.                    "lcl_application DEFINITION
*----------------------------------------------------------------------*
*       CLASS lcl_application IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_application IMPLEMENTATION.

  METHOD class_constructor.

    CALL METHOD init.


  ENDMETHOD.                    "constructor
*----------------------------------------------------------------------*
  METHOD main.
*
    DATA: ls_event  TYPE cntl_simple_event,
          lt_events TYPE cntl_simple_events.
*

    IF gr_tree IS BOUND.
      RETURN.
    ENDIF.


* create a list tree model instance
    CREATE OBJECT gr_tree
      EXPORTING
        node_selection_mode         = cl_list_tree_model=>node_sel_mode_single
        item_selection              = 'X'
        with_headers                = ' '
      EXCEPTIONS
        illegal_node_selection_mode = 1
        OTHERS                      = 99.

    IF sy-subrc <> 0.
      MESSAGE x000(cvi_tools_support).
    ENDIF.


* create a container for the tree control
    CREATE OBJECT gr_custom_container
      EXPORTING
        container_name              = 'TREE_CONTAINER'
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        lifetime_dynpro_dynpro_link = 5
        OTHERS                      = 99.

    IF sy-subrc <> 0.
      MESSAGE x001(cvi_tools_support).
    ENDIF.


    CALL METHOD gr_tree->create_tree_control
      EXPORTING
        parent                       = gr_custom_container
      EXCEPTIONS
        lifetime_error               = 1
        cntl_system_error            = 2
        create_error                 = 3
        failed                       = 4
        tree_control_already_created = 5
        OTHERS                       = 99.

    IF sy-subrc <> 0.
      MESSAGE x002(cvi_tools_support).
    ENDIF.



    ls_event-eventid    = cl_list_tree_model=>eventid_button_click.
    ls_event-appl_event = ''.
    APPEND ls_event TO lt_events.
    CLEAR ls_event.


    CALL METHOD gr_tree->set_registered_events
      EXPORTING
        events                    = lt_events
      EXCEPTIONS
        illegal_event_combination = 1
        unknown_event             = 2
        OTHERS                    = 99.

    IF sy-subrc <> 0.
      MESSAGE x003(cvi_tools_support) WITH 'SET_REGISTERED_EVENTS'.
    ENDIF.


* assign event handlers in the application class to each desired event
    SET HANDLER: lcl_application=>handle_button_click FOR gr_tree.

    CALL METHOD init_tree.


  ENDMETHOD.                    "main
*----------------------------------------------------------------------*
  METHOD init_tree.

    CALL METHOD add_root_node.


  ENDMETHOD.                    "init_tree
*----------------------------------------------------------------------*
  METHOD add_root_node.
*
    CONSTANTS: lc_area TYPE lty_area VALUE 'ROOT'.
*
    DATA: lv_key TYPE string.
*

    CLEAR ls_main2.
    ls_main2-area  = lc_area.
    lv_key = ls_main2.


    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    gs_item-text      = 'CVI-Integration'(000).
    APPEND gs_item TO gt_item_table.

    CALL METHOD add_node
      EXPORTING
        node_key   = lv_key
        isfolder   = 'X'
        item_table = gt_item_table.


    CALL METHOD add_main_node1
      EXPORTING
        iv_key = lv_key.


    CALL METHOD add_main_node2
      EXPORTING
        iv_key = lv_key.


    CALL METHOD gr_tree->expand_node
      EXPORTING
        node_key       = lv_key
      EXCEPTIONS
        node_not_found = 1
        OTHERS         = 99.

    IF sy-subrc <> 0.
      MESSAGE x003(cvi_tools_support) WITH 'EXPAND_NODE'.
    ENDIF.



  ENDMETHOD.                    "add_root_node
*----------------------------------------------------------------------*
  METHOD add_main_node1.
*
    CONSTANTS: lc_area TYPE lty_area VALUE 'GENERAL'.
*
    DATA: lv_key TYPE string.
*

    ls_main1 = iv_key.
    ls_main1-ident = '1'.
    ls_main1-area  = lc_area.
    lv_key = ls_main1.


    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    gs_item-text      = 'Generelle Einstellungen'(001).
    APPEND gs_item TO gt_item_table.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = 'X'
        item_table        = gt_item_table.

*    CALL METHOD add_main_node1_controller
*      EXPORTING
*        iv_key = lv_key.

    CALL METHOD add_main_node1_ppo
      EXPORTING
        iv_key = lv_key.

    CALL METHOD add_main_node1_badis
      EXPORTING
        iv_key = lv_key.


    CALL METHOD add_main_node1_mapping
      EXPORTING
        iv_key = lv_key.


  ENDMETHOD.                    "add_main_node1
*----------------------------------------------------------------------*

  METHOD add_main_node1_ppo.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'GENERAL_PPO'.
*

    ls_main1 = iv_key.
    ls_main1-ident = '1'.
    ls_main1-area  = lc_area.
    lv_key = ls_main1.


    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    gs_item-text      = 'Postprocessing Office (PPO)'(002).
    APPEND gs_item TO gt_item_table.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = 'X'
        item_table        = gt_item_table.


    CALL METHOD add_main_node1_ppo_status
      EXPORTING
        iv_key = lv_key.


  ENDMETHOD.                    "add_main_node1_PPO
*----------------------------------------------------------------------*
  METHOD add_main_node1_ppo_status.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'GENERAL_PPO_STATUS'.
*

    ls_main1 = iv_key.
    ls_main1-ident = '1'.
    ls_main1-area  = lc_area.
    ls_main1-view  = 'MDSV_CTRL_OBJPPO'.
    lv_key = ls_main1.


    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.

    CASE gv_ppo_for_bp_active.
      WHEN 'X'.
        gs_item-text = 'PPO ist aktiv für Plattformobjekt Geschäftspartner'(003).
      WHEN ' '.
        gs_item-text = 'PPO ist nicht aktiv für Plattformobjekt Geschäftspartner'(004).
    ENDCASE.

    APPEND gs_item TO gt_item_table.

    CALL METHOD add_push_button.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


  ENDMETHOD.                    "add_main_node1_PPO_status

*----------------------------------------------------------------------*
  METHOD add_main_node1_badis.

*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'GENERAL_BADIS'.
*

    ls_main1 = iv_key.
    ls_main1-ident = '1'.
    ls_main1-area  = lc_area.
    lv_key = ls_main1.


    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    gs_item-text      = 'SAP-BAdI-Implementierungen'(005).
    APPEND gs_item TO gt_item_table.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = 'X'
        item_table        = gt_item_table.


  ENDMETHOD.                    "add_main_node1_BADIS
*----------------------------------------------------------------------*
  METHOD add_main_node2.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'OBJECT'.
*

    ls_main2 = iv_key.
    ls_main2-ident = '2'.
    ls_main2-area  = lc_area.
    lv_key = ls_main2.


    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    gs_item-text      = 'Synchronisationsobjekte'(006).
    APPEND gs_item TO gt_item_table.

    CALL METHOD gr_tree->add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = 'X'
        item_table        = gt_item_table.


    CALL METHOD add_main_node2_obj
      EXPORTING
        iv_key = lv_key.


  ENDMETHOD.                    "add_main_node2
*----------------------------------------------------------------------*
  METHOD add_main_node2_obj.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'OBJECTS'.
*
    DATA: ls_object_types LIKE LINE OF gt_object_types.
*


    SORT gt_object_types BY description.

    LOOP AT gt_object_types INTO ls_object_types.

      ls_main2 = iv_key.
      ls_main2-area   = lc_area.
      ls_main2-object = ls_object_types-sync_object.
      lv_key = ls_main2.

      CLEAR: gs_item, gt_item_table.
      gs_item-item_name = gc_item_name_text.
      gs_item-class     = cl_gui_list_tree=>item_class_text.
      gs_item-alignment = cl_gui_list_tree=>align_auto.
      gs_item-font      = cl_gui_list_tree=>item_font_prop.
      gs_item-text      = ls_object_types-description.
      APPEND gs_item TO gt_item_table.


      CALL METHOD add_node
        EXPORTING
          node_key          = lv_key
          relative_node_key = iv_key
          relationship      = cl_list_tree_model=>relat_last_child
          isfolder          = 'X'
          item_table        = gt_item_table.


      CALL METHOD add_main_node2_bte_outbound
        EXPORTING
          iv_key = lv_key.



      CASE ls_object_types-sync_object.
        WHEN gc_bp.
          CALL METHOD add_main_node2_bp_outbound
            EXPORTING
              iv_key = lv_key.
        WHEN gc_customer.

          CALL METHOD add_main_node2_cust_pay_cards
            EXPORTING
              iv_key = lv_key.

        WHEN OTHERS.
          "do nothing
      ENDCASE.


      CALL METHOD add_main_node2_options
        EXPORTING
          iv_key        = lv_key
          iv_source_obj = ls_object_types-sync_object.

    ENDLOOP.


  ENDMETHOD.                    "add_main_node2_obj
*----------------------------------------------------------------------*
  METHOD add_main_node2_bp_outbound.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'BP_OUTBOUND'.
*

    ls_main2       = iv_key.
    ls_main2-area  = lc_area.
    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    gs_item-text      = 'Geschäftspartner-Outbound'(007).
    APPEND gs_item TO gt_item_table.


    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = 'X'
        item_table        = gt_item_table.


    CALL METHOD main_node2_bp_outbound_bas
      EXPORTING
        iv_key = lv_key.

    CALL METHOD main_node2_bp_outbound_comp
      EXPORTING
        iv_key = lv_key.

    CALL METHOD main_node2_bp_outbound_con
      EXPORTING
        iv_key = lv_key.


  ENDMETHOD.                    "add_main_node2_BP_outbound
*----------------------------------------------------------------------*
  METHOD main_node2_bp_outbound_con.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'BP_OUTBOUND_CONTROLLER'.
*

    ls_main2 = iv_key.
    ls_main2-area  = lc_area.
    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    gs_item-text =
    'Verknüpfung zwischen Geschäftspartner-Outbound und Controller'(040).

    APPEND gs_item TO gt_item_table.


    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = 'X'
        item_table        = gt_item_table.


    CALL METHOD main_node2_bp_outbound_con_fu
      EXPORTING
        iv_key = lv_key.


  ENDMETHOD.                    "main_node2_BP_outbound_con
*----------------------------------------------------------------------*
  METHOD main_node2_bp_outbound_con_fu.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'BP_OUTBOUND_CONTROLLER_FUNCTIONS'.
*

    ls_main2 = iv_key.
    ls_main2-area  = lc_area.
    ls_main2-view  = 'V_BUT_CALL_FU'.
    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.

    CALL METHOD check_crmc_but_call_fu
      EXPORTING
        iv_ztpkt = 'BPOUT'
        iv_objap = 'BUPX'
        iv_fname = 'MDS_BUPA_OUTBOUND'.


    CALL METHOD add_push_button.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


  ENDMETHOD.                    "add_main_node2_BP_outbound_con_fu
*----------------------------------------------------------------------*
  METHOD main_node2_bp_outbound_comp.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'BP_OUTBOUND_COMPLETION'.
*

    ls_main2 = iv_key.
    ls_main2-area  = lc_area.
    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    gs_item-text      = 'Vervollständigung der Geschäftspartnerdaten'(008).

    APPEND gs_item TO gt_item_table.


    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = 'X'
        item_table        = gt_item_table.


    CALL METHOD main_node2_bp_outbound_comp_fu
      EXPORTING
        iv_key = lv_key.


  ENDMETHOD.                    "main_node2_BP_outbound_compl
*----------------------------------------------------------------------*
  METHOD main_node2_bp_outbound_bas.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'BP_OUTBOUND_BASIC'.
*

    ls_main2 = iv_key.
    ls_main2-area  = lc_area.
    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font = cl_gui_list_tree=>item_font_prop.
    gs_item-text =
    'Synchronisationsrelevante Funktionsbausteine des Geschäftspartner-Outbounds'(009).

    APPEND gs_item TO gt_item_table.


    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = 'X'
        item_table        = gt_item_table.


    CALL METHOD main_node2_bp_outbound_bas_fu
      EXPORTING
        iv_key = lv_key.


  ENDMETHOD.                    "main_node2_BP_outbound_bas
*----------------------------------------------------------------------*
  METHOD add_main_node2_options.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'OPTIONS'.
*
    DATA: ls_options LIKE LINE OF gt_options.

    DATA: ls_source TYPE LINE OF mds_ctrls_object_type_t,
          ls_target TYPE LINE OF mds_ctrls_object_type_t.
*

    LOOP AT gt_options INTO ls_options WHERE sync_obj_source = iv_source_obj.

      ls_main2 = iv_key.
      ls_main2-area          = lc_area.
      ls_main2-object        = ls_options-sync_obj_source.
      ls_main2-source_object = ls_options-sync_obj_source.
      ls_main2-target_object = ls_options-sync_obj_target.
      lv_key = ls_main2.

      CLEAR: gs_item, gt_item_table.
      gs_item-item_name = gc_item_name_text.
      gs_item-class     = cl_gui_list_tree=>item_class_text.
      gs_item-alignment = cl_gui_list_tree=>align_auto.
      gs_item-font      = cl_gui_list_tree=>item_font_prop.


      CLEAR: ls_source,
             ls_target.

      READ TABLE gt_object_types with key sync_object = : ls_options-sync_obj_source INTO ls_source,
                                                          ls_options-sync_obj_target INTO ls_target.



      CONCATENATE
      'Synchronisationsoption:'(019)
      ls_source-description
      '->'
      ls_target-description
      INTO
      gs_item-text SEPARATED BY space.
      APPEND gs_item TO gt_item_table.

      CALL METHOD add_node
        EXPORTING
          node_key          = lv_key
          relative_node_key = iv_key
          relationship      = cl_list_tree_model=>relat_last_child
          isfolder          = 'X'
          item_table        = gt_item_table.





      CALL METHOD add_main_node2_options_sync
        EXPORTING
          iv_key        = lv_key
          iv_source_obj = ls_options-sync_obj_source
          iv_target_obj = ls_options-sync_obj_target.

      CALL METHOD add_main_node2_options_ppo
        EXPORTING
          iv_key        = lv_key
          iv_source_obj = ls_options-sync_obj_source
          iv_target_obj = ls_options-sync_obj_target.

      IF ( ls_options-sync_obj_source = gc_customer AND ls_options-sync_obj_target = gc_bp )       OR
         ( ls_options-sync_obj_source = gc_bp       AND ls_options-sync_obj_target = gc_customer ).
        CALL METHOD add_main_node2_cust_contact
          EXPORTING
            iv_key = lv_key.
      ENDIF.


      CALL METHOD add_main_node2_options_groups
        EXPORTING
          iv_key        = lv_key
          iv_source_obj = ls_options-sync_obj_source
          iv_target_obj = ls_options-sync_obj_target.

      CALL METHOD add_main_node2_options_roles
        EXPORTING
          iv_key        = lv_key
          iv_source_obj = ls_options-sync_obj_source
          iv_target_obj = ls_options-sync_obj_target.


    ENDLOOP.


  ENDMETHOD.                    "add_main_node2_options
*----------------------------------------------------------------------*
  METHOD add_main_node2_options_sync.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'CONTROLLER'.

    data: ls_mdsv_sync_opt type mdsv_ctrl_opt_a.

    ls_main2 = iv_key.
    ls_main2-area          = lc_area.
    ls_main2-object        = iv_source_obj.
    ls_main2-source_object = iv_source_obj.
    ls_main2-target_object = iv_target_obj.
    ls_main2-view          = 'MDSV_CTRL_OPT_A'.
    lv_key = ls_main2.

    select single * from mdsc_ctrl_opt_a into ls_mdsv_sync_opt where sync_obj_source = iv_source_obj
                                                             AND   sync_obj_target = iv_target_obj.
    IF sy-subrc = 0.
      CLEAR: gs_item, gt_item_table.

      gs_item-item_name = gc_item_name_text.
      gs_item-class     = cl_gui_list_tree=>item_class_text.
      gs_item-alignment = cl_gui_list_tree=>align_auto.
      gs_item-font      = cl_gui_list_tree=>item_font_prop.

    if ls_mdsv_sync_opt-ACTIVE_INDICATOR is not initial.
        gs_item-text = 'Synchronization is active'(071).
        ev_sync_active = 'X'.
    ELSE.
        gs_item-text = 'Synchronization ist nicht aktiv'(072).
        ev_sync_active = ' '.
    endif.
      APPEND gs_item TO gt_item_table.

      CALL METHOD add_push_button.


      CALL METHOD add_node
        EXPORTING
          node_key          = lv_key
          relative_node_key = iv_key
          relationship      = cl_list_tree_model=>relat_last_child
          isfolder          = ' '
          item_table        = gt_item_table.

  endif.
*
  endmethod.
*----------------------------------------------------------------------*
  METHOD add_main_node2_options_ppo.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'PPO_OPTION'.
*
    DATA: ls_mdsv_sync_ppo TYPE mdse_sync_ppo,
          ls_/sappo/va_bproc TYPE /sappo/a_bproc.
*

    ls_main2 = iv_key.
    ls_main2-area          = lc_area.
    ls_main2-object        = iv_source_obj.
    ls_main2-source_object = iv_source_obj.
    ls_main2-target_object = iv_target_obj.
    ls_main2-view          = '/SAPPO/VA_BPROC'.
    lv_key = ls_main2.


    SELECT SINGLE * FROM mdse_sync_ppo INTO ls_mdsv_sync_ppo WHERE sync_obj_source = iv_source_obj
                                                             AND   sync_obj_target = iv_target_obj.


    IF sy-subrc = 0.
      CLEAR: gs_item, gt_item_table.

      gs_item-item_name = gc_item_name_text.
      gs_item-class     = cl_gui_list_tree=>item_class_text.
      gs_item-alignment = cl_gui_list_tree=>align_auto.
      gs_item-font      = cl_gui_list_tree=>item_font_prop.

      SELECT SINGLE * FROM  /sappo/a_bproc INTO ls_/sappo/va_bproc
             WHERE  component         = gc_component
             AND    business_process  = ls_mdsv_sync_ppo-business_process.

      IF sy-subrc = 0 AND ls_/sappo/va_bproc-flg_active = 'X'.
        gs_item-text = 'PPO ist aktiv'(042).
        ev_ppo_active = 'X'.
      ELSE.
        gs_item-text = 'PPO ist nicht aktiv'(043).
        ev_ppo_active = ' '.
      ENDIF.

      CONCATENATE
        gs_item-text
        'für PPO-internen Prozess'(010)
        ls_mdsv_sync_ppo-business_process
      INTO gs_item-text SEPARATED BY space.


      APPEND gs_item TO gt_item_table.

      CALL METHOD add_push_button.


      CALL METHOD add_node
        EXPORTING
          node_key          = lv_key
          relative_node_key = iv_key
          relationship      = cl_list_tree_model=>relat_last_child
          isfolder          = ' '
          item_table        = gt_item_table.

      CLEAR gt_item_table.


      CASE gv_ppo_for_bp_active.
        WHEN 'X'.

          IF ls_/sappo/va_bproc-flg_active IS INITIAL.

            ls_main2-ppo_test = 'X'.
            lv_key = ls_main2.

            CLEAR gs_item-text.
            CONCATENATE
              'PPO ist inaktiv für Prozess'(011)
              ls_mdsv_sync_ppo-business_process
              ' obwohl das PPO generell für Geschäftspartner aktiv ist'(012)
            INTO gs_item-text SEPARATED BY space.

            APPEND gs_item TO gt_item_table.


            CLEAR gs_item-text.
            gs_item-item_name  = gc_traffic_sign.
            gs_item-t_image    = icon_yellow_light.
            gs_item-ignoreimag = 'X'.
            APPEND gs_item TO gt_item_table.


            CALL METHOD add_node
              EXPORTING
                node_key          = lv_key
                relative_node_key = iv_key
                relationship      = cl_list_tree_model=>relat_last_child
                isfolder          = ' '
                item_table        = gt_item_table.

            CLEAR gt_item_table.

            CLEAR ls_main2-ppo_test.

          ENDIF.


        WHEN ' '.

          IF ls_/sappo/va_bproc-flg_active IS NOT INITIAL.

            ls_main2-ppo_test = 'X'.
            lv_key = ls_main2.

            CLEAR gs_item-text.
            CONCATENATE
              'PPO ist aktiv für Prozess'(013)
              ls_mdsv_sync_ppo-business_process
              ' obwohl das PPO generell für Geschäftspartner nicht aktiv ist'(014)
            INTO gs_item-text SEPARATED BY space.

            APPEND gs_item TO gt_item_table.


            CLEAR gs_item-text.
            gs_item-item_name = gc_traffic_sign.
            gs_item-t_image   = icon_yellow_light.
            APPEND gs_item TO gt_item_table.


            CALL METHOD add_node
              EXPORTING
                node_key          = lv_key
                relative_node_key = iv_key
                relationship      = cl_list_tree_model=>relat_last_child
                isfolder          = ' '
                item_table        = gt_item_table.

            CLEAR gt_item_table.

            CLEAR ls_main2-ppo_test.

          ENDIF.
        WHEN OTHERS.
          "do nothing
      ENDCASE.

    ENDIF.


    CALL METHOD add_main_node2_options_wf
      EXPORTING
        iv_key              = lv_key
        iv_header_key       = iv_key
        iv_source_obj       = iv_source_obj
        iv_target_obj       = iv_target_obj
        iv_ppo_active       = ev_ppo_active
        iv_business_process = ls_mdsv_sync_ppo-business_process.


  ENDMETHOD.                    "add_main_node2_options_PPO
*----------------------------------------------------------------------*
  METHOD add_main_node2_options_groups.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'GROUPING'.
*
    DATA: ls_tbd001 TYPE tbd001,
          ls_tbc001 TYPE tbc001,
          ls_cvic_cust_to_bp1 TYPE cvic_cust_to_bp1,
          ls_cvic_vend_to_bp1 TYPE cvic_vend_to_bp1.
*
    ls_main2               = iv_key.
    ls_main2-area          = lc_area.
    ls_main2-object        = iv_source_obj.
    ls_main2-source_object = iv_source_obj.
    ls_main2-target_object = iv_target_obj.

    CASE iv_source_obj.
      WHEN gc_bp.
        CASE iv_target_obj.
          WHEN gc_customer.
            ls_main2-view = 'V_TBD001'.
          WHEN gc_vendor.
            ls_main2-view = 'V_TBC001'.
        ENDCASE.
      WHEN gc_customer.
        ls_main2-view = 'CVIV_CUST_TO_BP1'.
      WHEN gc_vendor.
        ls_main2-view = 'CVIV_VEND_TO_BP1'.
    ENDCASE.



    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.

    CASE iv_source_obj.
      WHEN gc_bp.
        gs_item-text = 'Zuordnungen Geschäftspartnergruppierungen zu Kontengruppen:'(015).

        CASE iv_target_obj.
          WHEN gc_customer.
            ls_main2-view = 'V_TBD001'.
            SELECT SINGLE * FROM tbd001 INTO ls_tbd001.
            IF sy-subrc = 0.
              IF gc_show_traffic_signs = 'X'.
                gs_item-t_image = icon_yellow_light.
              ENDIF.
              CONCATENATE gs_item-text 'entries existing'(062) INTO
              gs_item-text SEPARATED BY space.
            ELSE.
              IF gc_show_traffic_signs = 'X'.
                gs_item-t_image = icon_red_light.
              ENDIF.
              CONCATENATE gs_item-text 'no entries existing'(063) INTO
              gs_item-text SEPARATED BY space.
            ENDIF.

          WHEN gc_vendor.
            ls_main2-view = 'V_TBC001'.
            SELECT SINGLE * FROM tbc001 INTO ls_tbc001.
            IF sy-subrc = 0.
              IF gc_show_traffic_signs = 'X'.
                gs_item-t_image = icon_yellow_light.
              ENDIF.
              CONCATENATE gs_item-text 'entries existing'(062) INTO
              gs_item-text SEPARATED BY space.
            ELSE.
              IF gc_show_traffic_signs = 'X'.
                gs_item-t_image = icon_red_light.
              ENDIF.
              CONCATENATE gs_item-text 'no entries existing'(063) INTO
              gs_item-text SEPARATED BY space.
            ENDIF.
        ENDCASE.

      WHEN gc_customer.
        gs_item-text = 'Zuordnungen Kontengruppen zu Geschäftspartnergruppierungen:'(016).

        SELECT SINGLE * FROM cvic_cust_to_bp1 INTO ls_cvic_cust_to_bp1.
        IF sy-subrc = 0.
          IF gc_show_traffic_signs = 'X'.
            gs_item-t_image = icon_yellow_light.
          ENDIF.
          CONCATENATE gs_item-text 'entries existing'(062) INTO
          gs_item-text SEPARATED BY space.
        ELSE.
          IF gc_show_traffic_signs = 'X'.
            gs_item-t_image = icon_red_light.
          ENDIF.
          CONCATENATE gs_item-text 'no entries existing'(063) INTO
          gs_item-text SEPARATED BY space.
        ENDIF.

      WHEN gc_vendor.
        gs_item-text = 'Zuordnungen Kontengruppen zu Geschäftspartnergruppierungen:'(016).
        SELECT SINGLE * FROM cvic_vend_to_bp1 INTO ls_cvic_vend_to_bp1.
        IF sy-subrc = 0.
          IF gc_show_traffic_signs = 'X'.
            gs_item-t_image = icon_yellow_light.
          ENDIF.
          CONCATENATE gs_item-text 'entries existing'(062) INTO
          gs_item-text SEPARATED BY space.
        ELSE.
          IF gc_show_traffic_signs = 'X'.
            gs_item-t_image = icon_red_light.
          ENDIF.
          CONCATENATE gs_item-text 'no entries existing'(063) INTO
          gs_item-text SEPARATED BY space.
        ENDIF.
      WHEN OTHERS.
        "do nothing
    ENDCASE.


    APPEND gs_item TO gt_item_table.

    CALL METHOD add_push_button.


    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


  ENDMETHOD.                    "add_main_node2_options_groups
*----------------------------------------------------------------------*
  METHOD add_main_node2_options_gro_rec.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'GRO_REC'.
*
    DATA: lv_account_group_descr TYPE txt30_077t,
          lv_grouping_descr TYPE bu_text40.
    DATA: lt_tbd001 TYPE TABLE OF tbd001,
          ls_tbd001 TYPE          tbd001.
    DATA: lt_tbc001 TYPE TABLE OF tbc001,
          ls_tbc001 TYPE          tbc001.
    DATA: lt_cvic_vend_to_bp1 TYPE TABLE OF cvic_vend_to_bp1,
          ls_cvic_vend_to_bp1 TYPE          cvic_vend_to_bp1.
    DATA: lt_cvic_cust_to_bp1 TYPE TABLE OF cvic_cust_to_bp1,
          ls_cvic_cust_to_bp1 TYPE          cvic_cust_to_bp1.

*

    ls_main2 = iv_key.
    ls_main2-area          = lc_area.
    ls_main2-object        = iv_source_obj.
    ls_main2-source_object = iv_source_obj.
    ls_main2-target_object = iv_target_obj.


    CASE iv_source_obj.
      WHEN gc_bp.
        CASE iv_target_obj.
          WHEN gc_customer.

            ls_main2-view          = 'V_TBD001'.

            SELECT * FROM tbd001 INTO TABLE lt_tbd001.

            LOOP AT lt_tbd001 INTO ls_tbd001.

              ls_main2-account_group = ls_tbd001-ktokd.
              ls_main2-grouping = ls_tbd001-bu_group.
              lv_key = ls_main2.


              CLEAR: gs_item, gt_item_table.
              gs_item-item_name = gc_item_name_text.
              gs_item-class     = cl_gui_list_tree=>item_class_text.
              gs_item-alignment = cl_gui_list_tree=>align_auto.
              gs_item-font      = cl_gui_list_tree=>item_font_prop.


              CLEAR lv_account_group_descr.
              SELECT SINGLE txt30 FROM  t077x INTO lv_account_group_descr
                     WHERE  spras  = sy-langu
                     AND    ktokd  = ls_tbd001-ktokd.


              CLEAR lv_grouping_descr.
              SELECT SINGLE txt40 FROM  tb002 INTO lv_grouping_descr
                     WHERE  spras     = sy-langu
                     AND    bu_group  = ls_tbd001-bu_group.


              CONCATENATE
              ls_tbd001-bu_group
              lv_grouping_descr
              '->'
              ls_tbd001-ktokd
              lv_account_group_descr
              INTO gs_item-text SEPARATED BY space.


              CASE ls_tbd001-xsamenumber.
                WHEN 'X'.
                  CONCATENATE
                  gs_item-text
                  '/ (mit Nummerngleichheit)'(017)
                  INTO gs_item-text SEPARATED BY space.

                WHEN ' '.
                  CONCATENATE
                  gs_item-text
                  '/ (ohne Nummerngleichheit)'(018)
                  INTO gs_item-text SEPARATED BY space.

              ENDCASE.

              APPEND gs_item TO gt_item_table.

              CALL METHOD add_push_button.

              CALL METHOD add_node
                EXPORTING
                  node_key          = lv_key
                  relative_node_key = iv_key
                  relationship      = cl_list_tree_model=>relat_last_child
                  isfolder          = ' '
                  item_table        = gt_item_table.

            ENDLOOP.


          WHEN gc_vendor.


            ls_main2-view          = 'V_TBC001'.

            SELECT * FROM tbc001 INTO TABLE lt_tbc001.

            LOOP AT lt_tbc001 INTO ls_tbc001.

              ls_main2-account_group = ls_tbc001-ktokk.
              ls_main2-grouping      = ls_tbc001-bu_group.
              lv_key = ls_main2.


              CLEAR: gs_item, gt_item_table.
              gs_item-item_name = gc_item_name_text.
              gs_item-class     = cl_gui_list_tree=>item_class_text.
              gs_item-alignment = cl_gui_list_tree=>align_auto.
              gs_item-font      = cl_gui_list_tree=>item_font_prop.


              CLEAR lv_account_group_descr.
              SELECT SINGLE txt30 FROM  t077y INTO lv_account_group_descr
                     WHERE  spras  = sy-langu
                     AND    ktokk  = ls_tbc001-ktokk.


              CLEAR lv_grouping_descr.
              SELECT SINGLE txt40 FROM  tb002 INTO lv_grouping_descr
                     WHERE  spras     = sy-langu
                     AND    bu_group  = ls_tbc001-bu_group.


              CONCATENATE
              ls_tbc001-bu_group
              lv_grouping_descr
              '->'
              ls_tbc001-ktokk
              lv_account_group_descr
              INTO gs_item-text SEPARATED BY space.


              CASE ls_tbc001-xsamenumber.
                WHEN 'X'.
                  CONCATENATE
                  gs_item-text
                  '/ (mit Nummerngleichheit)'(017)
                  INTO gs_item-text SEPARATED BY space.

                WHEN ' '.
                  CONCATENATE
                  gs_item-text
                  '/ (ohne Nummerngleichheit)'(018)
                  INTO gs_item-text SEPARATED BY space.

              ENDCASE.

              APPEND gs_item TO gt_item_table.

              CALL METHOD add_push_button.

              CALL METHOD add_node
                EXPORTING
                  node_key          = lv_key
                  relative_node_key = iv_key
                  relationship      = cl_list_tree_model=>relat_last_child
                  isfolder          = ' '
                  item_table        = gt_item_table.

            ENDLOOP.

        ENDCASE.


      WHEN gc_customer.

        ls_main2-view          = 'CVIV_CUST_TO_BP1'.

        SELECT * FROM cvic_cust_to_bp1 INTO TABLE lt_cvic_cust_to_bp1.

        LOOP AT lt_cvic_cust_to_bp1 INTO ls_cvic_cust_to_bp1.

          ls_main2-account_group = ls_cvic_cust_to_bp1-account_group.
          ls_main2-grouping      = ls_cvic_cust_to_bp1-grouping.
          lv_key = ls_main2.


          CLEAR: gs_item, gt_item_table.
          gs_item-item_name = gc_item_name_text.
          gs_item-class     = cl_gui_list_tree=>item_class_text.
          gs_item-alignment = cl_gui_list_tree=>align_auto.
          gs_item-font      = cl_gui_list_tree=>item_font_prop.


          CLEAR lv_account_group_descr.
          SELECT SINGLE txt30 FROM  t077x INTO lv_account_group_descr
                 WHERE  spras  = sy-langu
                 AND    ktokd  = ls_cvic_cust_to_bp1-account_group.


          CLEAR lv_grouping_descr.
          SELECT SINGLE txt40 FROM  tb002 INTO lv_grouping_descr
                 WHERE  spras     = sy-langu
                 AND    bu_group  = ls_cvic_cust_to_bp1-grouping.


          CONCATENATE
          ls_cvic_cust_to_bp1-account_group
          lv_account_group_descr
          '->'
          ls_cvic_cust_to_bp1-grouping
          lv_grouping_descr
          INTO gs_item-text SEPARATED BY space.


          CASE ls_cvic_cust_to_bp1-same_number.
            WHEN 'X'.
              CONCATENATE
              gs_item-text
              '/ (mit Nummerngleichheit)'(017)
              INTO gs_item-text SEPARATED BY space.

            WHEN ' '.
              CONCATENATE
              gs_item-text
              '/ (ohne Nummerngleichheit)'(018)
              INTO gs_item-text SEPARATED BY space.

          ENDCASE.

          APPEND gs_item TO gt_item_table.

          CALL METHOD add_push_button.

          CALL METHOD add_node
            EXPORTING
              node_key          = lv_key
              relative_node_key = iv_key
              relationship      = cl_list_tree_model=>relat_last_child
              isfolder          = ' '
              item_table        = gt_item_table.

        ENDLOOP.

      WHEN gc_vendor.

        ls_main2-view          = 'CVIV_VEND_TO_BP1'.


        SELECT * FROM cvic_vend_to_bp1 INTO TABLE lt_cvic_vend_to_bp1.

        LOOP AT lt_cvic_vend_to_bp1 INTO ls_cvic_vend_to_bp1.

          ls_main2-account_group = ls_cvic_vend_to_bp1-account_group.
          ls_main2-grouping      = ls_cvic_vend_to_bp1-grouping.
          lv_key = ls_main2.


          CLEAR: gs_item, gt_item_table.
          gs_item-item_name = gc_item_name_text.
          gs_item-class     = cl_gui_list_tree=>item_class_text.
          gs_item-alignment = cl_gui_list_tree=>align_auto.
          gs_item-font      = cl_gui_list_tree=>item_font_prop.


          CLEAR lv_account_group_descr.
          SELECT SINGLE txt30 FROM  t077y INTO lv_account_group_descr
                 WHERE  spras  = sy-langu
                 AND    ktokk  = ls_cvic_vend_to_bp1-account_group.



          CLEAR lv_grouping_descr.
          SELECT SINGLE txt40 FROM  tb002 INTO lv_grouping_descr
                 WHERE  spras     = sy-langu
                 AND    bu_group  = ls_cvic_vend_to_bp1-grouping.


          CONCATENATE
          ls_cvic_vend_to_bp1-account_group
          lv_account_group_descr
          '->'
          ls_cvic_vend_to_bp1-grouping
          lv_grouping_descr
          INTO gs_item-text SEPARATED BY space.


          CASE ls_cvic_vend_to_bp1-same_number.
            WHEN 'X'.
              CONCATENATE
              gs_item-text
              '/ (mit Nummerngleichheit)'(017)
              INTO gs_item-text SEPARATED BY space.

            WHEN ' '.
              CONCATENATE
              gs_item-text
              '/ (ohne Nummerngleichheit)'(018)
              INTO gs_item-text SEPARATED BY space.

          ENDCASE.

          APPEND gs_item TO gt_item_table.

          CALL METHOD add_push_button.

          CALL METHOD add_node
            EXPORTING
              node_key          = lv_key
              relative_node_key = iv_key
              relationship      = cl_list_tree_model=>relat_last_child
              isfolder          = ' '
              item_table        = gt_item_table.

        ENDLOOP.

    ENDCASE.


  ENDMETHOD.                    "add_main_node2_options_gro_rec
*----------------------------------------------------------------------*
  METHOD handle_button_click.

    DATA: lv_view TYPE vim_name,
          lv_objecttype TYPE ob_typ.


    CASE node_key(1).
      WHEN '1'.
        ls_main1 = node_key.
        IF ls_main1-view IS INITIAL.
          RETURN.
        ELSE.
          lv_view = ls_main1-view.
        ENDIF.
      WHEN '2'.
        ls_main2 = node_key.
        IF ls_main2-view IS INITIAL.
          RETURN.
        ELSE.
          lv_view = ls_main2-view.
        ENDIF.
      WHEN OTHERS.
        RETURN.
    ENDCASE.



    IF lv_view = 'VC_TP038M'.
      lv_objecttype  = 'C'.
    ELSE.
      lv_objecttype  = 'V'.
    ENDIF.

    CALL FUNCTION 'OBJECT_MAINTENANCE_CALL'
      EXPORTING
        objectname                     = lv_view
        objecttype                     = lv_objecttype
      EXCEPTIONS
        interface_not_correct          = 1
        transaction_not_maintained     = 2
        transaction_not_found          = 3
        table_not_activ                = 4
        table_not_found                = 5
        subobject_not_found_in_project = 6
        subobject_not_found_in_guide   = 7
        object_not_found_in_project    = 8
        object_not_found_in_guide      = 9
        table_has_no_object_in_project = 10
        table_has_no_object_in_guide   = 11
        outline_not_found              = 12
        call_transaction_recurring     = 13
        system_failure                 = 14
        OTHERS                         = 99.

    IF sy-subrc <> 0.
      MESSAGE x004(cvi_tools_support) WITH 'OBJECT_MAINTENANCE_CALL'.
    ENDIF.



  ENDMETHOD.                    "handle_button_click
*----------------------------------------------------------------------*
  METHOD print.

    DATA: lv_title TYPE string.
    lv_title = 'Überprüfung des CVI-Customizings'(044).

    CALL METHOD gr_tree->print_tree
      EXPORTING
        all_nodes            = 'X'
        title                = lv_title
        preview              = 'X'
      EXCEPTIONS
        control_not_existing = 1
        control_dead         = 2
        cntl_system_error    = 3
        failed               = 4
        OTHERS               = 99.

    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.


  ENDMETHOD.                    "print
*----------------------------------------------------------------------*
  METHOD expand_all_nodes.

    CALL METHOD gr_tree->save_expand_all_nodes.


  ENDMETHOD.                    "expand_all_nodes
*----------------------------------------------------------------------*
  METHOD collapse_all_nodes.


    CALL METHOD gr_tree->collapse_all_nodes.


  ENDMETHOD.                    "collapse_all_nodes
*----------------------------------------------------------------------*
  METHOD add_push_button.

    CLEAR: gs_item.
    gs_item-item_name = gc_push_button.
    gs_item-class     = cl_gui_list_tree=>item_class_button.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_fixed.
    gs_item-text      = 'IMG'(045).

    APPEND gs_item TO gt_item_table.

  ENDMETHOD.                    "add_push_button
*----------------------------------------------------------------------*
  METHOD check_crmc_but_call_fu.

    DATA: l_xaktv TYPE crmt_bu_xaktvfn.

    CLEAR: gs_item.


    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.

    CONCATENATE
    'Status of function'(046)
    iv_fname
    'ist zum Zeitpunkt'(047)
    iv_ztpkt
    'für das Objekt'(048)
    iv_objap
    ':'
    INTO gs_item-text SEPARATED BY space.


    SELECT SINGLE xaktv FROM  crmc_but_call_fu INTO l_xaktv
           WHERE  ztpkt  = iv_ztpkt
           AND    objap  = iv_objap
           AND    fname  = iv_fname.

    IF NOT l_xaktv IS INITIAL.
      CONCATENATE
      gs_item-text
     'aktiv'(a00)
     INTO gs_item-text SEPARATED BY space.
    ELSE.
      CONCATENATE
      gs_item-text
     'nicht aktiv'(b00)
     INTO gs_item-text SEPARATED BY space.
    ENDIF.

    APPEND gs_item TO gt_item_table.


    IF gc_show_traffic_signs = 'X'.
      CLEAR: gs_item.
      gs_item-item_name = gc_traffic_sign.
      gs_item-class      = cl_gui_list_tree=>item_class_text.
      gs_item-alignment  = cl_gui_list_tree=>align_auto.
      gs_item-font       = cl_gui_list_tree=>item_font_prop.
      gs_item-ignoreimag = 'X'.


      IF NOT l_xaktv IS INITIAL.
        gs_item-t_image = icon_green_light.
      ELSE.
        gs_item-t_image = icon_red_light.
      ENDIF.

      APPEND gs_item TO gt_item_table.
    ENDIF.


  ENDMETHOD.                    "check_CRMC_BUT_CALL_FU

*----------------------------------------------------------------------*
  METHOD main_node2_bp_outbound_comp_fu.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'BP_OUTBOUND_COMPLETION_FUNCTIONS'.
*

    ls_main2 = iv_key.
    ls_main2-area  = lc_area.
    ls_main2-view  = 'V_BUT_CALL_FU'.
    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.

    CALL METHOD check_crmc_but_call_fu
      EXPORTING
        iv_ztpkt = 'MERGE'
        iv_objap = 'BUPA'
        iv_fname = 'MERGE_BUPA_CENTRAL'.

    CONCATENATE ls_main2-free
            'MERGE'
             'BUPA'
            'MERGE_BUPA_CENTRAL'
    INTO ls_main2-free.
    lv_key = ls_main2.

    CALL METHOD add_push_button.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


    CLEAR: gs_item, gt_item_table.

    CALL METHOD check_crmc_but_call_fu
      EXPORTING
        iv_ztpkt = 'MERGE'
        iv_objap = 'BUPA'
        iv_fname = 'MERGE_BUPA_FINSERV'.


    CONCATENATE lv_key
            'MERGE'
             'BUPA'
            'MERGE_BUPA_FINSERV'
    INTO lv_key.


    CALL METHOD add_push_button.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


    CLEAR: gs_item, gt_item_table.

    CALL METHOD check_crmc_but_call_fu
      EXPORTING
        iv_ztpkt = 'MERGE'
        iv_objap = 'BUPR'
        iv_fname = 'MERGE_BUPR_CENTRAL'.

    CONCATENATE lv_key
            'MERGE'
             'BUPR'
            'MERGE_BUPR_CENTRAL'
    INTO lv_key.

    CALL METHOD add_push_button.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


  ENDMETHOD.                    "main_node2_BP_outbound_comp_fu
*----------------------------------------------------------------------*
  METHOD main_node2_bp_outbound_bas_fu.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'BP_OUTBOUND_BASIC_FUNCTIONS'.
*

    ls_main2 = iv_key.
    ls_main2-area  = lc_area.
    ls_main2-view  = 'V_BUT_CALL_FU'.
    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.

    CALL METHOD check_crmc_but_call_fu
      EXPORTING
        iv_ztpkt = 'CRMOU'
        iv_objap = 'BUPA'
        iv_fname = 'BUPA_OUTBOUND_BPS_FILL_CENTRAL'.

    CONCATENATE lv_key
            'CRMOU'
            'BUPA'
            'BUPA_OUTBOUND_BPS_FILL_CENTRAL'
    INTO ls_main2-free.
    lv_key = ls_main2.

    CALL METHOD add_push_button.



    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


    CLEAR gt_item_table.

    CALL METHOD check_crmc_but_call_fu
      EXPORTING
        iv_ztpkt = 'CRMOU'
        iv_objap = 'BUPR'
        iv_fname = 'BUPA_OUTBOUND_BPR_FILL_CENTRAL'.

    CALL METHOD add_push_button.

    CONCATENATE lv_key
            'CRMOU'
            'BUPR'
            'BUPA_OUTBOUND_BPR_FILL_CENTRAL'
    INTO ls_main2-free.
    lv_key = ls_main2.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


  ENDMETHOD.                    "main_node2_BP_outbound_bas_fu
*----------------------------------------------------------------------*
  METHOD add_main_node2_cust_contact.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'CUST_CONTACT'.
*

    ls_main2 = iv_key.
    ls_main2-area  = lc_area.
    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    gs_item-text      = 'Synchronisation von Kontaktpersonen'(049).
    APPEND gs_item TO gt_item_table.


    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = 'X'
        item_table        = gt_item_table.


    CALL METHOD main_node2_cust_contact_ind
      EXPORTING
        iv_key = lv_key.


    CALL METHOD main_node2_cust_contact_ind_v
      EXPORTING
        iv_key = lv_key.





  ENDMETHOD.                    "add_main_node2_BP_outbound
*----------------------------------------------------------------------*
  METHOD main_node2_cust_contact_ind.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'CUST_CONTACT_INDICATOR'.
*

    gv_counter = gv_counter + 1.

    ls_main1 = iv_key.
    ls_main1-ident   = '1'.
    ls_main1-area    = lc_area.
    ls_main1-view    = 'CVIV_MAP_CONTACT'.
    ls_main1-counter = gv_counter.
    lv_key = ls_main1.


    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.

    CASE gv_contact_person_mapping_act.
      WHEN 'X'.
        gs_item-text = 'Kontaktpersonen-Synchronisation ist aktiv'(020).
      WHEN ' '.
        gs_item-text = 'Kontaktpersonen-Synchronisation ist nicht aktiv'(021).
    ENDCASE.

    APPEND gs_item TO gt_item_table.

    CALL METHOD add_push_button.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


  ENDMETHOD.                    "main_node2_cust_contact_ind
*----------------------------------------------------------------------*
  METHOD main_node2_cust_contact_ind_v.
*
    CONSTANTS: lc_area TYPE lty_area VALUE 'CUST_CONTACT_INDICATOR_VIEWS'.
*
    DATA: lv_key TYPE string.

    DATA: lv_test TYPE tv_image.
    DATA: ls_cvic_cp1_link TYPE cvic_cp1_link,
          ls_cvic_cp2_link TYPE cvic_cp2_link,
          ls_cvic_cp3_link TYPE cvic_cp3_link,
          ls_cvic_cp4_link TYPE cvic_cp4_link.

    DATA: lv_okay(1).

*

    IF gv_contact_person_mapping_act = ''.
      RETURN.
    ENDIF.


    gv_counter = gv_counter + 1.

    ls_main1 = iv_key.
    ls_main1-ident   = '1'.
    ls_main1-area    = lc_area.
    ls_main1-view    = 'CVIV_CP1_LINK'.
    ls_main1-counter = gv_counter.
    lv_key = ls_main1.


    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.

    CLEAR ls_cvic_cp1_link.
    SELECT SINGLE * FROM  cvic_cp1_link INTO ls_cvic_cp1_link
           WHERE abtnr    LIKE '%'
           AND   gp_abtnr LIKE '%'.                         "#EC *

    IF sy-subrc = 0.
      gs_item-text = 'Status der Mapping-Tabelle für Abteilungen: Einträge vorhanden'(022).
      lv_okay = 'X'.
    ELSE.
      gs_item-text = 'Status der Mapping-Tabelle für Abteilungen: Keine Einträge vorhanden'(023).
      lv_okay = ' '.
    ENDIF.

    APPEND gs_item TO gt_item_table.

    CALL METHOD add_push_button.

    IF lv_okay = ' '.
      IF gv_contact_person_mapping_act = 'X'.
        lv_test = icon_yellow_light.
        CALL METHOD add_icon
          EXPORTING
            iv_image = lv_test.
      ENDIF.
    ELSE.
      IF gv_contact_person_mapping_act = ' '.
        lv_test = icon_yellow_light.
        CALL METHOD add_icon
          EXPORTING
            iv_image = lv_test.
      ENDIF.
    ENDIF.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


    ls_main1-view   = 'CVIV_CP2_LINK'.
    lv_key = ls_main1.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.

    CLEAR ls_cvic_cp2_link.
    SELECT SINGLE * FROM  cvic_cp2_link INTO ls_cvic_cp2_link
           WHERE  pafkt LIKE '%'
           AND gp_pafkt LIKE '%'.                           "#EC *

    IF sy-subrc = 0.
      gs_item-text = 'Status der Mapping-Tabelle für Funktionen: Einträge vorhanden'(024).
      lv_okay = 'X'.
    ELSE.
      gs_item-text = 'Status der Mapping-Tabelle für Funktionen: Keine Einträge vorhanden'(025).
      lv_okay = ' '.
    ENDIF.

    APPEND gs_item TO gt_item_table.

    CALL METHOD add_push_button.

    IF lv_okay = ' '.
      IF gv_contact_person_mapping_act = 'X'.
        lv_test = icon_yellow_light.
        CALL METHOD add_icon
          EXPORTING
            iv_image = lv_test.
      ENDIF.
    ELSE.
      IF gv_contact_person_mapping_act = ' '.
        lv_test = icon_yellow_light.
        CALL METHOD add_icon
          EXPORTING
            iv_image = lv_test.
      ENDIF.
    ENDIF.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.



    ls_main1-view   = 'CVIV_CP3_LINK'.
    lv_key = ls_main1.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.


    CLEAR ls_cvic_cp3_link.
    SELECT SINGLE * FROM  cvic_cp3_link INTO ls_cvic_cp3_link
           WHERE parvo  LIKE '%'
           AND   paauth LIKE '%'.                           "#EC *

    IF sy-subrc = 0.
      gs_item-text = 'Status der Mapping-Tabelle für Vollmachten: Einträge vorhanden'(026).
      lv_okay = 'X'.
    ELSE.
      gs_item-text = 'Status der Mapping-Tabelle für Vollmachten: Keine Einträge vorhanden'(027).
      lv_okay = ' '.
    ENDIF.

    APPEND gs_item TO gt_item_table.

    CALL METHOD add_push_button.

    IF lv_okay = ' '.
      IF gv_contact_person_mapping_act = 'X'.
        lv_test = icon_yellow_light.
        CALL METHOD add_icon
          EXPORTING
            iv_image = lv_test.
      ENDIF.
    ELSE.
      IF gv_contact_person_mapping_act = ' '.
        lv_test = icon_yellow_light.
        CALL METHOD add_icon
          EXPORTING
            iv_image = lv_test.
      ENDIF.
    ENDIF.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


    ls_main1-view   = 'CVIV_CP4_LINK'.
    lv_key = ls_main1.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.


    CLEAR ls_cvic_cp4_link.
    SELECT SINGLE * FROM  cvic_cp4_link INTO ls_cvic_cp4_link
           WHERE  pavip    LIKE '%'
           AND    gp_pavip LIKE '%'.                        "#EC *

    IF sy-subrc = 0.
      gs_item-text = 'Status der Mapping-Tabelle für VIP-Kennzeichen: Einträge vorhanden'(028).
      lv_okay = 'X'.
    ELSE.
      gs_item-text = 'Status der Mapping-Tabelle für VIP-Kennzeichen: Keine Einträge vorhanden'(029).
      lv_okay = ' '.
    ENDIF.

    APPEND gs_item TO gt_item_table.

    CALL METHOD add_push_button.

    IF lv_okay = ' '.
      IF gv_contact_person_mapping_act = 'X'.
        lv_test = icon_yellow_light.
        CALL METHOD add_icon
          EXPORTING
            iv_image = lv_test.
      ENDIF.
    ELSE.
      IF gv_contact_person_mapping_act = ' '.
        lv_test = icon_yellow_light.
        CALL METHOD add_icon
          EXPORTING
            iv_image = lv_test.
      ENDIF.
    ENDIF.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


  ENDMETHOD.                    "main_node2_cust_contact_ind_v
*----------------------------------------------------------------------*
  METHOD add_icon.

    IF gc_show_traffic_signs = ''.
      RETURN.
    ENDIF.

    CLEAR: gs_item.
    gs_item-item_name = gc_traffic_sign.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-t_image   = iv_image.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.

    APPEND gs_item TO gt_item_table.


  ENDMETHOD.                    "add_icon
*----------------------------------------------------------------------*
  METHOD add_main_node2_bte_outbound.

    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'BTE'.
*

    ls_main2               = iv_key.
    ls_main2-area          = lc_area.
    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.

    CASE ls_main2-object.
      WHEN gc_customer.
        gs_item-text = 'CVI-Implementierung des BTE 1321 für die Synchronisation ist'(032).
      WHEN gc_vendor.
        gs_item-text = 'CVI-Implementierung des BTE 1421 für die Synchronisation ist'(033).
      WHEN OTHERS.
        RETURN.
    ENDCASE.

    APPEND gs_item TO gt_item_table.


    CLEAR: gs_item.
    gs_item-item_name = '4'.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.

    DATA: ls_tbe31 TYPE tbe31.
    DATA: lv_test TYPE tv_image.

    CASE ls_main2-object.
      WHEN gc_customer.

        SELECT SINGLE * FROM  tbe31 INTO ls_tbe31
               WHERE  event  = '00001321'
               AND    land   = ''
               AND    applk  = ''
               AND    funct = 'CMD_CUSTOMER_BTE_1321_IMPL'.

        IF sy-subrc = 0.
          gs_item-text = 'aktiv '(a00).
          APPEND gs_item TO gt_item_table.
          lv_test = icon_green_light.
          CALL METHOD add_icon
            EXPORTING
              iv_image = lv_test.
        ELSE.
          gs_item-text = 'nicht aktiv'(b00).
          APPEND gs_item TO gt_item_table.
          lv_test = icon_red_light.
          CALL METHOD add_icon
            EXPORTING
              iv_image = lv_test.
        ENDIF.

      WHEN gc_vendor.

        SELECT SINGLE * FROM  tbe31 INTO ls_tbe31
               WHERE  event  = '00001421'
               AND    land   = ''
               AND    applk  = ''
               AND    funct = 'VMD_VENDOR_BTE_1421_IMPL'.

        IF sy-subrc = 0.
          gs_item-text = 'aktiv'(a00).
          APPEND gs_item TO gt_item_table.
          lv_test = icon_green_light.
          CALL METHOD add_icon
            EXPORTING
              iv_image = lv_test.
        ELSE.
          gs_item-text = 'nicht aktiv'(b00).
          APPEND gs_item TO gt_item_table.
          lv_test = icon_red_light.
          CALL METHOD add_icon
            EXPORTING
              iv_image = lv_test.
        ENDIF.

      WHEN OTHERS.

        RETURN.

    ENDCASE.


    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


  ENDMETHOD.                    "add_main_node2_bte_outbound
*----------------------------------------------------------------------*
  METHOD add_main_node2_options_wf.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'WF_OPTION'.
*
    DATA: ls_mdsc_ppo_wf_user TYPE mdsc_ppo_wf_user.        "#EC NEEDED
*

    ls_main2 = iv_key.
    ls_main2-area          = lc_area.
    ls_main2-object        = iv_source_obj.
    ls_main2-source_object = iv_source_obj.
    ls_main2-target_object = iv_target_obj.
    ls_main2-view = 'MDSV_PPO_WF_USER'.
    ls_main2-free = iv_business_process.
    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.

    DATA: lv_help TYPE char01.

    CLEAR ls_mdsc_ppo_wf_user.
    SELECT SINGLE * FROM  mdsc_ppo_wf_user INTO ls_mdsc_ppo_wf_user
           WHERE  business_process  = iv_business_process.  "#EC *

    IF sy-subrc = 0.
      gs_item-text = 'Mindestens ein Empfänger für Nachbearbeitungs-Workflows ist gepflegt'(053).
    ELSE.
      gs_item-text = 'Kein Empfänger für Nachbearbeitungs-Workflow ist gepflegt'(054).
      lv_help = 'X'.
    ENDIF.

    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    APPEND gs_item TO gt_item_table.

    CALL METHOD add_push_button.


    IF lv_help = 'X' AND iv_ppo_active = 'X'.
      CLEAR: gs_item.
      gs_item-item_name = gc_traffic_sign.
      gs_item-class     = cl_gui_list_tree=>item_class_text.
      gs_item-alignment = cl_gui_list_tree=>align_auto.
      gs_item-font      = cl_gui_list_tree=>item_font_prop.
      CLEAR gs_item-text.
      gs_item-t_image = icon_yellow_light.

      APPEND gs_item TO gt_item_table.

    ENDIF.


    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_header_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.

    CLEAR gt_item_table.


  ENDMETHOD.                    "add_main_node2_options_PPO
*----------------------------------------------------------------------*
  METHOD add_node.

    CALL METHOD gr_tree->add_node
      EXPORTING
        node_key                = node_key
        relative_node_key       = relative_node_key
        relationship            = relationship
        isfolder                = isfolder
        item_table              = item_table
      EXCEPTIONS
        node_key_exists         = 1
        node_key_empty          = 2
        illegal_relationship    = 3
        relative_node_not_found = 4
        error_in_item_table     = 5
        OTHERS                  = 99.

    IF sy-subrc <> 0.
      MESSAGE x003(cvi_tools_support) WITH 'ADD_NODE'.
    ENDIF.

  ENDMETHOD.                    "add_node
*----------------------------------------------------------------------*
  METHOD add_main_node2_options_roles.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'ROLES'.
*
    DATA: ls_tbd002 TYPE tbd002,
          ls_tbc002 TYPE tbc002.
    DATA: ls_cvic_cust_to_bp2 TYPE cvic_cust_to_bp2,
          ls_cvic_vend_to_bp2 TYPE cvic_vend_to_bp2.
*
    ls_main2 = iv_key.
    ls_main2-area          = lc_area.
    ls_main2-object        = iv_source_obj.
    ls_main2-source_object = iv_source_obj.
    ls_main2-target_object = iv_target_obj.
    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.

    CASE iv_source_obj.
      WHEN gc_bp.
        gs_item-text = 'Geschäftspartner: Rollenzusatzdefinition'(055).

        CASE iv_target_obj.
          WHEN gc_customer.
            ls_main2-view = 'V_TBD002'.

            SELECT SINGLE * FROM tbd002 INTO ls_tbd002.
            IF sy-subrc = 0.
              IF gc_show_traffic_signs = 'X'.
                gs_item-t_image = icon_yellow_light.
              ENDIF.
              CONCATENATE gs_item-text 'entries existing'(062) INTO
              gs_item-text SEPARATED BY space.
            ELSE.
              IF gc_show_traffic_signs = 'X'.
                gs_item-t_image = icon_red_light.
              ENDIF.
              CONCATENATE gs_item-text 'no entries existing'(063) INTO
              gs_item-text SEPARATED BY space.
            ENDIF.


          WHEN gc_vendor.
            ls_main2-view = 'V_TBC002'.

            SELECT SINGLE * FROM tbc002 INTO ls_tbc002.
            IF sy-subrc = 0.
              IF gc_show_traffic_signs = 'X'.
                gs_item-t_image = icon_yellow_light.
              ENDIF.
              CONCATENATE gs_item-text 'entries existing'(062) INTO
              gs_item-text SEPARATED BY space.
            ELSE.
              IF gc_show_traffic_signs = 'X'.
                gs_item-t_image = icon_red_light.
              ENDIF.
              CONCATENATE gs_item-text 'no entries existing'(063) INTO
              gs_item-text SEPARATED BY space.
            ENDIF.
        ENDCASE.

        lv_key = ls_main2.

        APPEND gs_item TO gt_item_table.

        CALL METHOD add_push_button.

        CALL METHOD add_node
          EXPORTING
            node_key          = lv_key
            relative_node_key = iv_key
            relationship      = cl_list_tree_model=>relat_last_child
            isfolder          = ' '
            item_table        = gt_item_table.


      WHEN gc_customer.
        gs_item-text = 'Zuordnungen Kontengruppen zu Geschäftspartner-Rollen:'(052).

        ls_main2-view = 'CVIV_CUST_TO_BP2'.
        lv_key = ls_main2.

        SELECT SINGLE * FROM cvic_cust_to_bp2 INTO ls_cvic_cust_to_bp2.
        IF sy-subrc = 0.
          IF gc_show_traffic_signs = 'X'.
            gs_item-t_image = icon_yellow_light.
          ENDIF.
          CONCATENATE gs_item-text 'entries existing'(062) INTO
          gs_item-text SEPARATED BY space.
        ELSE.
          IF gc_show_traffic_signs = 'X'.
            gs_item-t_image = icon_red_light.
          ENDIF.
          CONCATENATE gs_item-text 'no entries existing'(063) INTO
          gs_item-text SEPARATED BY space.
        ENDIF.

        APPEND gs_item TO gt_item_table.

        CALL METHOD add_push_button.

        CALL METHOD add_node
          EXPORTING
            node_key          = lv_key
            relative_node_key = iv_key
            relationship      = cl_list_tree_model=>relat_last_child
            isfolder          = ' '
            item_table        = gt_item_table.

      WHEN gc_vendor.
        gs_item-text = 'Zuordnungen Kontengruppen zu Geschäftspartner-Rollen:'(052).

        ls_main2-view = 'CVIV_VEND_TO_BP2'.
        lv_key = ls_main2.

        SELECT SINGLE * FROM cvic_vend_to_bp2 INTO ls_cvic_vend_to_bp2.
        IF sy-subrc = 0.
          IF gc_show_traffic_signs = 'X'.
            gs_item-t_image = icon_yellow_light.
          ENDIF.
          CONCATENATE gs_item-text 'entries existing'(062) INTO
          gs_item-text SEPARATED BY space.
        ELSE.
          IF gc_show_traffic_signs = 'X'.
            gs_item-t_image = icon_red_light.
          ENDIF.
          CONCATENATE gs_item-text 'no entries existing'(063) INTO
          gs_item-text SEPARATED BY space.
        ENDIF.



        APPEND gs_item TO gt_item_table.

        CALL METHOD add_push_button.

        CALL METHOD add_node
          EXPORTING
            node_key          = lv_key
            relative_node_key = iv_key
            relationship      = cl_list_tree_model=>relat_last_child
            isfolder          = ' '
            item_table        = gt_item_table.



      WHEN OTHERS.
        "do nothing
    ENDCASE.


  ENDMETHOD.                    "add_main_node2_options_groups
*----------------------------------------------------------------------*
  METHOD add_main_node2_options_rol_rec.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'ROL_REC'.
*
    DATA: lv_account_group_descr TYPE txt30_077t.
    DATA: lv_rltxt TYPE bu_partnerroletxt.

*

    ls_main2 = iv_key.
    ls_main2-area   = lc_area.
    ls_main2-object = iv_source_obj.
    ls_main2-source_object = iv_source_obj.
    ls_main2-target_object = iv_target_obj.


    CASE iv_source_obj.
      WHEN gc_customer.
        DATA: lt_cvic_cust_to_bp2 TYPE TABLE OF cvic_cust_to_bp2,
              ls_cvic_cust_to_bp2 TYPE          cvic_cust_to_bp2.

        ls_main2-view          = 'CVIV_CUST_TO_BP2'.

        SELECT * FROM cvic_cust_to_bp2 INTO TABLE lt_cvic_cust_to_bp2.

        LOOP AT lt_cvic_cust_to_bp2 INTO ls_cvic_cust_to_bp2.

          ls_main2-account_group = ls_cvic_cust_to_bp2-account_group.
          ls_main2-role          = ls_cvic_cust_to_bp2-role.
          lv_key = ls_main2.


          CLEAR: gs_item, gt_item_table.
          gs_item-item_name = gc_item_name_text.
          gs_item-class     = cl_gui_list_tree=>item_class_text.
          gs_item-alignment = cl_gui_list_tree=>align_auto.
          gs_item-font      = cl_gui_list_tree=>item_font_prop.


          CLEAR lv_account_group_descr.
          SELECT SINGLE txt30 FROM  t077x INTO lv_account_group_descr
                 WHERE  spras  = sy-langu
                 AND    ktokd  = ls_cvic_cust_to_bp2-account_group.


          CLEAR lv_rltxt.
          SELECT SINGLE rltxt FROM  tb003t INTO lv_rltxt
                 WHERE  spras  = sy-langu
                 AND    role   = ls_cvic_cust_to_bp2-role.


          CONCATENATE
          ls_cvic_cust_to_bp2-account_group
          lv_account_group_descr
          '->'
          ls_cvic_cust_to_bp2-role
          lv_rltxt
          INTO gs_item-text SEPARATED BY space.


          APPEND gs_item TO gt_item_table.

          CALL METHOD add_push_button.

          CALL METHOD add_node
            EXPORTING
              node_key          = lv_key
              relative_node_key = iv_key
              relationship      = cl_list_tree_model=>relat_last_child
              isfolder          = ' '
              item_table        = gt_item_table.

        ENDLOOP.

      WHEN gc_vendor.
        DATA: lt_cvic_vend_to_bp2 TYPE TABLE OF cvic_vend_to_bp2,
              ls_cvic_vend_to_bp2 TYPE          cvic_vend_to_bp2.

        ls_main2-view          = 'CVIV_VEND_TO_BP2'.

        SELECT * FROM cvic_vend_to_bp2 INTO TABLE lt_cvic_vend_to_bp2.

        LOOP AT lt_cvic_vend_to_bp2 INTO ls_cvic_vend_to_bp2.

          ls_main2-account_group = ls_cvic_vend_to_bp2-account_group.
          ls_main2-role          = ls_cvic_vend_to_bp2-role.
          lv_key = ls_main2.


          CLEAR: gs_item, gt_item_table.
          gs_item-item_name = gc_item_name_text.
          gs_item-class     = cl_gui_list_tree=>item_class_text.
          gs_item-alignment = cl_gui_list_tree=>align_auto.
          gs_item-font      = cl_gui_list_tree=>item_font_prop.


          CLEAR lv_account_group_descr.
          SELECT SINGLE txt30 FROM  t077y INTO lv_account_group_descr
                 WHERE  spras  = sy-langu
                 AND    ktokk  = ls_cvic_vend_to_bp2-account_group.


          CLEAR lv_rltxt.
          SELECT SINGLE rltxt FROM  tb003t INTO lv_rltxt
                 WHERE  spras  = sy-langu
                 AND    role   = ls_cvic_vend_to_bp2-role.


          CONCATENATE
          ls_cvic_vend_to_bp2-account_group
          lv_account_group_descr
          '->'
          ls_cvic_vend_to_bp2-role
          lv_rltxt
          INTO gs_item-text SEPARATED BY space.


          APPEND gs_item TO gt_item_table.

          CALL METHOD add_push_button.

          CALL METHOD add_node
            EXPORTING
              node_key          = lv_key
              relative_node_key = iv_key
              relationship      = cl_list_tree_model=>relat_last_child
              isfolder          = ' '
              item_table        = gt_item_table.

        ENDLOOP.

    ENDCASE.


  ENDMETHOD.                    "add_main_node2_options_rol_rec
*----------------------------------------------------------------------*
  METHOD add_main_node2_cust_pay_cards.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'CUST_PAY_CARD'.
*

    ls_main2 = iv_key.
    ls_main2-area  = lc_area.
    lv_key = ls_main2.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    gs_item-text      = 'Mapping von Zahlkarten'(057).
    APPEND gs_item TO gt_item_table.


    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = 'X'
        item_table        = gt_item_table.


    CALL METHOD main_node2_cust_pay_card_rec
      EXPORTING
        iv_key = lv_key.


  ENDMETHOD.                    "add_main_node2_cust_pay_cards
*----------------------------------------------------------------------*
  METHOD main_node2_cust_pay_card_rec.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'CUST_PAY_CARD'.
*

    ls_main1 = iv_key.
    ls_main1-ident = '1'.
    ls_main1-area  = lc_area.
    ls_main1-view  = 'CVIV_CCID_LINK'.
    lv_key = ls_main1.


    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.


    DATA: ls_cvic_ccid_link TYPE cvic_ccid_link.

    SELECT SINGLE * FROM  cvic_ccid_link INTO ls_cvic_ccid_link
           WHERE  pcid_bp  LIKE '%'
           AND    ccins    LIKE '%'.                        "#EC *

    IF sy-subrc = 0.
      gs_item-text = 'Status der Mapping-Tabelle für Zahlkarten: Einträge vorhanden'(060).
    ELSE.
      gs_item-text = 'Status der Mapping-Tabelle für Zahlkarten: Keine Einträge vorhanden'(061).
    ENDIF.

    APPEND gs_item TO gt_item_table.

    CALL METHOD add_push_button.


    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


  ENDMETHOD.                    "main_node2_cust_pay_card_rec
*----------------------------------------------------------------------*
  METHOD init.

    SELECT SINGLE ppo_active FROM  mdsc_ctrl_objppo INTO gv_ppo_for_bp_active
           WHERE  sync_object  = gc_bp.


    CALL METHOD mds_ctrl_customizing=>object_types_read
      IMPORTING
        et_object_types = gt_object_types.

    DELETE gt_object_types WHERE sync_object <> gc_bp
                           AND   sync_object <> gc_customer
                           AND   sync_object <> gc_vendor.


    CALL METHOD mds_ctrl_customizing=>all_steps_read
      IMPORTING
        et_act_sync_opts = gt_options.


    SELECT SINGLE map_contact FROM  cvic_map_contact INTO gv_contact_person_mapping_act
           WHERE  map_contact  = 'X'.



  ENDMETHOD.                    "init
*----------------------------------------------------------------------*
  METHOD refresh.

    CALL METHOD gr_tree->delete_all_nodes.

    CALL METHOD init.

    CALL METHOD init_tree.

  ENDMETHOD.                    "refresh
*----------------------------------------------------------------------*
  METHOD add_main_node1_mapping.

*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'GENERAL_MAPPING'.
*

    ls_main1 = iv_key.
    ls_main1-ident = '1'.
    ls_main1-area  = lc_area.
    lv_key = ls_main1.


    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    gs_item-text      = 'Allgemeines Mapping'(065).
    APPEND gs_item TO gt_item_table.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = 'X'
        item_table        = gt_item_table.


    CALL METHOD add_main_node1_mapping_branch
      EXPORTING
        iv_key = lv_key.


    CALL METHOD main_node2_cust_vend_views
      EXPORTING
        iv_key = lv_key.


  ENDMETHOD.                    "add_main_node1_BADIS
*----------------------------------------------------------------------*
  METHOD add_main_node1_mapping_branch.
*
    DATA: lv_key TYPE string.
    CONSTANTS: lc_area TYPE lty_area VALUE 'GENERAL_MAPPING_BRANCH'.
*

    ls_main1 = iv_key.
    ls_main1-ident = '1'.
    ls_main1-area  = lc_area.
    ls_main1-view  = 'VC_TP038M'.
    lv_key = ls_main1.


    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.
    gs_item-text      = 'Branchen-Mapping'(058).

    APPEND gs_item TO gt_item_table.

    CALL METHOD add_push_button.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


  ENDMETHOD.                    "add_main_node1_PPO_status
*----------------------------------------------------------------------*
  METHOD main_node2_cust_vend_views.
*
    CONSTANTS: lc_area TYPE lty_area VALUE 'CUST_VEND_VIEWS'.
*
    DATA: lv_key TYPE string.

    DATA: lv_test TYPE tv_image.

    DATA: lv_okay(1).

    DATA: ls_cvic_legform_lnk TYPE cvic_legform_lnk.
*


    gv_counter = gv_counter + 1.

    ls_main1 = iv_key.
    ls_main1-ident   = '1'.
    ls_main1-area    = lc_area.
    ls_main1-counter = gv_counter.
    ls_main1-view   = 'CVIV_LEGFORM_LNK'.
    lv_key = ls_main1.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.


    SELECT SINGLE * FROM  cvic_legform_lnk INTO ls_cvic_legform_lnk
           WHERE  gform      LIKE '%'
           AND    legal_enty LIKE '%'.                      "#EC *

    IF sy-subrc = 0.
      gs_item-text = 'Status der Mapping-Tabelle für Rechtsformen: Einträge vorhanden'(030).
      lv_okay = 'X'.
    ELSE.
      gs_item-text = 'Status der Mapping-Tabelle für Rechtsformen: Keine Einträge vorhanden'(031).
      lv_okay = ' '.
    ENDIF.

    APPEND gs_item TO gt_item_table.

    CALL METHOD add_push_button.

    IF lv_okay = ' '.
      lv_test = icon_yellow_light.
      CALL METHOD add_icon
        EXPORTING
          iv_image = lv_test.
    ELSE.
      lv_test = icon_yellow_light.
      CALL METHOD add_icon
        EXPORTING
          iv_image = lv_test.

    ENDIF.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


    ls_main1-view   = 'CVIV_MARST_LINK'.
    lv_key = ls_main1.

    CLEAR: gs_item, gt_item_table.
    gs_item-item_name = gc_item_name_text.
    gs_item-class     = cl_gui_list_tree=>item_class_text.
    gs_item-alignment = cl_gui_list_tree=>align_auto.
    gs_item-font      = cl_gui_list_tree=>item_font_prop.


    DATA: ls_cvic_marst_link TYPE cvic_marst_link.
    SELECT SINGLE * FROM  cvic_marst_link INTO ls_cvic_marst_link
           WHERE  famst LIKE '%'
           AND    marst LIKE '%'.                           "#EC *

    IF sy-subrc = 0.
      gs_item-text = 'Status der Mapping-Tabelle für Familienstand: Einträge vorhanden'(050).
      lv_okay = 'X'.
    ELSE.
      gs_item-text = 'Status der Mapping-Tabelle für Familienstand: Keine Einträge vorhanden'(051).
      lv_okay = ' '.
    ENDIF.

    APPEND gs_item TO gt_item_table.

    CALL METHOD add_push_button.

    IF lv_okay = ' '.
      IF gv_contact_person_mapping_act = 'X'.
        lv_test = icon_yellow_light.
        CALL METHOD add_icon
          EXPORTING
            iv_image = lv_test.
      ENDIF.
    ELSE.
      IF gv_contact_person_mapping_act = ' '.
        lv_test = icon_yellow_light.
        CALL METHOD add_icon
          EXPORTING
            iv_image = lv_test.
      ENDIF.
    ENDIF.

    CALL METHOD add_node
      EXPORTING
        node_key          = lv_key
        relative_node_key = iv_key
        relationship      = cl_list_tree_model=>relat_last_child
        isfolder          = ' '
        item_table        = gt_item_table.


  ENDMETHOD.                    "main_node2_cust_views



ENDCLASS.                    "lcl_application IMPLEMENTATION
*******************************************************************************************************************
INCLUDE cvi_customizing_check_creato01.

INCLUDE cvi_customizing_check_exiti01.

INCLUDE cvi_customizing_check_statuo01.

INCLUDE cvi_customizing_check_user_i01.
