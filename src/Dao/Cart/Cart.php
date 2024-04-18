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
    
    public static function insertOrder($usercod, $orderId, $total, $estatus){
        $sql = "INSERT INTO ordenes (usercod, orderId, total, estatus) VALUES (:usercod, :orderId, :total, :estatus);";
        $params = array(
            "usercod" => $usercod,
            "orderId" => $orderId,
            "total" => $total,
            "estatus" => $estatus
        );
        return self::executeNonQuery($sql, $params);
    }
    
    public static function getOrders($usercod){
        $sql = "SELECT orderId FROM ordenes WHERE usercod = :usercod;";
        $params = array(
            "usercod" => $usercod
        );
        return self::obtenerUnRegistro($sql, $params);
    }

    public static function getUserOrders($usercod){
        $sql = "SELECT orderId, fechaOrden, total, estatus FROM ordenes  WHERE usercod = :usercod;";
        $params = array(
            "usercod" => $usercod
        );
        return self::obtenerRegistros($sql, $params);
    }
}


