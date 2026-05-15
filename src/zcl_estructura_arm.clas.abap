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

    TYPES:BEGIN OF ty_mueble,
            tipo   TYPE string,
            cantidad     TYPE i,
            telefono TYPE string,
            correo   TYPE string,
          END OF ty_mueble.
          data ls_mueble type ty_mueble.
          ls_mueble-tipo = 'Camas'.
          ls_mueble-cantidad = 33.
          ls_mueble-telefono = '666666666'.
          ls_mueble-correo = 'antonio@gmail.com'.


          ""segunda forma
**          DATA(ls_cliente2) = value ty_cliente( nombre = 'fer' edad = 32 correo = 'sdfjhsdjfjhsd' ).
**          out->write( ls_cliente2 ).
**            "segundo commit
**            ""tercera forma


  ENDMETHOD.

ENDCLASS.
