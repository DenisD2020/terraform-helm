output "nginx_url" {
  value = "http://${data.external.minikube_ip.result.ip}:30201"
}

output "redis_service" {
  value = helm_release.redis.status
}

output "redis_connection" {
  value = "Run: redis://$(minikube ip):$(kubectl get svc redis-master -o jsonpath='{.spec.ports[0].nodePort}')"
}