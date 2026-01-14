include: "/views/raw/agent_logs.view.lkml"

view: +agent_logs {

  dimension: primary_key {
    hidden: no
    primary_key: yes
    sql: FARM_FINGERPRINT(CONCAT(${timestamp_raw},${user_id})) ;;
  }

  dimension: tool_name {
    hidden: no
    type: string
    sql: TRIM(REGEXP_EXTRACT(${content}, r'Tool Name: ([^,|]+)')) ;;
  }

  dimension: text_response {
    hidden: no
    type: string
    sql: TRIM(REGEXP_EXTRACT(${content}, r'text:\s*(.*?)\s*\|'), "'");;
  }

  dimension: has_error {
    hidden: no
    type: yesno
    sql: ${event_type} = 'TOOL_ERROR' OR REGEXP_CONTAINS(content, r'(?i)\berror\b') ;;
  }

  dimension: prompt_token {
    hidden: no
    type: number
    sql: CAST(REGEXP_EXTRACT(${content}, r'prompt:\s*(\d+)') AS INT64) ;;
  }

  dimension: candidate_token {
    hidden: no
    type: number
    sql: CAST(REGEXP_EXTRACT(${content}, r'candidates:\s*(\d+)') AS INT64) ;;
  }

  #####

  measure: user_count {
    hidden: no
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: error_count  {
    hidden: no
    type: count
    filters: [has_error: "yes"]
  }

  measure: sum_of_prompt_token {
    hidden: no
    type: sum
    sql: ${prompt_token} ;;
  }

  measure: sum_of_candidate_token {
    hidden: no
    type: sum
    sql: ${candidate_token} ;;
  }

  measure: session_count {
    hidden: no
    type: count_distinct
    sql: ${session_id};;
  }

  measure: invocation_count {
    hidden: no
    type: count_distinct
    sql: ${invocation_id} ;;
  }

}
