
vault policy write vault-test-policy - <<EOH
path "kubeos/dev/vault-test/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}
path "kubeos/dev/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOH


vault write auth/kubernetes/role/vault-test \
        bound_service_account_names=vault-test \
        bound_service_account_namespaces=dev \
        policies=vault-test-policy \
        ttl=72h