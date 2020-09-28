import 'package:flutter/material.dart';
import 'package:zefiro_app/screens/home_screen/components/iqa_chart.dart';
import 'package:zefiro_app/screens/home_screen/components/localization.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zéfiro',
          style:
              TextStyle(color: Theme.of(context).accentColor, letterSpacing: 4),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Itens da home screen
            //Localização
            Localization(),
            IQAChart()
            //IQA
            //Grafico de histórico
            //Elementos respirando agora
            //Alerta de fumaça
          ],
        ),
      ),
    );
  }
}
