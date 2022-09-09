view: compsalesnew {
  sql_table_name: "SQLDEV01_DBO"."COMPSALESNEW"
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

  dimension: dmaid {
    type: number
    value_format_name: id
    sql: ${TABLE}."DMAID" ;;
  }

  dimension: growth {
    type: number
    sql: ${TABLE}."GROWTH" ;;
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

  dimension: regionid {
    type: number
    value_format_name: id
    sql: ${TABLE}."REGIONID" ;;
  }

  dimension: segmentid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."SEGMENTID" ;;
  }

  dimension: stateid {
    type: number
    value_format_name: id
    sql: ${TABLE}."STATEID" ;;
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

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}."ZIPCODE" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      units.id,
      weeks.id,
      weeks.monthname,
      metrics.id,
      metrics.name,
      segments.id,
      segments.name,
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
