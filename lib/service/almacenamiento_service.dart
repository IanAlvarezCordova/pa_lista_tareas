import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/tarea.dart';

class ServicioAlmacenamiento {
  final String clave = 'tareas';

  //metodo para guardar tareas
  Future<void> guardarTareas(List<Tarea> tareas) async {
    final shared = await SharedPreferences.getInstance();
    final jsonTareas = tareas.map((e) => e.toJson()).toList();
    shared.setString(clave, jsonEncode(jsonTareas));
  }

  //metodo para cargar
  Future<List<Tarea>> cargar() async {
    final shared = await SharedPreferences.getInstance();
    final datos = shared.getString(clave);
    if (datos != null) {
      final List<dynamic> jsonTareas = jsonDecode(datos);
      return jsonTareas.map((e) => Tarea.fromJson(e)).toList();
    }
    return [];
  }
}
