# Создаем namespace
resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = var.namespace_name
  }
}

resource "helm_release" "nginx_release" {
  name      = "nginx-release-dev"
  namespace = var.namespace_name
  chart     = "../charts/nginx"
  values = [
    file("../charts/values-common.yaml"),
    file("../charts/values-${var.environment}.yaml")
  ]
  # Ждем создания namespace перед установкой
  depends_on = [kubernetes_namespace.app_namespace]
}

resource "helm_release" "hello_world" {
  name       = "hello-world-dev"
  namespace = var.namespace_name
  chart      = "../charts/hello-world"
  values = [
    file("../charts/values-common.yaml"),
    file("../charts/values-${var.environment}.yaml")
  ]
}
