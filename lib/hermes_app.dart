import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hermesapp/pages/initial_page.dart';

class HermesApp extends StatelessWidget {
  const HermesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme baseTextTheme = GoogleFonts.leagueSpartanTextTheme();
    final TextTheme customTextTheme = baseTextTheme.copyWith(
      displayLarge: baseTextTheme.displayLarge?.copyWith(color: const Color(0xFF06416A)),
      displayMedium: baseTextTheme.displayMedium?.copyWith(color: const Color(0xFF06416A)),
      displaySmall: baseTextTheme.displaySmall?.copyWith(color: const Color(0xFF06416A)),
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(color: const Color(0xFF06416A)),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(color: const Color(0xFF06416A)),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(color: const Color(0xFF06416A)),
      titleLarge: baseTextTheme.titleLarge?.copyWith(color: const Color(0xFF06416A)),
      titleMedium: baseTextTheme.titleMedium?.copyWith(color: const Color(0xFF06416A)),
      titleSmall: baseTextTheme.titleSmall?.copyWith(color: const Color(0xFF06416A)),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: const Color(0xFF06416A)),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: const Color(0xFF06416A)),
      bodySmall: baseTextTheme.bodySmall?.copyWith(color: const Color(0xFF06416A)),
      labelLarge: baseTextTheme.labelLarge?.copyWith(color: const Color(0xFF06416A)),
      labelMedium: baseTextTheme.labelMedium?.copyWith(color: const Color(0xFF06416A)),
      labelSmall: baseTextTheme.labelSmall?.copyWith(color: const Color(0xFF06416A)),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF06416A)),
        useMaterial3: true,
        textTheme: customTextTheme,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(fontFamily: 'LeagueScript', color: Color(0xFF06416A)),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontFamily: 'LeagueScript', color: Color(0xFF06416A)), 
          ),
        ),
        dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(fontFamily: 'LeagueScript', color: Color(0xFF06416A)), 
          contentTextStyle: TextStyle(fontFamily: 'LeagueScript', color: Color(0xFF06416A)),
        ),
      ),
      home: const InitialPage(),
    );
  }
}
