//para ver detalle del prestamo
$(document).on("click", ".btnVerDetalle", function () {
  let idPrestamo = $(this).attr("idPrestamo");
//   console.log("idPrestamo :", idPrestamo);
  datos = new FormData();
  datos.append("accion", "mostrarPrestamo");
  datos.append("idPrestamo", idPrestamo);
  $.ajax({
    url: "ajax/solicitudes.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (respuesta) {
    //   console.log("Prestamo :", respuesta);
      $("#numeroPrestamo").text(respuesta["id_prestamo"]);
      $("#detalleTipoPrestamo").text(respuesta["tipo_prestamo"]);
      $("#detalleFechaInicio").text(respuesta["fecha_inicio"].split(" ")[0]);
      $("#detalleFechaFin").text(respuesta["fecha_fin"].split(" ")[0]);
      $("#detalleMotivoPrestamo").text(respuesta["motivo"]);
      $("#estadoPrestamo").text(respuesta["estado_prestamo"]);
      $("#estadoCallout")
            .removeClass("callout-success callout-warning callout-danger callout-info");

        // Agregar nueva clase según estado
                switch (respuesta["estado_prestamo"]) {
                    case "Autorizado"&& "Prestado":
                        $("#estadoCallout").addClass("callout-success");
                        
                        break;
                    case "Pendiente":
                        $("#estadoCallout").addClass("callout-warning");
                        
                        break;
                    case "Rechazado"&&"Devuelto":
                        $("#estadoCallout").addClass("callout-danger");
                        
                        break;
                    case "Tramite":
                        $("#estadoCallout").addClass("callout-info");
                        
                        break;
                     
                }
                $("#estadoPrestamo")
                .removeClass("badge-success badge-warning badge-danger badge-primary");

            // Agregar clase según estado
            switch (respuesta["estado_prestamo"]) {
                case "Autorizado" && "Prestado":
                    $("#estadoPrestamo").addClass("badge-success");
                    break;
                case "Pendiente":
                    $("#estadoPrestamo").addClass("badge-warning");
                    break;
                case "Rechazado"&&"Devuelto":
                    $("#estadoPrestamo").addClass("badge-danger");
                    break;
                case "Tramite":
                    $("#estadoPrestamo").addClass("badge-primary");
                    break;
                
                 
            }
       
      datosDetalle = new FormData();
      datosDetalle.append("accion", "mostrarPrestamoDetalle");
        datosDetalle.append("idPrestamoDetalle", respuesta["id_prestamo"]);
       $.ajax({
                url: "ajax/solicitudes.ajax.php",
                method: "POST",
                data: {
                    accion: "mostrarPrestamoDetalle",
                    idPrestamoDetalle: idPrestamo
                },
                dataType: "json",
                success: function (detalles) {
                    var tabla = $("#tblDetallePrestamo");

                    // Destruir DataTable si ya está inicializado
                    if ($.fn.DataTable.isDataTable(tabla)) {
                        tabla.DataTable().clear().destroy();
                    }

                    var tbody = tabla.find("tbody");
                    tbody.empty();

                    // Agregar filas
                    detalles.forEach(function (equipo) {
                        tbody.append(
                            "<tr>" +
                                "<td>" + equipo.equipo_id + "</td>" +
                                "<td>" + equipo.categoria + "</td>" +
                                "<td>" + equipo.descripcion + "</td>" +
                                "<td>" + equipo.etiqueta + "</td>" +
                                "<td>" + equipo.numero_serie + "</td>" +
                                "<td>" + equipo.ubicacion + "</td>" +
                            "</tr>"
                        );
                    });

                    // Inicializar DataTable nuevamente
                    tabla.DataTable({
                        responsive: true
                        
                        
                    });
                    $("#modalMisDetalles").modal("show");

                }
            });
        }
    });
});
