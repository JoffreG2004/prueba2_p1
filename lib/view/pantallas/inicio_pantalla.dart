import 'package:flutter/material.dart';

class InicioPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green.shade50,
              child: Icon(Icons.card_giftcard, size: 60, color: Colors.green.shade400),
            ),
            SizedBox(height: 30),
            Text(
              'Bono de un Empleado',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green.shade800),
            ),
            SizedBox(height: 15),
            Text(
              'Calcula el bono mensual de un trabajador según su sueldo, '
              'años de antigüedad y nivel de desempeño.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            SizedBox(height: 40),

            //boton para ir a la pantalla principal
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/principal'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade400,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('Comenzar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
