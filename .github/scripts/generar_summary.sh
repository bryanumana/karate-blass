#!/usr/bin/env bash

# Buscamos el archivo HTML de resumen de Karate
HTML_FILE=$(find target -name "karate-summary.html" | head -n 1)

if [ -f "$HTML_FILE" ]; then
    # Extraemos los datos del bloque JSON incrustado al final del HTML
    TOTAL_FEATS=$(grep -oP '"feature_count":\s*\K[0-9]+' "$HTML_FILE" | head -1 || echo "0")
    FEATS_PASSED=$(grep -oP '"feature_passed":\s*\K[0-9]+' "$HTML_FILE" | head -1 || echo "0")
    FEATS_FAILED=$(grep -oP '"feature_failed":\s*\K[0-9]+' "$HTML_FILE" | head -1 || echo "0")

    TOTAL_SCENARIOS=$(grep -oP '"scenario_count":\s*\K[0-9]+' "$HTML_FILE" | head -1 || echo "0")
    SCENARIOS_PASSED=$(grep -oP '"scenario_passed":\s*\K[0-9]+' "$HTML_FILE" | head -1 || echo "0")
    SCENARIOS_FAILED=$(grep -oP '"scenario_failed":\s*\K[0-9]+' "$HTML_FILE" | head -1 || echo "0")

    TIME_MS=$(grep -oP '"duration_millis":\s*\K[0-9]+' "$HTML_FILE" | head -1 || echo "0")

    # Convertimos los milisegundos a segundos con 2 decimales
    TIME_ELAPSED=$(awk "BEGIN {printf \"%.2f\", $TIME_MS/1000}")

    {
      echo "## 📊 Resultados de la Ejecución (Karate)"
      echo ""
      echo "| Métrica | Resultado |"
      echo "| :--- | :--- |"
      echo "| 🎯 **Features ejecutadas** | $TOTAL_FEATS |"
      echo "| 🟢 **Features pasadas** | $FEATS_PASSED |"
      echo "| 🔴 **Features fallidas** | $FEATS_FAILED |"
      echo "| 🎯 **Scenarios ejecutados** | $TOTAL_SCENARIOS |"
      echo "| 🟢 **Scenarios pasados** | $SCENARIOS_PASSED |"
      echo "| 🔴 **Scenarios fallidos** | $SCENARIOS_FAILED |"
      echo "| ⏱️ **Tiempo transcurrido** | $TIME_ELAPSED s |"
    } >> "$GITHUB_STEP_SUMMARY"
else
    echo "⚠️ No se encontró el archivo karate-summary.html, revisa los artefactos." >> "$GITHUB_STEP_SUMMARY"
fi