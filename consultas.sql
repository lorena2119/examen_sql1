USE pizzeria_db;

-- 1. Agregar tipo de producto
  INSERT INTO tipos_productos(nombre) VALUES ('Pizza'), ('Bebida'), ('Combos');
-- **Registrar un nuevo cliente:**
INSERT INTO clientes(nombre, email, numeroContacto, direccion, ciudad, pais)
VALUES('Lorena Contreras', 'lorena@gmail.com',  '0341-5551234', 'Calle Industria 45', 'Bucaramanga', 'Colombia');

-- 2. **Agregar un nuevo producto (pizza) al menú:**
INSERT INTO productos(tipo_id, nombre, precio)
VALUES(1, 'Ricotta',  99);
INSERT INTO pizzas (
    producto_id,
    tamano,
    sabor
) VALUES
    (
      (SELECT producto_id FROM productos WHERE nombre = 'Ricotta'),
      'Grande', 'Queso'
    );
SELECT *
FROM ingredientes;

-- 3. **Registrar una bebida en el menú:**
INSERT INTO productos(tipo_id, nombre, precio)
VALUES(2, 'Strawberry Passion',  45);
INSERT INTO bebidas (
    producto_id,
    sabor
) VALUES
    (
      (SELECT producto_id FROM productos WHERE nombre = 'Strawberry Passion'),
      'Fresa'
    );

-- 4. **Agregar un ingrediente a la base de datos:**
INSERT INTO ingredientes(nombre, stock)
VALUES('Cebolla',  45);

--5. **Crear un pedido para un cliente:**
INSERT INTO pedidos (cliente_id, fecha_pedido, estado) VALUES
(1, '2023-02-10', 'Entregado');

-- 6. **Añadir productos a un pedido específico:**
INSERT INTO detalles_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1,  1,  800,  99);

--7. **Añadir ingredientes adicionales a una pizza en un pedido:**
INSERT INTO pedidos (cliente_id, fecha_pedido, estado, ingrediente_id) VALUES
(1, '2025-02-10', 'Pendiente', 1);

-- 8. **Consultar el detalle de un pedido (productos y sus ingredientes):**
SELECT d.*, p.ingrediente_id
FROM detalles_pedidos as d
INNER JOIN pedidos as p ON p.pedido_id = d.pedido_id
WHERE p.pedido_id =1;

--9. **Actualizar el precio de una pizza en el menú:**
UPDATE productos SET precio = 200 WHERE producto_id = 1;

--10. **Actualizar la dirección de un cliente:**
UPDATE clientes SET direccion = 'Barrio caldas' WHERE cliente_id = 1;

--11. **Eliminar un producto del menú (bebida):**
DELETE FROM productos WHERE nombre = 'Strawberry Passion';

--12. **Eliminar un ingrediente de la base de datos:**
DELETE FROM ingredientes WHERE ingrediente_id = 1;

--14. **Listar todos los productos disponibles en el menú (pizzas y bebidas):**
SELECT * 
FROM productos;

-- 15. **Listar todos los ingredientes disponibles para personalizar una pizza:**
SELECT * 
FROM ingredientes;

--16. **Calcular el costo total de un pedido (incluyendo ingredientes adicionales):**
SELECT d.cantidad*d.precio_unitario as Total, p.ingrediente_id
FROM detalles_pedidos as d
INNER JOIN pedidos as p ON p.pedido_id = d.pedido_id
WHERE p.pedido_id =1;