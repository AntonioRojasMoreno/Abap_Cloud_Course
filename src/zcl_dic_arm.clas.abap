CLASS zcl_dic_arm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dic_arm IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA lv_cliente type ZDE_Cliente_ARM.
    lv_cliente = 'Antonio'.


  ENDMETHOD.

ENDCLASS.
