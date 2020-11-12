import 'package:flutter/material.dart';
import 'package:zefiro_app/models/recomendations.dart';

class RecomendationCard extends StatelessWidget {
  RecomendationCard(this.recomendation);

  final Recomendations recomendation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context).accentColor),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${this.recomendation.text}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                    '${this.recomendation.dateTime.day}-${this.recomendation.dateTime.month}-${this.recomendation.dateTime.year}',
                    textAlign: TextAlign.end)
              ],
            ),
          )),
    );
  }
}
