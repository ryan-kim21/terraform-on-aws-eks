resource "helm_release" "kong_release" {
  name       = "${local.name}-kong"
  repository = "https://charts.konghq.com"
  chart      = "kong"
  namespace  = "kong-namespace"   # 원하는 네임스페이스로 변경하세요.

  set {
    name  = "service.type"
    value = "LoadBalancer" # 혹은 원하는 서비스 타입을 지정하세요. 예: NodePort, ClusterIP 등
  }

  set {
    name  = "proxy.type"
    value = "LoadBalancer" # 혹은 원하는 프록시 타입을 지정하세요.
  }

  set {
    name  = "ingressController.enabled"
    value = "true" # Ingress 컨트롤러를 사용하려면 true로 설정하세요.
  }

  # 필요에 따라 추가 구성 값을 `set` 구문으로 제공할 수 있습니다.
  # 예:
  # set {
  #   name  = "some.configuration"
  #   value = "your_value"
  # }

}


