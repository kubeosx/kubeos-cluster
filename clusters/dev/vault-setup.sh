
vault policy write eight-api-policy - <<EOH
path "kubeos/dev/eight-api"
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


vault write auth/kubernetes/role/eight-api \
        bound_service_account_names=eight-api \
        bound_service_account_namespaces=dev \
        policies=eight-api-policy \
        ttl=72h

vault kv put kubeos/dev/eight-api name=eight-api