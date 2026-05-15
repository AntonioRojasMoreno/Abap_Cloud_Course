CLASS zcl_ex_estructura_arm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.

    "-------------------------------------------------------
    " ACTIVIDAD 1: Declaración de tipos base (estructuras planas)
    "-------------------------------------------------------

    " Estructura para datos de vuelo del usuario
    TYPES: BEGIN OF ty_flights,
             iduser     TYPE c LENGTH 40,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights.

    " Estructura para datos de aerolíneas
    TYPES: BEGIN OF ty_airlines,
             carrid    TYPE /dmo/carrier_id,
             connid    TYPE /dmo/connection_id,
             countryfr TYPE land1,
             cityfrom  TYPE /dmo/city,
             airpfrom  TYPE /dmo/airport_id,
             countryto TYPE land1,
           END OF ty_airlines.

    "-------------------------------------------------------
    " ACTIVIDAD 2: Estructura NESTED (anidada)
    "-------------------------------------------------------

    TYPES: BEGIN OF ty_nested,
             flight  TYPE ty_flights,
             airline TYPE ty_airlines,
           END OF ty_nested.

    "-------------------------------------------------------
    " ACTIVIDAD 3: Estructura DEEP (tabla interna como componente)
    "-------------------------------------------------------

    TYPES: tt_flights TYPE STANDARD TABLE OF ty_flights WITH EMPTY KEY.

    TYPES: BEGIN OF ty_deep,
             user_id TYPE c LENGTH 40,
             flights TYPE tt_flights,
           END OF ty_deep.

ENDCLASS.


CLASS zcl_ex_estructura_arm IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "=======================================================
    " ACTIVIDAD 4: Añadir datos a todas las estructuras
    "=======================================================

    " --- TY_FLIGHTS ---
    DATA(ls_flight) = VALUE ty_flights(
      iduser     = 'Antonio'
      aircode    = 'LH'
      flightnum  = '0400'
      key        = 'DE'
      seat       = 120
      flightdate = '20250614'
    ).

    out->write( |*** ACTIVIDAD 1 & 4: Estructura TY_FLIGHTS ***| ).
    out->write( ls_flight ).

    " --- TY_AIRLINES ---
    DATA(ls_airline) = VALUE ty_airlines(
      carrid    = 'LH'
      connid    = '0400'
      countryfr = 'DE'
      cityfrom  = 'FRANKFURT'
      airpfrom  = 'FRA'
      countryto = 'ES'
    ).

    out->write( |*** ACTIVIDAD 1 & 4: Estructura TY_AIRLINES ***| ).
    out->write( ls_airline ).

    " --- TY_NESTED ---
    DATA(ls_nested) = VALUE ty_nested(
      flight  = ls_flight
      airline = ls_airline
    ).

    out->write( |*** ACTIVIDAD 2 & 4: Estructura TY_NESTED ***| ).
    out->write( ls_nested ).

    " --- TY_DEEP ---
    DATA(ls_deep) = VALUE ty_deep(
      user_id = 'Antonio'
      flights = VALUE #(
        ( iduser = '0666' aircode = 'LH' flightnum = '0400'
          key = 'DE' seat = 120 flightdate = '20250614' )
        ( iduser = '0666' aircode = 'IB' flightnum = '6251'
          key = 'ES' seat = 85  flightdate = '20250620' )
      )
    ).

    out->write( |*** ACTIVIDAD 3 & 4: Estructura TY_DEEP ***| ).
    out->write( ls_deep ).

    "=======================================================
    " ACTIVIDAD 5: Estructura INCLUDE
    "=======================================================

    DATA: BEGIN OF ls_include_flights.
            INCLUDE TYPE ty_flights  AS flight_data  RENAMING WITH SUFFIX _fl.
            INCLUDE TYPE ty_airlines AS airline_data RENAMING WITH SUFFIX _al.
    DATA: END OF ls_include_flights.

    ls_include_flights-iduser_fl     = 'Antonio'.
    ls_include_flights-aircode_fl    = 'IB'.
    ls_include_flights-flightnum_fl  = '6251'.
    ls_include_flights-key_fl        = 'ES'.
    ls_include_flights-seat_fl       = 85.
    ls_include_flights-flightdate_fl = '20250620'.
    ls_include_flights-carrid_al     = 'IB'.
    ls_include_flights-connid_al     = '6251'.
    ls_include_flights-countryfr_al  = 'ES'.
    ls_include_flights-cityfrom_al   = 'MADRID'.
    ls_include_flights-airpfrom_al   = 'MAD'.
    ls_include_flights-countryto_al  = 'DE'.

    out->write( |*** ACTIVIDAD 5: Estructura TY_INCLUDE_FLIGHTS ***| ).
    out->write( ls_include_flights ).

  ENDMETHOD.

ENDCLASS.
