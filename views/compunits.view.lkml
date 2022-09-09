view: compunits {
  sql_table_name: "SQLDEV01_DBO"."COMPUNITS"
    ;;

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

  dimension: unitid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."UNITID" ;;
  }

  dimension: weekid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."WEEKID" ;;
  }

  measure: count {
    type: count
    drill_fields: [units.id, weeks.id, weeks.monthname]
  }
}
