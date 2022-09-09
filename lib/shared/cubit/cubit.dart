import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:salatuk/modules/azkar_screen/azkar_screen.dart';
import 'package:salatuk/modules/home_screen/home_screen.dart';
import 'package:salatuk/modules/sebha_screen/sebha_screen.dart';
import 'package:salatuk/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/salawat_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int pageIndex = 1;
  late Database db;
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
  //db.rawQuery('SELECT * FROM Salawat WHERE id=(SELECT max(id) FROM Salawat)')
  void changeSalahStatus(Salawat salah, status) {
    salah.status = status;
    emit(AppChangeSalahState());
  }

  void createDB() {
    openDatabase(
      'salatuk.db',
      version: 1,
      onCreate: (Database db, int version) {
        // When creating the db, create the table
        db
            .execute(
                'CREATE TABLE Salawat (id INTEGER PRIMARY KEY,date TEXT , fajr INTEGER, zuhr INTEGER, asr INTEGER, maghrib INTEGER, isha INTEGER)')
            .then((value) {
          print("Salawat Table Created");
          emit(AppCreateDataBaseState());
        });
      },
      onOpen: (db) {
        getDataFromDB(db);
        print("DB Opened");
      },
    ).then(
      (value) {
        db = value;
      },
    );
  }

  List<Map> allSalawat = [];

  void getDataFromDB(db) {
    emit(AppGetDatabaseLoadingState());
    db.rawQuery('SELECT * FROM Salawat').then((value) {
      if (value.isEmpty) {
        DateTime date = DateTime.now();
        date = date.subtract(Duration(days: 6));
        for (var i = 0; i < 7; i++) {
          insertDB(date: dateFormat(unformatted_date: date.toString()));
          date = date.add(const Duration(days: 1));
        }
      }
      allSalawat = value;
      print(allSalawat);
      db.rawQuery('SELECT * FROM Salawat WHERE id=(SELECT max(id)-1 FROM Salawat)').then((value){
        print(value);
      });
      emit(AppGetDataFromDatabaseState());
    });
  }

  String dateFormat({required String unformatted_date}) {
    int day = int.parse(unformatted_date.substring(8, 10));
    //String day = unformatted_date.substring(8, 10);
    String monthNum = unformatted_date.substring(5, 7);
    late String monthName;
    switch (monthNum) {
      case "01":
        monthName = "January";
        break;
      case "02":
        monthName = "February";
        break;
      case "03":
        monthName = "March";
        break;
      case "04":
        monthName = "April";
        break;
      case "05":
        monthName = "May";
        break;
      case "06":
        monthName = "June";
        break;
      case "07":
        monthName = "July";
        break;
      case "08":
        monthName = "August";
        break;
      case "09":
        monthName = "September";
        break;
      case "10":
        monthName = "October";
        break;
      case "11":
        monthName = "November";
        break;
      case "12":
        monthName = "December";
        break;
      default:
        monthName = "";
    }
    String year = unformatted_date.substring(0, 4);
    String formattedDate = "${day.toString()} " + monthName + "," + year;
    return formattedDate;
  }

  void updateDataBase({
    required String salah,
    required int status,
    required String date,
  }) {
    switch (salah) {
      case "fajr":
        db.rawUpdate('UPDATE Salawat SET fajr = ? WHERE date = ?',
            [status, date]).then((value) {
          emit(AppUpdateDataBaseState());
          getDataFromDB(db);
        });
        break;
      case "zuhr":
        db.rawUpdate('UPDATE Salawat SET zuhr = ? WHERE date = ?',
            [status, date]).then((value) {
          emit(AppUpdateDataBaseState());
          getDataFromDB(db);
        });
        break;
      case "asr":
        db.rawUpdate('UPDATE Salawat SET asr = ? WHERE date = ?',
            [status, date]).then((value) {
          emit(AppUpdateDataBaseState());
          getDataFromDB(db);
        });
        break;
      case "maghrib":
        db.rawUpdate('UPDATE Salawat SET maghrib = ? WHERE date = ?',
            [status, date]).then((value) {
          emit(AppUpdateDataBaseState());
          getDataFromDB(db);
        });
        break;
      case "isha":
        db.rawUpdate('UPDATE Salawat SET isha = ? WHERE date = ?',
            [status, date]).then((value) {
          emit(AppUpdateDataBaseState());
          getDataFromDB(db);
        });
        break;
    }
  }

  Future insertDB({
    required String date,
  }) async {
    await db.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO Salawat(date, fajr, zuhr, asr, maghrib, isha) VALUES("$date",0,0,0,0,0)')
          .then((value) {
        print("$value Inserted Successfully");
        emit(AppInsertDatabaseState());
        getDataFromDB(db);
      }).catchError((error) {
        print("Error While Inserting ${error.toString()}");
      });
    });
  }
}
