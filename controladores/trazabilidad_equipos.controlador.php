<?php

class ControladorTrazabilidadEquipos{
    static public function ctrTrazabilidadAgregarEquipo($item, $valor){
        $tabla = "trazabilidad_equipos";
        $respuesta = ModeloTrazabilidadEquipos::mdlMTrazabilidadAgregarEquipo($tabla);

        return $respuesta;
    }
}