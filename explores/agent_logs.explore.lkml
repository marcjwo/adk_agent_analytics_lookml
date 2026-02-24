include: "/views/refined/agent_logs.view.lkml"


explore: agent_logs {
  hidden: yes
  join: agent_logs__content_parts {
    view_label: "Agent Logs: Content Parts"
    sql: LEFT JOIN UNNEST(${agent_logs.content_parts}) as agent_logs__content_parts ;;
    relationship: one_to_many
  }
}
