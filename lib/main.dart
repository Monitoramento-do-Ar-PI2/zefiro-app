import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zefiro_app/managers/air_pollutant_manager.dart';
import 'package:zefiro_app/managers/user_manager.dart';
import 'package:zefiro_app/screens/home_screen/home_screen.dart';
import 'package:zefiro_app/notification.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ),
        ChangeNotifierProvider(
          create: (_) => AirPollutantManager(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Zéfiro',
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 18, 18, 18),
          accentColor: Color.fromARGB(255, 82, 199, 217),
          primaryColorLight: Color.fromARGB(255, 151, 151, 151),
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
        home: Scaffold(
          body: MessageHandler(),
        ),
      ),
    );
  }
}


