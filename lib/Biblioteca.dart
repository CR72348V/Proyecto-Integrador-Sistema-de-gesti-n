
// SISTEMA DE BIBLIOTECA

import 'dart:io';
import 'package:estructura_de_datos_ejemplo/Clases/Libro.dart';
import 'package:estructura_de_datos_ejemplo/Clases/Usuario.dart';
import 'package:estructura_de_datos_ejemplo/Clases/Prestamo.dart';

class Biblioteca {
  List<Libro> libros = [];
  List<Usuario> usuarios = [];

  int siguienteIdLibro = 1;
  int siguienteIdUsuario = 1;
  int siguienteIdPrestamo = 1;
  List<Prestamo> prestamos = [];

  
  // REGISTRAR LIBRO
  void registrarLibro() {
    print('\n--- REGISTRAR LIBRO ---');

    stdout.write('Título: ');
    String titulo = stdin.readLineSync()!.trim();

    stdout.write('Autor: ');
    String autor = stdin.readLineSync()!.trim();

    stdout.write('Categoría: ');
    String categoria = stdin.readLineSync()!.trim();

    stdout.write('ISBN: ');
    String isbn = stdin.readLineSync()!.trim();

    if (titulo.isEmpty ||
        autor.isEmpty ||
        categoria.isEmpty ||
        isbn.isEmpty) {
      print('Error: Todos los campos son obligatorios.');
      return;
    }

    // Validar que el ISBN no esté registrado

    for (Libro libro in libros) {
      if (libro.isbn == isbn) {
        print('Error: Este ISBN ya está registrado.');
        return;
      }
    }

    Libro nuevoLibro = Libro(
      id: siguienteIdLibro,
      titulo: titulo,
      autor: autor,
      categoria: categoria,
      isbn: isbn,
    );

    libros.add(nuevoLibro);
    siguienteIdLibro++;

    print('Libro registrado correctamente.');
  }

  
  // REGISTRAR USUARIO
  void registrarUsuario() {
    print('\n--- REGISTRAR USUARIO ---');

    stdout.write('Nombre: ');
    String nombre = stdin.readLineSync()!.trim();

    stdout.write('Matrícula: ');
    String matricula = stdin.readLineSync()!.trim();

    if (nombre.isEmpty || matricula.isEmpty) {
      print('Error: Todos los campos son obligatorios.');
      return;
    }

    for (Usuario usuario in usuarios) {
      if (usuario.matricula == matricula) {
        print('Error: La matrícula ya está registrada.');
        return;
      }
    }

    Usuario nuevoUsuario = Usuario(
      id: siguienteIdUsuario,
      nombre: nombre,
      matricula: matricula,
    );

    usuarios.add(nuevoUsuario);
    siguienteIdUsuario++;

    print('Usuario registrado correctamente.');
  }

  // MOSTRAR CATÁLOGO
  void mostrarCatalogo() {
    print('\n--- CATÁLOGO DE LIBROS ---');

    if (libros.isEmpty) {
      print('No hay libros registrados.');
      return;
    }

    for (Libro libro in libros) {
      libro.mostrarInfo();
    }
  }

  // MOSTRAR USUARIOS
  void mostrarUsuarios() {
    print('\n--- LISTA DE USUARIOS ---');

    if (usuarios.isEmpty) {
      print('No hay usuarios registrados.');
      return;
    }

    for (Usuario usuario in usuarios) {
      usuario.mostrarInfo();
    }
  }

  // BUSQUEDA SECUENCIAL
  void buscarLibroSecuencial() {
    print('\n--- BÚSQUEDA SECUENCIAL ---');

    stdout.write('Ingresa el título del libro: ');
    String titulo = stdin.readLineSync()!.trim().toLowerCase();

    for (Libro libro in libros) {
      if (libro.titulo.toLowerCase() == titulo) {
        print('Libro encontrado:');
        libro.mostrarInfo();
        return;
      }
    }

    print('No se encontró el libro.');
  }

  // BUBBLE SORT Ordenar por título
  void ordenarBubbleSort() {
    print('\n--- ORDENAMIENTO BUBBLE SORT ---');

    if (libros.isEmpty) {
      print('No hay libros para ordenar.');
      return;
    }

    for (int i = 0; i < libros.length - 1; i++) {
      for (int j = 0; j < libros.length - 1 - i; j++) {
        if (libros[j].titulo.toLowerCase().compareTo(
              libros[j + 1].titulo.toLowerCase(),
            ) >
            0) {
          Libro temporal = libros[j];

          libros[j] = libros[j + 1];
          libros[j + 1] = temporal;
        }
      }
    }

    print('Libros ordenados por título.');
    mostrarCatalogo();
  }

  // INSERTION SORT Ordenar por autor
  void ordenarInsertionSort() {
    print('\n--- ORDENAMIENTO INSERTION SORT ---');

    if (libros.isEmpty) {
      print('No hay libros para ordenar.');
      return;
    }

    for (int i = 1; i < libros.length; i++) {
      Libro actual = libros[i];

      int j = i - 1;

      while (j >= 0 &&
          libros[j].autor.toLowerCase().compareTo(
                actual.autor.toLowerCase(),
              ) >
              0) {
        libros[j + 1] = libros[j];
        j--;
      }

      libros[j + 1] = actual;
    }

    print('Libros ordenados por autor.');
    mostrarCatalogo();
  }

  // BUSQUEDA BINARIA Por título

  void buscarLibroBinario() {
    print('\n--- BÚSQUEDA BINARIA ---');

    if (libros.isEmpty) {
      print('No hay libros registrados.');
      return;
    }

    // Primero ordenar por título
    ordenarListaPorTitulo();

    stdout.write('Ingresa el título del libro: ');
    String titulo = stdin.readLineSync()!.trim().toLowerCase();

    int izquierda = 0;
    int derecha = libros.length - 1;

    while (izquierda <= derecha) {
      int medio = (izquierda + derecha) ~/ 2;

      int comparacion = libros[medio].titulo
          .toLowerCase()
          .compareTo(titulo);

      if (comparacion == 0) {
        print('Libro encontrado:');
        libros[medio].mostrarInfo();
        return;
      } else if (comparacion < 0) {
        izquierda = medio + 1;
      } else {
        derecha = medio - 1;
      }
    }

    print('No se encontró el libro.');
  }

  // ORDENAR PARA BUSQUEDA BINARIA
  void ordenarListaPorTitulo() {
    for (int i = 0; i < libros.length - 1; i++) {
      for (int j = 0; j < libros.length - 1 - i; j++) {
        if (libros[j].titulo.toLowerCase().compareTo(
              libros[j + 1].titulo.toLowerCase(),
            ) >
            0) {
          Libro temporal = libros[j];

          libros[j] = libros[j + 1];
          libros[j + 1] = temporal;
        }
      }
    }
  }

  // ELIMINAR LIBRO
  void eliminarLibro() {
    print('\n--- ELIMINAR LIBRO ---');

    stdout.write('Ingresa el ID del libro: ');
    int? id = int.tryParse(stdin.readLineSync()!);

    if (id == null) {
      print('Error: ID inválido.');
      return;
    }

    for (int i = 0; i < libros.length; i++) {
      if (libros[i].id == id) {
        libros.removeAt(i);
        print('Libro eliminado correctamente.');
        return;
      }
    }

    print('No se encontró el libro.');
  }
}