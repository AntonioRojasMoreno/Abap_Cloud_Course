CLASS zcl_ex03table_arm DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zcl_ex03table_arm IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "------------------------------------------------------------
    " PASO 1 — Definir tipo y crear lt_tabla1 con VALUE #(...)
    "------------------------------------------------------------
    TYPES: BEGIN OF ty_empleado,
             nombre   TYPE string,
             edad     TYPE i,
             telefono TYPE string,
             correo   TYPE string,
           END OF ty_empleado.

    TYPES ty_tabla TYPE TABLE OF ty_empleado WITH EMPTY KEY.

    DATA lt_tabla1 TYPE ty_tabla.

    lt_tabla1 = VALUE #(
      ( nombre = 'Ana'    edad = 33 telefono = '666666666' correo = 'AnitaTraviesa@gmail.com' )
      ( nombre = 'Pepe'   edad = 42 telefono = '777777777' correo = 'PedroDeveloper@gmail.com' )
      ( nombre = 'Luis'   edad = 21 telefono = '888888888' correo = 'LuisitoOnFire@gmail.com' )
      ( nombre = 'Raquel' edad = 57 telefono = '654321123' correo = 'TuRaqueRexulona@gmail.com' )
    ).

    out->write( '=== lt_tabla1 inicial ===' ).
    out->write( lt_tabla1 ).

    "------------------------------------------------------------
    " PASO 2 — Crear lt_tabla2 copiando el tipo de lt_tabla1
    "------------------------------------------------------------
    DATA lt_tabla2 LIKE lt_tabla1.  " LIKE copia el tipo exacto
    lt_tabla2 = lt_tabla1.          " Copia también los datos

    "------------------------------------------------------------
    " PASO 3 — Insertar línea en BLANCO en la posición 2
    "------------------------------------------------------------
    DATA ls_vacia TYPE ty_empleado.          " Estructura vacía (inicial)
    INSERT ls_vacia INTO lt_tabla2 INDEX 2.  " La empuja a la posición 2

    out->write( '=== lt_tabla2 tras insertar línea vacía en pos 2 ===' ).
    out->write( lt_tabla2 ).

    "------------------------------------------------------------
    " PASO 4 — Añadir nueva línea al FINAL con APPEND
    "------------------------------------------------------------
    APPEND VALUE #(
      nombre   = 'Pedro'
      edad     = 30
      telefono = '600111222'
      correo   = 'PedritoTheBestie@gmail.com'
    ) TO lt_tabla2.

    out->write( '=== lt_tabla2 tras APPEND ===' ).
    out->write( lt_tabla2 ).

    "------------------------------------------------------------
    " PASO 5 — Random con el tamaño máximo, extraer filas
    "          e insertarlas al principio de lt_tabla1
    "------------------------------------------------------------

    " 5a. Tamaño máximo de lt_tabla2
    DATA(lv_max) = lines( lt_tabla2 ).  " Número total de filas

    " 5b. Crear generador random UNA sola vez, rango [1, lv_max]
    DATA(lo_rand) = cl_abap_random_int=>create(
                      seed = cl_abap_random=>seed( )
                      min  = 1
                      max  = lv_max ).

    " 5c. Obtener DOS números aleatorios
    DATA(lv_num1) = lo_rand->get_next( ).
    DATA(lv_num2) = lo_rand->get_next( ).

    " 5d. Determinar cuál es el índice mínimo y cuál el máximo
    DATA lv_idx_min TYPE i.
    DATA lv_idx_max TYPE i.

    IF lv_num1 <= lv_num2.
      lv_idx_min = lv_num1.
      lv_idx_max = lv_num2.
    ELSE.
      lv_idx_min = lv_num2.
      lv_idx_max = lv_num1.
    ENDIF.

    out->write( |Random MIN: { lv_idx_min } — MAX: { lv_idx_max }| ).

    " 5e. Extraer las filas del rango [min..max] de lt_tabla2
    DATA lt_extraidas TYPE ty_tabla.
    DATA lv_pos       TYPE i.

    lv_pos = lv_idx_min.
    WHILE lv_pos <= lv_idx_max.
      READ TABLE lt_tabla2 INTO DATA(ls_leida) INDEX lv_pos.
      IF sy-subrc = 0.
        APPEND ls_leida TO lt_extraidas.
      ENDIF.
      lv_pos = lv_pos + 1.
    ENDWHILE.

    out->write( '=== Filas extraídas de lt_tabla2 ===' ).
    out->write( lt_extraidas ).

    " 5f. Insertarlas al PRINCIPIO de lt_tabla1 (index 1, 2, 3...)
    DATA lv_insert_pos TYPE i VALUE 1.

    LOOP AT lt_extraidas INTO DATA(ls_insertar).
      INSERT ls_insertar INTO lt_tabla1 INDEX lv_insert_pos.
      lv_insert_pos = lv_insert_pos + 1.
    ENDLOOP.

    out->write( '=== lt_tabla1 FINAL (con filas insertadas al principio) ===' ).
    out->write( lt_tabla1 ).

  ENDMETHOD.

ENDCLASS.


