<?phpnamespace Controllers\Libros;use Controllers\PublicController;use Dao\Cart\Cart as CartDao;use Views\Renderer;use Dao\Libros\Libros as LibrosDao;use Utilities\Site;class Catalogo extends PublicController{        private $viewData = [];    private function getAllLibros()    {        $this->viewData["libros"] = LibrosDao::getAllActive(1000);                //obtener el stock del libro en la base de datos        foreach ($this->viewData["libros"] as $key => $value) {            $stock = LibrosDao::getById($value["libroId"]);            $this->viewData["fueraStock"] = $stock["libroStock"];        }    }    public function run(): void    {        $usercod = \Utilities\Security::getUserId();        if ($this->isPostBack()) {            if (\Utilities\Security::isLogged()) {                try {                    $crrctd = isset($_POST["cantidad"]) ? $_POST["cantidad"] : 0;                    $crrprc = isset($_POST["precio"]) ? $_POST["precio"] : 0;                    $crrfching = date("Y-m-d H:i:s");                    $libroId = isset($_POST["libroId"]) ? $_POST["libroId"] : 0;                    //obtener el stock del libro en la base de datos                    $stock = LibrosDao::getById($libroId);                    if ($stock["libroStock"] < $crrctd) {                        Site::redirectToWithMsg("index.php?page=Libros_Catalogo", "No hay suficiente stock para el producto seleccionado.");                    } else {                        CartDao::insertProduct($usercod, $libroId, $crrctd, $crrprc, $crrfching);                       // echo '<script>alert("' . "Libro agregado al carrito" . '");</script>';                        Site::redirectToWithMsg("index.php?page=Libros_Catalogo", "Libro agregado al carrito.");                    }                } catch (\Exception $ex) {                    Site::redirectToWithMsg("index.php?page=Libros_Catalogo", "El producto ya esta en el carrito.");                }            } else {                Site::redirectToWithMsg("index.php?page=sec_login", "Inicie sesion para agregar productos.");            }        }                        $this->getAllLibros();                Renderer::render("libros/catalogo", $this->viewData);    }}