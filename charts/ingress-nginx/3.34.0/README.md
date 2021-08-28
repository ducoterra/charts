# Nginx ingress

1. Install nginx

    ```bash
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    helm repo update
    helm install ingress-nginx ingress-nginx/ingress-nginx
    ```

2. Install cert-manager

    ```bash
    kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.3.1/cert-manager.yaml
    ```

3. Apply nginx

    ```bash
    kubectl apply -f letsencrypt-issuer.yaml
    ```

## Ingress Examples

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-prod
    kubernetes.io/ingress.class: nginx
  name: {{ .Release.Name }}
spec:
  rules:
  - host: {{ .Release.Name }}.ducoterra.net
    http:
      paths:
      - backend:
          service:
            name: {{ .Release.Name }}
            port:
              number: 80
        path: /
        pathType: Prefix
  tls:
  - hosts:
    - {{ .Release.Name }}.ducoterra.net
    secretName: {{.Release.Name}}-tls-cert
```
