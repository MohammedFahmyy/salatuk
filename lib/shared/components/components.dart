import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salatuk/shared/cubit/cubit.dart';
import 'package:salatuk/shared/cubit/states.dart';
import '../../models/salawat_model.dart';

Widget buildButtonBar(Salawat salawat) {
  return BlocConsumer<AppCubit, AppStates>(
    listener: (context, state) {},
    builder: (context, state) {
      return Row(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 33,
              ),
              Radio(
                value: 1,
                groupValue: salawat.status,
                onChanged: (value) {
                  if (salawat.status == 1) {
                    AppCubit.get(context).changeSalahStatus(salawat, 0);
                  } else {
                    AppCubit.get(context).changeSalahStatus(salawat, value);
                  }
                },
              ),
              SizedBox(
                width: 22,
              ),
              Radio(
                value: 2,
                groupValue: salawat.status,
                onChanged: (value) {
                  if (salawat.status == 2) {
                    AppCubit.get(context).changeSalahStatus(salawat, 0);
                  } else {
                    AppCubit.get(context).changeSalahStatus(salawat, value);
                  }
                },
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                right: 20,
              ),
              alignment: Alignment.centerRight,
              child: Text(
                salawat.salah,
                style: TextStyle(
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
