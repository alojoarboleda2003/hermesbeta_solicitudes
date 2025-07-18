const driver = window.driver.js.driver;

$(document).on("click", "#btnTour", function() {
    const driverObj = driver({
        popoverClass: 'driverjs-theme',
        showProgress: true,
        // Textos personalizados en español
        nextBtnText: 'Siguiente -›',
        prevBtnText: '‹- Anterior',
        doneBtnText: 'Ok',  
        progressText: 'Paso {{current}} de {{total}}', 

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
                element: '.main-sidebar',
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
            },
            {
                popover: {
                    title: 'Fin del tour!',
                    description: '¡Gracias por tu visita por este tour!',
                    side: 'right',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            }              
        ]
    });

    driverObj.drive();
});