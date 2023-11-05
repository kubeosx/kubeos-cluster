
vault policy write seven-api-policy - <<EOH
path "kubeos/dev/seven-api"
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


vault write auth/kubernetes/role/seven-api \
        bound_service_account_names=seven-api \
        bound_service_account_namespaces=dev \
        policies=seven-api-policy \
        ttl=72h

vault kv put kubeos/dev/seven-api name=seven-api