import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math.dart' as vm;
import 'package:zefiro_app/managers/air_pollutant_manager.dart';
import 'dart:math';

import 'package:zefiro_app/screens/home_screen/components/animated_circle.dart';

class CurrentPollutants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final airPollutantManager = context.watch<AirPollutantManager>();
    final currentPollutants = airPollutantManager.airPollutant.currentPollutant;
    final mainCircleWidth = MediaQuery.of(context).size.width - 80;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 20),
          child: Text('O que estou respirando agora?',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.bold)),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: mainCircleWidth,
              height: mainCircleWidth,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 82, 199, 217).withOpacity(0.2)),
            ),
            if (currentPollutants == null ||
                airPollutantManager.currentPollutantsLoading) ...[
              Container()
            ] else ...[
              _buildButton(context, 0, mainCircleWidth,
                  pollutant: 'PTS',
                  value: double.parse(currentPollutants['PTS']),
                  pollutantMax: 876),
              _buildButton(context, 60, mainCircleWidth,
                  pollutant: 'PM10',
                  value: double.parse(currentPollutants['PM10']),
                  pollutantMax: 500),
              _buildButton(context, 120, mainCircleWidth,
                  pollutant: 'SO2',
                  value: double.parse(currentPollutants['SO2']),
                  pollutantMax: 2100),
              _buildButton(context, 180, mainCircleWidth,
                  pollutant: 'NO2',
                  value: double.parse(currentPollutants['NO2']),
                  pollutantMax: 3000),
              _buildButton(context, 240, mainCircleWidth,
                  pollutant: 'CO',
                  value: double.parse(currentPollutants['CO']),
                  pollutantMax: 40),
              _buildButton(context, 300, mainCircleWidth,
                  pollutant: 'O3',
                  value: double.parse(currentPollutants['O3']),
                  pollutantMax: 1000),
            ],
            AnimatedCircle(),
            SizedBox(
              width: mainCircleWidth / 6,
              height: mainCircleWidth / 6,
              child: FloatingActionButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.blur_on,
                      color: Colors.black,
                    )
                  ],
                ),
                backgroundColor: Theme.of(context).accentColor,
                onPressed: () =>
                    print('Pollutant Tap'), //update pollutants (request)
              ),
            ),
          ],
        ),
        Consumer<AirPollutantManager>(
          //Todo implementar manager para funcionar a logica dos botoes
          builder: (context, airPollutantManager, child) {
            if (airPollutantManager.selectedPollutant == null)
              return Container();
            else
              print("selected not null, buiding details");
            return _buildDetailedElementContainer(
                airPollutantManager.selectedPollutant,
                airPollutantManager.selectedPollutantValue);
          },
        ),
      ],
    );
  }

  _buildButton(BuildContext context, double angle, double mainCircleWidth,
      {String pollutant, double value, double pollutantMax}) {
    final airPollutantManager = context.watch<AirPollutantManager>();
    final size = (value / pollutantMax);
    final double rad = vm.radians(angle);
    return Transform.translate(
      offset: Offset(
        (mainCircleWidth / 3.2) * cos(rad),
        (mainCircleWidth / 3.2) * sin(rad),
      ),
      child: SizedBox(
        width: 50 + size * 40,
        height: 50 + size * 40,
        child: FloatingActionButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('$pollutant')],
          ),
          backgroundColor: Color.fromARGB(255, 82, 199, 217),
          onPressed: () {
            airPollutantManager.selectedPollutant = pollutant;
            airPollutantManager.selectedPollutantValue = value;
            print('Selected pollutant: ');
            print(airPollutantManager.selectedPollutant);
          },
        ),
      ),
    );
  }

  _buildDetailedElementContainer(String element, double value) {
    Map<String, String> elementNames = {
      'CO': 'Monóxido de Carbono',
      'NO2': 'Dióxido de Nitrogênio',
      'SO2': 'Dióxido de Enxofre',
      'O3': 'Ozônio',
      'PTS': 'Partículas Totais em Suspensão',
      'PM10': 'Partículas Inaláveis'
    };
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 82, 199, 217),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${elementNames[element]}',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "${value.round()} ppm",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
