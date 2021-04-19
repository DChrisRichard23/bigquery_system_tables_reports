view: table_most_recent_owner {
  derived_table: {
    sql: SELECT
          dataset_table
        , user_email AS most_recent_owner
      FROM (
        SELECT
            dataset_id || '.' || table_id AS dataset_table
          , user_email
          , (FORMAT_TIMESTAMP('%F %T', creation_time )) AS creation_time
          , ROW_NUMBER() OVER ( PARTITION BY dataset_id || '.' || table_id ORDER BY (FORMAT_TIMESTAMP('%F %T', creation_time )) DESC ) AS queries_ago
        FROM `mw-data-analytics-sandbox.information_schema_tables.job_execution_query`
        WHERE user_email != 'looker-sa@mw-data-analytics-sandbox.iam.gserviceaccount.com'
      ) AS A
      WHERE queries_ago = 1
      ORDER BY 1,2
      LIMIT 1000
       ;;
  }


  dimension: dataset_table {
    type: string
    sql: ${TABLE}.dataset_table ;;
  }

  dimension: most_recent_owner {
    type: string
    sql: ${TABLE}.most_recent_owner ;;
    html: <a href="/dashboards-next/110?User%20Email={{ value }}">{{ value }}</a> ;;
  }

  set: detail {
    fields: [dataset_table, most_recent_owner]
  }
}
