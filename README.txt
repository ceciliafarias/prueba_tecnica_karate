DEMOBLAZER TEST AUTOMATION

Este proyecto de automatización de pruebas está construido con Karate y Maven para probar la funcionalidad de la aplicación web DemoBlaze.

=== OBTENER EL CÓDIGO ===

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/tu-usuario/demoblaze-automation.git
   cd demoblaze-automation
   ```

2. O descargar como ZIP:
   - Haz clic en el botón verde "Code" en la página principal del repositorio
   - Selecciona "Download ZIP"
   - Descomprime el archivo en tu directorio de trabajo
   - Abre una terminal en el directorio descomprimido

=== REQUISITOS ===
- Java JDK 17
- Maven 3.6.0 o superior

=== ESTRUCTURA DEL PROYECTO ===
src/test/java/DemoBlazer/
├── features/
│   ├── login.feature
│   └── signUp.feature
├── resources/
│   ├── inputData.csv
│   └── inputData.json
├── utils/
│   ├── initData.feature
│   ├── Report.java
│   └── router.js
├── workflow/
│   └── demoblaze.feature
└── DemoBlazerTest.java

=== TAGS DISPONIBLES ===
- @demoBlazeCsv: Ejecuta pruebas utilizando datos de entrada en formato CSV
- @demoBlazeJson: Ejecuta pruebas utilizando datos de entrada en formato JSON
- @demoBlazeE2E: Ejecuta un flujo de extremo a extremo que incluye registro y login

=== COMO EJECUTAR LAS PRUEBAS ===

1. Instalar dependencias:
   mvn clean install

2. Ejecutar todas las pruebas:
   mvn test

3. Ejecutar pruebas específicas por tag:
   mvn test -Dtest=DemoBlazerTest -Dtag="@demoBlazeCsv"
   mvn test -Dtest=DemoBlazerTest -Dtag="@demoBlazeJson"
   mvn test -Dtest=DemoBlazerTest -Dtag="@demoBlazeE2E"

4. Ejecutar múltiples tags:
   mvn test -Dtest=DemoBlazerTest -Dtag="@demoBlazeCsv,@demoBlazeJson"

=== VISUALIZACIÓN DE REPORTES ===

1. Reportes de Karate:
   - Navega a la carpeta: target/report/karate-report/
   - Abre el archivo 'karate-summary.html' en tu navegador web
   - Este reporte muestra un resumen de todas las características (features) ejecutadas

2. Reportes de Cucumber:
   - Navega a la carpeta: target/report/cucumber-report/
   - Abre el archivo 'overview-features.html' para ver un resumen general
   - O abre el archivo 'cucumber-html-reports/overview-features.html' para un reporte más detallado
   - Los reportes incluyen:
     * Resumen de escenarios pasados/fallidos
     * Tiempos de ejecución
     * Datos de prueba utilizados
     * Capturas de pantalla (si están habilitadas)


=== NOTAS ADICIONALES ===
- Los datos de prueba se pueden configurar en los archivos inputData.csv o inputData.json
- El proyecto incluye un sistema de rutas (router.js) para manejar los diferentes escenarios
- La clase DemoBlazerTest.java es el punto de entrada para la ejecución de pruebas
