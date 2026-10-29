import 'package:flutter/material.dart';
import '../model/empleado_model.dart';

class EmpleadoViewmodel extends ChangeNotifier {
  String desempeno = 'Alto';

  void SeleccionarDesempeno(String valor) {
    desempeno = valor;
    notifyListeners();
  }

  // metodos
  EmpleadoModel calcular(double sueldo, int antiguedad) {
    //variable
    double porcentaje = 0;
    if (antiguedad >= 10 && desempeno == 'Alto') {
      porcentaje = 0.20;
    } else if (antiguedad >= 5) {
      porcentaje = 0.10;
    } else {
      porcentaje = 0.05;
    }
    double bono = sueldo * porcentaje;
    double sueldoFinal = sueldo + bono;

    return EmpleadoModel(
      sueldo: sueldo,
      antiguedad: antiguedad,
      desempeno: desempeno,
      porcentaje: porcentaje,
      bono: bono,
      sueldoFinal: sueldoFinal,
    );
  }
}
