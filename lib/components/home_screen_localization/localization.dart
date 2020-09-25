import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zefiro_app/managers/user_manager.dart';

class Localization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //navegar para mapa de seleção de estação
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 18, 0),
                child: Icon(
                  Icons.location_on,
                  color: Theme.of(context).primaryColorLight,
                  size: 28,
                ),
              ),
              Expanded(
                child: Consumer<UserManager>(
                  builder: (context, userManager, child) {
                    return Text(
                      '{$userManager.user.localization}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 16, 0),
                child: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColorLight,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
