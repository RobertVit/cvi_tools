CLASS cl_cockpit_unit_test DEFINITION DEFERRED.
CLASS cl_cvi_cockpit DEFINITION LOCAL FRIENDS cl_cockpit_unit_test.

CLASS cl_cockpit_unit_test DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
.

*?﻿<asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">
*?<asx:values>
*?<TESTCLASS_OPTIONS>
*?<TEST_CLASS>lcl_Cvi_Cockpit
*?</TEST_CLASS>
*?<TEST_MEMBER>f_Cut
*?</TEST_MEMBER>
*?<OBJECT_UNDER_TEST>CL_CVI_COCKPIT
*?</OBJECT_UNDER_TEST>
*?<OBJECT_IS_LOCAL/>
*?<GENERATE_FIXTURE>X
*?</GENERATE_FIXTURE>
*?<GENERATE_CLASS_FIXTURE>X
*?</GENERATE_CLASS_FIXTURE>
*?<GENERATE_INVOCATION>X
*?</GENERATE_INVOCATION>
*?<GENERATE_ASSERT_EQUAL>X
*?</GENERATE_ASSERT_EQUAL>
*?</TESTCLASS_OPTIONS>
*?</asx:values>
*?</asx:abap>
  PUBLIC SECTION.
    METHODS constructor.

    TYPES: BEGIN OF ty_stgtsk,
             stage     TYPE cvi_cockpit_stage,
             task      TYPE  cvi_cockpit_task,
             stgart_id TYPE cvi_cockpit_artifact,
             tskart_id TYPE cvi_cockpit_artifact,
           END OF ty_stgtsk.

    DATA : gs_stgtsk TYPE ty_stgtsk,
           gt_stgtsk TYPE TABLE OF ty_stgtsk.

  PRIVATE SECTION.
    DATA:
      f_cut TYPE REF TO cl_cvi_cockpit.  "class under test

    CLASS-METHODS: class_setup.
    CLASS-METHODS: class_teardown.
    METHODS: setup.
    METHODS: teardown.
    METHODS: determine_stage_status FOR TESTING.
    METHODS: display_logs FOR TESTING.
    METHODS: do_before_action FOR TESTING.
    METHODS: do_before_action_cvi_load FOR TESTING.
    METHODS: do_before_task_change FOR TESTING.
    METHODS: do_before_task_cng_cvi_load FOR TESTING.
    METHODS: do_navigation FOR TESTING.
    METHODS: execute_action FOR TESTING.
    METHODS: execute_info_action FOR TESTING.
    METHODS: get_data FOR TESTING.
    METHODS: get_fcodes_mapping_cvi_load FOR TESTING.
    METHODS: get_metadata FOR TESTING.
    METHODS: get_status_details FOR TESTING.
    METHODS: get_unsynchronised_records FOR TESTING.
    METHODS: maintain_navigation_mapping FOR TESTING.
    METHODS: reset_subsequent_stages FOR TESTING.
    METHODS: return_applicable_fcode FOR TESTING.
    METHODS: save FOR TESTING.
    METHODS: save_logs FOR TESTING.
    METHODS: set_applicable_fcodes FOR TESTING.
    METHODS: set_metadata FOR TESTING.


ENDCLASS.       "lcl_Cvi_Cockpit


CLASS cl_cockpit_unit_test IMPLEMENTATION.
  METHOD constructor.

    DATA: lt_task   TYPE TABLE OF cvi_ckp_task,
          ls_task   TYPE  cvi_ckp_task,
          lt_stg    TYPE TABLE OF cvi_ckp_stg,
          ls_stg    TYPE cvi_ckp_stg,
          lt_stgtsk TYPE TABLE OF cvi_ckp_stgtsk,
          ls_stgtsk TYPE  cvi_ckp_stgtsk.


    SELECT task artifact_id FROM cvi_ckp_task INTO TABLE lt_task .  "task_id
    SELECT stage artifact_id sequence FROM cvi_ckp_stg INTO TABLE lt_stg. "stg
    SELECT stage task FROM cvi_ckp_stgtsk INTO TABLE lt_stgtsk.

    LOOP AT lt_stgtsk INTO ls_stgtsk.
      READ TABLE lt_stg INTO ls_stg WITH KEY stage = ls_stgtsk-stage.
      IF sy-subrc EQ 0.
        gs_stgtsk-stgart_id = ls_stg-artifact_id.
        gs_stgtsk-stage = ls_stgtsk-stage.
      ENDIF.

      READ TABLE lt_task INTO ls_task WITH KEY task = ls_stgtsk-task.
      IF sy-subrc EQ 0.
        gs_stgtsk-task  = ls_stgtsk-task.
        gs_stgtsk-tskart_id = ls_task-artifact_id.
      ENDIF.

      APPEND gs_stgtsk TO gt_stgtsk.
    ENDLOOP.
    SORT gt_stgtsk BY stage task.

  ENDMETHOD.

  METHOD class_setup.



  ENDMETHOD.


  METHOD class_teardown.



  ENDMETHOD.
*
*
  METHOD setup.

    CREATE OBJECT f_cut.
  ENDMETHOD.


  METHOD teardown.


  ENDMETHOD.

*
  METHOD determine_stage_status.
*
**
  ENDMETHOD.
*
*
  METHOD display_logs.
*
    DATA iv_stage TYPE cvi_cockpit_stage.

    LOOP AT gt_stgtsk INTO gs_stgtsk.
      iv_stage = gs_stgtsk-stage.
      AT NEW stage.
        TEST-INJECTION logs.
          RETURN.
        END-TEST-INJECTION.
        cl_cvi_cockpit=>display_logs( iv_stage ).
      ENDAT.
    ENDLOOP.
*
  ENDMETHOD.
*
*
  METHOD do_before_action.
**
    DATA: iv_okcode TYPE syucomm,
          iv_tskart TYPE string.
    DATA iv_stage_artifact_id TYPE cvi_cockpit_artifact.
*
    LOOP AT gt_stgtsk INTO gs_stgtsk.

      CONCATENATE 'EXEC-' gs_stgtsk-tskart_id INTO iv_tskart.
      iv_okcode = iv_tskart.
      iv_stage_artifact_id = gs_stgtsk-stgart_id.
*
      cl_cvi_cockpit=>do_before_action(
          iv_okcode = iv_okcode
          iv_stage_artifact_id = iv_stage_artifact_id ).
      CLEAR : iv_tskart.

      CONCATENATE 'INFO-' gs_stgtsk-tskart_id INTO iv_tskart.
      iv_okcode = iv_tskart.
      iv_stage_artifact_id = gs_stgtsk-stgart_id.
*
      cl_cvi_cockpit=>do_before_action(
          iv_okcode = iv_okcode
          iv_stage_artifact_id = iv_stage_artifact_id ).
    ENDLOOP.

  ENDMETHOD.
*
*
  METHOD do_before_action_cvi_load.
*
    DATA: iv_okcode TYPE syucomm,
          iv_tskart TYPE string.

    LOOP AT gt_stgtsk INTO gs_stgtsk.
      CONCATENATE 'EXEC-' gs_stgtsk-tskart_id INTO iv_tskart.
      iv_okcode = iv_tskart.
      cl_cvi_cockpit=>do_before_action_cvi_load( iv_okcode ).
    ENDLOOP.
  ENDMETHOD.
*
*
  METHOD do_before_task_change.
*
    DATA is_task_details_old TYPE cl_cvi_cockpit=>ty_task_details.
    DATA is_task_details_new TYPE cl_cvi_cockpit=>ty_task_details.
*
    is_task_details_old-mandt = sy-mandt.
    is_task_details_old-task  = '07'.
    is_task_details_old-stage = '03'.
    is_task_details_old-status = '04'.
    is_task_details_old-comments = 'Completed'.
    is_task_details_old-changed_on = '20190904'.
    is_task_details_old-changed_by = 'I0000000'.
    is_task_details_old-changed_at = '065036'.
    is_task_details_old-status_text = 'Skip step (Projection decision)'.
    is_task_details_old-status_icon = '@08@'."@EB@
    is_task_details_old-task_artifact_id = 'LOAD_BLKTR'.
    is_task_details_old-stage_artifact_id = 'LOAD'.


    is_task_details_new-mandt = sy-mandt.
    is_task_details_new-task  = '07'.
    is_task_details_new-stage = '03'.
    is_task_details_new-status = '01'.
    is_task_details_new-comments = 'New'.
    is_task_details_new-changed_on = '20190904'.
    is_task_details_new-changed_by = 'I0000000'.
    is_task_details_new-changed_at = '065036'.
    is_task_details_new-status_text = 'Initial'.
    is_task_details_new-status_icon = '@EB@'.
    is_task_details_new-task_artifact_id = 'LOAD_BLKTR'.
    is_task_details_new-stage_artifact_id = 'LOAD'.
    is_task_details_new-is_changed = 'X'.

    cl_cvi_cockpit=>do_before_task_change(
        is_task_details_old = is_task_details_old
        is_task_details_new = is_task_details_new ).

  ENDMETHOD.
*
*
  METHOD do_before_task_cng_cvi_load.
*
    DATA is_task_details_old TYPE cl_cvi_cockpit=>ty_task_details.
    DATA is_task_details_new TYPE cl_cvi_cockpit=>ty_task_details.
*

    is_task_details_new-stage = '03'.
    is_task_details_new-task = '07'.
    is_task_details_new-status_icon = '@08@'.  "green

    TEST-INJECTION cng_load.
      CLEAR: lt_cust,lt_cust,lt_cust_cont, lt_vend_cont, lt_vend.
    END-TEST-INJECTION.
    cl_cvi_cockpit=>do_before_task_cng_cvi_load(
        is_task_details_old = is_task_details_old
        is_task_details_new = is_task_details_new ).

  ENDMETHOD.
*
*
  METHOD do_navigation.
*
    DATA: iv_okcode TYPE syst_ucomm,
          iv_tskart TYPE string.
*
    LOOP AT gt_stgtsk INTO gs_stgtsk.

      CONCATENATE 'EXEC-' gs_stgtsk-tskart_id INTO iv_tskart.
      iv_okcode = iv_tskart.

      TEST-INJECTION navigation_1. RETURN. END-TEST-INJECTION.
      TEST-INJECTION navigation_3. RETURN. END-TEST-INJECTION.
      TEST-INJECTION navigation_4. RETURN. END-TEST-INJECTION.
      TEST-INJECTION info_actn. RETURN. END-TEST-INJECTION.
      cl_cvi_cockpit=>do_navigation( iv_okcode ).

      CLEAR iv_tskart.
      CONCATENATE 'INFO-' gs_stgtsk-tskart_id INTO iv_tskart.
      iv_okcode = iv_tskart.

      TEST-INJECTION navigation_2. RETURN. END-TEST-INJECTION.
      cl_cvi_cockpit=>do_navigation( iv_okcode ).
    ENDLOOP.

  ENDMETHOD.


  METHOD execute_action.


    DATA iv_stage_artifact_id TYPE cvi_cockpit_artifact.
    DATA iv_okcode TYPE syst_ucomm.
    DATA iv_tskart TYPE string.
    DATA iv_action TYPE string.
    DATA iv_action_1 TYPE string VALUE 'LOGS'.

    LOOP AT gt_stgtsk INTO gs_stgtsk.
      iv_stage_artifact_id = gs_stgtsk-stgart_id.
      iv_action = 'EXEC'.

      CONCATENATE 'EXEC-' gs_stgtsk-tskart_id INTO iv_tskart.
      iv_okcode = iv_tskart.

      TEST-INJECTION navigation_1. RETURN. END-TEST-INJECTION.
      TEST-INJECTION navigation_2. RETURN. END-TEST-INJECTION.
      TEST-INJECTION navigation_3. RETURN. END-TEST-INJECTION.
      TEST-INJECTION navigation_4. RETURN. END-TEST-INJECTION.
      TEST-INJECTION info_actn. RETURN. END-TEST-INJECTION.

      cl_cvi_cockpit=>execute_action(
          iv_stage_artifact_id = iv_stage_artifact_id
          iv_okcode = iv_okcode
          iv_action = iv_action ).

      TEST-INJECTION logs. RETURN. end-test-injection.

      cl_cvi_cockpit=>execute_action(
         iv_stage_artifact_id = iv_stage_artifact_id
         iv_okcode = iv_okcode
         iv_action = iv_action_1 ).


      cl_abap_unit_assert=>assert_subrc(
       EXPORTING
         exp              = 0                            " Expected return code, optional, if not zero
         act              = sy-subrc                     " Return code of ABAP statements
         msg              = 'Succesfully executed'                             " Description
*            level            = if_aunit_constants=>critical " Severity (TOLERABLE, >CRITICAL<, FATAL)
*            quit             = if_aunit_constants=>method   " Alter control flow/ quit test (NO, >METHOD<, CLASS)
*            symsg            =                              " System message
*          RECEIVING
*            assertion_failed =                              " Condition was not met (and QUIT = NO)
     ).


    ENDLOOP.

  ENDMETHOD.


  METHOD execute_info_action.
**
    DATA: iv_ucomm  TYPE syst_ucomm,
          iv_tskart TYPE string.
*

    LOOP AT gt_stgtsk INTO gs_stgtsk.

      CONCATENATE 'INFO-' gs_stgtsk-tskart_id INTO iv_tskart.
      iv_ucomm = iv_tskart.

      TEST-INJECTION info_actn.
        RETURN.
      END-TEST-INJECTION.

      cl_cvi_cockpit=>execute_info_action( iv_ucomm ).

    ENDLOOP.
*
  ENDMETHOD.
*
*
  METHOD get_data.

    DATA et_stage TYPE cl_cvi_cockpit=>tt_stage_details.
    DATA et_task TYPE cl_cvi_cockpit=>tt_task_details.

    cl_cvi_cockpit=>get_data(
     IMPORTING
       et_stage = et_stage
       et_task = et_task
    ).

    cl_abap_unit_assert=>assert_equals(
      act   = et_stage
      exp   = et_stage          "<--- please adapt expected value
    " msg   = 'Testing value et_Stage'
*     level =
    ).
    cl_abap_unit_assert=>assert_equals(
      act   = et_task
      exp   = et_task          "<--- please adapt expected value
    " msg   = 'Testing value et_Task'
*     level =
    ).
  ENDMETHOD.
*
*
  METHOD get_fcodes_mapping_cvi_load.
**
    DATA fcode_list LIKE cl_cvi_cockpit=>st_fcode_navigation .

    fcode_list = cl_cvi_cockpit=>get_fcodes_mapping_cvi_load(  ).
**
    cl_abap_unit_assert=>assert_equals(
      act   = fcode_list
      exp   = fcode_list          "<--- please adapt expected value
    msg   = 'Testing value fcode_List'
*     level =
    ).
  ENDMETHOD.
*
*
  METHOD get_metadata.
*
    DATA et_status TYPE cl_cvi_cockpit=>tt_status_metadata.
    DATA et_stage TYPE cl_cvi_cockpit=>tt_stage_metadata.
    DATA et_task TYPE cl_cvi_cockpit=>tt_task_metadata.
*
    cl_cvi_cockpit=>get_metadata(
     IMPORTING
       et_status = et_status
       et_stage = et_stage
       et_task = et_task
    ).

    cl_abap_unit_assert=>assert_equals(
      act   = et_status
      exp   = et_status          "<--- please adapt expected value
    " msg   = 'Testing value et_Status'
*     level =
    ).
    cl_abap_unit_assert=>assert_equals(
      act   = et_stage
      exp   = et_stage          "<--- please adapt expected value
    " msg   = 'Testing value et_Stage'
*     level =
    ).
    cl_abap_unit_assert=>assert_equals(
      act   = et_task
      exp   = et_task          "<--- please adapt expected value
    " msg   = 'Testing value et_Task'
*     level =
    ).
  ENDMETHOD.
*
*
  METHOD get_status_details.
*
    DATA iv_status TYPE cvi_cockpit_status VALUE '03'.
    DATA es_status_details TYPE cl_cvi_cockpit=>ty_status_metadata.

    cl_cvi_cockpit=>get_status_details(
      EXPORTING
        iv_status = iv_status
     IMPORTING
       es_status_details = es_status_details
    ).

    cl_abap_unit_assert=>assert_equals(
      act   = es_status_details
      exp   = es_status_details          "<--- please adapt expected value
    " msg   = 'Testing value es_Status_Details'
*     level =
    ).
  ENDMETHOD.
*
*
  METHOD get_unsynchronised_records.
*
    DATA iv_count_reqd TYPE sap_bool.
    DATA ev_cust_unsync_count TYPE i.
    DATA ev_vend_unsync_count TYPE i.
    DATA ev_all_synchronized TYPE sap_bool.

    cl_cvi_cockpit=>get_unsynchronised_records(
     IMPORTING
       ev_cust_unsync_count = ev_cust_unsync_count
       ev_vend_unsync_count = ev_vend_unsync_count
       ev_all_synchronized  = ev_all_synchronized
    ).

    cl_abap_unit_assert=>assert_equals(
      act   = ev_cust_unsync_count
      exp   = ev_cust_unsync_count          "<--- please adapt expected value
*     msg   = 'Testing value ev_Cust_Unsync_Count'
*     level =
    ).
    cl_abap_unit_assert=>assert_equals(
      act   = ev_vend_unsync_count
      exp   = ev_vend_unsync_count          "<--- please adapt expected value
*     msg   = 'Testing value ev_Vend_Unsync_Count'
*     level =
    ).
    cl_abap_unit_assert=>assert_equals(
      act   = ev_all_synchronized
      exp   = ev_all_synchronized          "<--- please adapt expected value
*     msg   = 'Testing value ev_All_Synchronized'
*     level =
    ).
  ENDMETHOD.
*
*
  METHOD maintain_navigation_mapping.
**
**
    cl_cvi_cockpit=>maintain_navigation_mapping(  ).
**
  ENDMETHOD.
*
*
  METHOD reset_subsequent_stages.
*
    DATA iv_stage TYPE cvi_cockpit_stage VALUE '02'.
    DATA et_cockpit_log TYPE cl_cvi_cockpit=>tt_cockpit_log.
    DATA ct_stage_details TYPE cl_cvi_cockpit=>tt_stage_details.
    DATA ct_task_details TYPE cl_cvi_cockpit=>tt_task_details.

    DATA ls_stage_details LIKE LINE OF ct_stage_details.
    DATA ls_task_details LIKE LINE OF ct_task_details.

    ls_task_details-mandt = sy-mandt.
    ls_task_details-task  = '07'.
    ls_task_details-stage = '03'.
    ls_task_details-status = '01'.
    ls_task_details-comments = 'New'.
    ls_task_details-changed_on = '20190904'.
    ls_task_details-changed_by = 'I0000000'.
    ls_task_details-changed_at = '065036'.
    ls_task_details-status_text = 'Initial'.
    ls_task_details-status_icon = '@EB@'.
    ls_task_details-task_artifact_id = 'LOAD_BLKTR'.
    ls_task_details-stage_artifact_id = 'LOAD'.
    ls_task_details-is_changed = 'X'.

    APPEND ls_task_details TO ct_task_details.

    cl_cvi_cockpit=>reset_subsequent_stages(
      EXPORTING
        iv_stage = iv_stage
*     IMPORTING
*       ET_COCKPIT_LOG = et_Cockpit_Log
      CHANGING
        ct_stage_details = ct_stage_details
        ct_task_details = ct_task_details ).
*
    cl_abap_unit_assert=>assert_equals(
      act   = et_cockpit_log
      exp   = et_cockpit_log          "<--- please adapt expected value
    " msg   = 'Testing value et_Cockpit_Log'
*     level =
    ).
    cl_abap_unit_assert=>assert_equals(
      act   = ct_stage_details
      exp   = ct_stage_details          "<--- please adapt expected value
    " msg   = 'Testing value ct_Stage_Details'
*     level =
    ).
    cl_abap_unit_assert=>assert_equals(
      act   = ct_task_details
      exp   = ct_task_details          "<--- please adapt expected value
    " msg   = 'Testing value ct_Task_Details'
*     level =
    ).
  ENDMETHOD.
*
*
  METHOD return_applicable_fcode.
    DATA rt_fcode_rn TYPE cl_cvi_cockpit=>tt_fcode_rn.

    rt_fcode_rn = cl_cvi_cockpit=>return_applicable_fcode(  ).

    cl_abap_unit_assert=>assert_equals(
      act   = rt_fcode_rn
      exp   = rt_fcode_rn          "<--- please adapt expected value
    " msg   = 'Testing value rt_Fcode_Rn'
*     level =
    ).
  ENDMETHOD.
*
*
  METHOD save.
*
    DATA it_data TYPE cl_cvi_cockpit=>tt_task_details.
    DATA it_logs TYPE cl_cvi_cockpit=>tt_cockpit_log.
    DATA ev_subrc TYPE syst_subrc.

    DATA ls_data LIKE LINE OF it_data.

    ls_data-mandt = sy-mandt.
    ls_data-task = '14'.
    ls_data-stage = '04'.
    ls_data-status = '02'.
    ls_data-comments = 'ATC Entry'.
    ls_data-changed_by = 'C5275932'.
    ls_data-changed_at = '99999999'.
    ls_data-changed_on = '999999'.
    ls_data-status_text = 'Needs Resolution'.
    ls_data-status_icon = '@0A@'.
    ls_data-task_artifact_id = 'UPGD_PRECK'.
    ls_data-stage_artifact_id = 'UPGD'.
    ls_data-is_changed = 'X'.

    APPEND ls_data TO it_data.

* TEST-INJECTION Save.
*
*   end-test-injection.
    cl_cvi_cockpit=>save(
      EXPORTING
        it_data = it_data
*       IT_LOGS = it_Logs
     IMPORTING
       ev_subrc = ev_subrc
    ).

**
    cl_abap_unit_assert=>assert_equals(
      act   = ev_subrc
      exp   = 0          "<--- please adapt expected value
       msg   = 'Save failed'
*     level =
    ).
  ENDMETHOD.
*
*
  METHOD save_logs.
**
    DATA it_cockpit_status TYPE cl_cvi_cockpit=>tt_task_details.
    DATA it_logs TYPE cl_cvi_cockpit=>tt_cockpit_log.
    DATA ev_subrc TYPE syst_subrc.

    DATA ls_cockpit_status LIKE LINE OF it_cockpit_status.
    DATA ls_logs LIKE LINE OF it_logs.

    ls_cockpit_status-mandt = sy-mandt.
    ls_cockpit_status-task = '16'.
    ls_cockpit_status-stage = '05'.
    ls_cockpit_status-status = '02'.
    ls_cockpit_status-comments = 'ATC Entry'.
    ls_cockpit_status-changed_by = 'I0000000'.
    ls_cockpit_status-changed_at = '20190904'.
    ls_cockpit_status-changed_on = '110327'.
    ls_cockpit_status-status_text = 'Needs Resolution'.
    ls_cockpit_status-status_icon = '@0A@'.
    ls_cockpit_status-task_artifact_id = 'LOAD_LTOOL'.
    ls_cockpit_status-stage_artifact_id = 'LOAD'.
    ls_cockpit_status-is_changed = 'X'.

    APPEND ls_cockpit_status TO it_cockpit_status.

    ls_logs-mandt = sy-mandt.
    ls_logs-task = '16'.
    ls_logs-status = '02'.
    ls_logs-comments = 'User opted to edit a completed stage, resulting in overall task status reset !!!'.
    ls_logs-changed_by = 'I0000000'.
    ls_logs-changed_at = '20190904'.
    ls_logs-changed_on = '110327'.

    APPEND ls_logs TO it_logs.

    cl_cvi_cockpit=>save_logs(
      EXPORTING
        it_cockpit_status = it_cockpit_status
       it_logs = it_logs
     IMPORTING
       ev_subrc = ev_subrc
    ).

    cl_abap_unit_assert=>assert_equals(
      act   = ev_subrc
      exp   = ev_subrc          "<--- please adapt expected value
    " msg   = 'Testing value ev_Subrc'
*     level =
    ).
  ENDMETHOD.
**
*
  METHOD set_applicable_fcodes.
**
**
    cl_cvi_cockpit=>set_applicable_fcodes(  ).
**
  ENDMETHOD.
*
*
  METHOD set_metadata.
*

    cl_cvi_cockpit=>set_metadata(  ).
*
  ENDMETHOD.
*



ENDCLASS.
