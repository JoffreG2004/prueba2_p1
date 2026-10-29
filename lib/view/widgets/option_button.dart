import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String titulo;
  final String valor;
  final String seleccionado;
  final Function(String) onChanged;

  const OptionButton({
    super.key,
    required this.titulo,
    required this.valor,
    required this.seleccionado,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioGroup<String>(
      groupValue: seleccionado,
      onChanged: (value) {
        if (value != null) onChanged(value);
      },
      child: RadioListTile<String>(
        title: Text(titulo),
        value: valor,
      ),
    );
  }
}
