# mongox

## MongoDB Community
Após instalar e rodar o minikube,
crie os recursos utilizando o yamls aqui presentes para instalar o mongo com um replicaSet de exemplo.
O usuário é admin e a senha password. Você pode alterar os arquivos de acordo com o que desejar.

   ```
   minikube kubectl -- create -f ./
   ```

## Instalar Helm Charts
[instale o helm seguindo a documentação](https://helm.sh/docs/intro/install/)

## Prometheus
   ```
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm install prometheus prometheus-community/prometheus
   kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-np
   ```

O primeiro comando instala o chart. O segundo comando expoe o prometheus-server usando um NodePort.
Desta forma podemos acessar a interface web do Prometheus.

   ```
   minikube service prometheus-server-np
   ```

## Grafana
   ```
   helm repo add grafana https://grafana.github.io/helm-charts
   helm install grafana grafana/grafana
   kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-np
   ```

   ```
   minikube service grafana-np
   ```

# Configurar Prometheus Datasource no Grafana
Após logar na interface do grafana, adicione o prometheus como datasource:
Configuration > Datasources e adicione uma instancia Prometheus.

![configurar datasource](https://raw.githubusercontent.com/tarcisio/mongox/images/configurar-datasource.png)

A URL para o prometheus contem o nome do serviço http://prometheus-server:80

## Kubernetes Dashboard
Agora, configurar um dashboard para o kubernetes providos pela comunidade.
Neste momento vamos utilizar o  https://grafana.com/grafana/dashboards/6417

(+) > Import via grafana.com e digite o ID 6417 no campo e click em load.

![configurar datasource](https://raw.githubusercontent.com/tarcisio/mongox/images/configurar-datasource.png)

In the dashboard configuration we need to select the Prometheus Datasource we created in the earlier step.

![Alt text](relative/path/to/img.jpg?raw=true "Title")

Once we confirm the Import dialog, we’ll be redirected to the new Dashboard.

If everything went well, you’ll be able to see your cluster’s information in the Dashboard.