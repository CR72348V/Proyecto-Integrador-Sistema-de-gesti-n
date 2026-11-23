
// CLASE USUARIO

class Usuario {
  int id;
  String nombre;
  String matricula;

  Usuario({
    required this.id,
    required this.nombre,
    required this.matricula,
  });

  void mostrarInfo() {
    print('--------------------------------');
    print('ID: $id');
    print('Nombre: $nombre');
    print('Matrícula: $matricula');
  }
}


