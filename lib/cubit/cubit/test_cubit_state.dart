part of 'test_cubit_cubit.dart';

@immutable
sealed class TestCubitState {}

final class TestCubitInitial extends TestCubitState {}

final class TestCubitColorChanged extends TestCubitState {
  final Color color;

  TestCubitColorChanged(this.color);
}
