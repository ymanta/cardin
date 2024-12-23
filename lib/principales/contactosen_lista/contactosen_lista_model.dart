import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contactosen_lista_widget.dart' show ContactosenListaWidget;
import 'package:flutter/material.dart';

class ContactosenListaModel extends FlutterFlowModel<ContactosenListaWidget> {
  ///  Local state fields for this page.

  bool? paginaActualizada;

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
