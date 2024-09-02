<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
use Dao\Cart\Cart;
use Dao\Cart\Cart as CartDao;
use Utilities\Security;

class Accept extends PublicController
{
    
    private $viewData = [];
    public function run(): void
    {
        $dataview = array();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";
        if ($token !== "" && $token == $session_token) {
            $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET")
            );
            $result = $PayPalRestApi->captureOrder($session_token);
            
            $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);
            $orderData = json_decode($dataview["orderjson"], true);
            $orderId = $orderData['id'];
            $orderStatus = $orderData['status'];
            $orderCaptureAmount = $orderData['purchase_units'][0]['payments']['captures'][0]['amount']['value'];
           
            $this->usercod = Security::getUserId();
            $librosCarrito = CartDao::obtenerCarrito($this->usercod);
            $cantidadTotal = 0;
            $libroId = 0;

            foreach ($librosCarrito as $libro) {
                $cantidad = intval($libro["crrctd"]);
                $cantidadTotal += $cantidad;
                $libroId = intval($libro["libroid"]);
                $totalPrice = $cantidad * floatval($libro["libroPrecio"]); // Asume que el precio del libro está en la misma moneda que la orden

                // Inserta un registro en la tabla de detalles de la orden para cada libro en el carrito de compras
                CartDao::insertOrderDetails($orderId, $libroId, $cantidad, $totalPrice);
            }
            
            CartDao::insertOrder(Security::getUserId(),$orderId,$orderCaptureAmount,$cantidadTotal,$orderStatus);
            
        
        } else {
            $this->viewData["orderjson"] = "No Order Available!!!";
        }
        
        \Views\Renderer::render("paypal/accept", $this->viewData);
    }
}
