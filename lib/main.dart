import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/view_features/splash/widgets/splash_screan.dart';

void main() async {
  runApp(const MyApp());
  // TagRepo tagRepo = TagRepo();
  // tagRepo.fetchAllTagsWithoutEmail();
  // tagRepo.fetchTagsWithEmail(tags: [2, 3]);
  // tagRepo.createTag("salah");
  // tagRepo.fetchTagsOfMail(mailId: 2);
  // StatusRepo statusRepo = StatusRepo();
  // statusRepo.fetchStatuses(withMail: false);
  // statusRepo.fetchOneStatusWithMails(1);
  // statusRepo.statusMailsCount(1);
  // CategoryRepo categoryRepo = CategoryRepo();
  // categoryRepo.fetchCategory(2);
  // categoryRepo.fetchCategoriesList();
  // categoryRepo.createCategory("name");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'home', home: SplashScreen());
    // return MultiProvider(
    //   providers: [
    //     // ChangeNotifierProvider<CategoryProvider>(
    //     //   create: (_) => CategoryProvider(),
    //     // ),
    //   ],
    //   child: const MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       title: 'home',
    //       home: SplashScreen()),
    // );
  }
}
