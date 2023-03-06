kubectl delete secret generic atlantis-auth \
  --namespace=atlantis \
  --ignore-not-found=true
kubectl create secret generic atlantis-auth \
  --namespace=atlantis \
  --from-literal=ATLANTIS_GH_TOKEN=$ATLANTIS_GH_TOKEN \
  --from-literal=ATLANTIS_GH_USER=$ATLANTIS_GH_USER \
  --from-literal=ATLANTIS_GH_WEBHOOK_SECRET=$ATLANTIS_GH_WEBHOOK_SECRET \
  --from-literal=ATLANTIS_ATLANTIS_URL=$ATLANTIS_ATLANTIS_URL


kubectl delete secret generic tailscale-secret \
  --namespace=atlantis \
  --ignore-not-found=true
kubectl create secret generic tailscale-secret \
  --namespace=atlantis \
  --from-literal=TAILSCALE_AUTH_KEY=$TAILSCALE_AUTH_KEY


kubectl delete secret generic atlantis-cloudflared-token \
  --namespace=atlantis \
  --ignore-not-found=true
kubectl create secret generic atlantis-cloudflared-token \
  --namespace=atlantis \
  --from-literal=token=$ATLANTIS_CLOUDFLARED_TOKEN


# gcloud iam service-accounts keys create \
# --iam-account backend@ceramic-hds-testing.iam.gserviceaccount.com \
# ./backend@ceramic-hds-testing.iam.gserviceaccount.com.json
kubectl create secret generic atlantis-backend-bucket-auth \
  --namespace=atlantis \
  --from-file=sa.json=sa-local.json
