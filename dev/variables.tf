variable "namespace_name" {
  type        = string
  default     = "terraform-namespace-dev"  # Значение по умолчанию
  description = "Имя namespace для развертывания приложения"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Имя контура"
}