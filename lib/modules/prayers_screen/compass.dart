import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:smooth_compass/utils/src/compass_ui.dart';

class Qiblaa extends StatefulWidget {
  const Qiblaa({Key? key}) : super(key: key);

  @override
  State<Qiblaa> createState() => _QiblaaState();
}

class _QiblaaState extends State<Qiblaa> {
  bool _hasPermission = false;
  @override
  void initState() {
    super.initState();
    _fetchPermissionStatus();
  }

  void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() {
          _hasPermission = (status == PermissionStatus.granted);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (_hasPermission) {
            return _buildCompass();
          }
          return _buildPermissionFetch();
        },
      ),
    );
  }

  Widget _buildPermissionFetch() {
    return Center(
      child: ElevatedButton(
        child: const Text("String"),
        onPressed: () => Permission.locationWhenInUse.request().then((value) {
          _fetchPermissionStatus();
        }),
      ),
    );
  }
  double angle = 0;
  Widget _buildCompass() {
    
    return Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/arrow.png')),
                SmoothCompass(
                  rotationSpeed: 200,
                  height: 700,
                  width: 700,
                  compassAsset: Container(
                    height: 350,
                    width: 350,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/compass.png"),
                            fit: BoxFit.cover)),
                  ),
                  compassBuilder: (context,
                      AsyncSnapshot<CompassModel>? compassData,
                      Widget compassAsset) { 
                    angle = compassData!.data!.angle;        
                    return compassAsset;
                  },
                ),
              ],
            ),
          ),
        );
  }
}
