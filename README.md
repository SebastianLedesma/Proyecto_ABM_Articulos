# Proyecto_ABM_Articulos
Construido con:
- Maven (gestor de proyecto)
- Netbeans (IDE)
- MySql (gestor de base de datos)
- Html
- Css

SistemaABM
Permite subir, modificar, dar de baja y listar el contenido de una base de datos SQL a traves de una página con html y jsp.

Estructura de la Base
Tabla: articulos | Columnas: id,nombre, distribuidor, tipo,precio.

Listado de Métodos
- save(Articulo) Método de que permite guardar un artículo en la base de datos.

- update(Articulo) Método que permite actualizar un artículo siempre que el id del artículo exista en la base de datos.

- delete(Articulo) Método que permite eliminar un artículo de la base de datos siempre que el id ingresado coincida con el de algún artículo de la base de datos.

- getAll() Método que permite obtener los registros de la tabla articulos.

- getLikeTipoArticulo(TipoArticulo) Método que retorna una lista de artículos filtrados por TipoArticulo.

- getLikeDistribuidor(Distribuidor) Método de que retorna una lista de artículos según el distrbuidor.

- getById(id) Método que retorna un artículo por el id ingresado por parámetro.

- getLikeValorEncontrado(id) Método que permite saber si un articulo existe por el id ingresado por parámetro.

Recorrido del sitio
- index.html: página inicial que lleva a la página principal para dar de alta un artículo.

- PrincipalArticulos.jsp: en esta página se puede dar de alta un artículo, filtrar por tipoArticulo, distribuidor, eliminar, actualizar artículos.

- AltaArticulo.jsp: se invoca al método save(articulo) para insertar el artículo en la base de datos.

- EliminarArticulo.jsp: invoca al método delete(articulo) para eliminar el artículo de la lista.

- DistribuidorArticulo.jsp: se invoca al método getLikeDistribuidor(Distribuidor) y se muestran los artículos que coinciden con el distribuidor pasado por parámetro.

- TipoArticulo.jsp: se invoca al método getLikeTipoArticulo(TipoArticulo) y se muestran los artículos que coinciden con el parámetro recibido.

- ActualizarArticulo.jsp: se completan los datos del artículo para actualizarlo según el id ingresado. Los datos son usados por ArticuloActualizado.jsp.

- ArticuloActualizado.jsp: se invoca al método update(Articulo) para intentar actualizar el artículo siempre que el id ingresado exista en la lista de artículos.