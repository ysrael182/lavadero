<?php
class Conexion {
    /** @var mysqli */
    private $conect;
    
    public function __construct()
    {
        /*$this->conect = new mysqli(host, user, pass);
        if ($this->conect->connect_error) {
            echo 'Error : ('. $this->conect->connect_errno .') '. $this->conect->connect_error;
        }*/

        $pdo = "mysql:host=".host.";dbname=".db.";.charset.";
        try {
            $this->conect = new PDO($pdo, user, pass);
            $this->conect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo "Error en la conexion".$e->getMessage();
        }
    }
    public function getConection()
    {
        return $this->conect;
    }
}

?>