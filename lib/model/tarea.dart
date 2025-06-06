class Tarea {
  String titulo;
  bool completado;

  Tarea(this.titulo, {this.completado= false});

  //serializacion
Map<String, dynamic> toJson() => {
  'titulo': titulo,
  'completado': completado,

};

//constructores de fabrica
factory Tarea.fromJson(Map<String, dynamic> json){
  return Tarea(
    json['titulo'],
     completado: json['completado']
  );
}

}



