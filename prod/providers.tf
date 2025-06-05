provider "kubernetes" {
  config_context_cluster   = "minikube"
  config_path = "~/.kube/config"
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

data "external" "minikube_ip" {
  program = ["powershell.exe", "-Command", "minikube ip | ConvertTo-Json -Compress | % { '{ \"ip\": ' + $_ + ' }' }"]
}