import '/backend/backend.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cardincontacto_widget.dart' show CardincontactoWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CardincontactoModel extends FlutterFlowModel<CardincontactoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Custom Action - obtenerIdsDeRedContactos] action in Button widget.
  List<String>? idsObtenidos;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MiscontactosRecord? contactoParaEliminar;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MiscontactosRecord? contactoParaEliminarOpuesto;
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
