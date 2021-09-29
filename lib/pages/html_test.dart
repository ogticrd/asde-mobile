import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlTest extends StatelessWidget {
  const HtmlTest({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Html(
          data: """
          <p>El alcalde Manuel Jiménez supervisó los trabajos de reacondicionamiento que se realizan en la estación 3, en Los Mameyes, donde serán ubicados los 25 camiones compactadores que llegarán al país, los cuales serán integrados al programa de recogida de desechos sólidos.<br />\n“Ya está casi listo, este espacio limpio y decente donde cabe adecuadamente la flotilla de camiones para la recogida de la basura en el municipio Santo Domingo Este, dijo el alcalde durante su acostumbrado recorrido de “La Ruta de los Sábados”.<br />\nEl recorrido también incluyó la supervisión de los trabajos de limpieza de la avenida El Faro, donde se ejecuta un programa de recuperación del área.<br />\n“Ya hemos organizado un acuerdo con el Ministerio de Cultura para que el Ayuntamiento pueda cuidar y dar el mantenimiento oportuno para que el Faro mantenga su esencia y belleza en la parte exterior”, aseguró el funcionario municipal.<br />\nDijo que los árboles que adornan esos espacios cuando crecen de manera desproporcionada, más que embellecer el lugar, se convierten en un problema si no se podan a tiempo.<br />\nEn los trabajos participa un equipo integrado por más de 90 hombres y mujeres de la Dirección de Ingeniería y Obras del Ayuntamiento, quienes trabajan en las áreas de ornato, poda, limpieza y acondicionamiento en distintos sectores del municipio.<br />\nEl periplo sabatino del alcalde también incluyó una visita al Proyecto de Remediación Ambiental y Manejo de Escombros, ubicado en la proximidad de la Base Aérea de San Isidro.</p>\n<p><img loading=\"lazy\" width=\"250\" height=\"187\" class=\"alignnone size-medium wp-image-7813\" src=\"https://ayuntamientosde.gob.do/wp-content/uploads/2021/09/WhatsApp-Image-2021-09-08-at-10.25.31-AM-250x187.jpeg\" alt=\"\" srcset=\"https://ayuntamientosde.gob.do/wp-content/uploads/2021/09/WhatsApp-Image-2021-09-08-at-10.25.31-AM-250x187.jpeg 250w, https://ayuntamientosde.gob.do/wp-content/uploads/2021/09/WhatsApp-Image-2021-09-08-at-10.25.31-AM-700x524.jpeg 700w, https://ayuntamientosde.gob.do/wp-content/uploads/2021/09/WhatsApp-Image-2021-09-08-at-10.25.31-AM-768x575.jpeg 768w, https://ayuntamientosde.gob.do/wp-content/uploads/2021/09/WhatsApp-Image-2021-09-08-at-10.25.31-AM-120x90.jpeg 120w, https://ayuntamientosde.gob.do/wp-content/uploads/2021/09/WhatsApp-Image-2021-09-08-at-10.25.31-AM.jpeg 1280w\" sizes=\"(max-width: 250px) 100vw, 250px\" /></p>\n<p>Santo Domingo Este, 7 de septiembre 2021</p>\n
          """     
        ),
      ),
    );
  }
}