import 'package:flutter/material.dart';
import 'package:zefiro_app/screens/home_screen/components/current_pollutants.dart';
import 'package:provider/provider.dart';
import 'package:zefiro_app/managers/ait_pollutant_manager.dart';
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
            //IQA
            IQAChart(),
            //Grafico de histórico
            //Elementos respirando agora
            CurrentPollutants(),
            //AnimatedCircle()
            //Alerta de fumaça
            //Request test button
            Consumer<AirPollutantManager>(
              builder: (context, airPollutantManager, child) {
                return RaisedButton(
                  child: Text('Fake Request'),
                  onPressed: () {
                    airPollutantManager.requestCurrentIQA();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
