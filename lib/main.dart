import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zefiro_app/managers/user_manager.dart';
import 'package:zefiro_app/screens/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Zéfiro',
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 18, 18, 18),
          accentColor: Color.fromARGB(255, 82, 199, 217),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            default:
              return MaterialPageRoute(
                  builder: (_) => HomeScreen(), settings: settings);
          }
        },
      ),
    );
  }
}
