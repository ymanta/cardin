import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'finalde_datos_model.dart';
export 'finalde_datos_model.dart';

class FinaldeDatosWidget extends StatefulWidget {
  const FinaldeDatosWidget({super.key});

  @override
  State<FinaldeDatosWidget> createState() => _FinaldeDatosWidgetState();
}

class _FinaldeDatosWidgetState extends State<FinaldeDatosWidget> {
  late FinaldeDatosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinaldeDatosModel());
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
      height: 40.0,
      decoration: const BoxDecoration(),
    );
  }
}
