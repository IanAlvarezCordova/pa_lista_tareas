import 'package:flutter/material.dart';
import '../controller/tarea_controller.dart';
import '../model/tarea.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //logica
  //instancia de la clase TareaController
  final TareaController controller = TareaController();

  void agregarTarea() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController tareacontroller = TextEditingController();
        return AlertDialog(
          title: Text('Nueva_Tarea'),
          content: TextField(controller: tareacontroller),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  controller.agregarTarea(tareacontroller.text);
                });
                Navigator.pop(context);
              },
              child: Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  //diseno
  @override
  Widget build(BuildContext context) {
    //todo
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Tareas'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                SizedBox(height: 50),
                Icon(Icons.assignment, size: 80, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  "Realiza tus tareas",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tareas",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: controller.tareas.length,
              itemBuilder: (context, index) {
                Tarea tarea = controller.tareas[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CheckboxListTile(
                      title: Text(
                          tarea.titulo,
                          style: TextStyle(
                            decoration: tarea.completado ? TextDecoration.lineThrough : TextDecoration.none,
                          ),
                        ),
                      value: tarea.completado,
                      onChanged: (bool? valor) {
                        setState(() {
                          tarea.completado = valor ?? false;
                        });
                      },

                    ),

                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agregarTarea,
        child: Icon(Icons.add),
      ),
    );
  }
}
