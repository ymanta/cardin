import '/backend/backend.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'red_de_contacto_widget.dart' show RedDeContactoWidget;
import 'package:flutter/material.dart';

class RedDeContactoModel extends FlutterFlowModel<RedDeContactoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<InvitacionesRecord>? existeInvitacion;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<InvitacionesRecord>? existeInvitacionrecibida;
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
