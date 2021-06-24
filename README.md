# MongoDB X

Como instalar o
[MongoDB Community](https://github.com/mongodb/mongodb-kubernetes-operator) com a monitoração do
[Grafana](https://grafana.com/) +
[Prometheus](https://prometheus.io/) no
[Minikube](https://minikube.sigs.k8s.io/docs/start/).

Requisitos:
1. [Minikube](https://minikube.sigs.k8s.io/)
2. [Helm](https://helm.sh/)
3. Os arquivos deste repositório

## Instalar Minikube
[instale o minikube seguindo a documentação](https://minikube.sigs.k8s.io/docs/start/).

## Instalar Helm Charts
[instale o helm seguindo a documentação](https://helm.sh/docs/intro/install/).

## Instalar MongoDB Community
Após instalar e rodar o minikube:

   ```
   minikube start
   ```

crie os recursos utilizando o yamls aqui presentes para instalar o operador do MongoDB com um replicaSet de exemplo.
O usuário é `admin` e a senha `password`.
Você pode alterar os arquivos de acordo com o que desejar.

   ```
   minikube kubectl -- create -f ./
   ```

## Prometheus
Para adicionar o Prometheus utilizamos o helm chart provido pela comunidade.
   ```
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm install prometheus prometheus-community/prometheus
   kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-np
   ```

Os dois primeiros comandos instala o chart do Prometheus.
O terceiro comando expoe o prometheus-server usando um NodePort.
Desta forma podemos acessar a interface web do Prometheus utilizando a a porta criada.

   ```
   minikube service prometheus-server-np
   ```

## Grafana
Para adicionar o Grafana utilizamos o helm chart provido pela comunidade.

   ```
   helm repo add grafana https://grafana.github.io/helm-charts
   helm install grafana grafana/grafana
   kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-np
   ```

Da mesma forma que o Prometheus, instalamos o chart com os dois primeiros comandos e com o terceiro expomos
a interface web com um NodePort.

   ```
   minikube service grafana-np
   ```

![Grafana](images/grafana.png)

# Configurar Prometheus Datasource no Grafana
Após logar na interface do grafana, adicione o prometheus como datasource:
Configuration > Datasources e adicione uma instancia Prometheus.

![datasource import](images/configurar-datasource.png)

A URL para o prometheus contem o nome do serviço é `http://prometheus-server:80`

## Kubernetes Dashboard
Agora, configurar um dashboard para o kubernetes providos pela comunidade.
Neste momento vamos utilizar o  https://grafana.com/grafana/dashboards/6417

(+) > Import via grafana.com e digite o ID 6417 no campo e click em load.

![kubernetes dashboard import](images/grafana-kubernetes-dashboard-import0.png)

Na configuração do dashboard selecionamos o datasource do Prometheus criado anteriormente.

![kubernetes dashboard import](images/grafana-kubernetes-dashboard-import1.png)

Após confirmar a importação, seremos direcionados para o dashboard.

![kubernetes dashboard import](images/grafana-kubernetes-dashboard-import2.png)

Se tudo estiver ok, veremos informações do nosso cluster do minikube.

