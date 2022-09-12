import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salatuk/shared/cubit/cubit.dart';
import 'package:salatuk/shared/cubit/states.dart';
import '../../models/salawat_model.dart';

Widget buildButtonBar(Salawat salawat,status,salah,day) {
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
                  AppCubit.get(context).updateDataBase(salah: salah, status: value, id: day);
                },
              ),
              const SizedBox(
                width: 22,
              ),
              Radio(
                value: 2,
                toggleable: true,
                groupValue: status,
                onChanged: (value) {
                  AppCubit.get(context).updateDataBase(salah: salah, status: value, id: day);
                },
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