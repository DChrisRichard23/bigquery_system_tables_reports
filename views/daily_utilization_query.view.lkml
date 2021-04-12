view: daily_utilization_query {
  sql_table_name: `information_schema_tables.daily_utilization_query`
    ;;

  dimension: total_slots_sec_in {
    type: number
    hidden: yes
    sql: ${TABLE}.total_slots_sec ;;
  }

  measure: total_slots_sec {
    type: sum
    sql: ${total_slots_sec_in} ;;
    value_format: "#,###.00"
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

  measure: jobs {
    type: count
    drill_fields: []
  }

  measure: users {
    type: count_distinct
    sql: ${user_email} ;;

  }
}
