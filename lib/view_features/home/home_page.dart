import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:gsg_final_project_rgs/cores/helpers/token_helper.dart';
import 'package:gsg_final_project_rgs/custom_widgets/custom_snackbar.dart';
import 'package:gsg_final_project_rgs/view_features/auth/widgets/auth_screen.dart';
import 'package:gsg_final_project_rgs/view_features/home/providers/category_provider.dart';
import 'package:gsg_final_project_rgs/view_features/home/providers/status_provider.dart';
import 'package:gsg_final_project_rgs/view_features/home/providers/tags_provider.dart';
import 'package:gsg_final_project_rgs/view_features/home/widgets/category_list_view.dart';
import 'package:gsg_final_project_rgs/view_features/home/widgets/custom_text.dart';
import 'package:gsg_final_project_rgs/view_features/home/widgets/status_grid.dart';
import 'package:gsg_final_project_rgs/view_features/home/widgets/tag_list.dart';
import 'package:gsg_final_project_rgs/view_features/new_inbox/create_mail.dart';
import 'package:provider/provider.dart';

import '../../cores/helpers/api_response.dart';
import '../../cores/utils/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();
  // Map<int, Color> colors = {
  //   1: Colors.red,
  //   2: Colors.yellow,
  //   3: Colors.blue,
  //   4: Colors.green,
  // };

  // List statusList = ['Organization Name', 'k'];
  void logout() {
    if (removeUser()) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AuthScreen(),
          ));
    } else {
      My_snackBar.showSnackBar(context, "can't logout", Colors.red);
    }
  }

  @override
  void initState() {
    // CategoryProvider categoryProvider = CategoryProvider();
    // categoryProvider.categoryMails.status = DataStatus.LOADING;

    super.initState();
  }

  var myindex = 0;
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: kPrimaryColor,
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      drawer: _buildNavDrawer(),
      child: Scaffold(
        backgroundColor: kLightWhiteColor,
        body: Container(
          margin: const EdgeInsets.all(16),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  elevation: 0,
                  // Set padding and margin to zero
                  automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  stretch: true,
                  pinned: true,
                  backgroundColor: kLightWhiteColor,
                  title: _buildAppBar(
                    context,
                  )),
              SliverToBoxAdapter(child: Container()),
              SliverToBoxAdapter(
                child: Container(),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      elevation: 1,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8, left: 16, right: 16, top: 8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: kHintGreyColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CustomText('Search', 18, 'Poppins', kHintGreyColor,
                                FontWeight.w400),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      height: 250,
                      // color: Colors.red,
                      child: Consumer<StatusProvider>(
                        builder: (_, statusProvider, __) {
                          if (statusProvider.statusListWithMails.status ==
                              DataStatus.LOADING) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (statusProvider.statusListWithMails.status ==
                              DataStatus.ERROR) {
                            return Center(
                              child: Text(
                                  '${statusProvider.statusListWithMails.message}\n '),
                            );
                          }
                          print(
                              'count statuses: ${statusProvider.statusListWithMails.data?.length}');

                          return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: statusProvider
                                  .statusListWithMails.data?.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2 / 1.1,
                              ),
                              itemBuilder: (context, index) {
                                //colors[statusProvider
                                //                                     .statusListWithoutMails.data![index].id]!
                                return StatusTile(
                                    statusProvider
                                        .statusListWithMails.data![index],
                                    statusProvider.statusListWithMails
                                        .data![index].color!);
                              });
                        },
                      ),
                    ),

                    /// todo: Last try inshaallah
                    Container(
                      height: 400,
                      // color: Colors.blue,
                      child: Consumer<CategoryProvider>(
                          builder: (_, categoryProvider, __) {
                        return ListView.builder(
                            shrinkWrap: true,
                            //categoryProvider.categoryList.data!.length
                            itemCount: categoryProvider
                                .categoriesWithMailsAsContent.length,
                            itemBuilder: (context, index) {
                              // categoryProvider.fetchCategoryMails(index + 1);
                              // Provider.of<CategoryProvider>(context,
                              //         listen: false)
                              //     .fetchCategoryMails(index + 1);

                              if (categoryProvider.categoryUiStatus.isLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (categoryProvider.categoryUiStatus.isError) {
                                return Center(
                                  child: Text(
                                      '${categoryProvider.categoryUiStatus.errorMessage}'),
                                );
                              }

                              return CategoryListView(
                                  categoryModel:
                                      Provider.of<CategoryProvider>(context)
                                          .categoriesWithMailsAsContent[index]
                                          .category,
                                  mails: Provider.of<CategoryProvider>(context)
                                          .categoriesWithMailsAsContent[index]
                                          .mails ??
                                      []);
                            });
                      }),
                    ),
                    Consumer<TagsProvider>(
                      builder: (_, tagProvider, __) {
                        if (tagProvider.allTagsList.status ==
                            DataStatus.LOADING) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (tagProvider.allTagsList.status ==
                            DataStatus.ERROR) {
                          return Center(
                            child: Text('${tagProvider.allTagsList..message}'),
                          );
                        }

                        return Visibility(
                            // tagProvider.allTagsList.data!.isNotEmpty
                            //
                            visible: tagProvider.allTagsList.data!.isNotEmpty,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: CustomText('Tags', 20, 'Poppins',
                                      kBlackColor, FontWeight.w600),
                                ),
                                TagGridList(
                                    tags: tagProvider.allTagsList.data!),
                              ],
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavBar(context),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _handleMenuButtonPressed,
          icon: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: _advancedDrawerController,
            builder: (_, value, __) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Container(
                  key: ValueKey<bool>(value.visible),
                  child: value.visible
                      ? IconButton(onPressed: () {}, icon: Icon(Icons.add))
                      : IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                ),
              );
            },
          ),
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: PopUpMenu(
            menuList: _buildMenuList(context),
            icon: const CircleAvatar(
              radius: 23,
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }

  List<PopupMenuEntry<dynamic>> _buildMenuList(BuildContext context) {
    return [
      const PopupMenuItem(
          child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: CircleAvatar(
            radius: 45.0,
            backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
            backgroundColor: Colors.transparent,
          ),
        ),
      )),
      PopupMenuItem(
        textStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: 'Poppins',
            color: kBlackColor),
        child: Center(child: Text('${getToken()!.user!.name}')),
      ),
      const PopupMenuItem(
        textStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: 'Poppins',
            color: kLightBlackColor),
        child: Center(child: Text('Admin')),
      ),
      const PopupMenuDivider(),
      const PopupMenuItem(
          child: ListTile(
        leading: Icon(Icons.language),
        title: Text(
          'Switch to English',
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              color: kLightBlackColor,
              fontWeight: FontWeight.w400),
        ),
      )),
      PopupMenuItem(
          onTap: () {
            logout();
          },
          child: const ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'logout',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  color: kLightBlackColor,
                  fontWeight: FontWeight.w400),
            ),
          )),
    ];
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getToken();
        showModalBottomSheet<void>(
            isScrollControlled: true,
            backgroundColor: kLightWhiteColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            context: context,
            builder: (BuildContext context) {
              // return NewInboxPage();
              return NewInboxPage();
            });
      },
      child: Container(
        height: 57,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: kNavBottomColor, width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundColor: kLightPrimaryColor,
                  radius: 13,
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.add))
                  //   Image(
                  //     image: AssetImage('assets/add.png'),
                  //   ),
                  ),
              const SizedBox(
                width: 5,
              ),
              CustomText('New Inbox', 18, 'Poppins', kLightPrimaryColor,
                  FontWeight.w600),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavDrawer() {
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildDrawerHeader(),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.home),
                title: const Text(
                  'Home',
                  style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.account_circle_rounded),
                title: const Text('Profile',
                    style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.language),
                title: const Text('Language',
                    style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.logout),
                title: const Text('Logout',
                    style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.people_rounded),
                title: const Text('Sender',
                    style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings),
                title: const Text('Settings',
                    style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      width: 128,
      height: 128,
      margin: const EdgeInsets.only(
        top: 24,
        bottom: 64,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.black26,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        'assets/logoone.png',
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

class PopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const PopUpMenu({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}
///////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:gsg_final_project_rgs/view/home/categories/providers/Category_provider.dart';
// import 'package:provider/provider.dart';
//
// import '../../../cores/helpers/api_response.dart';
//
// class HomeView extends StatefulWidget {
//   static const id = '/HomeView';
//   const HomeView({
//     super.key,
//   });
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
// @override
// void initState() {
//   super.initState();
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Consumer<CategoryProvider>(
//       builder: (_, categoryprovider, __) {
//         print(categoryprovider.categories);
//
//         if (categoryprovider.categories.status == Status.LOADING) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (categoryprovider.categories.status == Status.ERROR) {
//           return Center(
//             child: Text('${categoryprovider.categories.message}'),
//           );
//         }
//         print(categoryprovider.categories.data?.length);
//         return Center(
//           child: ListView.builder(
//             itemCount: categoryprovider.categories.data?.length,
//             itemBuilder: (context, index) {
//               Catigory? category = categoryprovider.categories.data?[index];
//               return Text('${category?.name}');
//             },
//           ),
//         );
//       },
//     ),
//   );
// }
// }
