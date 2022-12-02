import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/pages/screens/splash_screen.dart';
import 'package:roulette/resources/themes.dart';
import 'package:roulette/routes/routes.dart';
import 'package:roulette/services/firebase_registration_mathods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDBX25RHew1Z1Mkfzfzd1uYFRUDTx0lQ5s',
    appId: '1:826640622061:android:cdf0ce13e8884e9f72c7e4',
    messagingSenderId: '826640622061',
    projectId: 'roulette-flutter-e0229',
    storageBucket: 'roulette-flutter-e0229.appspot.com',
  ),);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseRegistrationMethods>(
          create: (_) => FirebaseRegistrationMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseRegistrationMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: AppThemes.light(),
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: AppRoutes.generateRoute,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
        },
      ),
    );
  }
}

