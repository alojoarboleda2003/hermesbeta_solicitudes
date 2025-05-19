<?php

class ControladorRoles{
    /*=============================================
    MOSTRAR ROLES
    ==============================================*/
    static public function ctrMostrarRoles($item, $valor)
    {
        $tabla = "roles";
        $respuesta = ModeloRoles::mdlMostrarRoles($tabla, $item, $valor);
        return $respuesta;
    }

    /*=============================================
    CREAR ROL
    ==============================================*/
    static public function ctrCrearRol()
    {
        if (isset($_POST["nombreRol"]) && isset($_POST["descripcionRol"])) {
            // Validate the input fields
            if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ() ]+$/', $_POST["nombreRol"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ() ]+$/', $_POST["descripcionRol"])) {

                $tabla = "roles";
                $datos = array(
                    "nombre_rol" => $_POST["nombreRol"],
                    "descripcion" => $_POST["descripcionRol"]
                );

                $respuesta = ModeloRoles::mdlCrearRol($tabla, $datos);

                if ($respuesta == "ok") {
                    echo '<script>
                        Swal.fire({
                            icon: "success",
                            title: "¡El rol ha sido guardado correctamente!",
                            showConfirmButton: true,
                            confirmButtonText: "Cerrar"
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location = "roles";
                            }
                        });
                    </script>';
                } else {
                    echo '<script>
                        Swal.fire({
                            icon: "error",
                            title: "¡Error al guardar el rol!",
                            showConfirmButton: true,
                            confirmButtonText: "Cerrar"
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location = "roles";
                            }
                        });
                    </script>';
                }
            } else {
                echo '<script>
                    Swal.fire({
                        icon: "error",
                        title: "¡El nombre y la descripción no pueden ir vacíos o llevar caracteres especiales!",
                        showConfirmButton: true,
                        confirmButtonText: "Cerrar"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location = "roles";
                        }
                    });
                </script>';
            }
        }
    }

    /*=============================================
    EDITAR ROL
    ==============================================*/

    static public function ctrEditarRol()
    {
        if (isset($_POST["nombreEditRol"]) && isset($_POST["descripcionEditRol"]) && isset($_POST["idEditRol"])) {
            // Validate the input fields
            if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ() ]+$/', $_POST["nombreEditRol"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ() ]+$/', $_POST["descripcionEditRol"])) {

                $tabla = "roles";
                $datos = array(
                    "id_rol" => $_POST["idEditRol"],
                    "nombre_rol" => $_POST["nombreEditRol"],
                    "descripcion" => $_POST["descripcionEditRol"]
                );

                $respuesta = ModeloRoles::mdlEditarRol($tabla, $datos);

                if ($respuesta == "ok") {
                    echo '<script>
                        Swal.fire({
                            icon: "success",
                            title: "¡El rol ha sido editado correctamente!",
                            showConfirmButton: true,
                            confirmButtonText: "Cerrar"
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location = "roles";
                            }
                        });
                    </script>';
                } else {
                    echo '<script>
                        Swal.fire({
                            icon: "error",
                            title: "¡Error al editar el rol!",
                            showConfirmButton: true,
                            confirmButtonText: "Cerrar"
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location = "roles";
                            }
                        });
                    </script>';
                }
            } else {
                echo '<script>
                    Swal.fire({
                        icon: "error",
                        title: "¡El nombre y la descripción no pueden ir vacíos o llevar caracteres especiales!",
                        showConfirmButton: true,
                        confirmButtonText: "Cerrar"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location = "roles";
                        }
                    });
                </script>';
            }
        }
    }
}