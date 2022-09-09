view: units {
  sql_table_name: "SQLDEV01_DBO"."UNITS"
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

  dimension: accountid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."ACCOUNTID" ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}."ADDRESS1" ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}."ADDRESS2" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension_group: closedate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CLOSEDATE" ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}."CODE" ;;
  }

  dimension: mallcode {
    type: string
    sql: ${TABLE}."MALLCODE" ;;
  }

  dimension: malltype {
    type: number
    sql: ${TABLE}."MALLTYPE" ;;
  }

  dimension_group: opendate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."OPENDATE" ;;
  }

  dimension: regionid {
    type: number
    value_format_name: id
    sql: ${TABLE}."REGIONID" ;;
  }

  dimension: statecode {
    type: string
    sql: ${TABLE}."STATECODE" ;;
  }

  dimension: typeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."TYPEID" ;;
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
      id,
      accounts.longname,
      accounts.prdatacontactname,
      accounts.franchisename,
      accounts.datacontactname,
      accounts.shortname,
      accounts.prothercontactname,
      accounts.othercontactname,
      accounts.id,
      compsales2_years_v2.count,
      compsales3_years_v2.count,
      compsalesnew.count,
      compunits.count,
      weeklysales.count
    ]
  }
}
