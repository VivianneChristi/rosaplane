CREATE DATABASE rosaplane;
USE rosaplane;

CREATE TABLE destinos (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_destino VARCHAR(100),
    pais VARCHAR(50),
    descricao VARCHAR(255)
);

CREATE TABLE pacotes (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_destino INT,
    nome_pacote VARCHAR(100),
    preco INT,
    data_inicio DATE,
    data_termino DATE,
    FOREIGN KEY (id_destino) REFERENCES destinos(id)
);

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_cliente VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

CREATE TABLE reservas (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_cliente INT,
    id_pacote INT,
    data_reserva DATE,
    numero_pessoas INT,
    status_reserva VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_pacote) REFERENCES pacotes(id)
);

CREATE VIEW detalhes_reservas AS
SELECT 
    reservas.id AS id_reserva,
    reservas.data_reserva,
    reservas.numero_pessoas,
    reservas.status_reserva,
    clientes.nome_cliente,
    clientes.email,
    pacotes.nome_pacote,
    pacotes.preco,
    destinos.nome_destino,
    destinos.pais
FROM reservas
JOIN clientes ON reservas.id_cliente = clientes.id
JOIN pacotes ON reservas.id_pacote = pacotes.id
JOIN destinos ON pacotes.id_destino = destinos.id;

CREATE INDEX idx_reservas_status ON reservas(status_reserva);

INSERT INTO destinos (nome_destino, pais, descricao)
VALUES 
('Paris', 'França', 'A cidade do amor e da Torre Eiffel'),
('Tóquio', 'Japão', 'Conhecida por sua cultura rica e avançada tecnologia'),
('Rio de Janeiro', 'Brasil', 'Famosa pelo Carnaval e o Cristo Redentor');

INSERT INTO pacotes (id_destino, nome_pacote, preco, data_inicio, data_termino)
VALUES
(1, 'Romance em Paris', 5000, '2024-02-10', '2024-02-17'),
(2, 'Tecnologia e Tradição em Tóquio', 7000, '2024-03-05', '2024-03-15'),
(3, 'Carnaval no Rio', 4500, '2024-02-25', '2024-03-01');

INSERT INTO clientes (nome_cliente, email, telefone, endereco)
VALUES
('Alice Silva', 'alice.silva@email.com', '21987654321', 'Rua A, 123, São Paulo, SP'),
('Bruno Costa', 'bruno.costa@email.com', '21912345678', 'Av. B, 456, Rio de Janeiro, RJ'),
('Carla Nunes', 'carla.nunes@email.com', '11987654321', 'Rua C, 789, Belo Horizonte, MG');

INSERT INTO reservas (id_cliente, id_pacote, data_reserva, numero_pessoas, status_reserva)
VALUES
(1, 1, '2024-01-15', 2, 'Confirmada'),
(2, 2, '2024-02-20', 1, 'Pendente'),
(3, 3, '2024-02-22', 4, 'Cancelada');



SELECT * FROM detalhes_reservas;

