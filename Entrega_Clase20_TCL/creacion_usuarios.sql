USE negocio_pesca;

-- Creo el usuario con permisos de solo lectura
CREATE USER IF NOT EXISTS 'usuario_lectura'@'localhost' IDENTIFIED BY 'contraseña_usuario_lectura';

-- Asignar permisos de solo lectura sobre todas las tablas del esquema 'negocio_pesca'
GRANT SELECT ON negocio_pesca.* TO 'usuario_lectura'@'localhost';

-- Crear el usuario con permisos de lectura, inserción y modificación de datos
CREATE USER IF NOT EXISTS 'usuario_modificacion'@'localhost' IDENTIFIED BY 'contraseña_usuario_modificacion';

-- Asignar permisos de lectura, inserción y modificación de datos sin poder eliminar registros
GRANT SELECT, INSERT, UPDATE ON negocio_pesca.* TO 'usuario_modificacion'@'localhost';