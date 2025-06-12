
//cuando el documento este listo se ejecutara la funcion donde se cargaran todos los permisos de todos los modulos
$(document).ready(function() {
    $.ajax({
        url: "ajax/traerPermisos.ajax.php",
        dataType: "json",
        success: function(respuesta) {
            // console.log("respuesta", respuesta);
            let modulos = {};

            respuesta.forEach(permiso => {
                if (!modulos[permiso.id_modulo]) {
                    modulos[permiso.id_modulo] = {
                        nombre: permiso.nombre_modulo,
                        permisos: []
                    };
                }
                modulos[permiso.id_modulo].permisos.push(permiso);
            });
            // console.log("modulos", modulos);
            
            var html = "";
            $.each(modulos, function(index, value) {
                //el modulo de Módulos no se muestra en el listado de permisos
                // if (value.nombre!="Módulos") {        
                    html += '<div class="col-md-6">';
                    html +=     '<div class="card module-card card-primary">';
                    html +=         '<div class="card-header">Módulo: ' + value.nombre + '</div>';                
                    html +=         '<div class="card-body">';
                    $.each(value.permisos, function(index2, value2) {
                        html +=          '<div class="form-check">';
                        html +=             '<input type="checkbox" class="form-check-input" id="' + value2["id_permiso"] + '">';
                        html +=                 '<label class="form-check-label w-100" for="' + value2["id_permiso"] + '"><strong>' + value2["nombre_permiso"] + '</strong>';
                        html +=             '<div class="small text-muted">'+value2["descripcion_permiso"]+'</div></label>';
                        html +=          '</div>';  //form-check
                    });
                    html += '</div>'; // card-body
                    html += '</div>'; // card
                    html += '</div>';  // col-md-6
                // }
                
            });

            // console.log("html", html);

             $("#contenidoPermisos").html(html);
        },
    });

    $('.tablaPermisos').DataTable({
        "responsive": true,
        "language": {
            "sProcessing":     "Procesando...",
            "sLengthMenu":     "Mostrar _MENU_ registros",
            "sZeroRecords":    "No se encontraron resultados",
            "sEmptyTable":     "Ningún dato disponible en esta tabla",
            "sInfo":           "Registros del _START_ al _END_ de _TOTAL_",
            "sInfoEmpty":      "Mostrando registros del 0 al 0 de 0",
            "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
            "sSearch":         "Buscar:",
            "oPaginate": {
                "sFirst":    "Primero",
                "sLast":     "Último",
                "sNext":     "Siguiente",
                "sPrevious": "Anterior"
            }
        }
    });
});




// =========================================================================================================

$(document).on("change", "#selectRolForPermisos", function() {
    var idRol = $(this).val();
    
    if (idRol == undefined || idRol == null || idRol == "") {
        $("#contenidoPrincipal").addClass("d-none");
        $("#contenidoPermisos").addClass("d-none");
        $("#descripcionRol").addClass("d-none");
        $("#activarChecks").addClass("disabled");
        $("#desactivarChecks").addClass("disabled");
        return;
    }
    var datos = new FormData();
    datos.append("idRol", idRol);
    $.ajax({
        url: "ajax/permisos.ajax.php",
        method: "POST",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function(respuesta) { 
            console.log("respuesta inical", respuesta);
            //si el rol no tiene permisos
            if (respuesta["nombre_rol"] == null) {
                //traemos la informacion del rol para colocar la descipcion por el idRol
                var datos = new FormData();
                datos.append("idRolDescripcion", idRol);
                $.ajax({
                    url: "ajax/roles.ajax.php",
                    method: "POST",
                    data: datos,
                    cache: false,
                    contentType: false,
                    processData: false,
                    dataType: "json",
                    success: function(respuesta2) {
                        console.log("respuesta2", respuesta2);
                        $("#descripcionRol").html("<p>" + respuesta2["descripcion"] + "</p>");      
                    },
                });
            }else{
                $("#descripcionRol").html("<p>" + respuesta[idRol]["descripcion_rol"] + "</p>");
            }

            $("#activarChecks").removeClass("disabled");
            $("#desactivarChecks").removeClass("disabled");
            $("#descripcionRol").removeClass("d-none");
            $("input[type='checkbox']").prop("checked", false);
            const permisos = respuesta[idRol]["permisos"];
            console.log("permisos", permisos);
            $.each(permisos, function(index, value) {
                $("#"+value).prop("checked", true);
            });
            $("#contenidoPermisos").removeClass("d-none");
            $("#contenidoPrincipal").removeClass("d-none");
        },
    });
    
});

$(document).on("click", "#activarChecks", function() {
    $("input[type='checkbox']").prop("checked", true);
});
$(document).on("click", "#desactivarChecks", function() {
    $("input[type='checkbox']").prop("checked", false);
});

$(document).on("click", "#guardarPermisos", function() {
    var idRol = $("#selectRolForPermisos").val();
    if (idRol == undefined || idRol == null || idRol == "") {
        return;
    };
    // Recolectar los permisos seleccionados
    const permisosSeleccionados = [];
    $("input[type='checkbox']:checked").each(function() {
        permisosSeleccionados.push($(this).attr("id"));
    });

    // console.log("permisosSeleccionados", permisosSeleccionados);
    // Enviar los permisos seleccionados al servidor
    var datos = new FormData(); 
    datos.append("id_Rol", idRol);
    datos.append("permisos", JSON.stringify(permisosSeleccionados));
    $.ajax({
        url: "ajax/permisos.ajax.php",
        method: "POST",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function(respuesta) {
            console.log("respuesta", respuesta);
            if (respuesta == "ok") {
                Swal.fire({
                    icon: 'success',
                    title: 'Permisos guardados correctamente',
                    showConfirmButton: false,
                    timer: 1500
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error al guardar los permisos',
                    text: respuesta,
                });
            }

        },
        error: function(xhr, status, error) {
            console.error("Error en la solicitud AJAX:", error);
            console.log("Respuesta del servidor:", xhr.responseText);
        }
    });

});

//Tabla que muestra todo los permisos con d-none cuando se te creando un
//Nuevo permiso
document.addEventListener('DOMContentLoaded', function() {
    const selectRol = document.getElementById('selectRolForPermisos');
    const permisosCard = document.querySelector('.card.mt-4');

    selectRol.addEventListener('change', function() {
        if (this.value) {
            //Si selecciona el asignador de permisos se oculta la tabla
            permisosCard.classList.add('d-none');
        } else {
            // No selecciona el asignador de permisos siga mostrando la tabla
            permisosCard.classList.remove('d-none');
        }
    });
});

