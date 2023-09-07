import 'package:flutter/material.dart';
// import 'package:gsg_final_project_rgs/view_features/auth/widgets/testUi.dart';
// import 'package:gsg_final_project_rgs/view_features/home/categories/providers/Category_provider.dart';
import 'package:gsg_final_project_rgs/view_features/splash/widgets/splash_screan.dart';
// import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        // providers: [
        //   ChangeNotifierProvider<AuthProvider>(
        //     create: (_) => AuthProvider(),
        //   ),
        //   ChangeNotifierProvider<CategoryProvider>(
        //     create: (_) => CategoryProvider(),
        //   ),
        // ],
        // child: MaterialApp(
        MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'home',
      home: SplashScreen(),
      // routes: {
      //   SplashScreen.id: (context) => SplashScreen(),
      //   Hello.id: (context) => Hello(),
      // }
    );
    // );
  }
}
