import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salatuk/shared/cubit/cubit.dart';
import 'package:salatuk/shared/cubit/states.dart';

class SalatukHomeScreenLayout extends StatelessWidget {
  TabController? tabController;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDB(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppCubit.get(context)
                  .appBars[AppCubit.get(context).pageIndex],
              body: ConditionalBuilder(
                builder: (context) => 
              AppCubit.get(context)
                  .screens[AppCubit.get(context).pageIndex],
                  condition: AppCubit.get(context).allSalawat.isNotEmpty,
                  fallback: (context) => const Center(child: CircularProgressIndicator()),
              ),
              bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 8.0,
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: kBottomNavigationBarHeight,
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
                      currentIndex: AppCubit.get(context).pageIndex,
                      backgroundColor: Colors.blue,
                      selectedItemColor: Colors.white,
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.category), label: 'Category'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.next_plan), label: 'Category'),
                      ],
                      onTap: (value) {
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
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.home),
                  onPressed: () {
                    AppCubit.get(context).changePageIndex(1);
                    print(AppCubit.get(context).allSalawat[(AppCubit.get(context).allSalawat.length)-1]['fajr']);
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
