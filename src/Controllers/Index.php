<?php
/**
 * PHP Version 7.2
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */
namespace Controllers;
use Dao\Libros\Libros as DaoLibros;

/**
 * Index Controller
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */
class Index extends PublicController
{
    /**
     * Index run method
     *
     * @return void
     */
    
    private function getAllLibros(){
        $this->viewData["libros"] = DaoLibros::getAllActive(4);
    }
    
    public function run() :void
    {
        $this->getAllLibros();
        \Views\Renderer::render("index", $this->viewData);
    }
}
?>
