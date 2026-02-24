project_name: "adk_agent_analytics"

constant: connection {
  value: "default_bigquery_connection"
}

constant: project_id {
  value: "gcp_project"
}

constant: bq_dataset {
  value: "agent_logs"
}

constant: agent_logs_table {
  value: "agent_logs"
}

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
