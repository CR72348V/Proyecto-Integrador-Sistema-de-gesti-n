// CLASE LIBRO
class Libro {
  int id;
  String titulo;
  String autor;
  String categoria;
  String isbn;
  bool disponible;

  Libro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.categoria,
    required this.isbn,
    this.disponible = true,
  });

  void mostrarInfo() {
    print('--------------------------------');
    print('ID: $id');
    print('Título: $titulo');
    print('Autor: $autor');
    print('Categoría: $categoria');
    print('ISBN: $isbn');
    print('Estado: ${disponible ? "Disponible" : "Prestado"}');
  }
}