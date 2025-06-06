import 'package:flutter/material.dart';
import 'package:myapp/service/almacenamiento_service.dart';

import '../model/tarea.dart';

class TareaController extends ChangeNotifier {
  /* List <Tarea> tareas = [
    Tarea('Sacar la basura'),
    Tarea('Barrer la habitacion'),
    Tarea('Bañar al firulais')
  ]; */

  final ServicioAlmacenamiento almacenamiento = ServicioAlmacenamiento();

  List<Tarea> _tareas = [];

  //getter publico
  List<Tarea> get tareas => _tareas;

  //constructor
  TareaController() {
    _loadTareas();
  }
//
  void _loadTareas() async {
    _tareas = await almacenamiento.cargar();
    notifyListeners();
  }

  //metodo para agregar tarea
  void agregarTarea(String titulo) {
    tareas.add(Tarea(titulo));
    almacenamiento.guardarTareas(_tareas);
    notifyListeners();
  }

  
}
