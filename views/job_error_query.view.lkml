view: job_error_query {
  sql_table_name: `information_schema_tables.job_error_query`
    ;;

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

  dimension: job_type {
    type: string
    sql: ${TABLE}.job_type ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: statement_type {
    type: string
    sql: ${TABLE}.statement_type ;;
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
