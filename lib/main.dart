import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cubit/cubit/cubit/test_cubit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestCubitCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        home: const MyHomePage(title: 'Test Cubit'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.yellow,
    Colors.cyan,
    Colors.brown,
    Colors.black,
  ];

  int currentColorIndex = 0;

  void changeColor() {
    currentColorIndex = (currentColorIndex + 1) % colors.length;
    context.read<TestCubitCubit>().changeColor(colors[currentColorIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocConsumer<TestCubitCubit, TestCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: context.read<TestCubitCubit>().testColor,
                  width: 150,
                  height: 150,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: changeColor,
        child: Text(
          'Change',
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}
