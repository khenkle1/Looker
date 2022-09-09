view: locationhierarchy {
  sql_table_name: "SQLDEV01_DBO"."LOCATIONHIERARCHY"
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

  dimension: dma {
    type: string
    sql: ${TABLE}."DMA" ;;
  }

  dimension: dmaname {
    type: string
    sql: ${TABLE}."DMANAME" ;;
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

  dimension: nation {
    type: string
    sql: ${TABLE}."NATION" ;;
  }

  dimension: nationname {
    type: string
    sql: ${TABLE}."NATIONNAME" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: regionname {
    type: string
    sql: ${TABLE}."REGIONNAME" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: statename {
    type: string
    sql: ${TABLE}."STATENAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [nationname, regionname, dmaname, statename]
  }
}
