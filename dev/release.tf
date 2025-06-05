# Создаем namespace
resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = var.namespace_name
  }
}

resource "helm_release" "nginx_release" {
  name      = "nginx-release-dev"
  namespace = var.namespace_name
  chart     = "../custom-nginx"
  values = [
    file("../custom-nginx/values.yaml")
  ]
  # Ждем создания namespace перед установкой
  depends_on = [kubernetes_namespace.app_namespace]
}
