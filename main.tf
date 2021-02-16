resource "null_resource" "operator-deploy" {
  provisioner "local-exec" {
      command = <<EOT
        curl -s -X POST https://api.cloudability.com/v3/vendors/aws/accounts \
             -H 'Content-Type: application/json' \
             -u "$${CldAbltyAPIToken:?Missing Cloudability API Token Env Variable}:" \
             -d '{"vendorAccountId": "${data.aws_caller_identity.current.account_id}", "type": "aws_role" }'
      EOT
  }
}
