<?php

Class ControladorEstados{
    static public function ctrMostrarEstados($item, $valor){
        $tabla = "estados";

        $respuesta = ModeloEstados::mdlMostrarEstados($tabla, $item, $valor);
        return $respuesta;
    }
}