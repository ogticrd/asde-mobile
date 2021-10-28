import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../main_drawer.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TÉRMINOS Y CONDICIONES",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Reglamento de la aplicación",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                """Los presentes términos de uso (en lo que sigue, los “Términos de Uso”) regulan los servicios del APP “Ciudad es de Todos (en lo que sigue, el “APP”) del organismo gubernamental “Ayuntamiento Santo Domingo Este” (en lo que sigue, “Organismo Gubernamental”), con su domicilio y oficina principal en la Carretera Mella # 49, Esq. San Vicente de Paúl, Santo Domingo Este, República Dominicana. El uso del APP le otorga la condición de usuario del APP (en lo que sigue, el “Usuario”) e implica la aceptación plena y sin reservas de todas y cada una de las disposiciones establecidas en los Términos de Uso y las Políticas publicadas por el Organismo Gubernamental al momento en que el Usuario acceda al APP. Por lo tanto, se hace necesario que el Usuario lea detenidamente estos términos en cada ocasión en que utilice el APP, ya que este puede sufrir modificaciones sin previo aviso.

1. A través del APP, el Organismo Gubernamental facilita a los Usuarios el acceso y el uso de los servicios, informaciones y contenidos (en lo que sigue, los “Servicios”) colocados a disposición por el Organismo Gubernamental o por terceros.

2. Condiciones de Accesibilidad y Uso del APP.

a. Carácter gratuito del acceso y uso del APP.- La prestación de los Servicios, de parte del Organismo Gubernamental, tiene carácter gratuito para el Usuario. Sin perjuicio de lo anterior, algunos de los Servicios suministrados por el Organismo Gubernamental a través del APP podrían estar sujetos al pago de una tasa la cual estaría establecida en el mismo.

b. Registro del Usuario.- De manera general, la prestación de los Servicios no exige la suscripción o registro previo de parte del Usuario.

c. Veracidad de la información.- Toda información facilitada al Usuario mediante los Servicios deberá ser veraz. Por esto, el Usuario se compromete a garantizar el carácter auténtico de los datos que provea a consecuencia de los requisitos de los formularios necesarios para la suscripción de los Servicios. De igual forma, será responsabilidad del Usuario mantener toda la información facilitada al Organismo Gubernamental debidamente actualizada de manera tal que responda, en cada momento, a la situación real del Usuario. En todo caso el Usuario será el único responsable de las informaciones falsas o inexactas que realice y de los perjuicios que pueda causar el Organismo Gubernamental o a terceros por la información que suministre.

d. Propiedad Intelectual.- Todo el contenido de este APP, ya sean textos, imágenes, recopilaciones, marcas, logotipos, combinaciones de colores, o cualquier otro elemento, su estructura y diseño, la selección y forma de presentación de los materiales incluidos en la misma, y los programas necesarios para su funcionamiento, acceso y uso, están protegidos por derechos de propiedad intelectual, de los cuales es titular el Organismo Gubernamental o de terceros licenciantes, que el Usuario de este APP debe respetar.

e. El Usuario del APP deberá abstenerse de suprimir, alterar, eludir o manipular cualquier dispositivo de protección o sistema de seguridad que pueda estar instalado en el mismo.

3. Protección de los datos personales.- Para utilizar algunos de los Servicios, el Usuario debe facilitar previamente al Organismo Gubernamental algunos datos de carácter personal (en lo que sigue, los “Datos Personales”).

a. El Organismo Gubernamental tratará de forma automática los Datos Personales con la finalidad y las condiciones, definidas en su Política de Privacidad. EL Organismo Gubernamental no garantiza la ausencia de virus ni de otros elementos en los Servicios prestados por terceros a través del APP que puedan causar alteraciones en el sistema informático del Usuario (software y hardware) o en los documentos electrónicos y/o bases de datos de su sistema informático.

b. EL Organismo Gubernamental ha adoptado los niveles de seguridad de protección que entiende necesarios y procura instalar los medios y medidas técnicas de protección que se vayan haciendo necesarias. Sin embargo, el Usuario debe estar consciente de que las medidas de seguridad en la Internet no son inviolables.

c. El Organismo Gubernamental puede utilizar cookies cuando un Usuario navega por los sitios y APP. Las cookies que se puedan usar en los sitios y APP se asocian únicamente con el navegador de un computador determinado (un Usuario anónimo), y no proporcionan en sí mismas el nombre y apellido del Usuario. Gracias a las “cookies”, resulta posible que el Organismo Gubernamental reconozca los navegadores de los Usuarios registrados (luego de que éstos se hayan registrado por primera vez), esto ayuda que no tengan que registrarse cada vez que visita las áreas y los Servicios reservados exclusivamente a ellos. Las “cookies” utilizadas no pueden leer archivos “cookie” creados por otros proveedores. El Usuario tiene la posibilidad de configurar su navegador para ser avisado en su pantalla de la recepción de “cookies” y para impedir la instalación de las mismas en el disco duro.

d. Para utilizar el APP no es indispensable la instalación de las “cookies” enviadas por el Organismo Gubernamental, sin perjuicio de que en tal caso puede ser necesario que el Usuario se registre cada vez que acceda a un Servicio que requiera un registro previo.
""",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
