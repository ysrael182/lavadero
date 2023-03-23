<?php
class Home extends Controller
{
    public function __construct() {
        session_start();
        var_dump($_SESSION);
        if (!empty($_SESSION['activo'])) {
            header("location: ".base_url. "Administracion/home");
        }
        parent::__construct();
    }
    public function index()
    {
        $this->views->getView($this, "index");
    }
}
