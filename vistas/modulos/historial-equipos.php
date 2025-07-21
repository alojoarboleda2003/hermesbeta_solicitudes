<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Historial</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Inicio</a></li>
          </ol>
        </div>
      </div>

      <div class="card col-sm-6 text-white mt-2 rounded">
        <div class="card-header bg-dark">
          <h3 class="card-title mb-0">Búsqueda de equipo por número de serie</h3>
        </div>
        <div class="form-group col-lg-12 pt-3">
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text bg-secondary border-secondary"><i class="fas fa-barcode text-white"></i></span>
            </div>
            <input type="text" class="form-control border-secondary" id="buscarNumSerie" name="buscarNumSerie" placeholder="Ej:12345...">
            <div class="input-group-append">
              <button class="btn btn-primary" type="button">
                <i class="fas fa-search"></i>
              </button>
            </div>
          </div>
        </div>
      </div>

    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">

      <!-- Timelime example  -->
      <div class="row">
        <div class="col-md-12">
          <div class="timeline">
            <input type="hidden" id="idEquipo" name="idEquipo">


            <!-- Evento 1: Creación de equipo -->
            <?php

            $item = "equipo_id";
            $valor = 1;
            $trazabilidades = ControladorTrazabilidadEquipos::ctrMostrarTrazabilidadEquipos($item, $valor);
            //error_log(print_r($trazabilidades, true));
            // var_dump($trazabilidades);
            foreach ($trazabilidades as $value) {
              echo '<div class="time-label">
                    <span class="bg-green">' . substr($value["fecha_accion"], 2, 8) . '</span>
                    </div>
                    <div>
                    ' . $value["icono"] . '
                    <div class="timeline-item">
                      <span class="time"><i class="fas fa-clock"></i>' . substr($value["fecha_accion"], 11, 5) . '</span>
                      <h3 class="timeline-header bg-dark rounded-top"><a href="#">Sistema: </a>' . $value["titulo"] . '</h3>'
                . $value['descripcion'] . '
                      <div class="timeline-footer">
                        <a class="btn btn-info btn-sm">Detalles técnicos</a>
                      </div>
                    </div>
                  </div>';
            }

            ?>
            <!-- /.timeline -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->