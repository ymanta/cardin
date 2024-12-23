import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'eliminar_cuenta_widget.dart' show EliminarCuentaWidget;
import 'package:flutter/material.dart';

class EliminarCuentaModel extends FlutterFlowModel<EliminarCuentaWidget> {
  ///  Local state fields for this page.

  String? scaneoExistoso;

  ///  State fields for stateful widgets in this page.

  // Model for Navegador component.
  late NavegadorModel navegadorModel;

  @override
  void initState(BuildContext context) {
    navegadorModel = createModel(context, () => NavegadorModel());
  }

  @override
  void dispose() {
    navegadorModel.dispose();
  }
}
