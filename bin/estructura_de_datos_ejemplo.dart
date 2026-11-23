import 'dart:io';
import 'package:estructura_de_datos_ejemplo/Biblioteca.dart';

// MENU PRINCIPAL
void main() {
  Biblioteca biblioteca = Biblioteca();

  int opcion = 0;

  do {
    print('\n--------------------------------');
    print(' SISTEMA DE BIBLIOTECA DIGITAL');
    print('--------------------------------');
    print('1. Registrar libro');
    print('2. Registrar usuario');
    print('3. Mostrar catálogo');
    print('4. Mostrar usuarios');
    print('5. Buscar libro (secuencial)');
    print('6. Buscar libro (binaria)');
    print('7. Ordenar libros por título (Bubble Sort)');
    print('8. Ordenar libros por autor (Insertion Sort)');
    print('9. Eliminar libro');
    print('10. Salir');

    stdout.write('Selecciona una opción: ');

    opcion = int.tryParse(stdin.readLineSync()!) ?? 0;

    switch (opcion) {
      case 1:
        biblioteca.registrarLibro();
        break;

      case 2:
        biblioteca.registrarUsuario();
        break;

      case 3:
        biblioteca.mostrarCatalogo();
        break;

      case 4:
        biblioteca.mostrarUsuarios();
        break;

      case 5:
        biblioteca.buscarLibroSecuencial();
        break;

      case 6:
        biblioteca.buscarLibroBinario();
        break;

      case 7:
        biblioteca.ordenarBubbleSort();
        break;

      case 8:
        biblioteca.ordenarInsertionSort();
        break;

      case 9:
        biblioteca.eliminarLibro();
        break;

      case 10:
        print('Saliendo del sistema...');
        break;

      default:
        print('Opción inválida.');
    }
  } while (opcion != 10);
}

