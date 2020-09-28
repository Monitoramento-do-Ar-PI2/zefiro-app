import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:zefiro_app/managers/ait_pollutant_manager.dart';

class IQAChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final airPollutantManager = context.watch<AirPollutantManager>();
    final iqa = airPollutantManager.airPollutant.iqa;
    return Container(
      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 1,
        title: GaugeTitle(
            text: 'Índice de Qualidade do Ar',
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 400,
              showTicks: false,
              showLabels: false,
              canScaleToFit: true,
              isInversed: true,
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    verticalAlignment: GaugeAlignment.center,
                    positionFactor: 0,
                    horizontalAlignment: GaugeAlignment.center,
                    widget: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'IQAr',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                        ),
                        if (airPollutantManager.loading) ...[
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                                strokeWidth: 4,
                              ),
                            ),
                          )
                        ] else ...[
                          Text(
                            '${iqa.round()}',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            "Regular",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          )
                        ],
                      ],
                    ))
              ],
              pointers: <GaugePointer>[
                MarkerPointer(
                    value: airPollutantManager.airPollutant?.iqa == null
                        ? 400
                        : iqa, //valor
                    markerWidth: 20,
                    markerHeight: 20,
                    color: Colors.white,
                    markerType: MarkerType.triangle,
                    enableAnimation: true,
                    markerOffset: 10)
              ],
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: 40,
                    gradient: SweepGradient(
                        colors: <Color>[Colors.green, Colors.yellow],
                        stops: <double>[0.25, 1])),
                GaugeRange(startValue: 41, endValue: 100, color: Colors.yellow),
                GaugeRange(
                    startValue: 101,
                    endValue: 199,
                    gradient: SweepGradient(
                        colors: <Color>[Colors.yellow, Colors.orange],
                        stops: <double>[0.25, 0.75])),
                GaugeRange(
                    startValue: 200,
                    endValue: 299,
                    gradient: SweepGradient(
                        colors: <Color>[Colors.orange, Colors.red],
                        stops: <double>[0.25, 0.75])),
                GaugeRange(
                    startValue: 300,
                    endValue: 399,
                    gradient: SweepGradient(
                        colors: <Color>[Colors.red, Colors.purple],
                        stops: <double>[0.25, 0.75])),
                //tratar manualmente caso onde IQA >= 400
              ])
        ],
      ),
    );
  }
}
