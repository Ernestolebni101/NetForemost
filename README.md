
# Test Fase 2

Este proyecto utiliza SQL Server 2019 y .NET 7 para demostrar el uso de Dapper en una aplicación de consola simple para la conexión a la base de datos y presentación de datos en tablas.

## Pasos para ejecutar el proyecto

1. **Configuración de la base de datos:**

   - Ejecute el script `DbStructure.sql` para crear la estructura inicial de la base de datos.
   - Luego, ejecute el script `Procedures.sql` para crear los procedimientos almacenados necesarios.

   Puede ejecutar estos scripts en su IDE de SQL Server o en el gestor de bases de datos de su preferencia.

2. **Configuración de la cadena de conexión:**

   - Abra el archivo `Program.cs` y localice la clase `Constants`.
   - Sustituya la cadena de conexión actual por la correspondiente a su entorno de base de datos.

3. **Ejecución del proyecto:**

   - Compile y ejecute el proyecto. Por defecto, se encuentra configurado para ejecutarse en modo debug.
   - Una vez ejecutado correctamente, la aplicación mostrará los datos recuperados de la base de datos en formato de tabla en la consola.

¡Listo!.

---