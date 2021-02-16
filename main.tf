resource "null_resource" "operator-deploy" {
  provisioner "local-exec" {
      command = <<EOT
        curl -s -X POST https://cm.globalcatalog.test.cloud.ibm.com/api/v1-beta/deploy/kubernetes/olm/operator \
             -H 'Content-Type: application/json' \
             -H 'X-Auth-Refresh-Token: ${var.refresh_token}' \
             -H 'Authorization: bearer ${var.token}' \
             -d '{"cluster_id": "${var.cluster_id}", "region": "${var.region}", "all_namespaces": "${var.all_namespaces}", "version_locator_id": "${var.version_locator_id}", "namespaces": "${var.namespaces}"}'
        EOT
  } 
}
