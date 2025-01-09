# mqh_rommel

Proyecto en flutter para el aprendizaje de lenguaje de señas en la EMS.

## Configuracion del proyecto

<<<<<<< HEAD
Inicio.

=======
**Para cambiar el icono de la aplicacion**
...
agregar paquete flutter_launcher_icons
flutter pub run flutter\_launcher\_icons
...

**Para cambiar el nombre del paquete de la aplicacion:**
...
agregar paquete change_app_package_name
flutter pub run change\_app\_package\_name:main com.rommelolachea.mqhcbtis62
...

**Para cambiar el nombre de la aplicacion en android**
...
Abre el archivo android/app/src/main/AndroidManifest.xml.
Encuentra la línea que define el atributo android:label dentro del elemento <application>. Por ejemplo:
<application
    android:label="MiAplicacion"
    android:icon="@mipmap/ic_launcher">

Cambia el valor de android:label al nombre deseado. Por ejemplo:
    android:label="MQH"

Guarda el archivo y reconstruye el proyecto:
    flutter clean
    flutter run
...

**Para cambiar el nombre de la aplicacion en iOS**
...
Abre el archivo ios/Runner/Info.plist.
Busca la clave CFBundleName. Si no existe, agrégala:

<key>CFBundleName</key>
<string>MQH</string>

Guarda el archivo y asegúrate de que los cambios se reflejen al compilar el proyecto:

flutter clean
flutter run

...
>>>>>>> 59dde3a179ea1f06d07bd737321b4889aaf0905d
