
# (4H) Pizza Fiesta
La pizzería "Pizza Fiesta" requiere el desarrollo de una base de datos para gestionar de manera eficiente sus operaciones diarias. El sistema debe permitir el registro y manejo de clientes, productos (pizzas, bebidas e ingredientes), y pedidos. A su vez, la base de datos debe controlar los ingredientes utilizados en cada pizza, así como manejar los precios para pizzas de distintos tamaños (pequeñas, medianas y grandes), tanto individuales como enteras. Adicionalmente, el sistema debe gestionar el pago y la recogida de los pedidos, asegurando que los pedidos se preparen solo una vez confirmado el pago.

## Problema:
Actualmente, "Pizza Fiesta" no tiene una forma eficaz de gestionar sus operaciones, lo que genera dificultades en el seguimiento de pedidos, el control de inventario de ingredientes y el manejo de precios según el tipo de pizza y tamaño. Además, los clientes no tienen la posibilidad de personalizar su pedido de manera clara, lo que afecta la experiencia del usuario. La pizzería necesita una solución que automatice estas tareas y facilite la gestión de los pedidos y el inventario de productos.

Características Principales:
Gestión de Clientes: El sistema debe permitir el registro de información detallada de los clientes, incluyendo nombre, número de contacto y dirección.
Gestión de Productos:
Registro de pizzas disponibles (pequeñas, medianas y grandes) y bebidas.
Gestión de ingredientes, permitiendo la personalización de pizzas por parte de los clientes.
Control de combos que incluyan pizzas y bebidas.
Gestión de Pedidos:
Los clientes podrán realizar pedidos que se procesarán tras el pago.
La hora de recogida debe ser indicada por el cliente al hacer el pedido.
Posibilidad de añadir ingredientes extra, aplicando un costo adicional.
Detallado del Pedido:
El sistema debe detallar el proceso de preparación de cada pizza, permitiendo al cliente seleccionar los ingredientes disponibles para personalizar su pizza.
Visualización de costos según el tamaño de la pizza y los ingredientes añadidos.
Pagos y Recogida: Los pedidos solo comenzarán a prepararse una vez realizado el pago, sin costos adicionales, ya que los clientes recogen personalmente su orden.



# Consultas



1. **Registrar un nuevo cliente:**



```sql
INSERT INTO clientes(nombre, email, numeroContacto, direccion, ciudad, pais)
VALUES('Lorena Contreras', 'lorena@gmail.com',  '0341-5551234', 'Calle Industria 45', 'Bucaramanga', 'Colombia');
```



2. **Agregar un nuevo producto (pizza) al menú:**



```sql
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
```



3. **Registrar una bebida en el menú:**



```sql
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
```



4. **Agregar un ingrediente a la base de datos:**



```sql
INSERT INTO ingredientes(nombre, stock)
VALUES('Cebolla',  45);
```



5. **Crear un pedido para un cliente:**



```sql
INSERT INTO pedidos (cliente_id, fecha_pedido, estado) VALUES
(1, '2023-02-10', 'Entregado');
```



6. **Añadir productos a un pedido específico:**



```sql
INSERT INTO detalles_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1,  1,  800,  99);
```



7. **Añadir ingredientes adicionales a una pizza en un pedido:**



```sql
INSERT INTO pedidos (cliente_id, fecha_pedido, estado, ingrediente_id) VALUES
(1, '2025-02-10', 'Pendiente', 1);
```



8. **Consultar el detalle de un pedido (productos y sus ingredientes):**



```sql
SELECT d.*, p.ingrediente_id
FROM detalles_pedidos as d
INNER JOIN pedidos as p ON p.pedido_id = d.pedido_id
WHERE p.pedido_id =1;
```



9. **Actualizar el precio de una pizza en el menú:**



```sql
UPDATE productos SET precio = 200 WHERE producto_id = 1;
```



10. **Actualizar la dirección de un cliente:**



```sql
UPDATE clientes SET direccion = 'Barrio caldas' WHERE cliente_id = 1;
```



11. **Eliminar un producto del menú (bebida):**



```sql
DELETE FROM productos WHERE nombre = 'Strawberry Passion';
```



12. **Eliminar un ingrediente de la base de datos:**



```sql
DELETE FROM ingredientes WHERE ingrediente_id = 1;
```



13. **Consultar todos los pedidos de un cliente:**



```sql



```



14. **Listar todos los productos disponibles en el menú (pizzas y bebidas):**



```sql
SELECT * 
FROM productos;
```



15. **Listar todos los ingredientes disponibles para personalizar una pizza:**



```sql



```



16. **Calcular el costo total de un pedido (incluyendo ingredientes adicionales):**



```sql



```



17. **Listar los clientes que han hecho más de 5 pedidos:**



```sql



```



18. **Buscar pedidos programados para recogerse después de una hora específica:**



```sql



```



19. **Listar todos los combos de pizzas con bebidas disponibles en el menú:**



```sql



```



20. **Buscar pizzas con un precio mayor a $100:**



```sql



```



21. calcular el total de ingresos por día, semana y mes. 



**Ingresos por Día:**



```sql



```



**Ingresos por Semana:**



```sql



```



**Ingresos por Mes:**



```sql



```