import 'package:flutter/material.dart';
import 'package:travel_ui/app/presentation/ui/screens/onboarding_screen.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel UI',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'poppins',
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const OnboardingScreen(),
      ),
    );
  }
}
