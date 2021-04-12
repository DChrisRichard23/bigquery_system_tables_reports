view: hourly_utilization_query {
  sql_table_name: `information_schema_tables.hourly_utilization_query`
    ;;

  dimension: average_hourly_slot_usage {
    type: number
    sql: ${TABLE}.average_hourly_slot_usage ;;
  }

  dimension: job_type {
    type: string
    sql: ${TABLE}.job_type ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: reservation_id {
    type: string
    sql: ${TABLE}.reservation_id ;;
  }

  dimension_group: usage {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.usage_date ;;
  }

  dimension_group: usage_time {
    type: time
    timeframes: [
      raw,
      time
    ]
    sql: ${TABLE}.usage_time ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
