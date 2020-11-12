import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zefiro_app/managers/recomendations_manager.dart';
import 'package:zefiro_app/screens/recomendations/components/recomendationCard.dart';

class RecomendationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecomendationsManager>(
      builder: (context, recomendationsManager, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            title: Text(
              'Minhas Recomendações',
              style: TextStyle(
                  color: Theme.of(context).accentColor, letterSpacing: 1),
            ),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          body: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  RecomendationCard(recomendationsManager.allRecomendations[0]),
                  RecomendationCard(recomendationsManager.allRecomendations[1]),
                  RecomendationCard(recomendationsManager.allRecomendations[2]),
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}
