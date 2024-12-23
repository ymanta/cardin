import '/components/contenido_drawer_widget.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'inicio_widget.dart' show InicioWidget;
import 'package:flutter/material.dart';

class InicioModel extends FlutterFlowModel<InicioWidget> {
  ///  Local state fields for this page.

  int? chatsSinLeer = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - chatsPendientes] action in Inicio widget.
  int? chatsPendientes;
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
