import 'package:flutter/material.dart';
import '../controller/tarea_controller.dart';
import '../model/tarea.dart';


class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePageState();
}

class _HomePageState extends State<HomePages> {
  final TareaController controller = TareaController();

  void _agregarTarea() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController tareaCtrl = TextEditingController();
        return AlertDialog(
          title: const Text('Nueva tarea'),
          content: TextField(controller: tareaCtrl),
          actions: [
            TextButton(
              onPressed: () {
                if (tareaCtrl.text.isNotEmpty) {
                  setState(() {
                    controller.agregarTarea(tareaCtrl.text);
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  void _eliminarTarea(int index) {
    setState(() {
      controller.eliminarTarea(index);
    });
  }

  void _cambiarEstado(int index, bool completada) {
    setState(() {
      controller.cambiarEstado(index, completada);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(Icons.assignment, size: 80, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  "Completa tus tareas",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Tareas",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.tareas.length,
              itemBuilder: (context, index) {
                final tarea = controller.tareas[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: Checkbox(
                        value: tarea.completado,
                        onChanged: (valor) => _cambiarEstado(index, valor!),
                      ),
                      title: Text(
                        tarea.titulo,
                        style: TextStyle(
                          decoration: tarea.completado
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _eliminarTarea(index),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _agregarTarea,
        child: const Icon(Icons.add),
      ),
    );
  }
}