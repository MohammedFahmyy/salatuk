import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salatuk/shared/cubit/cubit.dart';
import 'package:salatuk/shared/cubit/states.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';
import '../../shared/components/components.dart';
import '../../shared/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  List<String> theDay = [
    "اليوم",
    "أمس",
    theDays(DateFormat('EEEE')
        .format(DateTime.now().subtract(const Duration(days: 2)))),
    theDays(DateFormat('EEEE')
        .format(DateTime.now().subtract(const Duration(days: 3)))),
    theDays(DateFormat('EEEE')
        .format(DateTime.now().subtract(const Duration(days: 4)))),
    theDays(DateFormat('EEEE')
        .format(DateTime.now().subtract(const Duration(days: 5)))),
    theDays(DateFormat('EEEE')
        .format(DateTime.now().subtract(const Duration(days: 6)))),
  ];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  child: Material(
                    elevation: 20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: AppColors.secondary,
                    child: Container(
                      child: TabBarView(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    SfRadialGauge(
                                      axes: <RadialAxis>[
                                        RadialAxis(
                                          isInversed: true,
                                          minimum: 0,
                                          maximum: 30,
                                          showLabels: false,
                                          showTicks: false,
                                          axisLineStyle: const AxisLineStyle(
                                            thickness: 0.115,
                                            cornerStyle: CornerStyle.bothCurve,
                                            thicknessUnit: GaugeSizeUnit.factor,
                                          ),
                                          pointers: <GaugePointer>[
                                            RangePointer(
                                              color: Colors.blue[100],
                                              value: AppCubit.get(context)
                                                  .cont
                                                  .toDouble(),
                                              cornerStyle:
                                                  CornerStyle.bothCurve,
                                              width: 0.115,
                                              sizeUnit: GaugeSizeUnit.factor,
                                              enableAnimation: true,
                                            ),
                                          ],
                                          annotations: [
                                            GaugeAnnotation(
                                                widget: Text(
                                              ' ${(AppCubit.get(context).cont).toString()}',
                                              style: const TextStyle(
                                                fontSize: 50,
                                                color: Color.fromARGB(
                                                    255, 220, 233, 243),
                                              ),
                                            ))
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 5,
                                        left: 10,
                                      ),
                                      child: Container(
                                        width: double.maxFinite,
                                        alignment: Alignment.bottomLeft,
                                        child: SizedBox(
                                          
                                          width: 40,
                                          height: 40,
                                          child: FittedBox(
                                            child: FloatingActionButton(
                                              onPressed: () {
                                                if (!cubit
                                                    .refreshButtonIsDisabled) {
                                                  cubit.updateCont();
                                                  cubit.toggleRefreshButton();
                                                }
                                              },
                                              backgroundColor:
                                                  cubit.refreshButtonIsDisabled
                                                      ? Colors.grey[300]
                                                      : const Color.fromARGB(
                                                          255, 146, 187, 189),
                                              elevation:
                                                  cubit.refreshButtonIsDisabled
                                                      ? 0
                                                      : 1,
                                              enableFeedback: false,
                                              splashColor:
                                                  cubit.refreshButtonIsDisabled
                                                      ? Colors.transparent
                                                      : null,
                                              child: const Icon(
                                                Icons.refresh,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "عدد الأيام المتبقية ${(30 - AppCubit.get(context).cont).toString()} يوماً",
                                          style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 220, 233, 243),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child:Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    SfRadialGauge(
                                      axes: <RadialAxis>[
                                        RadialAxis(
                                          isInversed: true,
                                          minimum: 0,
                                          maximum: 30,
                                          showLabels: false,
                                          showTicks: false,
                                          axisLineStyle: const AxisLineStyle(
                                            thickness: 0.115,
                                            cornerStyle: CornerStyle.bothCurve,
                                            thicknessUnit: GaugeSizeUnit.factor,
                                          ),
                                          pointers: <GaugePointer>[
                                            RangePointer(
                                              color: Colors.blue[100],
                                              value: AppCubit.get(context)
                                                  .contp
                                                  .toDouble(),
                                              cornerStyle:
                                                  CornerStyle.bothCurve,
                                              width: 0.115,
                                              sizeUnit: GaugeSizeUnit.factor,
                                              enableAnimation: true,
                                            ),
                                          ],
                                          annotations: [
                                            GaugeAnnotation(
                                                widget: Text(
                                              ' ${(AppCubit.get(context).contp).toString()}',
                                              style: const TextStyle(
                                                fontSize: 50,
                                                color: Color.fromARGB(
                                                    255, 220, 233, 243),
                                              ),
                                            ))
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 5,
                                        left: 10,
                                      ),
                                      child: Container(
                                        width: double.maxFinite,
                                        alignment: Alignment.bottomLeft,
                                        child: SizedBox(
                                          
                                          width: 40,
                                          height: 40,
                                          child: FittedBox(
                                            child: FloatingActionButton(
                                              onPressed: () {
                                                if (!cubit
                                                    .refreshButtonIsDisabled) {
                                                  cubit.updateCont();
                                                  cubit.toggleRefreshButton();
                                                }
                                              },
                                              backgroundColor:
                                                  cubit.refreshButtonIsDisabled
                                                      ? Colors.grey[300]
                                                      : const Color.fromARGB(
                                                          255, 146, 187, 189),
                                              elevation:
                                                  cubit.refreshButtonIsDisabled
                                                      ? 0
                                                      : 1,
                                              enableFeedback: false,
                                              splashColor:
                                                  cubit.refreshButtonIsDisabled
                                                      ? Colors.transparent
                                                      : null,
                                              child: const Icon(
                                                Icons.refresh,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "عدد الأيام المتبقية ${(30 - AppCubit.get(context).contp).toString()} يوماً",
                                          style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 220, 233, 243),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Stack(
                                //   alignment: Alignment.bottomCenter,
                                //   children: [
                                //     SfRadialGauge(
                                //       axes: <RadialAxis>[
                                //         RadialAxis(
                                //           isInversed: true,
                                //           minimum: 0,
                                //           maximum: 30,
                                //           showLabels: false,
                                //           showTicks: false,
                                //           axisLineStyle: const AxisLineStyle(
                                //             thickness: 0.115,
                                //             cornerStyle: CornerStyle.bothCurve,
                                //             thicknessUnit: GaugeSizeUnit.factor,
                                //           ),
                                //           pointers: <GaugePointer>[
                                //             RangePointer(
                                //               gradient: const SweepGradient(
                                //                 colors: [
                                //                   Color(0xFF2E3192),
                                //                   Color(0xFF1BFFFF),
                                //                 ],
                                //                 stops: [0.25, 0.75],
                                //               ),
                                //               value: AppCubit.get(context)
                                //                   .contp
                                //                   .toDouble(),
                                //               cornerStyle:
                                //                   CornerStyle.bothCurve,
                                //               width: 0.115,
                                //               sizeUnit: GaugeSizeUnit.factor,
                                //               enableAnimation: true,
                                //             ),
                                //           ],
                                //           annotations: [
                                //             GaugeAnnotation(
                                //                 widget: Text(
                                //               ' ${(AppCubit.get(context).contp).toString()}',
                                //               style:
                                //                   const TextStyle(fontSize: 50),
                                //             ))
                                //           ],
                                //         ),
                                //       ],
                                //     ),
                                //     Column(
                                //       mainAxisAlignment: MainAxisAlignment.end,
                                //       mainAxisSize: MainAxisSize.max,
                                //       children: [
                                //         SizedBox(
                                //           width: 30,
                                //           height: 30,
                                //           child: FittedBox(
                                //             child: FloatingActionButton(
                                //               onPressed: () {
                                //                 if (!cubit
                                //                     .refreshButtonIsDisabled) {
                                //                   cubit.updateCont();
                                //                   cubit.toggleRefreshButton();
                                //                 }
                                //               },
                                //               backgroundColor:
                                //                   cubit.refreshButtonIsDisabled
                                //                       ? Colors.grey
                                //                       : Colors.blue,
                                //               elevation:
                                //                   cubit.refreshButtonIsDisabled
                                //                       ? 0
                                //                       : 1,
                                //               enableFeedback: false,
                                //               splashColor:
                                //                   cubit.refreshButtonIsDisabled
                                //                       ? Colors.transparent
                                //                       : null,
                                //               child: const Icon(
                                //                 Icons.refresh,
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //         const SizedBox(
                                //           height: 5,
                                //         ),
                                //         Text(
                                //           "عدد الأيام المتبقية ${(30 - AppCubit.get(context).contp).toString()} يوماً",
                                //         ),
                                //       ],
                                //     ),
                                //   ],
                                // ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 45,
                          ),
                          const Text(
                            "بعد وقتها",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          const Text(
                            "في وقتها",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            AppCubit.get(context).allSalawat[
                                (AppCubit.get(context).allSalawat.length) -
                                    1 -
                                    pageIndex]['date'],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[400],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                theDay[pageIndex],
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: PageView(
                          reverse: true,
                          onPageChanged: (value) {
                            pageIndex = value;
                            AppCubit.get(context).changePage();
                          },
                          children: [
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return buildButtonBar(
                                    AppCubit.get(context).salawat[index],
                                    AppCubit.get(context).allSalawat[
                                        (AppCubit.get(context)
                                                .allSalawat
                                                .length) -
                                            1][salah(index)],
                                    index,
                                    (AppCubit.get(context).allSalawat.length));
                              },
                              itemCount: AppCubit.get(context).salawat.length,
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return buildButtonBar(
                                    AppCubit.get(context).salawat[index],
                                    AppCubit.get(context).allSalawat[
                                        (AppCubit.get(context)
                                                .allSalawat
                                                .length) -
                                            2][salah(index)],
                                    index,
                                    (AppCubit.get(context).allSalawat.length) -
                                        1);
                              },
                              itemCount: AppCubit.get(context).salawat.length,
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return buildButtonBar(
                                    AppCubit.get(context).salawat[index],
                                    AppCubit.get(context).allSalawat[
                                        (AppCubit.get(context)
                                                .allSalawat
                                                .length) -
                                            3][salah(index)],
                                    index,
                                    (AppCubit.get(context).allSalawat.length) -
                                        2);
                              },
                              itemCount: AppCubit.get(context).salawat.length,
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return buildButtonBar(
                                    AppCubit.get(context).salawat[index],
                                    AppCubit.get(context).allSalawat[
                                        (AppCubit.get(context)
                                                .allSalawat
                                                .length) -
                                            4][salah(index)],
                                    index,
                                    (AppCubit.get(context).allSalawat.length) -
                                        3);
                              },
                              itemCount: AppCubit.get(context).salawat.length,
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return buildButtonBar(
                                    AppCubit.get(context).salawat[index],
                                    AppCubit.get(context).allSalawat[
                                        (AppCubit.get(context)
                                                .allSalawat
                                                .length) -
                                            5][salah(index)],
                                    index,
                                    (AppCubit.get(context).allSalawat.length) -
                                        4);
                              },
                              itemCount: AppCubit.get(context).salawat.length,
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return buildButtonBar(
                                    AppCubit.get(context).salawat[index],
                                    AppCubit.get(context).allSalawat[
                                        (AppCubit.get(context)
                                                .allSalawat
                                                .length) -
                                            6][salah(index)],
                                    index,
                                    (AppCubit.get(context).allSalawat.length) -
                                        5);
                              },
                              itemCount: AppCubit.get(context).salawat.length,
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return buildButtonBar(
                                    AppCubit.get(context).salawat[index],
                                    AppCubit.get(context).allSalawat[
                                        (AppCubit.get(context)
                                                .allSalawat
                                                .length) -
                                            7][salah(index)],
                                    index,
                                    (AppCubit.get(context).allSalawat.length -
                                        6));
                              },
                              itemCount: AppCubit.get(context).salawat.length,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

String salah(int salahNum) {
  switch (salahNum) {
    case 0:
      return "fajr";
    case 1:
      return "zuhr";
    case 2:
      return "asr";
    case 3:
      return "maghrib";
    case 4:
      return "isha";
    default:
      return "";
  }
}

String theDays(String index) {
  switch (index) {
    case "Saturday":
      return "السبت";
    case "Sunday":
      return "الأحد";
    case "Monday":
      return "الإثنين";
    case "Tuesday":
      return "الثّلاثاء";
    case "Wednesday":
      return "الأربعاء";
    case "Thursday":
      return "الخميس";
    case "Friday":
      return "الجمعة";
    default:
      return "NULL";
  }
}
