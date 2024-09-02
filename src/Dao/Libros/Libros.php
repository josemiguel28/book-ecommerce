<?php

namespace Dao\Libros;

use Dao\Table;

class Libros extends Table
{
    // getAll
    public static function getAll()
    {
        return self::obtenerRegistros("select ecommerceprueba.libros.libroId,
       ecommerceprueba.libros.libroNombre,
       ecommerceprueba.libros.libroDescripcion,
       ecommerceprueba.libros.libroPrecio,
       ecommerceprueba.libros.libroImgUrl,
       ecommerceprueba.libros.libroStock,
       ecommerceprueba.libros.libroStatus,
       ecommerceprueba.categorias.categoria_nombre,
       ecommerceprueba.libros.libroAutor
       from libros
         inner join categorias on libros.categoriaId = categorias.categoria_id; ", []);
    }

    public static function getAllActive($limit)
    {
        return self::obtenerRegistros("select  ecommerceprueba.libros.libroId,
       ecommerceprueba.libros.libroNombre,
       ecommerceprueba.libros.libroDescripcion,
       ecommerceprueba.libros.libroPrecio,
       ecommerceprueba.libros.libroImgUrl,
       ecommerceprueba.libros.libroStock,
       ecommerceprueba.libros.libroStatus,
       ecommerceprueba.categorias.categoria_nombre,
       ecommerceprueba.libros.libroAutor
       from libros
         inner join categorias on libros.categoriaId = categorias.categoria_id
         WHERE ecommerceprueba.libros.libroStock > 0 AND ecommerceprueba.libros.libroStatus != 'INA'
        limit :limit; ", ["limit" => $limit]);
    }
    
    
    // getById
    public static function getById($id)
    {
        return self::obtenerUnRegistro("select ecommerceprueba.libros.libroId as libroId,
       ecommerceprueba.libros.libroNombre as libroNombre,
       ecommerceprueba.libros.libroDescripcion as libroDescripcion,
       ecommerceprueba.libros.libroPrecio as libroPrecio,
       ecommerceprueba.libros.libroImgUrl,
       ecommerceprueba.libros.libroStock,
       ecommerceprueba.libros.libroStatus,
       ecommerceprueba.categorias.categoria_nombre,
       ecommerceprueba.libros.libroAutor

       from libros
         inner join categorias on libros.categoriaId = categorias.categoria_id
       WHERE ecommerceprueba.libros.libroId = :id", ["id" => $id]);
    }
    // Add
    public static function add(
        $libroNombre,
        $libroDescripcion,
        $libroPrecio,
        $libroImgUrl,
        $libroStock,
        $libroStatus,
        $categoriaId,
        $libroAutor
    ) {
        $insertSql = "INSERT INTO libros (libroNombre,libroDescripcion,libroPrecio,libroImgUrl,libroStock,
                    libroStatus,categoriaId,libroAutor)
VALUES (
           :libroNombre,
           :libroDescripcion,
           :libroPrecio,
           :libroImgUrl,
           :libroStock,
           :libroStatus,
           :categoriaId,
           :libroAutor
       )";
        return self::executeNonQuery($insertSql, [
            "libroNombre" => $libroNombre,
            "libroDescripcion" => $libroDescripcion,
            "libroPrecio" => $libroPrecio,
            "libroImgUrl" => $libroImgUrl,
            "libroStock" => $libroStock,
            "libroStatus" => $libroStatus,
            "categoriaId" => $categoriaId,
            "libroAutor" => $libroAutor
        ]);
    }
    // Update
    public static function update(
        $libroId,
        $libroNombre,
        $libroDescripcion,
        $libroPrecio,
        $libroImgUrl,
        $libroStock,
        $libroStatus,
        $categoriaId,
        $libroAutor
    ) {
        $updateSql = "UPDATE libros SET  libroNombre = :libroNombre,
                                    libroDescripcion = :libroDescripcion,
                                    libroPrecio = :libroPrecio,
                                    libroImgUrl = :libroImgUrl,
                                    libroStock = :libroStock,
                                    libroStatus = :libroStatus,
                                    categoriaId = :categoriaId,
                                    libroAutor = :libroAutor
                                    WHERE libroId = :libroId
                                        ";
        return self::executeNonQuery($updateSql, [
            "libroId" => $libroId,
            "libroNombre" => $libroNombre,
            "libroDescripcion" => $libroDescripcion,
            "libroPrecio" => $libroPrecio,
            "libroImgUrl" => $libroImgUrl,
            "libroStock" => $libroStock,
            "libroStatus" => $libroStatus,
            "categoriaId" => $categoriaId,
            "libroAutor" => $libroAutor
        ]);
    }
    // Delete
    public static function delete($id)
    {
        $deleteSql = "DELETE FROM libros WHERE libroId = :libros_id";
        return self::executeNonQuery($deleteSql, ["libros_id" => $id]);
    }
    
    public static function getCategorias()
    {
        return self::obtenerRegistros("SELECT categoria_id, categoria_nombre FROM categorias;", []);
    }
}
