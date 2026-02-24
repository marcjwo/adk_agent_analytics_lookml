# Looker Project: `odk_agent_analytics`
## 📖 Overview
This is prebuilt LookML to work together with the agent logs table that is created when using the [BigQuery Agent Analytics plugin for ADK](https://google.github.io/adk-docs/integrations/bigquery-agent-analytics/
## 🛠 Project Constants
These values are defined in your project's `manifest.lkml`. Using these constants is the recommended way to maintain project portability across Development, Staging, and Production environments.
| Constant Name | Current Value | Usage / Description |
| :--- | :--- | :--- |
| `connection` | `default_bigquery_connection` | The named [BigQuery Connection](#) in Looker Admin. |
| `project_id` | `gcp_project` | The Google Cloud Platform (GCP) Project ID. |
| `bq_dataset` | `agent_logs` | The specific BigQuery Dataset housing the source data. |
| `agent_logs_table` | `agent_logs` | The base table name used for agent log analytics. |
### 💡 Reference Syntax
The constants are referenced in LookML with the `@{constant_name}` syntax.
### 👣
The repository contains a raw view file, a refined view file, and a prebuilt LookML dashboard to get started:
```
├── dashboards/
│   └── agent_analytics_operational_dashboard.dashboard
├── explores/
│   └── agent_logs.explore
├── views/
│   └── raw
│         └── agent_logs.view
│   └── refined
│         └── agent_logs.view
```
