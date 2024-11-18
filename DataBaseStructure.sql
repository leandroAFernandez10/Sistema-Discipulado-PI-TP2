-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS sistema_discipulados;
USE sistema_discipulados;

-- Crear la tabla 'persona'
CREATE TABLE persona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    telefono VARCHAR(15),
    email VARCHAR(100)
);

-- Crear la tabla 'discipulo'
CREATE TABLE discipulo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    persona_id INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    FOREIGN KEY (persona_id) REFERENCES persona(id) ON DELETE CASCADE
);

-- Crear la tabla 'disciplina'
CREATE TABLE disciplina (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Crear la tabla 'discipulado'
CREATE TABLE discipulado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    disciplina_id INT NOT NULL,
    FOREIGN KEY (disciplina_id) REFERENCES disciplina(id) ON DELETE SET NULL
);

-- Crear la tabla 'clase'
CREATE TABLE clase (
    id INT AUTO_INCREMENT PRIMARY KEY,
    discipulado_id INT NOT NULL,
    fecha DATE NOT NULL,
    tema VARCHAR(100) NOT NULL,
    FOREIGN KEY (discipulado_id) REFERENCES discipulado(id) ON DELETE CASCADE
);

-- Crear la tabla 'asistencia'
CREATE TABLE asistencia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    clase_id INT NOT NULL,
    discipulo_id INT NOT NULL,
    presente BOOLEAN NOT NULL,
    FOREIGN KEY (clase_id) REFERENCES clase(id) ON DELETE CASCADE,
    FOREIGN KEY (discipulo_id) REFERENCES discipulo(id) ON DELETE CASCADE
);

-- Crear la tabla 'matriculacion'
CREATE TABLE matriculacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    discipulo_id INT NOT NULL,
    discipulado_id INT NOT NULL,
    fecha_matriculacion DATE NOT NULL,
    FOREIGN KEY (discipulo_id) REFERENCES discipulo(id) ON DELETE CASCADE,
    FOREIGN KEY (discipulado_id) REFERENCES discipulado(id) ON DELETE CASCADE
);

-- Crear la tabla 'celula'
CREATE TABLE celula (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Crear la relación entre 'discipulo' y 'celula'
ALTER TABLE discipulo ADD COLUMN celula_id INT;
ALTER TABLE discipulo ADD FOREIGN KEY (celula_id) REFERENCES celula(id) ON DELETE SET NULL;


