import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'crear_lista_widget.dart' show CrearListaWidget;
import 'package:flutter/material.dart';

class CrearListaModel extends FlutterFlowModel<CrearListaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nombreLista widget.
  FocusNode? nombreListaFocusNode;
  TextEditingController? nombreListaTextController;
  String? Function(BuildContext, String?)? nombreListaTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? verificarsihaylistas;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ListasRecord>? existenombredelista;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreListaFocusNode?.dispose();
    nombreListaTextController?.dispose();
  }
}
