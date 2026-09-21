#!/usr/bin/env bash
# Removes everything the codelab created in BigQuery: the dataset, its tables and the property graph.
# The data agent from the optional chat step is deleted in the console (Agents → Agent catalog).
set -euo pipefail
PROJECT="${GOOGLE_CLOUD_PROJECT:-$(gcloud config get-value project 2>/dev/null || true)}"
DATASET="${DATASET:-music}"
bq --project_id="$PROJECT" rm -r -f -d "$PROJECT:$DATASET" && printf '  ✓ dropped %s.%s (tables and graph)\n' "$PROJECT" "$DATASET"
