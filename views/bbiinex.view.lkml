view: bbiinex {
  sql_table_name: "SQLDEV01_DBO"."BBIINEX"
    ;;

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}."_FIVETRAN_DELETED" ;;
  }

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}."_FIVETRAN_ID" ;;
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

  dimension: dma {
    type: number
    sql: ${TABLE}."DMA" ;;
  }

  dimension: nation {
    type: number
    sql: ${TABLE}."NATION" ;;
  }

  dimension: region {
    type: number
    sql: ${TABLE}."REGION" ;;
  }

  dimension: state {
    type: number
    sql: ${TABLE}."STATE" ;;
  }

  dimension: weightrule {
    type: number
    sql: ${TABLE}."WEIGHTRULE" ;;
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
      accounts.id
    ]
  }
}
