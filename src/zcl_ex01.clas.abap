CLASS zcl_ex01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    " Para usar out->write la clase debe implementar esta interfaz
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_ex01 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(lv_edad) = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
                                                 min = 1
                                                 max = 100 )->get_next( ).

    out->write( |Edad generada: { lv_edad }| ).

    " Estructura IF: evalúa las condiciones en orden de arriba hacia abajo
    IF lv_edad < 12.
      out->write( 'Descuento de 5€.' ).

    ELSEIF lv_edad > 12 AND lv_edad < 19.
      out->write( 'Descuento de 10€' ).

    ELSEIF lv_edad > 17 AND lv_edad < 66.
      out->write( 'Descuento de 20€' ).
    ELSEIF lv_edad > 65.
      out->write( 'Descuento de 10€' ).

    ELSE.
      out->write( 'No cumple ninguna de las condiciones específicas para el descuento.' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
