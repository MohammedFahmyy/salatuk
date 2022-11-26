import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salatuk/shared/cubit/cubit.dart';
import 'package:salatuk/shared/cubit/states.dart';
import '../../models/salawat_model.dart';
import '../constants/constants.dart';

Widget buildButtonBar(Salawat salawat, status, salah, day) {
  return BlocConsumer<AppCubit, AppStates>(
    listener: (context, state) {},
    builder: (context, state) {
      return Row(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 33,
              ),
              Radio(
                value: 1,
                toggleable: true,
                groupValue: status,
                onChanged: (value) {
                  AppCubit.get(context)
                      .updateDataBase(salah: salah, status: value, id: day);
                },
                fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary)
              ),
              const SizedBox(
                width: 22,
              ),
              Radio(
                value: 2,
                toggleable: true,
                groupValue: status,
                onChanged: (value) {
                  AppCubit.get(context)
                      .updateDataBase(salah: salah, status: value, id: day);
                },
                fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary)
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              alignment: Alignment.centerRight,
              child: Text(
                salawat.salah,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

class BuildAzkar extends StatelessWidget {
  final String zekr;
  final int count;
  final Function callback;
  const BuildAzkar(
      {Key? key,
      required this.zekr,
      required this.count,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    callback();
                    HapticFeedback.heavyImpact();
                  },
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 40,
                        left: 20,
                        right: 20,
                        top: 30,
                      ),
                      child: Text(
                        zekr,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              callback();
              HapticFeedback.heavyImpact();
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primary2,
              ),
              child: Center(
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

