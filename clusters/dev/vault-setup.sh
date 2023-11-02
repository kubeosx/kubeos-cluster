
vault policy write two-api-policy - <<EOH
path "kubeos/dev/two-api"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}
path "kubeos/dev/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "kubeos/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOH


vault write auth/kubernetes/role/two-api \
        bound_service_account_names=two-api \
        bound_service_account_namespaces=dev \
        policies=two-api-policy \
        ttl=72h