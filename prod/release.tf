resource "kubernetes_namespace" "nginx_namespace" {
  metadata {
    name = "terraform-namespace-dev"
  }
}

resource "helm_release" "nginx_release" {
  name      = "nginx-release-dev"
  namespace = "terraform-namespace-dev"
  chart     = "../custom-nginx"
  values = [
    file("../custom-nginx/values.yaml")
  ]
  # Ждем создания namespace перед установкой
  depends_on = [kubernetes_namespace.nginx_namespace]
}
