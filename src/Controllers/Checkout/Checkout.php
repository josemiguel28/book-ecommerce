<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
use Dao\Cart\Cart as CartDao;
use Utilities\Security;

class Checkout extends PublicController
{

    private $viewData;
    private $usercod;

    public function __construct()
    {
        parent::__construct();

        $this->usercod = Security::getUserId();
    }

    public function run(): void
    {
        if ($this->isPostBack()) {
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test" . (time() - 10000000),
                "http://localhost/mcv202401/index.php?page=Checkout_Error",
                "http://localhost/mcv202401/index.php?page=Checkout_Accept"
            );

            $librosCarrito = CartDao::obtenerCarrito($this->usercod);

            foreach ($librosCarrito as $libro) {
                $nombreLibro = $libro["libroNombre"];
                $descripcionLibro = $libro["libroDescripcion"];
                $idLibro = intval($libro["libroid"]);
                $precioLibro = intval($libro["libroPrecio"]);
                $cantidadLibro = intval($libro["crrctd"]);

                $PayPalOrder->addItem(
                    $nombreLibro,
                    $descripcionLibro,
                    $idLibro,
                    $precioLibro,
                    15,
                    $cantidadLibro,
                    "DIGITAL_GOODS"
                );
            }

            /*
                         $PayPalOrder->addItem("Test", "TestItem1", "PRD1", 100, 15, 1, "DIGITAL_GOODS");
                         $PayPalOrder->addItem("Test 2", "TestItem2", "PRD2", 50, 7.5, 2, "DIGITAL_GOODS");
            */
            $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET")
            );
            $PayPalRestApi->getAccessToken();
            $response = $PayPalRestApi->createOrder($PayPalOrder);
// Add this line
            echo "<pre>";
            var_dump($response);
            echo "</pre>";
            $_SESSION["orderid"] = $response->id;
            foreach ($response->links as $link) {
                if ($link->rel == "approve") {
                    \Utilities\Site::redirectTo($link->href);
                }
            }
            die();
        }

        \Views\Renderer::render("paypal/carrito", $this->viewData);
    }
}
