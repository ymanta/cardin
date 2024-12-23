import '/components/contenido_drawer_widget.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'micardin_widget.dart' show MicardinWidget;
import 'package:flutter/material.dart';

class MicardinModel extends FlutterFlowModel<MicardinWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for Navegador component.
  late NavegadorModel navegadorModel;
  // Model for ContenidoDrawer component.
  late ContenidoDrawerModel contenidoDrawerModel;

  @override
  void initState(BuildContext context) {
    navegadorModel = createModel(context, () => NavegadorModel());
    contenidoDrawerModel = createModel(context, () => ContenidoDrawerModel());
  }

  @override
  void dispose() {
    navegadorModel.dispose();
    contenidoDrawerModel.dispose();
  }
}
