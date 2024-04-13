import 'package:flutter/material.dart';
import 'package:my_portfolio/locator.dart';
import 'package:my_portfolio/ui/home_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await setupLocator();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      preferDesktop: true,
      builder:(_) => MaterialApp(
        title: 'Ganzorig Li | Dev',
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeView(),
        },
      ),
    );
  }
}

