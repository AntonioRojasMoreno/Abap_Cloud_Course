CLASS z_variables_arm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

    DATA: lv_numero1   TYPE decfloat34 VALUE 10,  " Primer número a operar lel
          lv_numero2   TYPE decfloat34 VALUE 5,   " Segundo número a operar
          lv_resultado TYPE decfloat34.           " Variable que guarda el resultado





  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_variables_arm IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  ENDMETHOD.

ENDCLASS.
