view: job_execution_query {
  sql_table_name: `information_schema_tables.job_execution_query`
    ;;

  dimension: avg_slots {
    type: number
    sql: ${TABLE}.avg_slots ;;
  }

  dimension: total_slot_ms {
    type: number
    sql: ${TABLE}.total_slot_ms ;;
  }


  dimension: avg_slots_tier {
    type: tier
    tiers: [0,0.001,0.003,0.01,0.03,0.1,0.3,1,3,10,30,100,300,1000,3000,10000,30000]
    sql: ${job_duration_seconds} ;;
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

  dimension: creation_hour {
    type: number
    sql: ${TABLE}.creation_hour ;;
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

  dimension: job_duration_tier {
    type: tier
    tiers: [0,1,2,3,5,10,30,60,300,10000,30000]
    sql: ${job_duration_seconds} ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: statement_type {
    type: string
    sql: ${TABLE}.statement_type ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
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

  dimension: total_bytes_tier {
    type: tier
    tiers: [0,10,30,100,300,1000,3000,10000,30000,100000,300000,1000000,3000000,10000000,30000000,100000000,300000000,1000000000,3000000000,10000000000,30000000000,100000000000]
    sql: ${total_bytes_processed} ;;
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

  measure: total_job_duration {
    type: sum
    sql: ${job_duration_seconds} ;;
    value_format: "#,###"
  }

}
