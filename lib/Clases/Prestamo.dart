// REGISTRO DE PRESTAMO DE UN LIBRO
import 'Libro.dart';
import 'Usuario.dart';

class Prestamo {
  int id;
  Libro libro;
  Usuario usuario;
  DateTime fechaPrestamo;
  DateTime? fechaDevolucion;

  Prestamo({
    required this.id,
    required this.libro,
    required this.usuario,
    required this.fechaPrestamo,
    this.fechaDevolucion,
  });

  bool get activo => fechaDevolucion == null;

  void mostrarInfo() {
    print('--------------------------------');
    print('Prestamo: $id');
    print('Libro: ${libro.titulo}');
    print('Usuario: ${usuario.nombre}');
    print('Fecha de prestamo: ${fechaPrestamo.toString().substring(0, 10)}');
    print('Estado: ${activo ? "Activo" : "Devuelto"}');
    if (fechaDevolucion != null) {
      print('Fecha de devolucion: ${fechaDevolucion!.toString().substring(0, 10)}');
    }
  }
}
