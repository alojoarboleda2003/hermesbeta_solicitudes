/* ==================================================
SERVERSIDE EQUIPOS
================================================== */

$('#tblEquipos').DataTable({
    "processing": true,
    "serverSide": true,
    "sAjaxSource": "ajax/serverside/serverside.equipos.php",
    "columns": [
        { "data": null },
        { "data": "1" },
        { "data": "2" },
        { "data": "3" },
        { "data": "4" },
        { "data": "5" },
        { "data": "6" },
        { "data": "7" },
        { "data": null }
    ],
    "columnDefs": [
        {
            "targets": [0],
            "render": function(data, type, row, meta) {
                return meta.row + 1;
            }
        },
        {
            "targets": [-1],
            "render": function(data, type, row) {
                return "<div class='btn-group'>" +
                    "<button title='Editar equipo' class='btn btn-default btnEditarEquipo' idEquipo='" + row[0] + "' data-toggle='modal' data-target='#modalEditarEquipo'><i class='fas fa-edit'></i></button>" +
                    "<button title='Traspaso de cuentadante' class='btn btn-default btnTraspasarEquipo' idEquipoTraspaso='" + row[0] + "' data-toggle='modal' data-target='#modalTraspaso'><i class='fas fa-share'></i></button>" +
                    "<button title='Traspaso de ubicación' class='btn btn-default btnTraspasarUbicacion' idEquipoTraspasoUbicacion='" + row[0] + "' data-toggle='modal' data-target='#modalTraspasoUbicacion'><i class='fas fa-map-pin'></i></button>" +
                    "<button title='Ver historial' class='btn btn-default btnHistorialEquipo' idEquipoHistorial='" + row[0] + "' data-toggle='modal' data-target='#modalHistorialEquipo'><i class='fas fa-clock'></i></button>" +
                "</div>";
            }
        }
    ],
    "responsive": true,
    "autoWidth": false,
    "lengthChange": true,
    "lengthMenu":[10, 25, 50, 100],
    "language": {
        "lengthMenu": "Mostrar _MENU_ registros",
        "zeroRecords": "No se encontraron resultados",
        "info": "Mostrando pagina _PAGE_ de _PAGES_",
        "infoEmpty": "No hay registros disponibles",
        "infoFiltered": "(filtrado de _MAX_ total registros)",
        "search": "Buscar:",
        "paginate": {
            "first":      "Primero",
            "last":       "Ultimo",
            "next":       "Siguiente",
            "previous":   "Anterior"
        }
    },
    "buttons": ["csv", "excel", "pdf"],
    "dom": "lfBrtip"    
});

/* ==================================================
BOTÓN PARA EDITAR EQUIPOS
================================================== */
var idEquipoTraspaso;
var idEquipoTraspasoUbicacion;

$(document).on("click", ".btnEditarEquipo", function() {
    var idEquipo = $(this).attr("idEquipo");
    console.log("IdEquipo: ", idEquipo);
    
    var datos = new FormData();
    datos.append("idEquipo", idEquipo);

    $.ajax({
        url: "ajax/equipos.ajax.php",
        method: "POST",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function(respuesta) {
            console.log("Respuesta completa del servidor:", respuesta);
            
            try {
                if (respuesta) {
                    console.log("datos: ", respuesta);
                    
                    $("#idEditEquipo").val(respuesta["equipo_id"]);
                    $("#numeroSerieEdit").val(respuesta["numero_serie"]);
                    $("#etiquetaEdit").val(respuesta["etiqueta"]);
                    $("#descripcionEdit").val(respuesta["descripcion"]);
                    $("#estadoEdit").val(respuesta["id_estado"]);
                    $("#categoriaEditId").val(respuesta["categoria_id"]);
                } else {
                    console.error("Respuesta inválida del servidor");
                    alert("Error: La respuesta del servidor no tiene el formato esperado");
                }
            } catch (e) {
                console.error("Error al procesar la respuesta:", e);
                alert("Error al procesar la respuesta del servidor");
            }
        },
        error: function(xhr, status, error) {
            console.error("Error en la petición Ajax:");
            console.error("Status:", status);
            console.error("Error:", error);
            console.error("Respuesta:", xhr.responseText);
            alert("Error al comunicarse con el servidor. Por favor, intente nuevamente.");
        }
    });
});

/* ==================================================
BOTÓN PARA INSERTAR EL CUENTADANTE Y UBICACIÓN ACTUAL
================================================== */

$(document).on("click", ".btnTraspasarEquipo", function(){
    idEquipoTraspaso = $(this).attr("idEquipoTraspaso");
    console.log("Id equipo traspaso: ", idEquipoTraspaso);

    var datos = new FormData();
    datos.append("idEquipoTraspaso", idEquipoTraspaso);

    $.ajax({
        url: "ajax/equipos.ajax.php",
        method: "POST",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function(respuesta) {
            try {
                if (respuesta) {
                    console.log("datos: ", respuesta);
                    
                    $("#idEditEquipo").val(respuesta["equipo_id"]);
                    $("#cuentadanteOrigenTraspaso").val(respuesta["cuentadante_nombre"] + " (" + respuesta["nombre_rol"] + ")");
                    $("#ubicacionOrigenTraspaso").val(respuesta["ubicacion_nombre"]);
                } else {
                    console.error("Respuesta inválida del servidor");
                    alert("Error: La respuesta del servidor no tiene el formato esperado");
                }
            } catch (e) {
                console.error("Error al procesar la respuesta:", e);
                alert("Error al procesar la respuesta del servidor");
            }
        },
        error: function(xhr, status, error) {
            console.error("Error en la petición Ajax:");
            console.error("Status:", status);
            console.error("Error:", error);
            console.error("Respuesta:", xhr.responseText);
            alert("Error al comunicarse con el servidor. Por favor, intente nuevamente.");
        }
    });
});

/* ==================================================
BOTÓN PARA BUSCAR EL CUENTADANTE Y AGREGARLO EN EL INPUT
================================================== */

$(document).on("click", ".btnBuscarCuentadante", function (event){
    event.preventDefault();
    console.log("Id equipo traspaso: ", idEquipoTraspaso);

    $("#cuentadanteDestino").val("");
    $("#ubicacionTraspaso").val("");

    var buscarDocumentoId = $("#buscarDocumentoId").val();
    let datos = new FormData();

    datos.append("buscarDocumentoId", buscarDocumentoId);
    if (buscarDocumentoId === ""){
        Toast.fire({
            icon: 'info',
            title: 'Por favor ingrese un documento a buscar',
            position: "center"
        })
        return;
    } else {
        $.ajax({
            url: "ajax/equipos.ajax.php",
            method: "POST",
            data: datos,
            cache: false,
            contentType: false,
            processData: false,
            dataType: "json",
            success: function(resultado){
                const docIngresado = String(buscarDocumentoId).trim();
                const docEncontrado = String(resultado["numero_documento"] || '').trim();
                console.log("rol usuario: ", resultado["nombre_rol"]);
                if(docIngresado != docEncontrado){
                    Toast.fire({
                        icon: 'error',
                        title: 'No se encontró el documento del cuentadante',
                        position: "center"
                    });
                    $("#buscarDocumentoId").val("");
                } else if(resultado["nombre_rol"] == "Aprendiz"){
                    Toast.fire({
                        icon: 'error',
                        title: 'No se puede asignar equipo a este documento',
                        position: "center"
                    });
                    $("#buscarDocumentoId").val("");
                } else {
                    console.log("id_usuario: ", resultado["id_usuario"]);
                    $("#idTraspasoEquipo").val(idEquipoTraspaso);
                    console.log("ESTE ES EL EQUIPO ID AL CUAL VOY A PASAR: ", idEquipoTraspaso);
                    $("#cuentadanteDestinoId").val(resultado["id_usuario"]);
                    $("#cuentadanteDestino").val(resultado["cuentadante_nombre_completo"] + " (" + resultado["nombre_rol"] + ")");
                }
            }
        });
    }
});

/* ==================================================
BOTÓN PARA MOSTRAR LOS DATOS DE LA UBICACIÓN ACTUAL
================================================== */

$(document).on("click", ".btnTraspasarUbicacion", function() {
    let idEquipoTraspasoUbicacion = $(this).attr("idEquipoTraspasoUbicacion");
    console.log("equipo a trasladar:",idEquipoTraspasoUbicacion);

    let datos = new FormData();
    datos.append("idEquipoTraspasoUbicacion", idEquipoTraspasoUbicacion);

    $.ajax({
        url: "ajax/equipos.ajax.php",
        method: "POST",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function(resultado){
            console.log(resultado);
            $("#idTraspasoUbicacion").val(resultado["equipo_id"]);
            $("#ubicacionActualId").val(resultado["ubicacion_id"]);
            $("#ubicacionActual").val(resultado["ubicacion_id"] + " " + resultado["ubicacion_nombre"]);
        }
    });
});

// Activar tooltips después de cada renderizado de tabla
$('#tblEquipos').on('draw.dt', function () {
    $('[data-toggle="tooltip"]').tooltip();
});