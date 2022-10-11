import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AzkarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 30,
            showLabels: false,
            showTicks: false,
            axisLineStyle: const AxisLineStyle(
              thickness: 0.05,
              cornerStyle: CornerStyle.bothCurve,
              color: Colors.amber,
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: const <GaugePointer>[
              RangePointer(

                value: 20,
                cornerStyle: CornerStyle.startCurve,
                width: 0.05,
                sizeUnit: GaugeSizeUnit.factor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
