import 'package:flutter/material.dart';

class CampoNumero extends StatelessWidget {
  final String etiqueta;
  final TextEditingController controller;
  final IconData? icono;

  const CampoNumero({
    super.key,
    required this.etiqueta,
    required this.controller,
    this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: etiqueta,
        prefixIcon: icono != null ? Icon(icono, color: Colors.green.shade400) : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
