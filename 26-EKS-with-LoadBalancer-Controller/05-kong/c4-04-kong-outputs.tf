# Helm Release Outputs
output "kong_helm_metadata" {
  description = "Metadata Block outlining status of the deployed release."
  value = helm_release.kong.metadata
}
