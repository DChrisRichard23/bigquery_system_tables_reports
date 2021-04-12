view: jobs_by_project {
  sql_table_name: `information_schema_tables.jobs_by_project`
    ;;

  dimension: cache_hit {
    type: yesno
    sql: ${TABLE}.cache_hit ;;
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

  dimension: destination_table__dataset_id {
    type: string
    sql: ${TABLE}.destination_table.dataset_id ;;
    group_label: "Destination Table"
    group_item_label: "Dataset ID"
  }

  dimension: destination_table__project_id {
    type: string
    sql: ${TABLE}.destination_table.project_id ;;
    group_label: "Destination Table"
    group_item_label: "Project ID"
  }

  dimension: destination_table__table_id {
    type: string
    sql: ${TABLE}.destination_table.table_id ;;
    group_label: "Destination Table"
    group_item_label: "Table ID"
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

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: job_stages {
    hidden: yes
    sql: ${TABLE}.job_stages ;;
  }

  dimension: job_type {
    type: string
    sql: ${TABLE}.job_type ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: parent_job_id {
    type: string
    sql: ${TABLE}.parent_job_id ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: project_number {
    type: number
    sql: ${TABLE}.project_number ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: referenced_tables {
    hidden: yes
    sql: ${TABLE}.referenced_tables ;;
  }

  dimension: reservation_id {
    type: string
    sql: ${TABLE}.reservation_id ;;
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

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: statement_type {
    type: string
    sql: ${TABLE}.statement_type ;;
  }

  dimension: timeline {
    hidden: yes
    sql: ${TABLE}.timeline ;;
  }

  dimension: total_bytes_billed {
    type: number
    sql: ${TABLE}.total_bytes_billed ;;
  }

  dimension: total_bytes_processed {
    type: number
    sql: ${TABLE}.total_bytes_processed ;;
  }

  dimension: total_slot_ms {
    type: number
    sql: ${TABLE}.total_slot_ms ;;
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

view: jobs_by_project__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: jobs_by_project__job_stages {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: completed_parallel_inputs {
    type: number
    sql: ${TABLE}.completed_parallel_inputs ;;
  }

  dimension: compute_ms_avg {
    type: number
    sql: ${TABLE}.compute_ms_avg ;;
  }

  dimension: compute_ms_max {
    type: number
    sql: ${TABLE}.compute_ms_max ;;
  }

  dimension: compute_ratio_avg {
    type: number
    sql: ${TABLE}.compute_ratio_avg ;;
  }

  dimension: compute_ratio_max {
    type: number
    sql: ${TABLE}.compute_ratio_max ;;
  }

  dimension: end_ms {
    type: number
    sql: ${TABLE}.end_ms ;;
  }

  dimension: input_stages {
    hidden: yes
    sql: ${TABLE}.input_stages ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: parallel_inputs {
    type: number
    sql: ${TABLE}.parallel_inputs ;;
  }

  dimension: read_ms_avg {
    type: number
    sql: ${TABLE}.read_ms_avg ;;
  }

  dimension: read_ms_max {
    type: number
    sql: ${TABLE}.read_ms_max ;;
  }

  dimension: read_ratio_avg {
    type: number
    sql: ${TABLE}.read_ratio_avg ;;
  }

  dimension: read_ratio_max {
    type: number
    sql: ${TABLE}.read_ratio_max ;;
  }

  dimension: records_read {
    type: number
    sql: ${TABLE}.records_read ;;
  }

  dimension: records_written {
    type: number
    sql: ${TABLE}.records_written ;;
  }

  dimension: shuffle_output_bytes {
    type: number
    sql: ${TABLE}.shuffle_output_bytes ;;
  }

  dimension: shuffle_output_bytes_spilled {
    type: number
    sql: ${TABLE}.shuffle_output_bytes_spilled ;;
  }

  dimension: slot_ms {
    type: number
    sql: ${TABLE}.slot_ms ;;
  }

  dimension: start_ms {
    type: number
    sql: ${TABLE}.start_ms ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: steps {
    hidden: yes
    sql: ${TABLE}.steps ;;
  }

  dimension: wait_ms_avg {
    type: number
    sql: ${TABLE}.wait_ms_avg ;;
  }

  dimension: wait_ms_max {
    type: number
    sql: ${TABLE}.wait_ms_max ;;
  }

  dimension: wait_ratio_avg {
    type: number
    sql: ${TABLE}.wait_ratio_avg ;;
  }

  dimension: wait_ratio_max {
    type: number
    sql: ${TABLE}.wait_ratio_max ;;
  }

  dimension: write_ms_avg {
    type: number
    sql: ${TABLE}.write_ms_avg ;;
  }

  dimension: write_ms_max {
    type: number
    sql: ${TABLE}.write_ms_max ;;
  }

  dimension: write_ratio_avg {
    type: number
    sql: ${TABLE}.write_ratio_avg ;;
  }

  dimension: write_ratio_max {
    type: number
    sql: ${TABLE}.write_ratio_max ;;
  }
}

view: jobs_by_project__timeline {
  dimension: active_units {
    type: number
    sql: ${TABLE}.active_units ;;
  }

  dimension: completed_units {
    type: number
    sql: ${TABLE}.completed_units ;;
  }

  dimension: elapsed_ms {
    type: number
    sql: ${TABLE}.elapsed_ms ;;
  }

  dimension: pending_units {
    type: number
    sql: ${TABLE}.pending_units ;;
  }

  dimension: total_slot_ms {
    type: number
    sql: ${TABLE}.total_slot_ms ;;
  }
}

view: jobs_by_project__job_stages__steps {
  dimension: kind {
    type: string
    sql: ${TABLE}.kind ;;
  }

  dimension: substeps {
    hidden: yes
    sql: ${TABLE}.substeps ;;
  }
}

view: jobs_by_project__job_stages__input_stages {
  dimension: jobs_by_project__job_stages__input_stages {
    type: number
    sql: jobs_by_project__job_stages__input_stages ;;
  }
}

view: jobs_by_project__job_stages__steps__substeps {
  dimension: jobs_by_project__job_stages__steps__substeps {
    type: string
    sql: jobs_by_project__job_stages__steps__substeps ;;
  }
}

view: jobs_by_project__referenced_tables {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.dataset_id ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: table_id {
    type: string
    sql: ${TABLE}.table_id ;;
  }
}
