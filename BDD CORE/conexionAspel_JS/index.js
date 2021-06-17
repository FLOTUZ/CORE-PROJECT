const Firebird = require("node-firebird");

let options = {
  host: "127.0.0.1",
  port: 3050,
  database: "C:\\Program Files (x86)\\Common Files\\Aspel\\Sistemas Aspel\\SAE8.00\\Ejemplos\\Ejemplos.fdb",
  user: "core",
  password: "core",
  lowercase_keys: false, // set to true to lowercase keys
  role: null, // default
  pageSize: 4096,
};

// Se genera una pool de 5 conexiones
let pool = Firebird.pool(5, options);

// Se obtiene una conexión libre
pool.get((err, db) => {
  if (err) throw err;

  // db = Nuesto atributo "bd" de la configuracion
  db.query("SELECT t.* FROM INVE01 t", function (err, result) {
    if (err) throw err;
    
    console.log(result);


    // IMPORTANTE: Se cierra la conexión
    db.detach();
  });
});

// Se destruye la conexión
pool.destroy(); 
