import 'package:flutter/material.dart';
import 'guardardatosproducto.dart';

class CapturaProductos extends StatefulWidget {
  const CapturaProductos({super.key});

  @override
  State<CapturaProductos> createState() => _CapturaProductosState();
}

class _CapturaProductosState extends State<CapturaProductos> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _precioCtrl = TextEditingController();
  final TextEditingController _categoriaCtrl = TextEditingController();
  final TextEditingController _descripcionCtrl = TextEditingController();
  final TextEditingController _stockCtrl = TextEditingController();

  void _guardarProducto() {
    if (_formKey.currentState!.validate()) {
      // Guardar usando el agente
      GuardarDatosProducto.guardar(
        _nombreCtrl.text,
        double.parse(_precioCtrl.text),
        _categoriaCtrl.text,
        _descripcionCtrl.text,
        int.parse(_stockCtrl.text),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Producto guardado exitosamente!'),
          backgroundColor: Colors.green,
        ),
      );

      // Limpiar los campos
      _nombreCtrl.clear();
      _precioCtrl.clear();
      _categoriaCtrl.clear();
      _descripcionCtrl.clear();
      _stockCtrl.clear();
    }
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _precioCtrl.dispose();
    _categoriaCtrl.dispose();
    _descripcionCtrl.dispose();
    _stockCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capturar Producto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Ingresa los datos del producto',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _nombreCtrl,
                label: 'Nombre del producto',
                icon: Icons.label,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _precioCtrl,
                label: 'Precio',
                icon: Icons.attach_money,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _categoriaCtrl,
                label: 'Categoría',
                icon: Icons.category,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _descripcionCtrl,
                label: 'Descripción',
                icon: Icons.description,
                maxLines: 3,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _stockCtrl,
                label: 'Stock Disponible',
                icon: Icons.inventory,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text(
                  'Guardar Datos',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: _guardarProducto,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.white70),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa $label';
        }
        return null;
      },
    );
  }
}
