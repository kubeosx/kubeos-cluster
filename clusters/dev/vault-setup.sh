
vault policy write demo-api-policy - <<EOH
path "kubeos/dev/demo-api"
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


vault write auth/kubernetes/role/demo-api \
        bound_service_account_names=demo-api \
        bound_service_account_namespaces=dev \
        policies=demo-api-policy \
        ttl=72h

vault kv put kubeos/dev/demo-api name=demo-api