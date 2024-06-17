# FLUTTER + FACEBOOK

este proyecto es un ejemplo de integración e inicio de sesión con Facebook (meta)

## pasos

los pasos estan inspirados en https://facebook.meedu.app/docs/7.x.x/intro

- debes de ir a facebook developers
- crear un proyecto pero como consumidor (no como empresa) porque los que iniciaran sesión serán consumidores finales
- despues completar el proceso aqui https://developers.facebook.com/docs/facebook-login/android/?locale=en
- te pedira que selecciones el proyecto que creaste
- agregas en /app/res/values/strings.xml

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>

  <string name="app_name">nombre_de_tu_proyeto_de_facebook</string>
  <string name="facebook_app_id">id_de_facebook</string>
  <string name="fb_login_protocol_scheme">fb_id_de_facebook</string>
  <string name="facebook_client_token">token_client_facebook</string>

</resources>

```

debes agregar el nombre del paquete de tu proyecto de flutter
debes extraer el SHA1 de tu proyecto, puedes ir

```xml
cd android
```

despues ejecutar

```xml
./gradlew signingReport
```

esto te dara el SHA1 de tu proyeto pero ojo!! este es de tu equipo + proyecto
si quieres compartir el codigo les dara diferentes SHA1
lo recomendable es generar una llave del proyecto
puede seguir la guia en https://docs.flutter.dev/deployment/android

despues de tener el SHA1 del proyecto con su llave dentro del proyecto
deben de convertir este SHA1 en base64

esto deben de registrar en el paso donde les pode insertar key hashes (28 caracteres)

con esto esta todo bien
