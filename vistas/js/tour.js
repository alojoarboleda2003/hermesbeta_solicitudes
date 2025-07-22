// documentacion: https://driverjs.com/docs/installation
// Se solicita instanciar la clase de driver.js desde el objeto 'window'
const driver = window.driver.js.driver;

$(document).on("click", "#btnTour", function() {
    const driverObj = driver({
        // Se configura el driver.js con los parámetros deseados
        popoverClass: 'driverjs-theme', //Aquí se configura la clase del popover
        showProgress: true, //Aquí se configura si se muestra el progreso de los pasos
        // Textos personalizados en español
        nextBtnText: 'Siguiente -›',
        prevBtnText: '‹- Anterior',
        doneBtnText: 'Ok',
        progressText: 'Paso {{current}} de {{total}}', 

        // Los pasos del tour
        steps: [
            {
                // Primer paso: Bienvenida general sin elemento
                popover: {
                    title: '¡Hola, bienvenido a Hermes!',
                    description: 'Te guiaremos a través de las funcionalidades principales de la plataforma. <br>Puedes usar las teclas flecha también(<- ->)', // Puedes añadir una descripción aquí
                    side: 'top',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                },
            },
            {
                element: '.main-sidebar', // Elemento al que se dirigirá el paso (Se toma por .clase o por #id)
                // Configuración del popover y mensajes a mostrar y en donde se mostrará
                popover: {
                    title: 'Menú principal',
                    description: 'En esta sección podrás ver el menú principal de navegación de Hermes.',
                    side: 'right',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            },
            {
                element: '.tour-home',
                popover: {
                    title: 'Inicio',
                    description: 'Aquí podrás visualizar gráficas y estadísticas en general.',
                    side: 'right',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            },
            {
                element: '.tour-administar',
                popover: {
                    title: 'Administración',
                    description: 'En esta sección se administran los permisos, usuarios, sedes, roles, etc.',
                    side: 'right',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            },
            {
                element: '.tour-usuarios',
                popover: {
                    title: 'Usuarios',
                    description: 'Aquí se administran los usuarios de la plataforma de Hermes.',
                    side: 'right',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            },
            {
                element: '.tour-equipos',
                popover: {
                    title: 'Equipos',
                    description: 'En esta sección se administran los equipos de la plataforma de Hermes.',
                    side: 'right',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            },
            {
                element: '.tour-solicitudes',
                popover: {
                    title: 'Solicitudes',
                    description: 'Aquí podrás consultar las solicitudes de los usuarios.',
                    side: 'right',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            },
            {
                element: '.tour-autorizaciones',
                popover: {
                    title: 'Autorizaciones',
                    description: 'En esta sección están los usuarios con autorización de los equipos pendientes por confirmar en trámite.',
                    side: 'right',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            },
            {
                element: '.tour-salidas',
                popover: {
                    title: 'Salidas',
                    description: 'En esta sección se consultan las salidas por autorizar de los equipos',
                    side: 'right',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            },
            {
                element: '.tour-devoluciones',
                popover: {
                    title: 'Devoluciones',
                    description: 'Los equipos en devolución se consultan en esta sección',
                    side: 'right',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            },
            {
                element: '.tour-mantenimiento',
                popover: {
                    title: 'Mantenimiento',
                    description: 'Equipos que llegan de devoluciones, llegan a mantenimiento o cuando se solicita de uno',
                    side: 'right',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            }
        ]
    });

    driverObj.drive();
});


//   <!-- ========== Start Section ==========
//   TODO: Tour de inventario
//   ========== End Section ========== -->
$(document).on("click", "#btnTourInventario", function() {
    // * Construye los pasos dinámicamente.
    let stepsInventario = [];

    // Solo agregar los pasos si el usuario tiene los permisos necesarios
    if (usuarioActual["permisos"].includes(1)) {
        stepsInventario.push({
            element: '.tourAgregarEquipo',
            popover: {
                title: 'Agregar un equipo',
                description: 'Con este botón podrás agregar un equipo a la plataforma con su información. <br>Tales como su eqtiqueta, número de serie, descripción, categoría y su cuentadante',
                side: 'top',
                align: 'center',
                className: 'driverjs-custom-popover' 
            }
        });
    }

    if(usuarioActual["permisos"].includes(6)){
        stepsInventario.push({
            element: '.tourImportarEquipos',
            popover: {
                title: 'Importar equipos por archivo Excel',
                description: 'Con este botón podrás importar equipos a la plataforma desde un archivo Excel.',
                side: 'top',
                align: 'center',
                className: 'driverjs-custom-popover' 
            }
        });
    }

    stepsInventario.push({
        element: '.dt-buttons',
        popover: {
            title: 'Botones de exportación',
            description: 'Con estos botones podrás exportar los datos de la tabla a un archivo Excel, CSV (archivo de texto plano separado por comas), PDF (formato de archivo de portabilidad).',
            side: 'top',
            align: 'center',
            className: 'driverjs-custom-popover' 
        }
    });

    if(usuarioActual["permisos"].includes(3)){
        stepsInventario.push({
            element: '.btnEditarEquipo',
            popover: {
                title: 'Botón de edición',
                description: 'Con este botón podrás editar los datos de un equipo.',
                side: 'top',
                align: 'center',
                className: 'driverjs-custom-popover' 
            }
        });
    }

    if(usuarioActual["permisos"].includes(5)){
        stepsInventario.push({
            element: '.btnTraspasarEquipo',
            popover: {
                title: 'Botón de traspaso de cuentadante',
                description: 'Con este botón podrás traspasar un equipo a otra cuentadante autorizado.',
                side: 'top',
                align: 'center',
                className: 'driverjs-custom-popover' 
            }
        });
    }

    if(usuarioActual["permisos"].includes(4)){
        stepsInventario.push({
            element: '.btnTraspasarUbicacion',
            popover: {
                title: 'Botón de traspaso de ubicación',
                description: 'Con este botón podrás traspasar un equipo a otra ubicación.',
                side: 'top',
                align: 'center',
                className: 'driverjs-custom-popover' 
            }
        });
    }

    stepsInventario.push({
        element: '.btnHistorialEquipo',
        popover: {
            title: 'Botón de historial de equipo',
            description: 'Con este botón podrás ver el historial de un equipo. Mostrando su trazabilidad a lo largo del tiempo; sus movimientos como cuando fue agregado, préstamos, mantenimiento, traspasos de ubicación o cuentadante, etc.',
            side: 'top',
            align: 'center',
            className: 'driverjs-custom-popover' 
        }
    });

    const driverObj = driver({
        popoverClass: 'driverjs-theme',
        showProgress: true,
        nextBtnText: 'Siguiente -›',
        prevBtnText: '‹- Anterior',
        doneBtnText: 'Ok',
        progressText: 'Paso {{current}} de {{total}}', 

        // Los pasos del tour para el inventario
        steps: stepsInventario
    });

    driverObj.drive();
});
