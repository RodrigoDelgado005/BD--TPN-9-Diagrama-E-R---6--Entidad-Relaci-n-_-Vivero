# BD--TPN-9-Diagrama-E-R---6--Entidad-Relaci-n-_-Vivero

Se desea diseñar una Base de Datos para gestionar los empleados y productos a la venta de una cadena de viveros dedicados a la venta de diversos productos relacionados con la jardinería. Los supuestos que hay que recoger en la BD son los siguientes:

La cadena de viveros dispone de varios viveros en la provincia de Buenos Aires identificados por un código de tienda y de los que se almacenará un teléfono, una dirección y un responsable que será uno de los empleados que trabaja en el vivero (es necesario almacenar durante qué períodos de tiempo ha sido responsable cada empleado).

Los productos que se venden tienen asignado un código de producto y nos interesa guardar el precio y el stock que hay de cada producto en cada uno de los viveros. Las plantas de las que se guardará su nombre, y una breve descripción de los cuidados que requiere; accesorios de jardinería y artículos de decoración. Estos productos se distribuyen en zonas dentro de cada vivero cada una de ellas identificadas por un nombre dentro de cada vivero (zona exterior regadío, interior climatizada, zona de caja, etc.). Se desea conocer el stock de cada producto de acuerdo a las zonas del vivero.

Los empleados estarán asignados a una determinada zona en un vivero la cual podrá cambiar a lo largo del tiempo (se guardará histórico de ello) y además, los empleados pueden moverse de un vivero a otro según las necesidades en distintos períodos de
tiempo. De los empleados se quiere conocer su DNI, su nombre y un teléfono de contacto.

En cuanto al proceso de venta de los distintos productos, sólo se almacenarán los pedidos que realizan los clientes pertenecientes al Club VIP que es una promoción especial que permite a los clientes obtener descuentos según las cuantías de sus compras.
De estos clientes se almacena su DNI, su nombre, dirección, teléfono y la fecha de incorporación al club así como los datos de sus pedidos que incluyen un número de pedido, la fecha de realización, los productos adquiridos junto con las unidades y el descuento realizado; por último, también se incluye el precio de los portes en caso de que se hayan contratado. De cada cliente se almacenarán todos los pedidos que haya realizado hasta la fecha.

En cuanto a estos pedidos de clientes pertenecientes al Club VIP interesa también guardar quién fue el empleado que lo gestionó y en qué vivero se realizó el pedido teniendo en cuenta que un pedido en un determinado vivero lo gestiona un único empleado.
