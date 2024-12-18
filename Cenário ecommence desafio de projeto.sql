-- Criação de Banco de dados para o cenário de E-COMMERCE

create database ecommerce_entrega;
use ecommerce_entrega;

-- criar tabelas cliente

create table Client(
  idCliente INT NOT NULL AUTO_INCREMENT,
  Pname VARCHAR(10) NOT NULL,
  Nmeioinicial VARCHAR(3) NULL,
  Sobrenome VARCHAR(20) NULL,
  cpf CHAR(11) NOT NULL,
  Endereço VARCHAR(45) NULL,
  Dnascimento DATE NOT NULL,
  PRIMARY KEY (idCliente),
  UNIQUE INDEX Identificação_UNIQUE (cpf ASC) VISIBLE)
ENGINE = InnoDB;

-- criar tabelas produto

CREATE TABLE Produto(
  idProduto INT NOT NULL AUTO_INCREMENT,
  Categoria VARCHAR(45) NOT NULL,
  Descrição VARCHAR(45) NULL,
  Valor VARCHAR(45) NOT NULL,
  PRIMARY KEY (idProduto))
ENGINE = InnoDB;

-- criar tabelas pedido

CREATE TABLE Pedido(
  idPedido INT NOT NULL AUTO_INCREMENT,
  Status_do_pedido ENUM ('Em andamento','Processando','Enviado','Entregue') NULL DEFAULT 'Processando',
  Descrição VARCHAR(45) NULL,
  Cliente_idCliente INT NOT NULL,
  Frete FLOAT NULL,
  PRIMARY KEY (idPedido, Cliente_idCliente),
  INDEX fk_Pedido_Cliente1_idx (Cliente_idCliente ASC) VISIBLE,
  CONSTRAINT fk_Pedido_Cliente1
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES mydb.Cliente (idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- para ser continuado no desafio: termina de implementar a tabela e crie a conexão com as tabelas necessarias 
-- alem disso, reflita essa modificação no esquema relacional

create table Pagamento(
idCliente
idPagamento
TipoPagamento enum('Boleto', 'Dois cartões')
limiteAvaliavel float,
primary key(idClente, idPagamento));

CREATE TABLE Fornecedor(
  idFornecedor INT NOT NULL,
  RSocial VARCHAR(45) NOT NULL,
  CNPJ CHAR(14) NULL,
  Telefone VARCHAR(15) NULL,
  Email VARCHAR(45) NULL,
  PRIMARY KEY (idFornecedor),
  UNIQUE INDEX RSocial_UNIQUE (RSocial ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE Disponibilizando_Produto(
  Fornecedor_idFornecedor INT NOT NULL,
  Produto_idProduto INT NOT NULL,
  PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
  INDEX fk_Fornecedor_has_Produto_Produto1_idx (Produto_idProduto ASC) VISIBLE,
  INDEX fk_Fornecedor_has_Produto_Fornecedor_idx (Fornecedor_idFornecedor ASC) VISIBLE,
  CONSTRAINT fk_Fornecedor_has_Produto_Fornecedor
    FOREIGN KEY (Fornecedor_idFornecedor)
    REFERENCES mydb.Fornecedor (idFornecedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Fornecedor_has_Produto_Produto1
    FOREIGN KEY (Produto_idProduto)
    REFERENCES mydb.Produto (idProduto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE Estoque(
  idEstoque INT NOT NULL,
  Local VARCHAR(45) NULL,
  Produto VARCHAR(45) NULL,
  Quantidade VARCHAR(45) NULL,
  PRIMARY KEY (idEstoque))
ENGINE = InnoDB;


CREATE table Estoque_de_Produto(
  Estoque_idEstoque INT NOT NULL,
  Produto_idProduto INT NOT NULL,
  Quantidade VARCHAR(45) NULL,
  PRIMARY KEY (Estoque_idEstoque, Produto_idProduto),
  INDEX fk_Estoque_has_Produto_Produto1_idx (Produto_idProduto ASC) VISIBLE,
  INDEX fk_Estoque_has_Produto_Estoque1_idx (Estoque_idEstoque ASC) VISIBLE,
  CONSTRAINT fk_Estoque_has_Produto_Estoque1
    FOREIGN KEY (Estoque_idEstoque)
    REFERENCES Estoque (idEstoque)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Estoque_has_Produto_Produto1
    FOREIGN KEY (Produto_idProduto)
    REFERENCES Produto (idProduto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS Terceito_vendedor(
  idTerceito_vendedor INT NOT NULL,
  RSocial VARCHAR(45) NOT NULL,
  Local VARCHAR(45) NULL,
  NomeFantasia VARCHAR(45) NOT NULL,
  PRIMARY KEY (idTerceito_vendedor),
  UNIQUE INDEX Razão_social_UNIQUE (RSocial ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE Produto_por_vendedor(
  Terceito_vendedor_idTerceito_vendedor INT NOT NULL,
  Produto_idProduto INT NOT NULL,
  Quantidade INT NULL,
  Produto_por_vendedorcol INT NULL,
  PRIMARY KEY (Terceito_vendedor_idTerceito_vendedor, Produto_idProduto),
  INDEX fk_Terceito_vendedor_has_Produto_Produto1_idx (Produto_idProduto ASC) VISIBLE,
  INDEX fk_Terceito_vendedor_has_Produto_Terceito_vendedor1_idx (Terceito_vendedor_idTerceito_vendedor ASC) VISIBLE,
  CONSTRAINT fk_Terceito_vendedor_has_Produto_Terceito_vendedor1
    FOREIGN KEY (Terceito_vendedor_idTerceito_vendedor)
    REFERENCES Terceito_vendedor (idTerceito_vendedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Terceito_vendedor_has_Produto_Produto1
    FOREIGN KEY (Produto_idProduto)
    REFERENCES Produto (idProduto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    
