view: segments {
  sql_table_name: "SQLDEV01_DBO"."SEGMENTS"
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

  dimension: abbrev {
    type: string
    sql: ${TABLE}."ABBREV" ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}."NUMBER" ;;
  }

  dimension: total {
    type: yesno
    sql: ${TABLE}."TOTAL" ;;
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
      accounts.count,
      benchmarks.count,
      benchmarks2_yrgrowth.count,
      benchmarks3_yrgrowth.count,
      compsales2_years_v2.count,
      compsales3_years_v2.count,
      compsalesaccounts2_years_v2.count,
      compsalesaccounts3_years_v2.count,
      compsalesaccountsnew.count,
      compsalesnew.count,
      results.count,
      results2_yrgrowth.count,
      results3_yrgrowth.count
    ]
  }
}
