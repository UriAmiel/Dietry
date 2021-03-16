import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dietary/screens/config_menu_screen.dart';
import 'package:dietary/screens/welcome_screen.dart';
import 'package:dietary/screens/day_screen.dart';
import 'package:dietary/models/database.dart';
import 'package:dietary/services/notification_manger.dart';
import 'package:dietary/services/prefernces_manager.dart';
import 'package:dietary/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeNotificationPlugin();
  bool isConfiged = await getIsConfiged();
  isConfiged = isConfiged ?? false;
  return runApp(MyApp(
    isConfiged: isConfiged,
  ));
}

class MyApp extends StatelessWidget {
  final bool isConfiged;

  const MyApp({Key key, this.isConfiged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: isConfiged ? dayScreenRoute : welcomeScreenRoute,
        routes: {
          welcomeScreenRoute: (context) => WelcomeScreen(),
          configScreenRoute: (context) => ConfigMenuScreen(),
          dayScreenRoute: (context) => DayScreen(),
        },
      ),
      create: (BuildContext context) => AppDatabase(),
    );
  }
}
