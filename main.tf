resource "null_resource" "operator-deploy" {
  provisioner "local-exec" {
      command = <<EOT
        curl -s -X POST https://cm.globalcatalog.test.cloud.ibm.com/api/v1-beta/deploy/kubernetes/olm/operator \
             -H 'Content-Type: application/json' \
             -H 'X-Auth-Refresh-Token: ${data.refresh_token}' \
             -H 'Authorization: bearer ${data.token}' \
             -d '{"cluster_id": "${data.cluster_id}", "region": "${data.region}", "all_namespaces": "${data.all_namespaces}", "version_locator_id": "${data.version_locator_id}", "namespaces": "${data.namespaces}"}'
        EOT
  }
}
