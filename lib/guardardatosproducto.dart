import 'claseproducto.dart';
import 'diccionarioproducto.dart';

class GuardarDatosProducto {
  static int _idActual = 1;

  static void guardar(
    String nombre,
    double precio,
    String categoria,
    String descripcion,
    int stockDisponible,
  ) {
    // Se inicializa el ID auto numérico
    // Se crea la instancia de Producto
    Producto nuevoProducto = Producto(
      id: _idActual,
      nombre: nombre,
      precio: precio,
      categoria: categoria,
      descripcion: descripcion,
      stockDisponible: stockDisponible,
    );

    // Conforme se vayan registrando se guarden en el diccionario
    // Modificar el archivo diccionarioproducto.dart nivel principiante
    datosproducto[_idActual] = nuevoProducto;
    
    // Incrementar el ID para el siguiente registro
    _idActual++;
  }
}
