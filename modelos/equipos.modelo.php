<?php

require_once "conexion.php";

class ModeloEquipos{
    public static function mdlMostrarEquipos($tabla, $item, $valor){
        if ($item != null) {
            $stmt = Conexion::conectar()->prepare("SELECT 
            e.equipo_id,
            e.numero_serie,
            e.etiqueta,
            e.descripcion,
            e.fecha_entrada,
            u.ubicacion_id,
            c.categoria_id,
            c.nombre AS categoria_nombre,
            cu.id_usuario,
            e.id_estado,
            es.estado AS estado_nombre,
            u.nombre AS ubicacion_nombre,
            CONCAT_WS(' ',cu.nombre,cu.apellido) AS cuentadante_nombre
        FROM 
            $tabla e
        LEFT JOIN 
            ubicaciones u ON e.ubicacion_id = u.ubicacion_id
        LEFT JOIN 
            categorias c ON e.categoria_id = c.categoria_id
        LEFT JOIN 
            usuarios cu ON e.cuentadante_id = cu.id_usuario
        LEFT JOIN
            estados es ON e.id_estado = es.id_estado
        -- LEFT JOIN
            
        WHERE e." . $item . " = :" . $item);

            if ($item == "numero_serie" || $item == "etiqueta" || $item == "descripcion" || $item == "categoria_nombre" || $item == "estado_nombre" || $item == "ubicacion_nombre" || $item == "cuentadante_nombre") {
                $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
            } else {
                $stmt->bindParam(":" . $item, $valor, PDO::PARAM_INT);
            }
            $stmt->execute();
            return $stmt->fetch();
        } else {
            $stmt = Conexion::conectar()->prepare("SELECT 
            e.equipo_id,
            e.numero_serie,
            e.etiqueta,
            e.descripcion,
            e.fecha_entrada,
            u.ubicacion_id,
            c.categoria_id,
            c.nombre AS categoria_nombre,
            cu.id_usuario,
            e.id_estado,
            es.estado AS estado_nombre,
            u.nombre AS ubicacion_nombre,
            CONCAT_WS(' ',cu.nombre,cu.apellido) AS cuentadante_nombre
        FROM 
            $tabla e
        LEFT JOIN 
            ubicaciones u ON e.ubicacion_id = u.ubicacion_id
        LEFT JOIN 
            categorias c ON e.categoria_id = c.categoria_id
        LEFT JOIN 
            usuarios cu ON e.cuentadante_id = cu.id_usuario
        LEFT JOIN
            estados es ON e.id_estado = es.id_estado");
            $stmt->execute();
            return $stmt->fetchAll();
        }

        $stmt->close();
        $stmt = null;
    } // fin del metodo mdlMostrarEquipos


    
    // =====================================
    //     REALIZAR TRASPASO CUENTADANTE
    // =====================================
    public static function mdlMostrarDatosCuentadanteOrigen($tabla, $item, $valor){
        try {
            // SQL CAPTURANDO LOS DATOS DEL CUENTADANTE ACTUAL A MOSTRAR EN EL MODAL
            $stmt1 = Conexion::conectar()->prepare("SELECT e.equipo_id,
                                                us.nombre,
                                                us.numero_documento,
                                                ub.nombre as ubicacion_nombre,
                                                ur.id_rol,
                                                r.nombre_rol,
                                                CONCAT_WS(' ',us.nombre,us.apellido) AS cuentadante_nombre
                                                FROM $tabla e
                                                LEFT JOIN usuarios us ON e.cuentadante_id = us.id_usuario
                                                LEFT JOIN ubicaciones ub ON e.ubicacion_id = ub.ubicacion_id
                                                LEFT JOIN usuario_rol ur ON us.id_usuario = ur.id_usuario
                                                LEFT JOIN roles r ON ur.id_rol = r.id_rol
                                                WHERE $item = :$item;");
            if ($item == "equipo_id") {
                $stmt1->bindParam(":" . $item, $valor, PDO::PARAM_INT);
            } else {
                $stmt1->bindParam(":" . $item, $valor, PDO::PARAM_STR);
            }
            $stmt1->execute();
            return $stmt1->fetch();
        } catch (Exception $e) {
            error_log("Error al editar usuario: " . $e->getMessage());
        } finally {
            //Cerrar la conexión
            $stmt1 = null;
        }
    } // fin del metodo mdlRealizarTraspasoCuentadante

    

    public static function mdlMostrarDatosCuentadanteTraspaso($tabla, $item, $valor){
        try{
            $stmt = Conexion::conectar()->prepare("SELECT 
                                                us.numero_documento,
                                                us.nombre AS cuentadante_nombre,
                                                e.cuentadante_id,
                                                e.ubicacion_id,
                                                us.id_usuario,
                                                e.equipo_id,
                                                ro.nombre_rol,
                                                CONCAT_WS(' ',us.nombre,us.apellido) AS cuentadante_nombre_completo,
                                                ub.nombre AS ubicacion_nombre
                                            FROM 
                                                $tabla us
                                            LEFT JOIN 
                                                usuario_rol ur ON us.id_usuario = ur.id_usuario
                                            LEFT JOIN 
                                                roles ro ON ur.id_rol = ro.id_rol
                                            LEFT JOIN
                                                equipos e ON us.id_usuario = e.cuentadante_id
                                            LEFT JOIN
                                                ubicaciones ub ON e.ubicacion_id = ub.ubicacion_id
                                            WHERE 
                                                $item = :$item;");
            if($item == "id_rol" || $item == "equipo_id"){
                $stmt -> bindParam(":" . $item, $valor, PDO::PARAM_INT);
            } else {
                $stmt -> bindParam(":" . $item, $valor, PDO::PARAM_STR);
            }
            $stmt -> execute();
            return $stmt -> fetch();
        } catch (Exception $e){
            error_log("Error al cambiar de cuentadante: " . $e->getMessage());
        } finally {
            $stmt = null;
        }
    }

    public static function mdlMostrarUbicacion($tabla, $item, $valor){
        try{
            $stmt = Conexion::conectar()->prepare("SELECT ub.ubicacion_id, 
                                                    ub.nombre AS nombre_ubicacion
                                                    FROM $tabla e
                                                    JOIN ubicaciones ub ON e.ubicacion_id = ub.ubicacion_id
                                                    WHERE $item = :$item");
            if($item == "nombre_ubicacion"){
                $stmt -> bindParam(":" . $item, $valor, PDO::PARAM_STR);
            } else {
                $stmt -> bindParam(":" . $item, $valor, PDO::PARAM_INT);
            }
            $stmt -> execute();
            return $stmt -> fetch();
        } catch (Exception $e){
            error_log("Error al cambiar de cuentadante: " . $e->getMessage());
        } finally {
            $stmt = null;
        }
    }

    public static function mdlMostrarUbicacionDestino($tabla, $item, $valor){
        try{
            $stmt = Conexion::conectar()->prepare("SELECT e.ubicacion_id, 
                                                    ub.nombre AS nombre_ubicacion
                                                    FROM $tabla e
                                                    JOIN ubicaciones ub ON e.ubicacion_id = ub.ubicacion_id
                                                    WHERE e.$item = :$item LIMIT 1");
            if($item == "nombre_ubicacion"){
                $stmt -> bindParam(":" . $item, $valor, PDO::PARAM_STR);
            } else {
                $stmt -> bindParam(":" . $item, $valor, PDO::PARAM_INT);
            }
            $stmt -> execute();
            return $stmt -> fetch();
        } catch (Exception $e){
            error_log("Error al cambiar de cuentadante: " . $e->getMessage());
        } finally {
            $stmt = null;
        }
        
    }

    static public function mdlRealizarTraspasoUbicacion($tabla, $datos){
        try{
            $stmt = Conexion::conectar()->prepare("UPDATE $tabla 
                                                    SET ubicacion_id = :ubicacion_id
                                                    WHERE equipo_id = :equipo_id");
            
            $stmt -> bindParam(":ubicacion_id", $datos["ubicacion_id"], PDO::PARAM_INT);
            $stmt -> bindParam(":equipo_id", $datos["equipo_id"], PDO::PARAM_INT);

            if($stmt ->execute()){
                return "ok";
            } else {
                $errorInfo = $stmt -> errorInfo();
                return "error: " . $errorInfo[2];
            }
        } catch (PDOException $e){
            error_log("Error al cambiar de ubicación: " . $e->getMessage());
            return "error";
        } finally {
            $stmt->closeCursor();
            $stmt = null;
        }
    }

    public static function mdlRealizarTraspasoCuentadante($tabla, $datos){
        try{
            $stmt = Conexion::conectar()->prepare("UPDATE $tabla 
                                                    SET cuentadante_id = :cuentadante_id
                                                    WHERE equipo_id = :equipo_id");

            
            // Corrección en los bindParam
            $stmt->bindParam(":equipo_id", $datos["equipo_id"], PDO::PARAM_INT);
            $stmt->bindParam(":cuentadante_id", $datos["cuentadante_id"], PDO::PARAM_INT);
            // $stmt->bindParam(":ubicacion_id", $datos["ubicacion_id"], PDO::PARAM_INT);

            if($stmt ->execute()){
                return "ok";
            }
            // Verificar si se actualizó realmente algún registro
        } catch (Exception $e){
            error_log("Error al cambiar de cuentadante: " . $e->getMessage());
            return "error";
        } finally {
            $stmt = null;
        }
    }

     // =====================================
    //    AGREGAR EQUIPOS
    // =====================================

    public static function mdlAgregarEquipos($tabla, $datos){
        try {
            // Preparar la consulta con los valores por defecto definidos en la base de datos
            $stmt = Conexion::conectar()->prepare("INSERT INTO equipos (numero_serie,
                                                                etiqueta,
                                                                descripcion,
                                                                categoria_id,
                                                                ubicacion_id,
                                                                cuentadante_id,
                                                                id_estado) 
                                                                VALUES (:numero_serie, 
                                                                :etiqueta, 
                                                                :descripcion, 
                                                                :categoria_id, 
                                                                (SELECT ubicacion_id FROM ubicaciones WHERE nombre = 'Almacen' LIMIT 1), 
                                                                :cuentadante_id, 
                                                                (SELECT id_estado FROM estados WHERE estado = 'Disponible' LIMIT 1));");
    
            // Vincular los parámetros con los datos del formulario
            $stmt->bindParam(":numero_serie", $datos["numero_serie"], PDO::PARAM_STR);
            $stmt->bindParam(":etiqueta", $datos["etiqueta"], PDO::PARAM_STR);
            $stmt->bindParam(":descripcion", $datos["descripcion"], PDO::PARAM_STR);
            $stmt->bindParam(":categoria_id", $datos["categoria_id"], PDO::PARAM_INT);
            $stmt->bindParam(":cuentadante_id", $datos["cuentadante_id"], PDO::PARAM_INT);
    
            // Ejecutar la consulta
            if ($stmt->execute()) {
                return "ok";
            } else {
                $errorInfo = $stmt->errorInfo();
                error_log("Error SQL en mdlAgregarEquipos: " . $errorInfo[2]); // Guardar error en log
                return "error: " . $errorInfo[2];
            }
        } catch (PDOException $e) {
            error_log("Error en mdlAgregarEquipos: " . $e->getMessage());
            return "error";
        } finally {
            $stmt->closeCursor();
            $stmt = null;
        }
    }

    static public function mdlEditarEquipos($tabla, $datos){
        try{
            $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET 
                etiqueta = :etiquetaEdit,
                descripcion = :descripcionEdit,
                categoria_id = :categoriaEdit,
                id_estado = :estadoEdit
                WHERE equipo_id = :equipo_id");
                
            $stmt->bindParam(":equipo_id", $datos["equipo_id"], PDO::PARAM_INT);
            $stmt->bindParam(":etiquetaEdit", $datos["etiquetaEdit"], PDO::PARAM_STR);
            $stmt->bindParam(":descripcionEdit", $datos["descripcionEdit"], PDO::PARAM_STR);
            $stmt->bindParam(":categoriaEdit", $datos["categoriaEdit"], PDO::PARAM_INT);
            $stmt->bindParam(":estadoEdit", $datos["estadoEdit"], PDO::PARAM_INT);
    
            if($stmt->execute()){
                return "ok";
            } else {
                return "error";
            }
        } catch(PDOException $e){
            return "error: " . $e->getMessage();
        } finally {
            if($stmt){
                $stmt->closeCursor();
                $stmt = null;
            }
        }
    }
    public static function mdlImportarEquipo($tabla, $datos) {
    try {
        // Validar que los campos requeridos estén presentes y no sean vacíos
        $camposRequeridos = ['numero_serie', 'etiqueta', 'descripcion', 'categoria_id', 'cuentadante_id', 'ubicacion_id', 'id_estado'];
        foreach ($camposRequeridos as $campo) {
            if (!isset($datos[$campo]) || trim($datos[$campo]) === '') {
                $mensajeError = "Campo requerido '$campo' no definido o vacío en los datos.";
                error_log("ERROR en mdlImportarEquipo: " . $mensajeError);
                return "error: $mensajeError";
            }
        }

        // Validar que la ubicación existe
        $ubicacionStmt = Conexion::conectar()->prepare("SELECT ubicacion_id FROM ubicaciones WHERE ubicacion_id = :ubicacion_id LIMIT 1");
        $ubicacionStmt->bindParam(":ubicacion_id", $datos["ubicacion_id"], PDO::PARAM_INT);
        $ubicacionStmt->execute();
        $ubicacion = $ubicacionStmt->fetch(PDO::FETCH_ASSOC);
        if (!$ubicacion) {
            $msg = "No se encontró la ubicación con ID " . $datos["ubicacion_id"];
            error_log("ERROR en mdlImportarEquipo: " . $msg);
            return "error: $msg";
        }

        // Validar que el estado existe
        $estadoStmt = Conexion::conectar()->prepare("SELECT id_estado FROM estados WHERE id_estado = :id_estado LIMIT 1");
        $estadoStmt->bindParam(":id_estado", $datos["id_estado"], PDO::PARAM_INT);
        $estadoStmt->execute();
        $estado = $estadoStmt->fetch(PDO::FETCH_ASSOC);
        if (!$estado) {
            $msg = "No se encontró el estado con ID " . $datos["id_estado"];
            error_log("ERROR en mdlImportarEquipo: " . $msg);
            return "error: $msg";
        }

        // Preparar consulta SQL
        $sql = "
            INSERT INTO $tabla (
                numero_serie,
                etiqueta,
                descripcion,
                categoria_id,
                ubicacion_id,
                cuentadante_id,
                id_estado
            ) VALUES (
                :numero_serie,
                :etiqueta,
                :descripcion,
                :categoria_id,
                :ubicacion_id,
                :cuentadante_id,
                :id_estado
            )
        ";

        $stmt = Conexion::conectar()->prepare($sql);

        // Enlazar parámetros
        $stmt->bindParam(":numero_serie", $datos["numero_serie"], PDO::PARAM_STR);
        $stmt->bindParam(":etiqueta", $datos["etiqueta"], PDO::PARAM_STR);
        $stmt->bindParam(":descripcion", $datos["descripcion"], PDO::PARAM_STR);
        $stmt->bindParam(":categoria_id", $datos["categoria_id"], PDO::PARAM_INT);
        $stmt->bindParam(":ubicacion_id", $datos["ubicacion_id"], PDO::PARAM_INT);
        $stmt->bindParam(":cuentadante_id", $datos["cuentadante_id"], PDO::PARAM_INT);
        $stmt->bindParam(":id_estado", $datos["id_estado"], PDO::PARAM_INT);

        // Ejecutar la consulta
        if ($stmt->execute()) {
            return "ok";
        } else {
            $errorInfo = $stmt->errorInfo();
            error_log("Error SQL en mdlImportarEquipo: " . $errorInfo[2]);
            return "error: " . $errorInfo[2];
        }

    } catch (PDOException $e) {
        error_log("Excepción PDO en mdlImportarEquipo: " . $e->getMessage());
        return "error: " . $e->getMessage();
    } finally {
        if (isset($stmt)) {
            $stmt->closeCursor();
            $stmt = null;
        }
    }
}

}