*&---------------------------------------------------------------------*
*& Include CVI_COCKPIT_TOP    Module Pool      CVI_COCKPIT
*&
*&---------------------------------------------------------------------*

"controls
CONTROLS:  ts_cockpit TYPE TABSTRIP.
"Constants
CONSTANTS: BEGIN OF gc_tabstrip_fcode, " ok-code for each tab
             validation  LIKE sy-ucomm VALUE 'VALD',
             preparation LIKE sy-ucomm VALUE 'PREP',
             cvi_load    LIKE sy-ucomm VALUE 'LOAD',
             prep_sum    LIKE sy-ucomm VALUE 'UPGD',
           END OF gc_tabstrip_fcode,

           BEGIN OF gc_fcode,
             back       TYPE sy-ucomm VALUE 'BACK',
             cancel     TYPE sy-ucomm VALUE 'CANC',
             exit       TYPE sy-ucomm VALUE 'EXIT',
             ok         TYPE sy-ucomm VALUE 'OK',
             save       TYPE sy-ucomm VALUE 'SAVE',
             click      TYPE sy-ucomm VALUE 'CLICK',
             unsync     TYPE sy-ucomm VALUE 'UNSYNC',
             help       TYPE sy-ucomm VALUE 'HELP',
             next_steps TYPE sy-ucomm VALUE 'NEXT_STEPS',
           END OF gc_fcode,

           gc_max_number_chars      TYPE i                VALUE 120,
           gc_cvi_load_program_name TYPE sy-repid         VALUE 'CVI_LOAD_TOOL',
           gc_cockpit_lock_arg      TYPE cvi_cockpit_task VALUE '*'.


DATA:BEGIN OF gs_status_pop_det, "status popup
       stage             TYPE cvi_cockpit_stage,
       task              TYPE cvi_cockpit_task,
       status            TYPE cvi_cockpit_status,
       status_text       TYPE val_text,
       status_icon       TYPE icon_d,
       comments          TYPE cvi_cockpit_comment,
       changed_by        TYPE aenam,
       changed_on        TYPE aedat,
       stage_artifact_id TYPE cvi_cockpit_artifact,
       task_artifact_id  TYPE cvi_cockpit_artifact,
       is_data_changed   TYPE sap_bool,
     END OF gs_status_pop_det,

     BEGIN OF gs_ppo_inputs, " For PPO2 input Pop-Up
       customer  TYPE char1,
       vendor    TYPE char1,
       date_from TYPE /sappo/dte_dialog_creadate,
       date_to   TYPE /sappo/dte_dialog_creadate,
     END OF gs_ppo_inputs,

     BEGIN OF gs_overall_status, "For overall status
       overall_status_icon TYPE string,
       overall_status_text TYPE string,
       cust_unsync_count   TYPE        i,
       vend_unsync_count   TYPE        i,
       text_1              TYPE c LENGTH 50,
       text_2              TYPE c LENGTH 65,
     END OF gs_overall_status,

     gv_okcode           TYPE        sy-ucomm,
     gv_subcsreen        TYPE        sy-dynnr,
     gv_repid            TYPE        sy-repid,
     gt_stage_status     TYPE        cl_cvi_cockpit=>tt_stage_details,
     gt_cockpit_log      TYPE        cl_cvi_cockpit=>tt_cockpit_log,
     gs_stage_status     TYPE        cl_cvi_cockpit=>ty_stage_details,
     gt_task_details     TYPE        cl_cvi_cockpit=>tt_task_details,
     gs_task_details     TYPE        cl_cvi_cockpit=>ty_task_details,
     gv_cursor_field     TYPE        string,
     go_editor           TYPE REF TO cl_gui_textedit,
     go_editor_container TYPE REF TO cl_gui_custom_container.
