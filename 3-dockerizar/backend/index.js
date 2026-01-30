const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Configuración de la conexión a MySQL
const dbConfig = {
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'usuario',
  password: process.env.DB_PASSWORD || 'password123',
  database: process.env.DB_NAME || 'personas_db',
  port: process.env.DB_PORT || 3306
};

// Crear pool de conexiones
const pool = mysql.createPool(dbConfig);
const promisePool = pool.promise();

// Función para esperar a que la base de datos esté lista
async function waitForDatabase() {
  const maxRetries = 10;
  const retryDelay = 3000;
  
  for (let i = 0; i < maxRetries; i++) {
    try {
      await promisePool.query('SELECT 1');
      console.log('✅ Conexión exitosa a MySQL');
      return true;
    } catch (error) {
      console.log(`⏳ Esperando conexión a MySQL... intento ${i + 1}/${maxRetries}`);
      await new Promise(resolve => setTimeout(resolve, retryDelay));
    }
  }
  throw new Error('No se pudo conectar a la base de datos');
}

// Rutas
// Ruta principal
app.get('/', (req, res) => {
  res.json({
    message: 'API de Personas - MySQL',
    endpoints: {
      '/api/personas': 'GET - Obtener todas las personas',
      '/api/personas/:id': 'GET - Obtener una persona por ID'
    }
  });
});

// Obtener todas las personas
app.get('/api/personas', async (req, res) => {
  try {
    const [rows] = await promisePool.query('SELECT * FROM persona ORDER BY id');
    res.json({
      success: true,
      total: rows.length,
      data: rows
    });
  } catch (error) {
    console.error('Error al consultar personas:', error);
    res.status(500).json({
      success: false,
      message: 'Error al obtener las personas',
      error: error.message
    });
  }
});

// Obtener una persona por ID
app.get('/api/personas/:id', async (req, res) => {
  const { id } = req.params;
  
  try {
    const [rows] = await promisePool.query('SELECT * FROM persona WHERE id = ?', [id]);
    
    if (rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: `No se encontró persona con ID ${id}`
      });
    }
    
    res.json({
      success: true,
      data: rows[0]
    });
  } catch (error) {
    console.error('Error al consultar persona:', error);
    res.status(500).json({
      success: false,
      message: 'Error al obtener la persona',
      error: error.message
    });
  }
});

// Iniciar servidor
async function startServer() {
  try {
    await waitForDatabase();
    
    app.listen(PORT, () => {
      console.log(`🚀 Servidor corriendo en http://localhost:${PORT}`);
      console.log(`📊 Base de datos: ${dbConfig.database}`);
      console.log(`🔗 Endpoints disponibles:`);
      console.log(`   - GET http://localhost:${PORT}/api/personas`);
      console.log(`   - GET http://localhost:${PORT}/api/personas/:id`);
    });
  } catch (error) {
    console.error('❌ Error al iniciar servidor:', error);
    process.exit(1);
  }
}

startServer();
