import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SwitchingWidget extends StatefulWidget {
  const SwitchingWidget({Key? key}) : super(key: key);

  @override
  _SwitchingWidgetState createState() => _SwitchingWidgetState();
}

class _SwitchingWidgetState extends State<SwitchingWidget> {

  @override
  void initState() {
    Modular.to.pushReplacementNamed("/User".toLowerCase());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
