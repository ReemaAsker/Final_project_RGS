import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/view/home/categories/models/category_response.dart';
import 'package:gsg_final_project_rgs/view/home/categories/providers/Category_provider.dart';
import 'package:provider/provider.dart';

import '../../../cores/helpers/api_response.dart';

class HomeView extends StatefulWidget {
  static const id = '/HomeView';
  const HomeView({
    super.key,
  });
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CategoryProvider>(
        builder: (_, categoryprovider, __) {
          print(categoryprovider.categories);

          if (categoryprovider.categories.status == Status.LOADING) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (categoryprovider.categories.status == Status.ERROR) {
            return Center(
              child: Text('${categoryprovider.categories.message}'),
            );
          }
          print(categoryprovider.categories.data?.length);
          return Center(
            child: ListView.builder(
              itemCount: categoryprovider.categories.data?.length,
              itemBuilder: (context, index) {
                Categories? Category = categoryprovider.categories.data?[index];
                return Text('${Category?.name}');
              },
            ),
          );
        },
      ),
    );
  }
}
