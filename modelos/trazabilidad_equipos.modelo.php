<?php

require_once "conexion.php";

class ModeloTrazabilidadEquipos{

    static public function mdlMTrazabilidadAgregarEquipo($tabla){
        try{
            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE id_equipo = 1");
        } catch (Exception $e) {
            return $e->getMessage();
        }
        $stmt->execute();
        return $stmt->fetchAll();
    }
}
