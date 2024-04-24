# Configuring ISTIO for Kubernetes Ingress

### For HTTP (Non-TLS Mode)

Apply the following configuration for an HTTP gateway:

```shell
kubectl -n istio-system apply -f istio-ingress/resources/gateway-http.yaml
```

### For HTTPS (TLS Mode)

To set up a secure gateway using TLS:

1. **Create a TLS Secret:** Use the template below, replacing placeholder values with your actual base64 encoded certificate and key.

   ```yaml
   apiVersion: v1
   kind: Secret
   metadata:
     name: tls-secret # Replace with your secret name
   data:
     tls.crt: >-
       <base64 encoded certificate>
     tls.key: >-
       <base64 encoded private key>
   type: kubernetes.io/tls
   ```

2. **Deploy the HTTPS Gateway:** After creating the secret, apply the HTTPS gateway configuration.

```shell
kubectl -n istio-system apply -f istio-ingress/resources/gateway-https.yaml
```

## DNS Configuration for Access

To make your service accessible via a domain name, configure DNS to point to the ISTIO ingress.

### Retrieving the External IP Address

Run this command to fetch the external IP address of the ISTIO ingress:

```shell
kubectl get svc istio-ingress -n istio-system
```

Look for the `EXTERNAL-IP` column in the command output.

### Setting Up DNS

With the external IP in hand, update your DNS settings to direct traffic to this IP. The specific steps will depend on your DNS provider or internal DNS system.

By following these steps, you'll have ISTIO set up as an ingress controller in your Kubernetes cluster.