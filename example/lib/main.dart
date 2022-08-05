import 'package:fl_three_state_switch/fl_three_state_switch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Three State switch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SwitchState _state = SwitchState.start;
  SwitchState _customState = SwitchState.start;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              normalSwitch(),
              const SizedBox(
                height: 20,
              ),
              disableSwitch(),
              const SizedBox(
                height: 20,
              ),
              customizeSwitch(),
            ],
          ),
        ),
      ),
    );
  }

  Column normalSwitch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Normal Three State Switch",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FlThreeStateSwtich(
          onChanged: (state) {
            setState(() {
              _state = state;
            });
          },
          disable: false,
          state: _state,
        ),
      ],
    );
  }

  Column disableSwitch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Disable Three State Switch",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FlThreeStateSwtich(
          onChanged: (state) {},
          disable: true,
          state: SwitchState.start,
        ),
      ],
    );
  }

  Column customizeSwitch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Customize Three State Switch",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FlThreeStateSwtich(
          onChanged: (state) {
            setState(() {
              _customState = state;
            });
          },
          endBackgroundColor: Colors.red,
          middleBackgroundColor: Colors.green,
          disable: false,
          state: _customState,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _customState == SwitchState.start
                  ? Icons.add
                  : _customState == SwitchState.middle
                      ? Icons.remove
                      : Icons.close,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
