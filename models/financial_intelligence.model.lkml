connection: "fi_data"

# include all the views
include: "/views/**/*.view"

datagroup: financial_intelligence_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: financial_intelligence_default_datagroup

explore: accounts {
  join: segments {
    type: left_outer
    sql_on: ${accounts.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }
}

explore: bbiinex {
  join: accounts {
    type: left_outer
    sql_on: ${bbiinex.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${accounts.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }
}

explore: benchmarks {
  join: metrics {
    type: left_outer
    sql_on: ${benchmarks.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${benchmarks.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }

  join: locationhierarchy {
    type: left_outer
    sql_on: ${benchmarks.locationid} = ${locationhierarchy.locationid}.id} ;;
    relationship: many_to_one
  }
}

explore: benchmarks2_yrgrowth {
  join: segments {
    type: left_outer
    sql_on: ${benchmarks2_yrgrowth.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }

  join: metrics {
    type: left_outer
    sql_on: ${benchmarks2_yrgrowth.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }
}

explore: benchmarks3_yrgrowth {
  join: metrics {
    type: left_outer
    sql_on: ${benchmarks3_yrgrowth.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${benchmarks3_yrgrowth.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }
}

explore: competitivesets {
  join: metrics {
    type: left_outer
    sql_on: ${competitivesets.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${competitivesets.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${accounts.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }
}

explore: compsales2_years_v2 {
  join: weeks {
    type: left_outer
    sql_on: ${compsales2_years_v2.weekid} = ${weeks.id} ;;
    relationship: many_to_one
  }

  join: metrics {
    type: left_outer
    sql_on: ${compsales2_years_v2.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }

  join: units {
    type: left_outer
    sql_on: ${compsales2_years_v2.unitid} = ${units.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${compsales2_years_v2.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${compsales2_years_v2.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }
}

explore: compsales3_years_v2 {
  join: units {
    type: left_outer
    sql_on: ${compsales3_years_v2.unitid} = ${units.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${compsales3_years_v2.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${compsales3_years_v2.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: weeks {
    type: left_outer
    sql_on: ${compsales3_years_v2.weekid} = ${weeks.id} ;;
    relationship: many_to_one
  }

  join: metrics {
    type: left_outer
    sql_on: ${compsales3_years_v2.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }
}

explore: compsalesaccounts2_years_v2 {
  join: segments {
    type: left_outer
    sql_on: ${compsalesaccounts2_years_v2.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }

  join: metrics {
    type: left_outer
    sql_on: ${compsalesaccounts2_years_v2.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${compsalesaccounts2_years_v2.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: weeks {
    type: left_outer
    sql_on: ${compsalesaccounts2_years_v2.weekid} = ${weeks.id} ;;
    relationship: many_to_one
  }
}

explore: compsalesaccounts3_years_v2 {
  join: accounts {
    type: left_outer
    sql_on: ${compsalesaccounts3_years_v2.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${compsalesaccounts3_years_v2.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }

  join: weeks {
    type: left_outer
    sql_on: ${compsalesaccounts3_years_v2.weekid} = ${weeks.id} ;;
    relationship: many_to_one
  }

  join: metrics {
    type: left_outer
    sql_on: ${compsalesaccounts3_years_v2.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }
}

explore: compsalesaccountsnew {
  join: weeks {
    type: left_outer
    sql_on: ${compsalesaccountsnew.weekid} = ${weeks.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${compsalesaccountsnew.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: metrics {
    type: left_outer
    sql_on: ${compsalesaccountsnew.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${compsalesaccountsnew.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }
}

explore: compsalesnew {
  join: units {
    type: left_outer
    sql_on: ${compsalesnew.unitid} = ${units.id} ;;
    relationship: many_to_one
  }

  join: weeks {
    type: left_outer
    sql_on: ${compsalesnew.weekid} = ${weeks.id} ;;
    relationship: many_to_one
  }

  join: metrics {
    type: left_outer
    sql_on: ${compsalesnew.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${compsalesnew.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${compsalesnew.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }
}

explore: compunits {
  join: units {
    type: left_outer
    sql_on: ${compunits.unitid} = ${units.id} ;;
    relationship: many_to_one
  }

  join: weeks {
    type: left_outer
    sql_on: ${compunits.weekid} = ${weeks.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${units.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${accounts.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }
}

explore: customreportaccounts {}

explore: fivetran_audit {}

explore: locationhierarchy {}

explore: metrics {}

explore: results {
  join: metrics {
    type: left_outer
    sql_on: ${results.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${results.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${results.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }
}

explore: results2_yrgrowth {
  join: metrics {
    type: left_outer
    sql_on: ${results2_yrgrowth.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${results2_yrgrowth.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${results2_yrgrowth.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }
}

explore: results3_yrgrowth {
  join: segments {
    type: left_outer
    sql_on: ${results3_yrgrowth.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }

  join: metrics {
    type: left_outer
    sql_on: ${results3_yrgrowth.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${results3_yrgrowth.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }
}

explore: segments {}

explore: units {
  join: accounts {
    type: left_outer
    sql_on: ${units.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${accounts.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }
}

explore: weeklysales {
  join: weeks {
    type: left_outer
    sql_on: ${weeklysales.weekid} = ${weeks.id} ;;
    relationship: many_to_one
  }

  join: metrics {
    type: left_outer
    sql_on: ${weeklysales.metricid} = ${metrics.id} ;;
    relationship: many_to_one
  }

  join: units {
    type: left_outer
    sql_on: ${weeklysales.unitid} = ${units.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${units.accountid} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: segments {
    type: left_outer
    sql_on: ${accounts.segmentid} = ${segments.id} ;;
    relationship: many_to_one
  }
}

explore: weeks {}
