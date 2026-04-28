CLASS zcl_estructura_arm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_estructura_arm IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES:BEGIN OF ty_cliente,
            nombre   TYPE zde_cliente_arm,
            edad     TYPE i,
            telefono TYPE string,
            correo   TYPE string,
          END OF ty_cliente.
          data ls_cliente type ty_cliente.
          ls_cliente-nombre = 'Antonio'.
          ls_cliente-edad = 33.
          ls_cliente-telefono = '666666666'.
          ls_cliente-correo = 'antonio@gmail.com'.
          out->write( ls_cliente ).
          ""segunda forma
          DATA(ls_cliente2) = value ty_cliente( nombre = 'fer' edad = 32 correo = 'sdfjhsdjfjhsd' ).
          out->write( ls_cliente2 ).
            "segundo commit
            ""tercera forma


  ENDMETHOD.

ENDCLASS.
