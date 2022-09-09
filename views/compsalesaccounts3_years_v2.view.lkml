view: compsalesaccounts3_years_v2 {
  sql_table_name: "SQLDEV01_DBO"."COMPSALESACCOUNTS3YEARS_V2"
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

  dimension: concept {
    type: number
    sql: ${TABLE}."CONCEPT" ;;
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

  dimension: growth {
    type: number
    sql: ${TABLE}."GROWTH" ;;
  }

  dimension: locationid {
    type: number
    value_format_name: id
    sql: ${TABLE}."LOCATIONID" ;;
  }

  dimension: locationtypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."LOCATIONTYPEID" ;;
  }

  dimension: metricid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."METRICID" ;;
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
      accounts.longname,
      accounts.prdatacontactname,
      accounts.franchisename,
      accounts.datacontactname,
      accounts.shortname,
      accounts.prothercontactname,
      accounts.othercontactname,
      accounts.id,
      segments.id,
      segments.name,
      weeks.id,
      weeks.monthname,
      metrics.id,
      metrics.name
    ]
  }
}
