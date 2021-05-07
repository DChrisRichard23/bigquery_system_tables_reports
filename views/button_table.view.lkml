view: button_table {
  derived_table: {
    sql: SELECT
        'Most Recent Hour' AS most_recent_hour_button,
        'Most Recent Day' AS most_recent_day_button
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: most_recent_hour_button {
    type: string
    sql: ${TABLE}.most_recent_hour_button ;;
    html: <a href="/dashboards-next/125?Hours+Ago=%5B0%2C1%5D">{{ value }}</a> ;;
  }

  dimension: most_recent_day_button {
    type: string
    sql: ${TABLE}.most_recent_day_button ;;
    html:  <a href="/dashboards-next/126?Hours%20Ago=%5B0,24%5D">{{ value }}</a> ;;
  }

  set: detail {
    fields: [most_recent_hour_button, most_recent_day_button]
  }
}
