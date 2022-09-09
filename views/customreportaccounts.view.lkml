view: customreportaccounts {
  sql_table_name: "SQLDEV01_DBO"."CUSTOMREPORTACCOUNTS"
    ;;

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}."_FIVETRAN_DELETED" ;;
  }

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}."_FIVETRAN_ID" ;;
  }

  dimension_group: _fivetran_synced {
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
    sql: ${TABLE}.CAST(${TABLE}."_FIVETRAN_SYNCED" AS TIMESTAMP_NTZ) ;;
  }

  dimension: includedaccountid {
    type: number
    value_format_name: id
    sql: ${TABLE}."INCLUDEDACCOUNTID" ;;
  }

  dimension: reportaccountid {
    type: number
    value_format_name: id
    sql: ${TABLE}."REPORTACCOUNTID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
