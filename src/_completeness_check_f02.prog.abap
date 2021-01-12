*----------------------------------------------------------------------*
***INCLUDE _COMPLETENESS_CHECK_F02.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      FORM  EXPORT_TO_EXCEL
*&---------------------------------------------------------------------*
*       TEXT
*----------------------------------------------------------------------*
*  -->  P1        TEXT
*  <--  P2        TEXT
*----------------------------------------------------------------------*
FORM export_to_excel .

  DATA: begin of header occurs 0,
          colname(30) type c,
        end of header.

  HEADER-COLNAME = 'FIELD NAME'.
  APPEND HEADER.
  CLEAR HEADER.
  HEADER-COLNAME = 'INCL/EXCL'.
  APPEND HEADER.
  CLEAR HEADER.
  HEADER-COLNAME = 'OPTION'.
  APPEND HEADER.
  CLEAR HEADER.
  HEADER-COLNAME = 'LOWER LIMIT'.
  APPEND HEADER.
  CLEAR HEADER.
  HEADER-COLNAME = 'UPPER LIMIT'.
  append header.
  clear header.

  TYPES: begin of excel_type,
           fldname(5)   type c,
           incl_excl(1) type c,
           option(2)    type c,
           lower(10)    type c,
           upper(10)    type c,
         end of excel_type.

  DATA: lt_cust      type table of excel_type,
        lt_vend      type table of excel_type,
        lt_cust_cont type table of excel_type,
        lt_vend_cont type table of excel_type.

  DATA: ls_cust_ex      like line of lt_cust,
        ls_vend_ex      like line of lt_vend,
        ls_cust_cont_ex like line of lt_cust_cont,
        ls_vend_cont_ex like line of lt_vend_cont.

  DATA: ls_cust      like line of gt_cust,
        ls_vend      like line of gt_vend,
        ls_cust_cont like line of gt_cust_cont,
        ls_vend_cont like line of gt_vend_cont,
        p_file       type string.

  DATA : fullpath    TYPE                   string,
         filename    TYPE                   string,
         path        TYPE                   string,
         user_action TYPE                   i,
         encoding    TYPE                   abap_encoding.



  if gv_cust_wo_cp = gc_true.
* EXCEL FILE FOR CUSTOMERS
    loop at gt_cust into ls_cust.
      ls_cust_ex-fldname = 'KUNNR'.
      ls_cust_ex-incl_excl = 'I'.
      ls_cust_ex-option = 'EQ'.
      ls_cust_ex-lower = ls_cust-kunnr.
      append ls_cust_ex to lt_cust.
      clear ls_cust_ex.
      clear ls_cust.
    endloop.


    IF p_file IS INITIAL.
      CALL METHOD cl_gui_frontend_services=>file_save_dialog
        EXPORTING
          window_title         = 'Select path'
          INITIAL_DIRECTORY    = 'C:\TEMP\CVI'
          default_file_name    = 'unsync_customers.xls'
        CHANGING
          filename             = filename
          path                 = path
          fullpath             = fullpath
          user_action          = user_action
        EXCEPTIONS
          cntl_error           = 1
          error_no_gui         = 2
          not_supported_by_gui = 3
          OTHERS               = 4.

      IF sy-subrc <> 0.
        EXIT.
      ENDIF.

      IF user_action <> cl_gui_frontend_services=>action_ok.
        EXIT.
      ENDIF.

    ELSE.
      fullpath = p_file.

    ENDIF.

    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        FILENAME   = fullpath
        FILETYPE   = 'DBF'
      TABLES
        DATA_TAB   = lt_cust
        FIELDNAMES = header.
  endif.

  clear p_file.
  clear fullpath.
  clear filename.
  clear user_action.
  clear encoding.
* EXCEL FILE FOR SUPPLIERS
  if gv_vend_wo_cp = gc_true.

    loop at gt_vend into ls_vend.
      ls_vend_ex-fldname = 'LIFNR'.
      ls_vend_ex-incl_excl = 'I'.
      ls_vend_ex-option = 'EQ'.
      ls_vend_ex-lower = ls_vend-lifnr.
      append ls_vend_ex to lt_vend.
      clear ls_vend_ex.
      clear ls_vend.
    endloop.

    IF PATH IS INITIAL.

      CALL METHOD CL_GUI_FRONTEND_SERVICES=>FILE_SAVE_DIALOG
        EXPORTING
          WINDOW_TITLE         = 'Select path'
          INITIAL_DIRECTORY    = 'C:\TEMP\CVI'
          DEFAULT_FILE_NAME    = 'unsync_vendors.xls'
        CHANGING
          FILENAME             = FILENAME
          PATH                 = PATH
          FULLPATH             = FULLPATH
          USER_ACTION          = USER_ACTION
        EXCEPTIONS
          CNTL_ERROR           = 1
          ERROR_NO_GUI         = 2
          NOT_SUPPORTED_BY_GUI = 3
          OTHERS               = 4.

      IF SY-SUBRC <> 0.
        EXIT.
      ENDIF.

      IF USER_ACTION <> CL_GUI_FRONTEND_SERVICES=>ACTION_OK.
        EXIT.
      ENDIF.

    ELSE.

      CONCATENATE PATH 'unsync_vendors.xls' INTO FULLPATH.

    ENDIF.


      CALL FUNCTION 'GUI_DOWNLOAD'
        EXPORTING
          FILENAME   = fullpath
          FILETYPE   = 'DBF'
        TABLES
          DATA_TAB   = lt_vend
          FIELDNAMES = header.

  ENDIF.
  clear p_file.
  clear fullpath.
  clear filename.
  clear user_action.
  clear encoding.

  if gv_cust_with_cp = gc_true.

* EXCEL FILE FOR CUSTOMER CONTACTS
    loop at gt_cust_cont into ls_cust_cont.
      ls_cust_cont_ex-fldname = 'KUNNR'.
      ls_cust_cont_ex-incl_excl = 'I'.
      ls_cust_cont_ex-option = 'EQ'.
      ls_cust_cont_ex-lower = ls_cust_cont-kunnr.
      append ls_cust_cont_ex to lt_cust_cont.
      clear ls_cust_cont_ex.
      clear ls_cust_cont.
    endloop.

    IF PATH IS INITIAL.
      CALL METHOD CL_GUI_FRONTEND_SERVICES=>FILE_SAVE_DIALOG
        EXPORTING
          WINDOW_TITLE         = 'Select path'
          INITIAL_DIRECTORY    = 'C:\TEMP\CVI'
          DEFAULT_FILE_NAME    = 'unsync_customers_contacts.xls'
        CHANGING
          FILENAME             = FILENAME
          PATH                 = PATH
          FULLPATH             = FULLPATH
          USER_ACTION          = USER_ACTION
        EXCEPTIONS
          CNTL_ERROR           = 1
          ERROR_NO_GUI         = 2
          NOT_SUPPORTED_BY_GUI = 3
          OTHERS               = 4.

      IF SY-SUBRC <> 0.
        EXIT.
      ENDIF.

      IF USER_ACTION <> CL_GUI_FRONTEND_SERVICES=>ACTION_OK.
        EXIT.
      ENDIF.

    ELSE.

      CONCATENATE PATH 'unsync_customers_contacts.xls' INTO FULLPATH.

    ENDIF.






**      SORT LT_CUST_CONT BY LOWER.
**      DELETE ADJACENT DUPLICATES FROM LT_CUST_CONT.

    CALL FUNCTION 'GUI_DOWNLOAD'
        EXPORTING
          FILENAME   = fullpath
          FILETYPE   = 'DBF'
        TABLES
          DATA_TAB   = lt_cust_cont
          FIELDNAMES = header.
  ENDIF.
  CLEAR P_FILE.
  clear fullpath.
  clear filename.
  clear user_action.
  clear encoding.

  if gv_vend_with_cp = gc_true.

* EXCEL FILE FOR SUPPLIER CONTACTS
    loop at gt_vend_cont into ls_vend_cont.
      ls_vend_cont_ex-fldname = 'LIFNR'.
      ls_vend_cont_ex-incl_excl = 'I'.
      ls_vend_cont_ex-option = 'EQ'.
      ls_vend_cont_ex-lower = ls_vend_cont-lifnr.
      append ls_vend_cont_ex to lt_vend_cont.
      clear ls_vend_cont_ex.
      clear ls_vend_cont.
    endloop.

    IF PATH IS INITIAL.
      CALL METHOD CL_GUI_FRONTEND_SERVICES=>FILE_SAVE_DIALOG
        EXPORTING
          WINDOW_TITLE         = 'Select path'
          INITIAL_DIRECTORY    = 'C:\TEMP\CVI'
          DEFAULT_FILE_NAME    = 'unsync_vendors_contacts.xls'
        CHANGING
          FILENAME             = FILENAME
          PATH                 = PATH
          FULLPATH             = FULLPATH
          USER_ACTION          = USER_ACTION
        EXCEPTIONS
          CNTL_ERROR           = 1
          ERROR_NO_GUI         = 2
          NOT_SUPPORTED_BY_GUI = 3
          OTHERS               = 4.

      IF SY-SUBRC <> 0.
        EXIT.
      ENDIF.

      IF USER_ACTION <> CL_GUI_FRONTEND_SERVICES=>ACTION_OK.
        EXIT.
      ENDIF.

    ELSE.
      CONCATENATE PATH 'unsync_vendors_contacts.xls' INTO FULLPATH.
    ENDIF.

      CALL FUNCTION 'GUI_DOWNLOAD'
        EXPORTING
          FILENAME   = fullpath
          FILETYPE   = 'DBF'
        TABLES
          DATA_TAB   = lt_vend_cont
          FIELDNAMES = header.

  endif.
  clear p_file.
  clear fullpath.
  clear filename.
  clear user_action.
  clear encoding.
  if sy-subrc EQ 0.
    MESSAGE 'Excel file(s) for selected object(s) are downloaded' TYPE 'S'.
  endif.
  clear path.





ENDFORM.
