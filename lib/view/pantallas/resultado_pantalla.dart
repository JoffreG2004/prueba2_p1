import 'package:flutter/material.dart';
import '../../model/empleado_model.dart';

class ResultadoPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final empleado = ModalRoute.of(context)!.settings.arguments as EmpleadoModel;

    Widget dato(String titulo, String valor) {
      return ListTile(
        title: Text(titulo, style: TextStyle(color: Colors.grey.shade700)),
        trailing: Text(valor,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green.shade800)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.green.shade50,
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  dato('Sueldo', '\$${empleado.sueldo.toStringAsFixed(2)}'),
                  dato('Antigüedad', '${empleado.antiguedad} años'),
                  dato('Desempeño', empleado.desempeno),
                  dato('Porcentaje de bono', '${(empleado.porcentaje * 100).toStringAsFixed(0)}%'),
                  dato('Valor del bono', '\$${empleado.bono.toStringAsFixed(2)}'),
                ],
              ),
            ),
            SizedBox(height: 20),


            Card(
              color: Colors.green.shade400,
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('Sueldo final', style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(height: 5),
                    Text('\$${empleado.sueldoFinal.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
            ),


            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade400,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('Regresar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
