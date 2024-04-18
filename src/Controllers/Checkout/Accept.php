<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
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
            
            CartDao::insertOrder(Security::getUserId(),$orderId,$orderCaptureAmount,$orderStatus);
        
        } else {
            $this->viewData["orderjson"] = "No Order Available!!!";
        }
        
        \Views\Renderer::render("paypal/accept", $this->viewData);
    }
}
