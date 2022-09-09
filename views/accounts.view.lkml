view: accounts {
  sql_table_name: "SQLDEV01_DBO"."ACCOUNTS"
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

  dimension: companynotes {
    type: string
    sql: ${TABLE}."COMPANYNOTES" ;;
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

  dimension: datacontactemail {
    type: string
    sql: ${TABLE}."DATACONTACTEMAIL" ;;
  }

  dimension: datacontactname {
    type: string
    sql: ${TABLE}."DATACONTACTNAME" ;;
  }

  dimension: franchisecode {
    type: number
    sql: ${TABLE}."FRANCHISECODE" ;;
  }

  dimension: franchisename {
    type: string
    sql: ${TABLE}."FRANCHISENAME" ;;
  }

  dimension: idclientsuccessrep {
    type: number
    sql: ${TABLE}."IDCLIENTSUCCESSREP" ;;
  }

  dimension: longname {
    type: string
    sql: ${TABLE}."LONGNAME" ;;
  }

  dimension: othercontactemail {
    type: string
    sql: ${TABLE}."OTHERCONTACTEMAIL" ;;
  }

  dimension: othercontactname {
    type: string
    sql: ${TABLE}."OTHERCONTACTNAME" ;;
  }

  dimension: ownertypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."OWNERTYPEID" ;;
  }

  dimension: parentid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PARENTID" ;;
  }

  dimension: prcompanynotes {
    type: string
    sql: ${TABLE}."PRCOMPANYNOTES" ;;
  }

  dimension: prdatacontactemail {
    type: string
    sql: ${TABLE}."PRDATACONTACTEMAIL" ;;
  }

  dimension: prdatacontactname {
    type: string
    sql: ${TABLE}."PRDATACONTACTNAME" ;;
  }

  dimension: prothercontactemail {
    type: string
    sql: ${TABLE}."PROTHERCONTACTEMAIL" ;;
  }

  dimension: prothercontactname {
    type: string
    sql: ${TABLE}."PROTHERCONTACTNAME" ;;
  }

  dimension: prreportformatpref {
    type: string
    sql: ${TABLE}."PRREPORTFORMATPREF" ;;
  }

  dimension: prsegmentid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PRSEGMENTID" ;;
  }

  dimension: prstatusid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PRSTATUSID" ;;
  }

  dimension: prsystemuserid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PRSYSTEMUSERID" ;;
  }

  dimension: reportformatpref {
    type: string
    sql: ${TABLE}."REPORTFORMATPREF" ;;
  }

  dimension: segmentid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."SEGMENTID" ;;
  }

  dimension: shortname {
    type: string
    sql: ${TABLE}."SHORTNAME" ;;
  }

  dimension_group: startdate {
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
    sql: ${TABLE}."STARTDATE" ;;
  }

  dimension: statusid {
    type: number
    value_format_name: id
    sql: ${TABLE}."STATUSID" ;;
  }

  dimension: systemuserid {
    type: number
    value_format_name: id
    sql: ${TABLE}."SYSTEMUSERID" ;;
  }

  dimension: wbstatusid {
    type: number
    value_format_name: id
    sql: ${TABLE}."WBSTATUSID" ;;
  }

  dimension: wbsystemuserid {
    type: number
    value_format_name: id
    sql: ${TABLE}."WBSYSTEMUSERID" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      longname,
      prdatacontactname,
      franchisename,
      datacontactname,
      shortname,
      prothercontactname,
      othercontactname,
      segments.id,
      segments.name,
      bbiinex.count,
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
      units.count
    ]
  }
}
