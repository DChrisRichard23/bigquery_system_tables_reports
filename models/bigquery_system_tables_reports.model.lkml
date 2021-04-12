connection: "information_schema_tables"

# include all the views
include: "/views/**/*.view"

datagroup: bigquery_system_tables_reports_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bigquery_system_tables_reports_default_datagroup

explore: daily_utilization_query {}

explore: hourly_utilization_query {}

explore: job_comparison_statistics_query {}

explore: job_error_query {}

explore: job_execution_query {}

explore: jobs_by_project {
  join: jobs_by_project__labels {
    view_label: "Jobs By Project: Labels"
    sql: LEFT JOIN UNNEST(${jobs_by_project.labels}) as jobs_by_project__labels ;;
    relationship: one_to_many
  }

  join: jobs_by_project__job_stages {
    view_label: "Jobs By Project: Job Stages"
    sql: LEFT JOIN UNNEST(${jobs_by_project.job_stages}) as jobs_by_project__job_stages ;;
    relationship: one_to_many
  }

  join: jobs_by_project__timeline {
    view_label: "Jobs By Project: Timeline"
    sql: LEFT JOIN UNNEST(${jobs_by_project.timeline}) as jobs_by_project__timeline ;;
    relationship: one_to_many
  }

  join: jobs_by_project__job_stages__steps {
    view_label: "Jobs By Project: Job Stages Steps"
    sql: LEFT JOIN UNNEST(${jobs_by_project__job_stages.steps}) as jobs_by_project__job_stages__steps ;;
    relationship: one_to_many
  }

  join: jobs_by_project__job_stages__input_stages {
    view_label: "Jobs By Project: Job Stages Input Stages"
    sql: LEFT JOIN UNNEST(${jobs_by_project__job_stages.input_stages}) as jobs_by_project__job_stages__input_stages ;;
    relationship: one_to_many
  }

  join: jobs_by_project__job_stages__steps__substeps {
    view_label: "Jobs By Project: Job Stages Steps Substeps"
    sql: LEFT JOIN UNNEST(${jobs_by_project__job_stages__steps.substeps}) as jobs_by_project__job_stages__steps__substeps ;;
    relationship: one_to_many
  }

  join: jobs_by_project__referenced_tables {
    view_label: "Jobs By Project: Referenced Tables"
    sql: LEFT JOIN UNNEST(${jobs_by_project.referenced_tables}) as jobs_by_project__referenced_tables ;;
    relationship: one_to_many
  }
}
