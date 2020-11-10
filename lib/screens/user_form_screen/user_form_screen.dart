import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zefiro_app/managers/user_manager.dart';

class UserFormScreen extends StatefulWidget {
  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  int age = 0;
  List<String> healthProblems = [
    'Asma',
    'Bronquite',
    'Teste',
    'Pneumonia',
    'Cardiopatia'
  ];
  List<String> userChoices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Minha Saúde',
          style:
              TextStyle(color: Theme.of(context).accentColor, letterSpacing: 2),
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 18, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Informe sua idade',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '$age',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Slider(
                value: this.age.toDouble(),
                min: 0,
                max: 100,
                divisions: 100,
                activeColor: Theme.of(context).accentColor,
                inactiveColor: Theme.of(context).primaryColorLight,
                onChanged: (double newAge) {
                  setState(() {
                    age = newAge.round();
                  });
                  print(age);
                },
                label: age.toString(),
              ),
            ),
            SizedBox(height: 18),
            Text(
              'Você possui algum problema de saúde ?',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            ChipsChoice.multiple(
                wrapped: true,
                value: userChoices,
                choiceActiveStyle: C2ChoiceStyle(
                    brightness: Brightness.dark,
                    color: Theme.of(context).primaryColor.withOpacity(0.8)),
                choiceStyle: C2ChoiceStyle(
                    brightness: Brightness.dark,
                    color: Theme.of(context).primaryColor.withOpacity(0.95),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                onChanged: (value) {
                  setState(() {
                    userChoices = value;
                  });
                  print(userChoices);
                },
                choiceItems: C2Choice.listFrom<String, String>(
                    source: healthProblems,
                    value: (i, v) => v,
                    label: (i, v) => v)),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<UserManager>(
                  builder: (context, userManager, child) {
                    return RaisedButton(
                      onPressed: () async {
                        await userManager.saveUserData(age, userChoices);
                        Navigator.of(context).pushNamed('/home');
                      },
                      color: Theme.of(context).accentColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (userManager.loading) ...[
                            SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    Theme.of(context).primaryColor),
                                strokeWidth: 2,
                              ),
                            ),
                          ] else ...[
                            Text(
                              'SALVAR',
                              style: TextStyle(
                                  letterSpacing: 4, color: Colors.black),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 18,
                            )
                          ]
                        ],
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
