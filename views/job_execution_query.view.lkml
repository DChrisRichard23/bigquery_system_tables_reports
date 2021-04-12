view: job_execution_query {
  sql_table_name: `information_schema_tables.job_execution_query`
    ;;

  dimension: avg_slots {
    type: number
    sql: ${TABLE}.avg_slots ;;
  }

  dimension_group: creation {
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
    sql: ${TABLE}.creation_date ;;
  }

  dimension_group: creation_time {
    type: time
    timeframes: [
      raw,
      time
    ]
    sql: ${TABLE}.creation_time ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_time ;;
  }

  dimension: error_result__debug_info {
    type: string
    sql: ${TABLE}.error_result.debug_info ;;
    group_label: "Error Result"
    group_item_label: "Debug Info"
  }

  dimension: error_result__location {
    type: string
    sql: ${TABLE}.error_result.location ;;
    group_label: "Error Result"
    group_item_label: "Location"
  }

  dimension: error_result__message {
    type: string
    sql: ${TABLE}.error_result.message ;;
    group_label: "Error Result"
    group_item_label: "Message"
  }

  dimension: error_result__reason {
    type: string
    sql: ${TABLE}.error_result.reason ;;
    group_label: "Error Result"
    group_item_label: "Reason"
  }

  dimension: job_duration_seconds {
    type: number
    sql: ${TABLE}.job_duration_seconds ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
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

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: total_bytes_processed {
    type: number
    sql: ${TABLE}.total_bytes_processed ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: projects {
    type: count_distinct
    sql: ${TABLE}.project_id ;;
  }

  measure: users {
    type: count_distinct
    sql: ${TABLE}.user_email ;;
  }

  measure: jobs {
    type: count_distinct
    sql: ${TABLE}.job_id ;;
  }

  measure: query_jobs {
    type: count_distinct
    sql: CASE WHEN ${TABLE}.job_type = 'QUERY' THEN ${TABLE}.job_id END ;;
  }

  measure: extract_jobs {
    type: count_distinct
    sql: CASE WHEN ${TABLE}.job_type = 'EXTRACT' THEN ${TABLE}.job_id END ;;
  }

  measure: copy_jobs {
    type: count_distinct
    sql: CASE WHEN ${TABLE}.job_type = 'COPY' THEN ${TABLE}.job_id END ;;
  }

  measure: load_jobs {
    type: count_distinct
    sql: CASE WHEN ${TABLE}.job_type = 'LOAD' THEN ${TABLE}.job_id END ;;
  }

  measure: avg_slots_consumed {
    type: average
    sql: ${avg_slots} ;;
    value_format: "#,###.00"
  }

  measure: total_terabytes_processed {
    type: sum
    sql: total_bytes_processed / 1099511627776 ;;
    value_format: "#,###.00"
  }

  measure: avg_job_duration {
    type: average
    sql: job_duration_seconds ;;
    value_format: "#,###.00"
  }

}
