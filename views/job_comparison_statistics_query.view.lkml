view: job_comparison_statistics_query {
  sql_table_name: `information_schema_tables.job_comparison_statistics_query`
    ;;

  dimension: cache_hit {
    type: yesno
    sql: ${TABLE}.cache_hit ;;
  }

  dimension: creation_sum_sec {
    type: number
    sql: ${TABLE}.creation_sum_sec ;;
  }

  dimension_group: creation {
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
    sql: ${TABLE}.creation_time ;;
  }

  dimension: duration_sum_sec {
    type: number
    sql: ${TABLE}.duration_sum_sec ;;
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

  dimension: error_reason {
    type: string
    sql: ${TABLE}.error_reason ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: job_type {
    type: string
    sql: ${TABLE}.job_type ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: reservation_id {
    type: string
    sql: ${TABLE}.reservation_id ;;
  }

  dimension: shuffle_output_bytes {
    type: number
    sql: ${TABLE}.shuffle_output_bytes ;;
  }

  dimension: shuffle_output_bytes_spilled {
    type: number
    sql: ${TABLE}.shuffle_output_bytes_spilled ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_time ;;
  }

  dimension: sum_bytes_processed {
    type: number
    sql: ${TABLE}.sum_bytes_processed ;;
  }

  dimension: sum_slot_ms {
    type: number
    sql: ${TABLE}.sum_slot_ms ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
