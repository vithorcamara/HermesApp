# Hermes App

Este projeto é um aplicativo desenvolvido em Dart, utilizando o framework Flutter. O objetivo do Hermes App é fornecer uma interface para envio de pacotes e pagamentos, simulando uma plataforma de envio de encomendas com diversas funcionalidades como pagamento via cartão, PIX, checagem de dados do destinatário e remetente, entre outros.

## Estrutura do Projeto

O projeto está organizado da seguinte maneira:

### Diretórios

- **lib/pages/**: Contém as páginas principais do aplicativo.
  - `adicionais_page.dart`: Página de adicionais do pacote.
  - `cartao_pagamento_page.dart`: Página para pagamento com cartão.
  - `checagem_page.dart`: Página de checagem de dados do envio.
  - `codigo_barras_page.dart`: Página para leitura de código de barras.
  - `concluido.dart`: Página exibida quando o processo de envio está concluído.
  - `contrato_pagamento_page.dart`: Página para gerenciamento de contrato de pagamento.
  - `dados_destinatario_page.dart`: Página para preenchimento dos dados do destinatário.
  - `dados_remetente_page.dart`: Página para preenchimento dos dados do remetente.
  - `initial_page.dart`: Página inicial do aplicativo.
  - `pacote_page.dart`: Página para informações do pacote.
  - `pagamento_page.dart`: Página de pagamento principal.
  - `pix_pagamento_page.dart`: Página de pagamento via PIX.
  - `splash_screen_page.dart`: Tela de splash exibida no início do aplicativo.
  - `tipo_usuario_page.dart`: Página para seleção do tipo de usuário.

- **lib/service/**: Contém serviços auxiliares.
  - `media_query.dart`: Utilitário para adaptar o layout de acordo com o tamanho da tela.
  - `validation_cpf.dart`: Serviço para validação de CPF.

- **lib/widgets/**: Contém widgets personalizados usados em diversas partes do aplicativo.
  - `CorreiosButton.dart`: Botão personalizado com o estilo dos Correios.
  - `CorreiosIconeBordaButton.dart`: Botão de ícone com borda.
  - `CorreiosIconeButton.dart`: Botão de ícone.

## Funcionalidades

- **Gerenciamento de Encomendas**: O usuário pode gerenciar seus envios de pacotes com informações detalhadas de remetente e destinatário.
- **Métodos de Pagamento**: Suporte para pagamento via cartão de crédito, PIX e contrato de pagamento.
- **Leitura de Código de Barras**: Implementação de leitura de código de barras para acompanhar os pacotes.
- **Validação de CPF**: Validação de CPF no momento do cadastro ou envio.

## Pré-requisitos

- **Flutter SDK**: Este projeto foi desenvolvido utilizando o Flutter. Você precisará instalar o SDK para executar o aplicativo.
- **Dart SDK**: O projeto é baseado na linguagem Dart, então é necessário ter o Dart SDK instalado.

## Como Executar

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/vithorcamara/HermesApp
   ```
   
2. **Instale as dependências**:
   ```bash
   flutter pub get
   ```

3. **Execute o aplicativo**:
   ```bash
   flutter run
   ```