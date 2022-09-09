view: weeklysales {
  sql_table_name: "SQLDEV01_DBO"."WEEKLYSALES"
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

  dimension: metricid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."METRICID" ;;
  }

  dimension: statusid {
    type: number
    value_format_name: id
    sql: ${TABLE}."STATUSID" ;;
  }

  dimension: unitid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."UNITID" ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}."VALUE" ;;
  }

  dimension: weekid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."WEEKID" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      weeks.id,
      weeks.monthname,
      metrics.id,
      metrics.name,
      units.id
    ]
  }
}
