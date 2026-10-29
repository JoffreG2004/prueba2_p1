import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/empleado_viewmodel.dart';
import '../widgets/option_button.dart';
import '../widgets/campo_numero.dart';

class EmpleadoPantalla extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmpleadoPantallaState();
}

class _EmpleadoPantallaState extends State<EmpleadoPantalla> {

  final sueldoController = TextEditingController();
  final antiguedadController = TextEditingController();

  void mensaje(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(texto), backgroundColor: Colors.red.shade400),
    );
  }


  void calcular() {
    double? sueldo = double.tryParse(sueldoController.text);
    int? antiguedad = int.tryParse(antiguedadController.text);


    if (sueldo == null || sueldo <= 0) {
      mensaje('Ingrese un sueldo válido');
      return;
    }
    if (antiguedad == null || antiguedad < 0) {
      mensaje('Ingrese una antigüedad válida (años enteros)');
      return;
    }


    final vm = context.read<EmpleadoViewmodel>();
    final resultado = vm.calcular(sueldo, antiguedad);


    Navigator.pushNamed(context, '/resultado', arguments: resultado);
  }

  @override
  void dispose() {
    sueldoController.dispose();
    antiguedadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<EmpleadoViewmodel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bono del empleado', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CampoNumero(etiqueta: 'Sueldo', controller: sueldoController, icono: Icons.attach_money),
            SizedBox(height: 15),
            CampoNumero(etiqueta: 'Años de antigüedad', controller: antiguedadController, icono: Icons.calendar_month),
            SizedBox(height: 20),
            Text('Nivel de desempeño',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green.shade800)),
            SizedBox(height: 10),
            OptionButton(
                titulo: 'Alto',
                valor: 'Alto',
                seleccionado: vm.desempeno,
                onChanged: (valor) => vm.SeleccionarDesempeno(valor)),
            OptionButton(
                titulo: 'Medio',
                valor: 'Medio',
                seleccionado: vm.desempeno,
                onChanged: (valor) => vm.SeleccionarDesempeno(valor)),
            OptionButton(
                titulo: 'Bajo',
                valor: 'Bajo',
                seleccionado: vm.desempeno,
                onChanged: (valor) => vm.SeleccionarDesempeno(valor)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade400,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('Calcular', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
