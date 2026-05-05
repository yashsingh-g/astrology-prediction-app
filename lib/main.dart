import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:astro_predict/screens/splash_screen.dart';
import 'package:astro_predict/screens/home_screen.dart';
import 'package:astro_predict/screens/horoscope_screen.dart';
import 'package:astro_predict/screens/profile_screen.dart';
import 'package:astro_predict/providers/horoscope_provider.dart';
import 'package:astro_predict/utils/app_colors.dart';
import 'package:astro_predict/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initNotifications();
  runApp(const AstroPredictApp());
}

class AstroPredictApp extends StatelessWidget {
  const AstroPredictApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HoroscopeProvider()),
      ],
      child: MaterialApp(
        title: 'Astro Predict',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.primary,
          colorScheme: ColorScheme.dark(
            primary: AppColors.primary,
            secondary: AppColors.accent,
            surface: AppColors.cardBackground,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primary,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          textTheme: TextTheme(
            headlineLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headlineMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              color: Colors.white60,
            ),
          ),
        ),
        home: SplashScreen(),
        routes: {
          '/home': (context) => HomeScreen(),
          '/horoscope': (context) => HoroscopeScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}
