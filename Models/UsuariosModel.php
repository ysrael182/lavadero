<?php
class UsuariosModel extends Query{
    public function __construct()
    {
        parent::__construct();
    }
    public function getUsuario(string $usuario, string $clave)
    {
        $sql = <<<SQL
        SELECT usuarios.*, rol.nombre as rol FROM usuarios RIGHT JOIN usuario_rol ON usuarios.id = usuario_rol.usuarioId
        RIGHT JOIN rol ON rol.rolId = usuario_rol.rolId WHERE usuarios.usuario = '{$usuario}' AND usuarios.clave = '{$clave}';        
SQL;
        $data = $this->select($sql);
        return $data;
    }
    public function getEmpresa()
    {
        $sql = "SELECT * FROM configuracion";
        $data = $this->select($sql);
        return $data;
    }
    public function getUsuarios(int $estado)
    {
        $sql = "SELECT id,usuario,nombre,correo,estado FROM usuarios WHERE estado = $estado";
        $data = $this->selectAll($sql);
        return $data;
    }
    public function registrarUsuario(string $usuario, string $nombre, string $correo, string $telefono, string $clave, string $rol)
    {
        $vericar = "SELECT * FROM usuarios WHERE usuario = '$usuario' OR correo = '$correo'";
        $existe = $this->select($vericar);
        if (empty($existe)) {
            $sql = "INSERT INTO usuarios(usuario, nombre, correo,telefono, clave) VALUES (?,?,?,?,?)";
            $datos = array($usuario, $nombre, $correo, $telefono, $clave);
            $userId = $this->insertar($sql, $datos);
            if ($userId ) {
                $rol = $rol ? $rol :'USER';
                $sqlRol = "SELECT rolId from rol where nombre = '$rol'";
                $rolData = $this->select($sqlRol);
                if ($rolData && isset($rolData['rolId'])) {
                    $rolId = $rolData['rolId'];
                    $sql = "INSERT INTO usuario_rol(usuarioId, rolId) VALUES (?,?)";
                    $datos = array($userId, $rolId);
                    $this->insertar($sql, $datos);
                }
                $res = "ok";
            } else {
                $res = "error";
            }
        }else{
            $res = "existe";
        }
        return $res;
    }
    public function modificarUsuario(string $usuario, string $nombre, string $correo, string $tele, int $id)
    {
        $sql = "UPDATE usuarios SET usuario = ?, nombre = ?, correo= ?, telefono=? WHERE id = ?";
        $datos = array($usuario, $nombre, $correo, $tele, $id);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $res = "modificado";
        } else {
            $res = "error";
        }
        return $res;
    }
    public function editarUser(int $id)
    {
        $sql = "SELECT * FROM usuarios WHERE id = $id";
        $data = $this->select($sql);
        return $data;
    }
    public function getPass(string $clave, int $id)
    {
        $sql = "SELECT * FROM usuarios WHERE clave = '$clave' AND id = $id";
        $data = $this->select($sql);
        return $data;
    }
    public function accionUser(int $estado, int $id)
    {
        $sql = "UPDATE usuarios SET estado = ? WHERE id = ?";
        $datos = array($estado, $id);
        $data = $this->save($sql, $datos);
        return $data;
    }
    public function modificarPass(string $clave, int $id)
    {
        $sql = "UPDATE usuarios SET clave = ? WHERE id = ?";
        $datos = array($clave, $id);
        $data = $this->save($sql, $datos);
        return $data;
    }
    public function modificarDato(string $usuario, string $nombre,string $apellido, string $correo, string $tel, string $dir, string $img, int $id)
    {
        $sql = "UPDATE usuarios SET usuario=?, nombre=?, apellido=?, correo=?, telefono=?, direccion=?, perfil=? WHERE id=?";
        $datos = array($usuario, $nombre, $apellido, $correo, $tel, $dir, $img, $id);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $res = 1;
        }else{
            $res = 0;
        }
        return $res;
    }
}
?>