<?php

class ControladorSolicitudes
{

    static public function ctrMostrarEquiposDisponible($fechaInicio, $fechaFin)
    {
        $respuesta = ModeloSolicitudes::mdlMostrarEquiposDisponible($fechaInicio, $fechaFin);
        return $respuesta;
    }

     static public function ctrGuardarSolicitud($datos){

        //si la fecha inicio es igual a la fecha fin el tipo_prestamo es "imediata"
        if($datos["fechaInicio"] == $datos["fechaFin"]){
            $tipo_prestamo = "Inmediato";
            $estado_prestamo = "Prestado";
        }else{
            $tipo_prestamo = "Reservado";
            $estado_prestamo = "Pendiente";
        }

        $datos = array(
            "fecha_inicio" => $datos["fechaInicio"],
            "fecha_fin" => $datos["fechaFin"],
            "tipo_prestamo" => $tipo_prestamo,
            "motivo" => $datos["motivo"],
            "estado_prestamo" => $estado_prestamo,
            "usuario_id" => $datos["idSolicitante"],
            "equipos" => $datos["equipos"]
        );



        $tabla = "prestamos";
        $respuesta = ModeloSolicitudes::mdlGuardarSolicitud($tabla, $datos);
        return $respuesta;
        
    }

        
    

    static public function ctrMostrarSolicitudes($item, $valor)
    {
        $respuesta = ModeloSolicitudes::mdlMostrarSolicitudes($item, $valor);
        return $respuesta;
    }

    static public function ctrMostrarPrestamo($item, $valor)
    {
        $respuesta = ModeloSolicitudes::mdlMostrarPrestamo($item, $valor);
        return $respuesta;
    }

    static public function ctrMostrarPrestamoDetalle($item, $valor)
    {
        $respuesta = ModeloSolicitudes::mdlMostrarPrestamoDetalle($item, $valor);
        return $respuesta;
    }

    static public function ctrMostrarHistorial($item, $valor)
    {

        $tabla = "prestamos";
        $respuesta = ModeloSolicitudes::mdlMostrarHistorial($tabla, $item, $valor);
        return $respuesta;
    }

    static public function ctrContarPrestamosPorEstado($estado_prestamo, $fecha)
    {
        $tabla = "prestamos";
        $respuesta = ModeloSolicitudes::mdlContarPrestamosPorEstado($tabla, $estado_prestamo, $fecha);
        return $respuesta;

    }

    static public function ctrContarDevoluciones($fecha)
    {
        $tabla = "prestamos";
        $respuesta = ModeloSolicitudes::mdlContarDevoluciones($tabla, $fecha);
        return $respuesta;
    }




    public static function ctrContarEquiposPorCategoria() {
        return ModeloSolicitudes::mdlContarEquiposPorCategoria();
    }
    
    public static function ctrContarEquiposPorReserva() {
        return ModeloSolicitudes::mdlContarEquiposPorReserva();
    }

}