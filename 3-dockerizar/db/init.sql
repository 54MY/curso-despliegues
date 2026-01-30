-- Crear la tabla persona
CREATE TABLE IF NOT EXISTS persona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    email VARCHAR(150) NOT NULL,
    telefono VARCHAR(20),
    ciudad VARCHAR(100),
    pais VARCHAR(100),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar 20 personas de ejemplo
INSERT INTO persona (nombre, apellido, edad, email, telefono, ciudad, pais) VALUES
('Juan', 'Pérez', 28, 'juan.perez@email.com', '+591-4-4123456', 'Cochabamba', 'Bolivia'),
('María', 'González', 34, 'maria.gonzalez@email.com', '+591-4-4234567', 'Cochabamba', 'Bolivia'),
('Carlos', 'Rodríguez', 42, 'carlos.rodriguez@email.com', '+591-2-2345678', 'La Paz', 'Bolivia'),
('Ana', 'Martínez', 25, 'ana.martinez@email.com', '+591-3-3456789', 'Santa Cruz', 'Bolivia'),
('Luis', 'López', 31, 'luis.lopez@email.com', '+591-4-4567890', 'Cochabamba', 'Bolivia'),
('Carmen', 'Sánchez', 29, 'carmen.sanchez@email.com', '+591-2-2678901', 'La Paz', 'Bolivia'),
('Pedro', 'Ramírez', 38, 'pedro.ramirez@email.com', '+591-3-3789012', 'Santa Cruz', 'Bolivia'),
('Laura', 'Torres', 27, 'laura.torres@email.com', '+591-4-4890123', 'Cochabamba', 'Bolivia'),
('Diego', 'Flores', 45, 'diego.flores@email.com', '+591-2-2901234', 'La Paz', 'Bolivia'),
('Sofia', 'Vargas', 33, 'sofia.vargas@email.com', '+591-3-3012345', 'Santa Cruz', 'Bolivia'),
('Miguel', 'Herrera', 26, 'miguel.herrera@email.com', '+591-4-4123567', 'Cochabamba', 'Bolivia'),
('Elena', 'Mendoza', 30, 'elena.mendoza@email.com', '+591-2-2234678', 'La Paz', 'Bolivia'),
('Roberto', 'Jiménez', 41, 'roberto.jimenez@email.com', '+591-3-3345789', 'Santa Cruz', 'Bolivia'),
('Patricia', 'Morales', 24, 'patricia.morales@email.com', '+591-4-4456890', 'Cochabamba', 'Bolivia'),
('Fernando', 'Castro', 36, 'fernando.castro@email.com', '+591-2-2567901', 'La Paz', 'Bolivia'),
('Isabel', 'Ortiz', 32, 'isabel.ortiz@email.com', '+591-3-3678012', 'Santa Cruz', 'Bolivia'),
('Andrés', 'Ruiz', 28, 'andres.ruiz@email.com', '+591-4-4789123', 'Cochabamba', 'Bolivia'),
('Gabriela', 'Díaz', 35, 'gabriela.diaz@email.com', '+591-2-2890234', 'La Paz', 'Bolivia'),
('Javier', 'Romero', 39, 'javier.romero@email.com', '+591-3-3901345', 'Santa Cruz', 'Bolivia'),
('Valentina', 'Cruz', 23, 'valentina.cruz@email.com', '+591-4-4012456', 'Cochabamba', 'Bolivia');

-- Verificar los datos insertados
SELECT * FROM persona;
