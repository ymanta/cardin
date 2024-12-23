import '/backend/backend.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contactos_widget.dart' show ContactosWidget;
import 'package:flutter/material.dart';

class ContactosModel extends FlutterFlowModel<ContactosWidget> {
  ///  Local state fields for this page.

  bool nameOrder = false;

  bool fechaOrder = false;

  bool nombreAsc = true;

  bool fechaAsc = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for inputBuscar widget.
  FocusNode? inputBuscarFocusNode;
  TextEditingController? inputBuscarTextController;
  String? Function(BuildContext, String?)? inputBuscarTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Image widget.
  int? verificaSiExisteChat;
  // Stores action output result for [Firestore Query - Query a collection] action in Image widget.
  ChatsRecord? chatObtenido;
  // Stores action output result for [Backend Call - Create Document] action in Image widget.
  ChatsRecord? newChatThread;
  // Model for Navegador component.
  late NavegadorModel navegadorModel;

  @override
  void initState(BuildContext context) {
    navegadorModel = createModel(context, () => NavegadorModel());
  }

  @override
  void dispose() {
    inputBuscarFocusNode?.dispose();
    inputBuscarTextController?.dispose();

    navegadorModel.dispose();
  }
}
