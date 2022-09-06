import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salatuk/modules/home_screen/home_screen.dart';
import 'package:salatuk/shared/components/components.dart';
import 'package:salatuk/shared/cubit/cubit.dart';
import 'package:salatuk/shared/cubit/states.dart';

class SalatukHomeScreenLayout extends StatelessWidget {
  TabController? tabController;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppCubit.get(context).appBars[AppCubit.get(context).pageIndex],
            body: AppCubit.get(context).screens[AppCubit.get(context).pageIndex],
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 8.0,
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: kBottomNavigationBarHeight,
                child: Container(
                  decoration: BoxDecoration(
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
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.category), label: 'Category'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: ''),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.next_plan), label: 'Category'),
                    ],
                    onTap: (value){
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
                child: Icon(Icons.home),
                onPressed: () {
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
