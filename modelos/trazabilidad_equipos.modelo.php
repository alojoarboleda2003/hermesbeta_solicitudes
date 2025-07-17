<?php

require_once "conexion.php";

class ModeloTrazabilidadEquipos{

    static public function mdlMTrazabilidadAgregarEquipo($tabla){
        try{
            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE id_trazabilidad = 1");

            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }
}
