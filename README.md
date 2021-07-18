# Hugo Gcloud

Imagem docker para deploy de site estático com o framework [hugo](hugo.io).

O framework hugo transforma o seu conteúdo escrito na liguagem *markdown* para *html*.

Além disso conta com vários [temas](https://themes.gohugo.io/) desde o mais simples até os mais rebuscados.

## Propósito

A idea é ter uma imagem que já tenha o hugo e o google sdk instalados. Depois usá-la em algum CI/CD e deixando o deploy automatizado.

Criei essa imagem para automatizar os deploy feitos e compartilhar com a comunidade.

## Requisito

- É necessário entender como o framework HUGO funciona e saber configurar o arquivo `config.tmol`. Vai depender de cada template.

- Criar um service account no formato json para utilizar em seu CI/CI como o GitlabCI.

- Ter um projeto no **Google Cloud**

- Criar as seguintes variáveis de ambiente em seu CI/CD:
  - **project_id** - ID do seu projeto no Google Cloud
  - **service account** - Uma conta de serviço usando para gerenciar nosso projeto com os `gsutil`e o `gcloud`

Não vou contar aqui como hospedar o seu site no Google Cloud. Tem mais passos do que esses escritos, mas deixo essa documentação da Google sobre [como hospedar o seu site no Google Cloud](https://cloud.google.com/storage/docs/hosting-static-website#storage-create-bucket-gsutil)
