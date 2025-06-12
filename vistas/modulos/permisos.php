<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Gestión de Permisos</h1>
                </div>
            </div>
        </div>
    </section>


    <section class="content">
        <div class="container-fluid">
            <!-- Primera Card - Asignación de Permisos -->
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Asignación de Permisos por Rol</h3>
                </div>
                <div class="card-body">
                    <!-- Tu código existente de selección de rol -->
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-6 col-md-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                                    </div>
                                    <select class="form-control" id="selectRolForPermisos" name="selectRol">
                                        <option value="">Seleccione un rol...</option>
                                        <?php
                                        $roles = ControladorRoles::ctrMostrarRoles(null, null);
                                        foreach ($roles as $rol) {
                                            if ($rol["estado"] == "activo") {
                                                echo '<option value="'.$rol["id_rol"].'">'.$rol["nombre_rol"].'</option>';
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-12 justify-content-end float-right">
                                <button type="button" id="activarChecks" class="btn btn-primary disabled">Seleccionar Todos</button>
                                <button type="button" id="desactivarChecks" class="btn btn-outline-primary disabled">Deseleccionar Todos</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Segunda Card - Lista de Permisos -->
            <div class="card mt-4">
                <div class="card-header">
                    <h3 class="card-title">Lista de Permisos del Sistema</h3>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped dt-responsive tablaPermisos">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Módulo</th>
                                <th>Permiso</th>
                                <th>Descripción</th>
                                <th>Roles Asignados</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                        $permisos = ControladorPermisos::ctrListarPermisos();
                        foreach ($permisos as $permiso) {
                            echo '<tr>
                                <td>'.$permiso["id_permiso"].'</td>
                                <td>'.$permiso["modulo"].'</td>
                                <td>'.$permiso["nombre_permiso"].'</td>
                                <td>'.$permiso["descripcion_permiso"].'</td>
                                <td>'.$permiso["roles_asignados"].'</td>
                            </tr>';
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Tu código existente del contenido principal -->
            <div class="card d-none" id="contenidoPrincipal">
                <div class="card-header">
                    <div id="descripcionRol" class="role-description d-none">
                        <!-- La descripción del rol se mostrará aquí -->
                    </div>
                </div>

                <div class="card-body">
                    <div id="contenidoPermisos" class="row d-none">
                            <!-- Aquí se cargarán los permisos del rol seleccionado -->
                    </div>
                </div>

                <div class="card-footer">
                    <!-- Botón Guardar -->
                    <div class="col-12">
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end btn-guardar">
                            <button class="btn btn-primary" id="guardarPermisos">Guardar Cambios</button>
                        </div>
                    </div>
                </div>
                <!-- card -->
            </div>
        </div>
    </section>
</div>