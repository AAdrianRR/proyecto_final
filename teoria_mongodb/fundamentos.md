# Sección Teórica: Fundamentos de MongoDB y Análisis NoSQL

## 1. ¿Qué es una base de datos no relacional y qué es MongoDB?
Una **base de datos no relacional (NoSQL)** es un sistema de almacenamiento diseñado para gestionar datos que no requieren un esquema de tablas rígido ni relaciones complejas mediante claves foráneas. A diferencia de los sistemas tradicionales, prioriza la flexibilidad, la velocidad de escritura y la escalabilidad horizontal.

**MongoDB** es una base de datos NoSQL orientada a documentos, de código abierto y de alto rendimiento. Almacena la información en formato BSON (una representación binaria de JSON), lo que permite guardar estructuras complejas y anidadas directamente dentro de un mismo registro sin necesidad de normalizar los datos en múltiples tablas.

---

## 2. ¿Qué son una colección, un documento y un campo?
* **Documento:** Es la unidad básica de almacenamiento en MongoDB (equivalente a una fila en SQL). Consiste en un registro en formato BSON compuesto por pares clave-valor.
* **Colección:** Es una agrupación de documentos en MongoDB (equivalente a una tabla en SQL). A diferencia de una tabla relacional, los documentos dentro de una misma colección no necesitan tener exactamente los mismos campos ni la misma estructura.
* **Campo:** Es cada uno de los atributos o elementos clave-valor dentro de un documento (equivalente a una columna en SQL). Por ejemplo, en `"estado": "Pendiente"`, `"estado"` es el campo y `"Pendiente"` su valor.

---

## 3. Diferencias principales entre una tabla relacional y una colección de documentos

| Característica | Tabla Relacional (PostgreSQL) | Colección de Documentos (MongoDB) |
| :--- | :--- | :--- |
| **Esquema** | Estricto y predefinido (*Schema-first*). | Flexible y dinámico (*Schema-less*). |
| **Estructura** | Filas y columnas bien definidas. | Documentos JSON/BSON independientes. |
| **Relaciones** | Se gestionan con `FOREIGN KEY` y `JOINs`. | Se gestionan por incrustación (*Embedding*) o referencias. |
| **Escalabilidad** | Principalmente vertical (más RAM/CPU). | Principalmente horizontal (*Sharding* distribuido). |

---

## 4. Ventajas y limitaciones de MongoDB

### Ventajas
1. **Flexibilidad de esquema:** Permite agregar o modificar campos en los documentos sin necesidad de realizar migraciones complejas de base de datos (`ALTER TABLE`).
2. **Alta velocidad de lectura/escritura:** Al permitir almacenar información relacionada (como un ticket y sus comentarios) en un solo documento, se reducen las operaciones de consulta costosas como los `JOIN`.

### Limitaciones
1. **Consistencia y ACID limitada en modelos complejos:** Aunque soporte transacciones, no está optimizado de forma natural para operaciones que requieren estricta integridad referencial en múltiples colecciones.
2. **Mayor consumo de almacenamiento:** Al duplicar información incrustada para evitar uniones, puede generar redundancia de datos y requerir más memoria en disco.

---

## 5. ¿Cuándo conviene utilizar PostgreSQL vs. MongoDB?
* **Conviene PostgreSQL cuando:** Se requiere consistencia ACID estricta, integridad referencial sólida, manejo de transacciones financieras o cuando la estructura del dominio de datos es altamente relacional y madura (por ejemplo: inventarios, facturación, sistemas contables).
* **Conviene MongoDB cuando:** Se trabaja con datos semiestructurados o no estructurados, cuando los requisitos del esquema cambian constantemente, para el manejo de Big Data, análisis en tiempo real o en sistemas con altos volúmenes de escritura distribuida (por ejemplo: catálogos de e-commerce, redes sociales, bitácoras de eventos).

---

## 6. Aplicación al Proyecto HelpDesk: ¿Qué información se almacenaría en MongoDB?
Para nuestro sistema de **HelpDesk**, la estructura central del negocio (usuarios, técnicos, asignación de tickets) se mantiene en **PostgreSQL** para asegurar la integridad referencial. 

Sin embargo, **MongoDB se utilizaría para almacenar la bitácora de eventos y logs del sistema (Audit Logs)** asociados a cada ticket. Dado que cada evento puede registrar métricas variables (cambios de estado, direcciones IP, navegadores desde donde se respondió, archivos adjuntos de error, o metadatos de diagnóstico), MongoDB permite guardar este historial dinámico sin sobrecargar el modelo relacional.

---

## 7. Ejemplo de registro del proyecto como documento JSON

A continuación se muestra cómo se representaría el evento de seguimiento e historial de un ticket dentro de una colección llamada `historial_tickets` en MongoDB:

```json
{
  "_id": "64f1a2b3c4d5e6f7a8b9c0d1",
  "ticket_id": 1,
  "evento": "CAMBIO_DE_ESTADO",
  "fecha": "2026-08-17T21:30:00Z",
  "usuario_accion": {
    "id": 2,
    "nombre": "Marta Sistemas",
    "rol": "Técnico"
  },
  "detalles_evento": {
    "estado_anterior": "Pendiente",
    "estado_nuevo": "En Proceso",
    "ip_origen": "192.168.1.45",
    "sistema_operativo": "Windows 11"
  },
  "comentario_adjunto": {
    "mensaje": "Se inicia revisión física del equipo de cómputo.",
    "adjuntos": ["diagnostico_inicial.log", "foto_pantalla.png"]
  }
}