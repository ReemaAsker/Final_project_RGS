import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/view/home/categories/home_view.dart';
import 'package:gsg_final_project_rgs/view/home/categories/providers/Category_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, title: 'home', home: HomeView()),
    );
  }
}
