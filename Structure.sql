CREATE DATABASE pizzeria_db;
USE pizzeria_db;

CREATE TABLE tipos_productos (
    tipo_id   INT AUTO_INCREMENT PRIMARY KEY,
    nombre    VARCHAR(50)    NOT NULL
);

-- 2. Tabla de productos
CREATE TABLE productos (
    producto_id     INT AUTO_INCREMENT PRIMARY KEY,
    tipo_id        INT NOT NULL,
    nombre         VARCHAR(50)    NOT NULL,
    precio      DECIMAL(10,2)  NOT NULL  DEFAULT 0.00,
    CONSTRAINT fk_productos_tipos
        FOREIGN KEY (tipo_id)
        REFERENCES tipos_productos(tipo_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
-- 3. Tabla de clientes
CREATE TABLE clientes (
    cliente_id   INT AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(100)   NOT NULL,
    email          VARCHAR(100)   UNIQUE,
    numeroContacto       VARCHAR(20),
    direccion      VARCHAR(150),
    ciudad         VARCHAR(50),
    pais           VARCHAR(50)
);

-- 4. Tabla de pizzas
CREATE TABLE pizzas (
    pizza_id       INT AUTO_INCREMENT PRIMARY KEY,
    producto_id        INT NOT NULL,
    tamano      ENUM('Pequeña', 'Mediana', 'Grande') NOT NULL DEFAULT 'Mediana',
    sabor ENUM('Hawaiana', 'Pepperoni', 'Campesina', 'Mexicana','Queso','Carnes') NOT NULL DEFAULT 'Queso',
    CONSTRAINT fk_pizza_productos
        FOREIGN KEY (producto_id)
        REFERENCES productos(producto_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
-- 5. Tabla de bebidas
CREATE TABLE bebidas (
    bebida_id       INT AUTO_INCREMENT PRIMARY KEY,
    producto_id        INT NOT NULL,
    sabor ENUM('Mango', 'Fresa', 'Mora', 'Agua','Mandarina') NOT NULL DEFAULT 'Agua',
    CONSTRAINT fk_bebida_productos
        FOREIGN KEY (producto_id)
        REFERENCES productos(producto_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 6. Tabla de combos
CREATE TABLE combos (
    combo_id       INT AUTO_INCREMENT PRIMARY KEY,
    producto_id        INT NOT NULL,
    pizza_id        INT NOT NULL,
    bebida_id    INT NOT NULL,
    CONSTRAINT fk_combos_productos
        FOREIGN KEY (producto_id)
        REFERENCES productos(producto_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_combos_pizzas
        FOREIGN KEY (pizza_id)
        REFERENCES pizzas(pizza_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_combos_bebidas
        FOREIGN KEY (bebida_id)
        REFERENCES bebidas(bebida_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 7. Ingredientes
CREATE TABLE ingredientes (
    ingrediente_id   INT AUTO_INCREMENT PRIMARY KEY,
    nombre    VARCHAR(50)    NOT NULL,
    stock       INT            NOT NULL  DEFAULT 0
);

-- 8. Tabla de pedidos
CREATE TABLE pedidos (
    pedido_id     INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id    INT NOT NULL,      -- FK a 'clientes'
    ingrediente_id   INT NULL,      -- FK a 'ingredientes' (ingrediente extra)
    fecha_pedido  DATE NOT NULL      DEFAULT (CURRENT_DATE),
    estado        ENUM('Pendiente','Procesando','Enviado','Entregado','Cancelado') NOT NULL DEFAULT 'Pendiente',
    INDEX idx_pedidos_fecha (fecha_pedido),
    CONSTRAINT fk_pedidos_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(cliente_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_pedidos_ingredientes
        FOREIGN KEY (ingrediente_id)
        REFERENCES ingredientes(ingrediente_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- 9. Tabla de pago
CREATE TABLE pagos (
    pago_id       INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id        INT NOT NULL,
    realizado BOOLEAN NOT NULL,
    CONSTRAINT fk_pagos_pedidos
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(pedido_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 10. Tabla de detalles_pedidos
CREATE TABLE detalles_pedidos (
    detalle_id      INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id       INT NOT NULL,
    producto_id     INT NOT NULL,
    cantidad        INT NOT NULL     DEFAULT 1,
    precio_unitario DECIMAL(10,2) NOT NULL,
    --
    CONSTRAINT fk_detalles_ped_pedido
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(pedido_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_detalles_ped_producto
        FOREIGN KEY (producto_id)
        REFERENCES productos(producto_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    INDEX idx_detalles_pedido (pedido_id),
    INDEX idx_detalles_producto (producto_id)
);
