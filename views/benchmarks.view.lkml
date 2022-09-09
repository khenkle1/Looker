view: benchmarks {
  sql_table_name: "SQLDEV01_DBO"."BENCHMARKS"
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

  dimension: brandcount {
    type: number
    sql: ${TABLE}."BRANDCOUNT" ;;
  }

  dimension: calctype {
    type: number
    sql: ${TABLE}."CALCTYPE" ;;
  }

  dimension: cuisinetypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."CUISINETYPEID" ;;
  }

  dimension: dataset {
    type: string
    sql: ${TABLE}."DATASET" ;;
  }

  dimension: excludedaccountid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EXCLUDEDACCOUNTID" ;;
  }

  dimension: locationid {
    type: number
    value_format_name: id
    sql: ${TABLE}."LOCATIONID" ;;
  }

  dimension: locationtype {
    type: number
    sql: ${TABLE}."LOCATIONTYPE" ;;
  }

  dimension: metricid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."METRICID" ;;
  }

  dimension: periodid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PERIODID" ;;
  }

  dimension: periodtype {
    type: number
    sql: ${TABLE}."PERIODTYPE" ;;
  }

  dimension: segmentid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."SEGMENTID" ;;
  }

  dimension: unitcount {
    type: number
    sql: ${TABLE}."UNITCOUNT" ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}."VALUE" ;;
  }

  measure: count {
    type: count
    drill_fields: [metrics.id, metrics.name, segments.id, segments.name]
  }
}
