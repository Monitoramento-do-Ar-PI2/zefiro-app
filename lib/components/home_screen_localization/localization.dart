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
                    if (userManager.loading ||
                        userManager.user?.address == null)
                      return Row(
                        children: [
                          Text(
                            'Localizando',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    Theme.of(context).primaryColorLight),
                                strokeWidth: 2,
                              ),
                            ),
                          )
                        ],
                      );
                    else
                      return Text(
                        userManager.user.address,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
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
