import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:salatuk/modules/azkar_screen/azkar_screen.dart';
import 'package:salatuk/modules/home_screen/home_screen.dart';
import 'package:salatuk/modules/sebha_screen/sebha_screen.dart';
import 'package:salatuk/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/salawat_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int pageIndex = 1;
  static TabBar get _tabBar => TabBar(
        tabs: [
          Tab(
            text: "تحدي ال30 يوماً",
          ),
          Tab(
            text: "صلوات في أوقاتها",
          ),
        ],
      );
  List<AppBar> appBars = [
    AppBar(
      title: Text(
        "Test",
      ),
      centerTitle: true,
    ),
    AppBar(
      elevation: 0,
      title: Text(
        "إلا صلاتي",
      ),
      bottom: PreferredSize(
        preferredSize: _tabBar.preferredSize,
        child: Material(
          color: Colors.cyan, //<-- SEE HERE
          child: _tabBar,
        ),
      ),
      centerTitle: true,
    ),
    AppBar(
      title: Text(
        "Test",
      ),
      centerTitle: true,
    ),
  ];
  List<Widget> screens = [
    AzkarScreen(),
    HomeScreen(),
    SebhaScreen(),
  ];
  void changePageIndex(int index) {
    pageIndex = index;
    emit(AppChangeNavBarState());
  }
  List<Salawat> salawat = [
    Salawat(status: 1, salah: "الفجر"),
    Salawat(status: 1, salah: "الظهر"),
    Salawat(status: 1, salah: "العصر"),
    Salawat(status: 1, salah: "المغرب"),
    Salawat(status: 1, salah: "العشاء"),
  ];
  void changeSalahStatus(Salawat salah,status){
    salah.status =status;
    emit(AppChangeSalahState());
  }
}
