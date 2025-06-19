import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'test_cubit_state.dart';

class TestCubitCubit extends Cubit<TestCubitState> {
  TestCubitCubit() : super(TestCubitInitial());
  Color testColor=Colors.red;

  void changeColor(Color color){
    testColor=color;
    emit(TestCubitColorChanged(color));
  }
}
