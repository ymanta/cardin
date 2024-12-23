import '/flutter_flow/flutter_flow_util.dart';
import 'editar_lista_widget.dart' show EditarListaWidget;
import 'package:flutter/material.dart';

class EditarListaModel extends FlutterFlowModel<EditarListaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputNombreActualLista widget.
  FocusNode? inputNombreActualListaFocusNode;
  TextEditingController? inputNombreActualListaTextController;
  String? Function(BuildContext, String?)?
      inputNombreActualListaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputNombreActualListaFocusNode?.dispose();
    inputNombreActualListaTextController?.dispose();
  }
}
