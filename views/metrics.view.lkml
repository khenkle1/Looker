view: metrics {
  sql_table_name: "SQLDEV01_DBO"."METRICS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}."_FIVETRAN_DELETED" ;;
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

  dimension: code {
    type: string
    sql: ${TABLE}."CODE" ;;
  }

  dimension: default {
    type: yesno
    sql: ${TABLE}."DEFAULT" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: displayorder {
    type: number
    sql: ${TABLE}."DISPLAYORDER" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: productid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PRODUCTID" ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}."REFERENCE" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      benchmarks.count,
      benchmarks2_yrgrowth.count,
      benchmarks3_yrgrowth.count,
      competitivesets.count,
      compsales2_years_v2.count,
      compsales3_years_v2.count,
      compsalesaccounts2_years_v2.count,
      compsalesaccounts3_years_v2.count,
      compsalesaccountsnew.count,
      compsalesnew.count,
      results.count,
      results2_yrgrowth.count,
      results3_yrgrowth.count,
      weeklysales.count
    ]
  }
}
