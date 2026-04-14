import 'package:flutter/material.dart';
import 'diccionarioproducto.dart';

class VerProductos extends StatelessWidget {
  const VerProductos({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos la lista de productos del diccionario
    final productos = datosproducto.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Productos'),
      ),
      body: productos.isEmpty
          ? const Center(
              child: Text(
                'No hay productos registrados aún.',
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final prod = productos[index];
                return Card(
                  color: Colors.white10,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        prod.id.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    title: Text(
                      prod.nombre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          'Categoría: ${prod.categoria}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        Text(
                          'Descripción: ${prod.descripcion}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        Text(
                          'Stock: ${prod.stockDisponible}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    trailing: Text(
                      '\$${prod.precio.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
