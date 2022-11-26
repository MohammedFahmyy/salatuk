import 'package:flutter/material.dart';
import 'package:salatuk/modules/azkar_screen/azkar_sabah_screen.dart';
import 'package:salatuk/shared/constants/constants.dart';

import 'azkar_masaa_screen.dart';

class AzkarPreScreen extends StatelessWidget {
  const AzkarPreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AzkarSabahScreen()));
            },
              child: Container(
                width: double.maxFinite,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    AppColors.primary,
                    AppColors.secondary,
                  ],
                )),
                child: const Center(
                  child: Text(
                    'أذكار الصباح',
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AzkarMasaaScreen()));
            },
              child: Container(
                width: double.maxFinite,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    AppColors.primary,
                    AppColors.secondary,
                  ],
                )),
                child: const Center(
                  child: Text(
                    'أذكار المساء',
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50,)
        ],
      ),
    );
  }
}
