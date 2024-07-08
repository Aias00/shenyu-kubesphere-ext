{{- define "shenyu.h2.url" }}
    {{-  .Values.dataSource.h2.url | default "jdbc:h2:mem:~/shenyu;DB_CLOSE_DELAY=-1;MODE=MySQL;" }}
{{- end -}}

{{- define "shenyu.mysql.url" -}}
{{- with .Values.dataSource.mysql -}}
    {{- if .urlOverride -}}
        {{- .urlOverride | quote -}}
    {{- else -}}
        jdbc:mysql://{{ required ".dataSource.mysql.ip is required" .ip }}:{{ .port }}/{{ required "" .database | default "shenyu" }}?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=Asia/Shanghai&zeroDateTimeBehavior=convertToNull
    {{- end }}
{{- end }}
{{- end -}}

{{- define "shenyu.pg.url" -}}
{{- with .Values.dataSource.pg -}}
    {{- if .urlOverride -}}
        {{- .urlOverride -}}
    {{- else -}}
        jdbc:postgresql://{{ .ip }}:{{ .port }}/{{ .database | default "shenyu" }}
    {{- end }}
{{- end }}
{{- end -}}

{{- define "shenyu.oracle.url" -}}
{{- with .Values.dataSource.oracle -}}
    {{- if .urlOverride -}}
        {{- .urlOverride -}}
    {{- else -}}
        jdbc:oracle:thin:@{{ .ip }}:{{ .port }}/{{ .serviceName | default "shenyu" }}
    {{- end }}
{{- end }}
{{- end -}}


{{- define "common.labels.standard" -}}
{{- end -}}

{{- define "common.labels.matchLabels" -}}
{{- end -}}

{{- define "shenyu.admin.labels" -}}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: shenyu-admin
{{- end -}}

{{- define "shenyu.admin.selectorLabels" -}}
{{ include "common.labels.matchLabels" . }}
app.kubernetes.io/component: shenyu-admin
{{- end -}}

{{- define "shenyu.bootstrap.labels" -}}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: shenyu-bootstrap
{{- end -}}

{{- define "shenyu.bootstrap.selectorLabels" -}}
{{ include "common.labels.matchLabels" . }}
app.kubernetes.io/component: shenyu-bootstrap
{{- end -}}


{{/* vim: set filetype=mustache: */}}
{{/*
Renders a value that contains template perhaps with scope if the scope is present.
Usage:
{{ include "common.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $ ) }}
{{ include "common.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $ "scope" $app ) }}
*/}}
{{- define "common.tplvalues.render" -}}
{{- $value := typeIs "string" .value | ternary .value (.value | toYaml) }}
{{- if contains "{{" (toJson .value) }}
  {{- if .scope }}
      {{- tpl (cat "{{- with $.RelativeScope -}}" $value "{{- end }}") (merge (dict "RelativeScope" .scope) .context) }}
  {{- else }}
    {{- tpl $value .context }}
  {{- end }}
{{- else }}
    {{- $value }}
{{- end }}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "common.names.fullname" -}}
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