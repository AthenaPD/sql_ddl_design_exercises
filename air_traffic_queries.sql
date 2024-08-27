WITH pf_tab AS (
    SELECT first_name, last_name, seat, departure, arrival, from_airport, to_airport FROM passengers 
    JOIN flights ON passengers.flight_id = flights.id
),

from_ap_tab AS (
    SELECT from_airport, airports.acronym AS from_ap, airports.city AS from_city, airports.country AS from_country FROM airports
    JOIN pf_tab ON pf_tab.from_airport = airports.id
),

to_ap_tab AS (
    SELECT to_airport, airports.acronym AS to_ap, airports.city AS to_city, airports.country AS to_country FROM airports
    JOIN pf_tab ON pf_tab.from_airport = airports.id
)

SELECT first_name, last_name, seat, departure, arrival, from_city, from_country, to_city, to_country FROM pf_tab
JOIN from_ap_tab ON from_ap_tab.from_airport = pf_tab.from_airport
JOIN to_ap_tab ON to_ap_tab.to_airport = pf_tab.to_airport;