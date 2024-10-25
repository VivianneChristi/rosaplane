# Sistema de Gerenciamento de Pacotes de Viagem - RosaPlane
Este projeto é o sistema de gerenciamento de pacotes de viagem para a empresa de turismo RosaPlane, desenvolvido para gerenciar informações sobre destinos, pacotes, clientes e reservas. O objetivo é garantir a integridade dos dados e otimizar o desempenho das consultas, possibilitando uma experiência mais eficiente para os usuários finais.

### Índice
- Especificações do Projeto
- Estrutura do Banco de Dados
- Instalação
- Detalhes das Tabelas e Consultas
- Exemplo de Consultas
- Contribuição
  
### Especificações do Projeto
1. __Destinos:__  Armazena informações sobre destinos de viagem.
2. __Pacotes:__ Detalhes de pacotes oferecidos, incluindo informações de preço e data.
3. __Clientes:__ Informações dos clientes cadastrados no sistema.
4. __Reservas:__ Armazena dados de reservas feitas pelos clientes, com status e número de pessoas.

### Estrutura do Banco de Dados
O banco de dados "rosaplane" foi projetado com tabelas específicas para cada aspecto do sistema de viagens:

### Tabelas:
__1. Destinos__

*id:* Chave primária, auto-incremento <br>
*nome_destino:* Nome do destino <br>
*pais:* País do destino <br>
*descricao:* Descrição breve do destino <br>

__2.Pacotes__

*id:* Chave primária, auto-incremento <br>
*id_destino:* Chave estrangeira que faz referência ao id em Destinos <br>
*nome_pacote:* Nome do pacote <br>
*preco:* Preço do pacote <br>
*data_inicio:* Data de início do pacote <br>
*data_termino:* Data de término do pacote <br>

__3.Clientes__
 
*id:* Chave primária, auto-incremento <br>
*nome_cliente:* Nome completo do cliente <br>
*email:* E-mail do cliente, campo único <br>
*telefone:* Telefone de contato do cliente <br>
*endereco:* Endereço completo do cliente

__4.Reservas__

*id:* Chave primária, auto-incremento <br>
*id_cliente:* Chave estrangeira que faz referência ao id em Clientes <br>
*id_pacote:* Chave estrangeira que faz referência ao id em Pacotes <br>
*data_reserva:* Data da reserva <br>
*numero_pessoas:* Quantidade de pessoas incluídas na reserva <br>
*status_reserva:* Status da reserva (confirmada, pendente, cancelada) 

### Views e Índices

__1.VIEW detalhes_reservas:__ <br>
Mostra uma visão detalhada de reservas, com informações do cliente, pacote e destino. <br>
*Índice idx_reservas_status:* Criado para otimizar consultas pelo campo status_reserva na tabela de Reservas.<br>


### Instalação

Clone este repositório e importe o script SQL rosaplane.sql no seu servidor MySQL.
Execute o comando CREATE DATABASE rosaplane; e USE rosaplane; para criar e acessar o banco de dados.
Execute as consultas fornecidas no arquivo SQL para criar as tabelas, views e índices.

### Detalhes das Tabelas e Consultas
Para visualizar informações detalhadas de todas as reservas, clientes, pacotes e destinos, consulte a VIEW detalhes_reservas.

*Exemplo de consulta:*
```
SELECT * FROM detalhes_reservas;
```

### Exemplo de Consultas

*Exemplo de Inserção:*

```
INSERT INTO destinos (nome_destino, pais, descricao) 
VALUES ('Paris', 'França', 'A cidade do amor e da Torre Eiffel');
Exemplo de Consulta com View:
```

```
SELECT * FROM detalhes_reservas WHERE status_reserva = 'Confirmada';
```

### Contribuição
Contribuições são bem-vindas! Sinta-se à vontade para fazer fork deste projeto e submeter um pull request.

