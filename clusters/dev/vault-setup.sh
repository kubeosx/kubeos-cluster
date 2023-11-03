
vault policy write three-api-policy - <<EOH
path "kubeos/dev/three-api"
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


vault write auth/kubernetes/role/three-api \
        bound_service_account_names=three-api \
        bound_service_account_namespaces=dev \
        policies=three-api-policy \
        ttl=72h

vault kv put kubeos/dev/three-api name=three-api