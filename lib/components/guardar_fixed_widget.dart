import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'guardar_fixed_model.dart';
export 'guardar_fixed_model.dart';

class GuardarFixedWidget extends StatefulWidget {
  const GuardarFixedWidget({super.key});

  @override
  State<GuardarFixedWidget> createState() => _GuardarFixedWidgetState();
}

class _GuardarFixedWidgetState extends State<GuardarFixedWidget> {
  late GuardarFixedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GuardarFixedModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0xFF071B34),
      ),
      child: const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
      ),
    );
  }
}
