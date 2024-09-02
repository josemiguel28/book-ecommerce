<?php

namespace Dao\Cart;

class Cart extends \Dao\Table
{


    public static function insertProduct(
        $usercod,
        $libroId,
        $crrctd,
        $crrprc,
        $crrfching
    )
    {
        $sql = "INSERT INTO carretilla  (usercod,libroId, crrctd, crrprc,crrfching) 
        VALUES (:usercod, :libroId, :crrctd, :crrprc, :crrfching)";
        $params = array(
            "usercod" => $usercod,
            "libroId" => $libroId,
            "crrctd" => $crrctd,
            "crrprc" => $crrprc,
            "crrfching" => $crrfching
        );

        return self::executeNonQuery($sql, $params);
    }


    public static function obtenerCarrito($usercod)
    {
        $sql = "select carretilla.usercod,
     libros.libroid,
     libros.libroDescripcion,
     libros.libroNombre,
     libros.libroPrecio,
     libros.libroImgUrl,
     carretilla.crrctd,
     (carretilla.crrctd * libros.libroPrecio) * 0.15 as ISV,
   (carretilla.crrctd * libros.libroPrecio) as subtotal,
     carretilla.crrctd * libros.libroPrecio as total

    from carretilla
    inner join libros on libros.libroid = carretilla.libroid
    where carretilla.usercod = :usercod;";

        $params = array(
            "usercod" => $usercod
        );
        return self::obtenerRegistros($sql, $params);
    }

    public static function deleteProduct($usercod, $libroId)
    {
        $sql = "DELETE FROM carretilla WHERE usercod = :usercod AND libroid = :libroId;";
        $params = array(
            "usercod" => $usercod,
            "libroId" => $libroId
        );
        return self::executeNonQuery($sql, $params);
    }

    public static function insertOrder($usercod, $orderId, $total, $cantidad, $estatus)
    {
        $sql = "INSERT INTO ordenes (usercod ,orderId, total, cantidad , estatus) VALUES (:usercod,:orderId, :total, :cantidad,:estatus);";
        $params = array(
            "usercod" => $usercod,
            "orderId" => $orderId,
            "total" => $total,
            "cantidad" => $cantidad,
            "estatus" => $estatus
        );
        return self::executeNonQuery($sql, $params);
    }

    public static function insertOrderDetails($orderId, $libroId, $cantidad, $totalPrice)
    {
        $sql = "INSERT INTO orderdetails (orderId, ProductID, Quantity,TotalPrice) VALUES (:orderId, :libroId, :cantidad,:totalPrice);";
        $params = array(
            "orderId" => $orderId,
            "libroId" => $libroId,
            "cantidad" => $cantidad,
            "totalPrice" => $totalPrice
        );
        return self::executeNonQuery($sql, $params);
    }

    public static function getOrderDetails($orderId)
    {
        $sql = "select od.OrderID OrdenID,
       lb.libroNombre Libro,
       lb.libroAutor Autor,
       lb.libroImgUrl,
       lb.libroPrecio Precio,
       od.Quantity Cantidad, 
       od.TotalPrice Total,
       o.fechaOrden Fecha, 
       o.estatus Estatus
       
       from orderdetails as od
         join libros as lb 
         on od.ProductID = lb.libroId
       
       join ordenes as o 
       on o.orderId = od.OrderID
       
         where od.OrderID = :orderId;";
        $params = array(
            "orderId" => $orderId
        );
        
        return self::obtenerRegistros($sql, $params);
    }

    public static function getUserOrders($usercod)
    {
        $sql = "SELECT orderId, fechaOrden, total, estatus FROM ordenes  WHERE usercod = :usercod;";
        $params = array(
            "usercod" => $usercod
        );
        return self::obtenerRegistros($sql, $params);
    }
}


