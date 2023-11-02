
vault policy write one-api-policy - <<EOH
path "kubeos/dev/one-api"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOH


vault write auth/kubernetes/role/one-api \
        bound_service_account_names=one-api \
        bound_service_account_namespaces=dev \
        policies=one-api-policy \
        ttl=72h