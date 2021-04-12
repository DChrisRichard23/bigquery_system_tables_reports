view: daily_utilization_query {
  sql_table_name: `information_schema_tables.daily_utilization_query`
    ;;

  dimension: average_daily_slot_usage {
    type: number
    sql: ${TABLE}.average_daily_slot_usage ;;
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
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.usage_date ;;
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
