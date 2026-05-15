CLASS zcl_ex02table_arm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.

    "-------------------------------------------------------
    " TIPO BASE: Estructura de vuelos (tabla origen)
    "-------------------------------------------------------
    TYPES: BEGIN OF ty_flights,
             iduser     TYPE c LENGTH 40,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights.

    TYPES: tt_flights TYPE STANDARD TABLE OF ty_flights WITH EMPTY KEY.

    "-------------------------------------------------------
    " TIPO DESTINO: Mismos campos + ID autoincremental
    "-------------------------------------------------------
    TYPES: BEGIN OF ty_flights_filtered,
             id         TYPE i,          "« Campo nuevo: ID autoincremental
             iduser     TYPE c LENGTH 40,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights_filtered.

    TYPES: tt_flights_filtered TYPE STANDARD TABLE OF ty_flights_filtered WITH EMPTY KEY.

ENDCLASS.


CLASS zcl_ex02table_arm IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "=======================================================
    " PASO 1: Poblar la tabla ORIGEN con datos mixtos
    "         (usuarios que empiezan por 'A' y otros)
    "=======================================================
    DATA(lt_source) = VALUE tt_flights(
      ( iduser = 'Antonio'   aircode = 'LH' flightnum = '0400' key = 'DE' seat = 120 flightdate = '20250614' )
      ( iduser = 'Ana'       aircode = 'IB' flightnum = '6251' key = 'ES' seat = 85  flightdate = '20250620' )
      ( iduser = 'Pedro'     aircode = 'FR' flightnum = '1234' key = 'FR' seat = 200 flightdate = '20250701' )
      ( iduser = 'Alberto'   aircode = 'AA' flightnum = '0100' key = 'US' seat = 150 flightdate = '20250715' )
      ( iduser = 'Maria'     aircode = 'IB' flightnum = '5678' key = 'ES' seat = 95  flightdate = '20250801' )
      ( iduser = 'Alejandro' aircode = 'LH' flightnum = '0800' key = 'DE' seat = 180 flightdate = '20250810' )
      ( iduser = 'Carlos'    aircode = 'VY' flightnum = '3344' key = 'ES' seat = 60  flightdate = '20250901' )
    ).

    out->write( |*** TABLA ORIGEN — Todos los registros ***| ).
    out->write( lt_source ).

    "=======================================================
    " PASO 2: Crear tabla DESTINO y volcar sólo los registros
    "         cuyo iduser empiece por 'A' — con ID autoincremental
    "=======================================================
    DATA: lt_filtered TYPE tt_flights_filtered.
    DATA: lv_counter  TYPE i VALUE 0.         "« Contador para el ID

    LOOP AT lt_source INTO DATA(ls_flight).

      IF ls_flight-iduser CP 'A*'.            "« Patrón: empieza por 'A'

        lv_counter += 1.                      "« Incrementamos el ID

        APPEND VALUE #(
          id         = lv_counter
          iduser     = ls_flight-iduser
          aircode    = ls_flight-aircode
          flightnum  = ls_flight-flightnum
          key        = ls_flight-key
          seat       = ls_flight-seat
          flightdate = ls_flight-flightdate
        ) TO lt_filtered.

      ENDIF.

    ENDLOOP.

    out->write( |*** TABLA DESTINO — Usuarios que empiezan por A (con ID) ***| ).
    out->write( lt_filtered ).

    "=======================================================
    " PASO 3 (BONUS): Mostrar cuántos registros se filtraron
    "=======================================================
    out->write( |>>> Total registros volcados: { lv_counter }| ).

  ENDMETHOD.

ENDCLASS.
