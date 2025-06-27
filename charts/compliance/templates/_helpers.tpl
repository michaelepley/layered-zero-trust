{{/*
Generate the canonical names for various parts of a compliance system. Parts include those as currently defined by the openshift compliance operator.
*/}}

# the compliance system name: eg, "validated-pattern-layered-0-1"
{{- define "canonical-name.compliance" -}}
{{ printf "%s-%s-%s-%s" .Values.compliance.name .Values.compliance.variant (index .Values.compliance "major-version") (index .Values.compliance "minor-version") | trunc 63 | trimSuffix "-" }}
{{- end }}

# the compliance profilebundle name: eg, ocpv4-zerotrust
{{- define "canonical-name.profile-bundle" -}}
{{- range $key, $val := .Values.policy.profile}}{{$val.name}}{{end -}}-{{- range $key, $val := .Values.policy.baseline}}{{$val.name}}{{end -}}
{{- end }}

# the compliance profile name: eg, validated-pattern-layered-ocpv4
{{- define "canonical-name.profile" -}}
{{ printf "%s-%s" .Values.compliance.name .Values.compliance.variant }}-{{- range $key, $val := .Values.policy.profile}}{{$val.name}}{{end -}}
{{- end }}

#the compliance scan setting name: eg, validated-pattern-layered-zero-trust
{{- define "canonical-name.scan-setting" -}}
{{ printf "%s-%s" .Values.compliance.name .Values.compliance.variant }}-{{- range $key, $val := .Values.policy.baseline}}{{$val.name}}{{end -}}
{{- end }}

#the compliance scan setting binding name: eg, zero-trust-ocpv4
{{- define "canonical-name.scan-setting-binding" -}}
{{- range $key, $val := .Values.policy.baseline}}{{$val.name}}{{end -}}{{- range $key, $val := .Values.policy.profile }}-{{$val.name}}{{end -}}
{{- end }}

# the compliance regime (a complete synopsis): eg, validated-pattern-layered-0-1-zero-trust-ocpv4
{{- define "canonical-name.compliance-regime" -}}
{{ printf "%s-%s-%s-%s" .Values.compliance.name .Values.compliance.variant (index .Values.compliance "major-version") (index .Values.compliance "minor-version") }}-{{- range  $key, $val := .Values.policy.profile}}{{$val.name}}{{end}}-{{- range  $key, $val := .Values.policy.baseline}}{{$val.name}}{{end -}}
{{- end }}

