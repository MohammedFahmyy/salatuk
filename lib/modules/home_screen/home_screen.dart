import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salatuk/models/salawat_model.dart';
import 'package:salatuk/shared/cubit/cubit.dart';
import 'package:salatuk/shared/cubit/states.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.cyan,
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                SfRadialGauge(
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      minimum: 0,
                                      maximum: 30,
                                      showLabels: false,
                                      showTicks: false,
                                      axisLineStyle: AxisLineStyle(
                                        thickness: 0.2,
                                        cornerStyle: CornerStyle.bothCurve,
                                        color: Colors.amber,
                                        thicknessUnit: GaugeSizeUnit.factor,
                                      ),
                                      pointers: <GaugePointer>[
                                        RangePointer(
                                          value: 20,
                                          cornerStyle: CornerStyle.bothCurve,
                                          width: 0.2,
                                          sizeUnit: GaugeSizeUnit.factor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  "عدد الأيام المتبقية 30 يوماً",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          "Page 2",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "متأخر",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            "في وقتها",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            "2022/9/4",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[400],
                            ),
                          ),
                          Text(
                            "    اليوم",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) =>
                              buildButtonBar(AppCubit.get(context).salawat[index]),
                          itemCount: AppCubit.get(context).salawat.length,
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
