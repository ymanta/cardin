import '/backend/backend.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'compartir_widget.dart' show CompartirWidget;
import 'package:flutter/material.dart';

class CompartirModel extends FlutterFlowModel<CompartirWidget> {
  ///  Local state fields for this page.

  String? scaneoExistoso;

  ///  State fields for stateful widgets in this page.

  var valorQr = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? existeEnMiscontactos;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? infoContacto;
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
