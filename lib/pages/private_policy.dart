import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../main_drawer.dart';

class PrivatePolicyPage extends StatelessWidget {
  const PrivatePolicyPage({Key? key}) : super(key: key);

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
                "POLÍTICA DE PRIVACIDAD",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Uso de la información de los usuarios",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                """
Estas Políticas (en adelante, las “Políticas”) condicionan el uso de los servicios del Portal de Internet «http://ayuntamientosde.gob.do/” (en adelante, el “Portal”) del organismo gubernamental “Ayuntamiento Santo Domingo Este” (en lo que sigue, “Organismo Gubernamental”), con su domicilio y oficina principal en la Carretera Mella # 49, Esq. San Vicente de Paúl, Santo Domingo Este, República Dominicana

1.

a. Menores de edad.- Para hacer uso de los Servicios que requieran la recopilación de Datos Personales por parte del Organismo Gubernamental através del Portal, los menores de edad deben obtener permiso previo por parte de sus padres, tutores o representantes legales, quienes serán considerados responsables de todos los actos realizados por los menores dispuestos a su cargo.

b. Obligación de hacer un uso correcto del Portal y de los Servicios.- El Usuario se compromete a utilizar el Portal y los Servicios de conformidad con la ley, las presentes Políticas, los Términos de Uso, las Condiciones Particulares de ciertos Servicios y demás avisos e instrucciones puestos en su conocimiento, así como el orden público, la moral y las buenas costumbres generalmente aceptadas.

c. El Usuario deberá abstenerse de obtener e incluso de intentar obtener los Contenidos empleando para ello medios o procedimientos distintos de los que, según los casos, se hayan puesto a su disposición al efecto o se hayan indicado en las páginas Web donde se encuentren los contenidos o, en general, de los que se empleen habitualmente en la Internet, siempre que no entrañen un riesgo de daño o inutilización del Portal, de los Servicios y/o de los contenidos.

d. El Usuario o terceros perjudicados por la recepción de mensajes no solicitados dirigidos a una pluralidad de personas podrán comunicárselo al Organismo Gubernamental remitiendo un mensaje a la siguiente dirección de correo electrónico: info@asde.gov.do

2. No Licencia.
a. Todas las marcas, nombres comerciales o signos distintivos de cualquier clase que aparecen en el Portal son propiedad del Organismo Gubernamental o de terceros, sin que pueda entenderse que el uso o acceso al Portal y/o a los Servicios atribuya al Usuario derecho alguno sobre los citados signos distintivos.

b. Así mismo, los Contenidos son propiedad intelectual del Organismo Gubernamental o de terceros, sin que puedan entenderse cedidos al Usuario, en virtud de lo establecido en estas Políticas, ninguno de los derechos de explotación que existen o puedan existir sobre dichos contenidos más allá de lo estrictamente necesario para el correcto uso del Portal y de los Servicios, es decir, el Usuario podrá consultar, copiar y almacenar en el disco duro de su computadora o en cualquier otro soporte físico, imprimir o reproducir el material disponible en esta página Web, exclusivamente para su uso personal o privado, o el que se realice dentro de su empresa u organización, haciendo mención en todo momento de la propiedad que sobre éste posee el Organismo Gubernamental, quedando terminantemente prohibido realizar alteraciones, modificaciones o des compilación de su contenido.

c. Queda estrictamente prohibida la comercialización en cualquier forma y bajo cualquier título del material contenido en este sitio, sin contar con la previa autorización por escrito del Organismo Gubernamental. Este portal podrá contener información proveniente de otras fuentes, por lo que en estos casos, se deberá requerir el consentimiento de ellas para su reproducción.

3. Exclusión de garantías y de responsabilidad.
a. Disponibilidad y continuidad, utilidad y falibilidad.- El Organismo Gubernamental no garantiza la disponibilidad y continuidad del funcionamiento del Portal y de los Servicios. Cuando ello sea razonablemente posible, el Organismo Gubernamental advertirá previamente de las interrupciones en el funcionamiento del Portal y de los Servicios. El Organismo Gubernamental tampoco garantiza la utilidad del Portal y de los Servicios para la realización de ninguna actividad en concreto, ni su infalibilidad y, en particular, aunque no de modo excluyente, que el Usuario pueda efectivamente utilizar el Portal y los Servicios, acceder a las distintas páginas Web que forman el Portal o a aquellas desde las que se prestan los Servicios.

b. EL ORGANISMO GUBERNAMENTAL EXCLUYE CUALQUIER RESPONSABILIDAD POR DAÑOS Y PERJUICIOS DE TODA NATURALEZA QUE PUEDAN DEBERSE A LA FALTA DE DISPONIBILIDAD O DE CONTINUIDAD DEL FUNCIONAMIENTO DEL PORTAL Y DE LOS SERVICIOS, A LA DEFRAUDACIÓN DE LA UTILIDAD QUE EL USUARIO HUBIERE PODIDO ATRIBUIR AL PORTAL Y/O A LOS SERVICIOS, A LA FALIBILIDAD DEL PORTAL Y/O DE LOS SERVICIOS, Y EN PARTICULAR, AUNQUE NO DE MODO EXCLUYENTE, A LOS FALLOS EN EL ACCESO A LAS DISTINTAS PÁGINAS WEB DEL PORTAL O A AQUELLAS DESDE LAS QUE SE PRESTAN LOS SERVICIOS.

c. Privacidad y seguridad en la utilización del Portal y de los Servicios.- El Organismo Gubernamental no garantiza la privacidad y seguridad de la utilización del Portal y de los Servicios y, en particular, no garantiza que terceros no autorizados no puedan tener conocimiento de la clase, condiciones, características y circunstancias del uso que el Usuario hacen del Portal y de los Servicios.

d. El Organismo Gubernamental no controla ni garantiza la ausencia de virus ni de otros elementos en los Contenidos que puedan producir alteraciones en su sistema informático (software y hardware) o en los documentos electrónicos y ficheros almacenados en su sistema informático.

e. Veracidad, exactitud y actualidad.- EL AYUNTAMIENTO SANTO DOMINGO ESTE EXCLUYE CUALQUIER RESPONSABILIDAD POR LOS DAÑOS Y PERJUICIOS DE TODA NATURALEZA QUE PUEDAN GENERARSE POR LA FALTA DE VERACIDAD, EXACTITUD Y/O ACTUALIDAD DE LOS CONTENIDOS.

f. Licitud, fiabilidad y utilidad.- El Organismo Gubernamental no garantiza la licitud, fiabilidad y utilidad de los servicios prestados por terceros a través del Portal. EL AYUNTAMIENTO SANTO DOMINGO ESTE EXCLUYE CUALQUIER RESPONSABILIDAD POR LOS DAÑOS Y PERJUICIOS DE TODA NATURALEZA QUE PUEDAN GENERARSE POR LOS SERVICIOS PRESTADOS POR TERCEROS A TRAVÉS DEL APP.

4. Procedimiento en caso de realización de actividades de carácter ilícito.
a. En el caso de que cualquier Usuario o un tercero considere que existen hechos o circunstancias que revelen el carácter ilícito de la utilización de cualquier contenido y/o de la realización de cualquier actividad en las páginas Web incluidas o accesibles a través del Portal, y, en particular, de la violación de derechos de propiedad intelectual u otros derechos, deberá enviar una notificación al Organismo Gubernamental en la que se exprese lo siguiente:

1. Datos personales del reclamante: nombre, número de cédula (o pasaporte, en caso de extranjeros), dirección, número de teléfono y dirección de correo electrónico;

2. Especificación de la supuesta actividad ilícita llevada a cabo en el Portal y, en particular, cuando se trate de una supuesta violación de derechos, indicación precisa y concreta de los contenidos protegidos así como de su localización en las páginas Web;

3. Hechos o circunstancias que revelan el carácter ilícito de dicha actividad;

4. En el supuesto de violación de derechos, firma manuscrita o equivalente, con los Datos Personales del titular de los derechos supuestamente infringidos o de la persona autorizada para actuar en nombre y por cuenta de ésta;

5. Declaración expresa, clara y bajo la responsabilidad del reclamante de que la información proporcionada en la notificación es exacta y del carácter ilícito de la utilización de los contenidos o de la realización de las actividades descritas.

b.
1. Todas las notificaciones y comunicaciones (en adelante, las “Notificaciones”) por parte del Usuario al Organismo Gubernamental se considerarán eficaces, a todos los efectos, cuando se nos envíen por mensajería a la siguiente dirección: Carretera Mella # 49, Esq. San Vicente de Paúl, Santo Domingo Este, República Dominicana.

a. Legislación aplicable.
Las Presentes Políticas se rige en todas y cada una de sus partes por las leyes de la República Dominicana.

b. Jurisdicción.
El Organismo Gubernamental y el Usuario, con renuncia tácita a cualquier otro fuero, se someten al de los tribunales de la República Dominicana. Para cualquier sugerencia o propuesta de colaboración escríbanos a nuestro correo electrónico info@asde.gov.do. Esta dirección de correo electrónico está siendo protegida de \”spam bots\”, necesita habilitar Javascript para poder verla, o llámenos al siguiente número de teléfono: (809) 788-7676.
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
