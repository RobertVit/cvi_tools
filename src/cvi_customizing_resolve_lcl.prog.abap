*&---------------------------------------------------------------------*
*&  Include           CVI_CUSTOMIZING_RESOLVE_LCL
*&---------------------------------------------------------------------*
 CLASS lcl_cvi_customizing_resolve DEFINITION.

   PUBLIC SECTION.
     DATA:
       mt_fcat             TYPE lvc_t_fcat,
       display_mode        TYPE sap_bool,
       "D- Only Readonly Mode, E-Editable Mode, R- Ready for Input,
       "A - Readonly but with all applicable toolbar
       node_key            TYPE tv_nodekey,
       item_name           TYPE tv_itmname,
       field_map_out_to_in TYPE cl_cvi_customizing_resolve=>tt_field_mapping_out_to_in,
       dropdown_values     TYPE lvc_t_drop,
       data                TYPE REF TO data, " ALV Data
       data_comp_type      TYPE rs38l_typ,
       logs                TYPE cl_cvi_customizing_resolve=>tt_log,
*       save_logs           TYPE cl_cvi_customizing_resolve=>tt_log,
       inconsistent_logs   TYPE cl_cvi_customizing_resolve=>tt_log,
       event(30)           TYPE c,
       func_exclude        TYPE ui_functions,
       layout_details      TYPE lvc_s_layo,
       layout_log          TYPE lvc_s_layo,
       fcat_log            TYPE lvc_t_fcat,
       fcat_details        TYPE lvc_t_fcat.

     METHODS:
       "To prepare field catalog for all ALV's
       prepare_field_catalog
         IMPORTING iv_scenario TYPE char12
         EXPORTING et_fcat     TYPE lvc_t_fcat
                   es_layo     TYPE lvc_s_layo,

       "Method to control the link click events of ALV
       handle_link_click
       FOR EVENT link_click
                   OF cl_gui_list_tree
         IMPORTING node_key item_name,

       "Control the edit tool baar as required based on node
       handle_edit_toolbar FOR EVENT toolbar OF cl_gui_alv_grid
         IMPORTING e_object e_interactive,

       "method to handle the data change
       handle_data_changed
                   FOR EVENT data_changed OF cl_gui_alv_grid
         IMPORTING er_data_changed,

       "Handle user command's for processing
       handle_user_command
                   FOR EVENT user_command OF cl_gui_alv_grid
         IMPORTING e_ucomm,
       set_data_alv_toolbar,

       " To control F4
       handle_on_f4 FOR EVENT onf4 OF cl_gui_alv_grid
         IMPORTING e_fieldname e_fieldvalue es_row_no er_event_data,

       "Method to navigate to the respective customizing
       show_customizing
         IMPORTING iv_scenario TYPE char12,
       handle_data_changed_finished  FOR EVENT data_changed_finished
         OF cl_gui_alv_grid.

 ENDCLASS.
