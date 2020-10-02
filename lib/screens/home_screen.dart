import 'package:flutter/material.dart';
import 'package:zefiro_app/components/home_screen_localization/localization.dart';
import 'package:zefiro_app/screens/home_screen/components/current_pollutants.dart';

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
            //IQA
            //Grafico de histórico
            //Elementos respirando agora
            CurrentPollutants()
            //AnimatedCircle()
            //Alerta de fumaça
          ],
        ),
      ),
    );
  }
}
