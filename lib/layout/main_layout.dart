import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salatuk/shared/cubit/cubit.dart';
import 'package:salatuk/shared/cubit/states.dart';
import '../shared/constants/constants.dart';

class SalatukHomeScreenLayout extends StatelessWidget {
  TabController? tabController;
  Color? unselectedItemColor = Colors.grey;
  Color selectedItemColor = AppColors.secondary;
  int pageIndex = 1;

  SalatukHomeScreenLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDB(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppCubit.get(context)
                  .appBars[AppCubit.get(context).pageIndex],
              body: ConditionalBuilder(
                builder: (context) => AppCubit.get(context)
                    .screens[AppCubit.get(context).pageIndex],
                condition: AppCubit.get(context).allSalawat.isNotEmpty,
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 5.0,
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 55.5,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey,
                          width: .5,
                        ),
                      ),
                    ),
                    child: BottomNavigationBar(
                      unselectedFontSize: 12,
                      selectedFontSize: 14,
                      currentIndex: AppCubit.get(context).pageIndex,
                      backgroundColor: Colors.white,
                      selectedItemColor: selectedItemColor,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      items: [
                        BottomNavigationBarItem(
                          icon: SizedBox(
                              height: 25,
                              child: Image.asset(
                                "assets/sebha.png",
                                color: pageIndex == 0
                                    ? selectedItemColor
                                    : unselectedItemColor,
                              )),
                          label: '',
                        ),
                        const BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: SizedBox(
                              height: 25,
                              child: Image.asset(
                                "assets/azkar.png",
                                color: pageIndex == 2
                                    ? selectedItemColor
                                    : unselectedItemColor,
                              )),
                          label: '',
                        ),
                      ],
                      onTap: (value) {
                        pageIndex = value;
                        AppCubit.get(context).changePageIndex(value);
                      },
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniCenterDocked,
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.home,
                    color: pageIndex == 1
                        ? selectedItemColor
                        : unselectedItemColor,
                  ),
                  onPressed: () {
                    pageIndex = 1;
                    AppCubit.get(context).changePageIndex(1);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
