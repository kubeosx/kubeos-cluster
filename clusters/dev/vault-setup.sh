
vault policy write six-api-policy - <<EOH
path "kubeos/dev/six-api"
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


vault write auth/kubernetes/role/six-api \
        bound_service_account_names=six-api \
        bound_service_account_namespaces=dev \
        policies=six-api-policy \
        ttl=72h

vault kv put kubeos/dev/six-api name=six-api