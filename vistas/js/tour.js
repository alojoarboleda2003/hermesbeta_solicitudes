const driver = window.driver.js.driver;

$(document).on("click", "#btnTour", function() {
    const driverObj = driver({
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
                    description: 'Te guiaremos a través de las funcionalidades principales de la plataforma.', // Puedes añadir una descripción aquí
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
                    side: 'top',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            },
            {
                element: '.tour-home',
                popover: {
                    title: 'Inicio',
                    description: 'Aquí podrás visualizar gráficas y estadísticas en general.',
                    side: 'top',
                    align: 'center',
                    className: 'driverjs-custom-popover' 
                }
            }
        ]
    });

    driverObj.drive();
});