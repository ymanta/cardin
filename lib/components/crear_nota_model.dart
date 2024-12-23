import '/flutter_flow/flutter_flow_util.dart';
import 'crear_nota_widget.dart' show CrearNotaWidget;
import 'package:flutter/material.dart';

class CrearNotaModel extends FlutterFlowModel<CrearNotaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for notaContacto widget.
  FocusNode? notaContactoFocusNode;
  TextEditingController? notaContactoTextController;
  String? Function(BuildContext, String?)? notaContactoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    notaContactoFocusNode?.dispose();
    notaContactoTextController?.dispose();
  }
}
