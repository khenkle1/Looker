view: results3_yrgrowth {
  sql_table_name: "SQLDEV01_DBO"."RESULTS3YRGROWTH"
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

  dimension: accountid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."ACCOUNTID" ;;
  }

  dimension: cuisinetypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."CUISINETYPEID" ;;
  }

  dimension: currentvalue {
    type: number
    sql: ${TABLE}."CURRENTVALUE" ;;
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

  dimension: previousvalue {
    type: number
    sql: ${TABLE}."PREVIOUSVALUE" ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      segments.id,
      segments.name,
      metrics.id,
      metrics.name,
      accounts.longname,
      accounts.prdatacontactname,
      accounts.franchisename,
      accounts.datacontactname,
      accounts.shortname,
      accounts.prothercontactname,
      accounts.othercontactname,
      accounts.id
    ]
  }
}
