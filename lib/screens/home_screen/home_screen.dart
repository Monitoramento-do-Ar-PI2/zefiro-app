import 'package:flutter/material.dart';
import 'package:zefiro_app/managers/recomendations_manager.dart';
import 'package:zefiro_app/screens/home_screen/components/current_pollutants.dart';
import 'package:provider/provider.dart';
import 'package:zefiro_app/managers/air_pollutant_manager.dart';
import 'package:zefiro_app/screens/home_screen/components/iqa_chart.dart';
import 'package:zefiro_app/screens/home_screen/components/localization.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecomendationsManager recomendationsManager =
        context.watch<RecomendationsManager>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zéfiro',
          style:
              TextStyle(color: Theme.of(context).accentColor, letterSpacing: 4),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            color: Theme.of(context).primaryColorLight,
            onPressed: () {
              Navigator.of(context).pushNamed('/userForm');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            color: Theme.of(context).primaryColorLight,
            onPressed: () async {
              await recomendationsManager.requestRecomendations();
              Navigator.of(context).pushNamed('/recomendations');
            },
          )
        ],
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
                    airPollutantManager.requestCurrentPollutants();
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
