CLASS zcl_lbmo_conditionals_case_arm DEFINITION
  PUBLIC
    FINAL
    CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lbmo_conditionals_case_arm IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(lv_edad) = cl_abap_random_int=>create(
                    seed = cl_abap_random=>seed( )
                    min  = 1
                    max  = 100
                )->get_next( ).
    out->write( lv_edad ).


    CASE lv_edad.
      WHEN 12. out->write( lv_edad + 'eres un bebesito' ).
      WHEN 18. out->write( lv_edad ).
      WHEN 45. out->write( lv_edad ).
      WHEN OTHERS. out->write( 'cualquier otra edad' ).
    ENDCASE.

    IF lv_edad < 12.
      out->write( |{ lv_edad } eres un bebesito| ).
    ELSEIF lv_edad = 18.
      out->write( |{ lv_edad } enhorabuena, puedes drogarte oficialmente| ).
    ELSEIF lv_edad >= 45.
      out->write( |{ lv_edad } te quedan 2 dias bro | ).
    ELSE.
      out->write( ':/' ).
    ENDIF.








  ENDMETHOD.

ENDCLASS.
