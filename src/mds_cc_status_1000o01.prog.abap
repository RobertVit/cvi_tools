*----------------------------------------------------------------------*
***INCLUDE ZTEST_CC_STATUS_1000O01 .
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  STATUS_1000  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_1000 OUTPUT.


  TABLES: but0cc.

  TYPES: BEGIN OF lt_card_type,
            ccnum TYPE ccard-ccnum,
            card_guid TYPE but0cc-card_guid,
         END OF lt_card_type,

         BEGIN OF lt_partner_card_type,
           partner TYPE but0cc-partner,
           ccnum TYPE but0cc-ccnum,
           card_guid TYPE but0cc-card_guid,
         END OF lt_partner_card_type.

  DATA: lv_msg                TYPE char255,
        lt_partner_card       TYPE TABLE OF lt_partner_card_type,
        ls_partner_card       LIKE LINE OF lt_partner_card,
        lt_card               TYPE TABLE OF lt_card_type,
        ls_card               LIKE LINE OF lt_card,
        ls_data               TYPE pca_master_data,
        ls_guid               TYPE card_guid,
        lv_count              TYPE n VALUE '0',
        lv_flag               TYPE pca_activ,
        lt_return             TYPE bus_pca_bapi-return_table,
        ls_error              TYPE bus_pca_bapi-error,
        lv_ccard              TYPE ccard-ccnum.
  DATA: ls_alv_grid           TYPE REF TO cl_gui_alv_grid,
        g_custom_container    TYPE REF TO cl_gui_custom_container,
        gt_field_cat          TYPE lvc_t_fcat ,
        gs_field_cat          TYPE lvc_s_fcat ,
        lv_text_message(255)  TYPE c,
        lt_toolbar            TYPE ui_functions.

  CALL FUNCTION 'PCA0_GET_ACTIV_CARD_VARIANT'
    IMPORTING
      ev_pca_activ = lv_flag
      et_return    = lt_return.

  IF lv_flag IS INITIAL.
    SELECT ccnum FROM but0cc INTO CORRESPONDING FIELDS OF TABLE lt_card
       GROUP BY ccnum
       HAVING COUNT( * ) > 1.                           "#EC CI_NOWHERE

    IF lt_card IS NOT INITIAL.
      SELECT partner ccnum FROM but0cc INTO CORRESPONDING FIELDS OF TABLE lt_partner_card
          FOR ALL ENTRIES IN lt_card
          WHERE ccnum = lt_card-ccnum.                  "#EC CI_NOFIRST
    ELSE.
*        Message saying no records are assigned to more than one BP
*      lv_msg = text-001.
      lv_text_message = text-001.
    ENDIF.

  ELSE. " New card master is active
    SELECT card_guid FROM but0cc INTO CORRESPONDING FIELDS OF TABLE lt_card
      GROUP BY card_guid
      HAVING COUNT( * ) > 1.                            "#EC CI_NOWHERE
    IF lt_card IS NOT INITIAL.
      SELECT partner card_guid FROM but0cc INTO CORRESPONDING FIELDS OF TABLE lt_partner_card
        FOR ALL ENTRIES IN lt_card
        WHERE card_guid = lt_card-card_guid.
    ELSE.
*        Message saying no records are assigned to more than one BP
*      lv_msg = text-001.
      lv_text_message = text-001.
    ENDIF.

    LOOP AT lt_partner_card INTO ls_partner_card.
      ls_guid = ls_partner_card-card_guid.
      CALL FUNCTION 'PCA_MASTER_GET_DETAIL'
        EXPORTING
          iv_card_guid = ls_guid
        IMPORTING
          es_data      = ls_data
          et_return    = lt_return
          ev_error     = ls_error.
      MOVE ls_data-mask_number TO ls_partner_card-ccnum.
      MODIFY lt_partner_card FROM ls_partner_card.
    ENDLOOP.
  ENDIF.

  IF lt_partner_card IS INITIAL.
*   No corresponding card numbers
    lv_text_message = text-001.
    EXIT.
  ENDIF.

  gs_field_cat-fieldname = 'CCNUM'.
  gs_field_cat-inttype = 'C'.
  gs_field_cat-outputlen = '20'.
  gs_field_cat-coltext = text-003.
  gs_field_cat-seltext = text-003.
  APPEND gs_field_cat TO  gt_field_cat.

  gs_field_cat-fieldname = 'PARTNER'.
  gs_field_cat-inttype = 'C'.
  gs_field_cat-outputlen = '15'.
  gs_field_cat-coltext = text-004.
  gs_field_cat-seltext = text-004.
  APPEND gs_field_cat TO  gt_field_cat.

    lv_text_message = text-002.
    IF ls_alv_grid IS INITIAL.
      IF g_custom_container IS INITIAL.

        CREATE OBJECT g_custom_container
          EXPORTING
          container_name = 'CC_CONTAINER'.

        CREATE OBJECT ls_alv_grid
          EXPORTING
          i_parent = g_custom_container.
      ENDIF.

*     Exclude certain operations from the toolbar
      PERFORM exclude_toolbar_functions CHANGING lt_toolbar.

      CALL METHOD ls_alv_grid->set_table_for_first_display
        EXPORTING
          it_toolbar_excluding = lt_toolbar
        CHANGING
          it_outtab       = lt_partner_card
          it_fieldcatalog = gt_field_cat.
    ELSE.
      CALL METHOD ls_alv_grid->refresh_table_display.
    ENDIF.


ENDMODULE.                 " STATUS_1000  OUTPUT
