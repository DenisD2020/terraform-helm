# resource "helm_release" "redis" {
#   name       = "redis"
#   repository = "https://charts.helm.sh/stable"  # Официальный репозиторий Bitnami
#   chart      = "redis"
#   version    = "18.2.0"  # Актуальная версия (проверьте в документации)
#   namespace  = "terraform-namespace"
#
#   set {
#     name  = "architecture"
#     value = "standalone"  # Или "replication" для кластера
#   }
#
#   set {
#     name  = "auth.enabled"
#     value = "false"  # Отключить пароль (для тестов)
#   }
#
#   set {
#     name  = "service.type"
#     value = "NodePort"
#   }
# }