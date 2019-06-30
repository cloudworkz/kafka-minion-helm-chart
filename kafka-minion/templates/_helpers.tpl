{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "kafka-minion.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kafka-minion.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kafka-minion.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name for the sasl credentials secret.
*/}}
{{- define "kafka-minion.saslSecretName" -}}
    {{- if .Values.kafka.sasl.existingSecret -}}
        {{- .Values.kafka.sasl.existingSecret -}}
    {{- else -}}
        {{- template "kafka-minion.fullname" . -}}-sasl
    {{- end -}}
{{- end -}}

{{/*
Create the name for the TLS credentials secret.
*/}}
{{- define "kafka-minion.tlsSecretName" -}}
    {{- if .Values.kafka.tls.existingSecret -}}
        {{- .Values.kafka.tls.existingSecret -}}
    {{- else -}}
        {{- template "kafka-minion.fullname" . -}}-sasl
    {{- end -}}
{{- end -}}
