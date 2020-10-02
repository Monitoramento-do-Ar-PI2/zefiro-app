import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vm;
import 'dart:math';

import 'package:zefiro_app/screens/home_screen/components/animated_circle.dart';

class CurrentPollutants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainCircleWidth = MediaQuery.of(context).size.width - 80;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: mainCircleWidth,
          height: mainCircleWidth,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 82, 199, 217).withOpacity(0.2)),
        ),
        _buildButton(0, mainCircleWidth,
            pollutant: 'PTS', value: 876, pollutantMax: 876),
        _buildButton(60, mainCircleWidth,
            pollutant: 'PM10', value: 500, pollutantMax: 500),
        _buildButton(120, mainCircleWidth,
            pollutant: 'SO2', value: 2100, pollutantMax: 2100),
        _buildButton(180, mainCircleWidth,
            pollutant: 'NO2', value: 3000, pollutantMax: 3000),
        _buildButton(240, mainCircleWidth,
            pollutant: 'CO', value: 40, pollutantMax: 40),
        _buildButton(300, mainCircleWidth,
            pollutant: 'O3', value: 1000, pollutantMax: 1000),
        //Circulo central animado
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
            onPressed: () => print('Pollutant Tap'),
          ),
        ),
      ],
    );
  }

  _buildButton(double angle, double mainCircleWidth,
      {String pollutant, double value, double pollutantMax}) {
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
          onPressed: () => print('Pollutant Tap'),
        ),
      ),
    );
  }
}
