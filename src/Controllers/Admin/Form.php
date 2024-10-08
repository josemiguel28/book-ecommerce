<?php

namespace Controllers\Admin;

use Controllers\PublicController;
use Dao\Libros\Libros as LibrosDao;
use Dao\Servicios\Servicios as ServiciosDao;
use Utilities\ArrUtils;
use Utilities\Context;
use Utilities\Site;
use Utilities\Validators;
use Views\Renderer;

class Form extends PublicController
{

    private $viewData = array();

    private $libroNombre = "";
    private $libroPrecio = "";
    private $libroStock = "";
    private $libroCategoria = "";
    private $libroEstado = "";
    private $libroId = 0;
    private $libroDescripcion = "";
    private $libroImagen = "";
    private $libroAutor = "";
    private $nombreImagen = "";
    private $mode = "DSP";
    private $modeDscArr = [
        "DSP" => "Mostrar %s",
        "INS" => "Insertar %s",
        "DEL" => "Eliminar %s",
        "UPD" => "Actualizar %s"
    ];
    private $estadosOptions = [
        "ACT" => "Activo",
        "INA" => "Inactivo",
        "RTR" => "Retirado",
    ];

    private $errors = [];
    private $hasErrors = false;
    private $isReadOnly = "readonly";
    private $showActions = true;


    private function getDatos()
    {
        if (isset($_GET["mode"])) {
            $this->mode = $_GET["mode"];

            if (!isset($this->modeDscArr[$this->mode])) {
                $this->addError("modo invalido");
            }
        }

        if (isset($_GET["id"])) {
            $this->libroId = intval($_GET["id"]);
            $tmpDataFromDb = LibrosDao::getById($this->libroId);

            if ($tmpDataFromDb) {
                $this->libroNombre = $tmpDataFromDb["libroNombre"];
                $this->libroDescripcion = $tmpDataFromDb["libroDescripcion"];
                $this->libroPrecio = $tmpDataFromDb["libroPrecio"];
                $this->libroImagen = $tmpDataFromDb["libroImgUrl"];
                $this->libroStock = $tmpDataFromDb["libroStock"];
                $this->libroEstado = $tmpDataFromDb["libroStatus"];
                $this->libroCategoria = $tmpDataFromDb["categoria_nombre"];
                $this->libroAutor = $tmpDataFromDb["libroAutor"];

            } else {
                $this->addError("Libro no encontrado");
            }
        }
    }

    private function getPostData()
    {

        $tmpMode = "";

        if (isset($_POST["mode"])) {
            $tmpMode = $_POST["mode"];

            if (!isset($this->modeDscArr[$tmpMode])) {
                $this->addError("Modo Invalido");
            }

            if ($this->mode != $tmpMode) {
                $this->addError("Modo Invalido");
            }
        }

        if (isset($_POST["libroId"])) {
            $this->libroId = $_POST["libroId"];

        }

        if (isset($_POST["libroNombre"])) {
            $this->libroNombre = $_POST["libroNombre"];

            if (Validators::IsEmpty($this->libroNombre)) {
                $this->addError("Se necesita un nombre del libro", "nombre_error");
            }
        }

        if (isset($_POST["libroAutor"])) {
            $this->libroAutor = $_POST["libroAutor"];

            if (Validators::IsEmpty($this->libroAutor)) {
                $this->addError("Se necesita un nombre del autor del libro", "nombre_autor_error");
            }
        }

        if (isset($_POST["libroPrecio"])) {
            $this->libroPrecio = $_POST["libroPrecio"];

            if (Validators::IsEmpty($this->libroPrecio)) {
                $this->addError("Se necesita un precio", "precio_error");
            }
        }

        if (isset($_POST["libroStock"])) {
            $this->libroStock = $_POST["libroStock"];

            if (Validators::IsEmpty($this->libroStock)) {
                $this->addError("Se necesita un stock", "stock_error");
            }
        }


        if (isset($_POST["libroCategoria"])) {
            $this->libroCategoria = $_POST["libroCategoria"];

            if (Validators::IsEmpty($this->libroCategoria)) {
                $this->addError("Categoria invalida", "categoria_error");
            }
        }

        if (isset($_POST["libroEstatus"])) {
            $this->libroEstado = $_POST["libroEstatus"];

            if (Validators::IsEmpty($this->libroEstado)) {
                $this->addError("Plataforma Invalida invalida", "plataforma_error");
            }
        }

        if (isset($_POST["libroDescripcion"])) {
            $this->libroDescripcion = $_POST["libroDescripcion"];

            if (Validators::IsEmpty($this->libroDescripcion)) {
                $this->addError("Descripcion invalida", "descripcion_error");
            }
        }

        if (isset($_FILES["libroImagen"])) {
            $tmpServicioImagen = $_FILES["libroImagen"];

            
            $getImagen= LibrosDao::getById($this->libroId);

            $carpetaImagenes = '../' . Context::getContextByKey("BASE_DIR") . "/servidorImagenes";
            
            if (!is_dir($carpetaImagenes)) {
                mkdir($carpetaImagenes);
            }

            if($this->mode == "UPD"){
                if($tmpServicioImagen["name"]){
                    $temp = unlink($carpetaImagenes . "/" . $getImagen["libroImgUrl"]);
                    $this->nombreImagen = md5(uniqid(rand(), true)) . ".jpg";
                    move_uploaded_file($tmpServicioImagen['tmp_name'], $carpetaImagenes . "/" . $this->nombreImagen);
                }else{
                    $this->nombreImagen = $getImagen["libroImgUrl"];
                }

            }
            
            if ($this->mode == "DEL") {
                unlink($carpetaImagenes . "/" . $getImagen["libroImgUrl"]);
            }
            
            if ($this->mode == "INS") {
                $this->nombreImagen = md5(uniqid(rand(), true)) . ".png";
                move_uploaded_file($tmpServicioImagen['tmp_name'], $carpetaImagenes . "/" . $this->nombreImagen);
            }
            
        }
    }


    private function executePostAction()
    {
        switch ($this->mode) {
            case "INS":
                $result = LibrosDao::add(
                    $this->libroNombre,
                    $this->libroDescripcion,
                    $this->libroPrecio,
                    $this->nombreImagen,
                    $this->libroStock,
                    $this->libroEstado,
                    $this->libroCategoria,
                    $this->libroAutor

                );
                if ($result > 0) {
                    Site::redirectToWithMsg(
                        "index.php?page=Admin_ListaLibros",
                        "Libro creado"
                    );
                } else {
                    $this->addError("Error al crear el libro");
                }
                break;

            case "UPD":
                $result = LibrosDao::update(
                    $this->libroId,
                    $this->libroNombre,
                    $this->libroDescripcion,
                    $this->libroPrecio,
                    $this->nombreImagen,
                    $this->libroStock,
                    $this->libroEstado,
                    $this->libroCategoria,
                    $this->libroAutor
                );
                if ($result > 0) {
                    Site::redirectToWithMsg(
                        "index.php?page=Admin_ListaLibros",
                        "Libro actualizado"
                    );
                } else {
                    $this->addError("Error al actualizar el libro");
                }
                break;


            case "DEL":
                $result = LibrosDao::delete($this->libroId);
                if ($result > 0) {
                    Site::redirectToWithMsg(
                        "index.php?page=Admin_ListaLibros",
                        "Libro eliminado"
                    );
                } else {
                    $this->addError("Error al eliminar el libro");
                }
                break;
        }
    }

    private function prepareView()
    {

        $this->viewData["modeDsc"] = sprintf($this->modeDscArr[$this->mode], $this->mode);
        $this->viewData["mode"] = $this->mode;
        $this->viewData["libroId"] = $this->libroId;
        $this->viewData["libroNombre"] = $this->libroNombre;
        $this->viewData["libroPrecio"] = $this->libroPrecio;
        $this->viewData["libroAutor"] = $this->libroAutor;
        $this->viewData["libroCategoria"] = $this->libroCategoria;
        $this->viewData["libroEstado"] = $this->libroEstado;
        $this->viewData["libroStock"] = $this->libroStock;
        $this->viewData["libroDescripcion"] = $this->libroDescripcion;
        $this->viewData["libroImagen"] = $this->libroImagen;

        $this->viewData["categoriaOpciones"] = ArrUtils::objectArrToOptionsArray($tempCategoriesOption = LibrosDao::getCategorias(),
            "categoria_id",
            "categoria_nombre",
            "categoria_nombre",
            $this->libroCategoria);

        $this->viewData["estadosOptions"] = ArrUtils::toOptionsArray(
            $this->estadosOptions,
            "key",
            "value",
            "selected",
            $this->libroEstado
        );
        
        $this->viewData["error"] = $this->errors;
        $this->viewData["has_errors"] = $this->hasErrors;

        if ($this->mode == "DSP" || $this->mode == "DEL") {

            $this->isReadOnly = "readonly disabled";

            if ($this->mode == "DSP") {
                $this->showActions = false;
            }
        } else {
            $this->isReadOnly = "";
            $this->showActions = true;
        }
        $this->viewData["isReadOnly"] = $this->isReadOnly;
        $this->viewData["showActions"] = $this->showActions;
    }

    private function addError($errorMsg, $origin = "global"): void
    {
        if (!isset($this->errors[$origin])) {
            $this->errors[$origin] = [];
        }

        $this->errors[$origin][] = $errorMsg;
        $this->hasErrors = true;
    }

    public function run(): void
    {
        $this->getDatos();

        if ($this->isPostBack()) {
            $this->getPostData();
            $this->executePostAction();
        }
        $this->prepareView();
        
        Renderer::render("admin/formulario", $this->viewData);
    }
}