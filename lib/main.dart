import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/view_features/home/providers/category_provider.dart';
import 'package:gsg_final_project_rgs/view_features/home/providers/status_provider.dart';
import 'package:gsg_final_project_rgs/view_features/home/providers/tags_provider.dart';
import 'package:gsg_final_project_rgs/view_features/search/search_provider.dart';
import 'package:gsg_final_project_rgs/view_features/splash/widgets/splash_screan.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());

  // StatusRepo statusRepo = StatusRepo();
  // statusRepo.fetchStatuses(withMail: false);
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
        ChangeNotifierProvider<SearchProvider>(
          create: (_) => SearchProvider(),
        ),
        ChangeNotifierProvider<StatusProvider>(
          create: (_) => StatusProvider(),
        ),
        ChangeNotifierProvider<TagsProvider>(
          create: (_) => TagsProvider(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'home',
          home: SplashScreen()),
    );
  }
}
