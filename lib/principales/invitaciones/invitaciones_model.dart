import '/backend/backend.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invitaciones_widget.dart' show InvitacionesWidget;
import 'package:flutter/material.dart';

class InvitacionesModel extends FlutterFlowModel<InvitacionesWidget> {
  ///  Local state fields for this page.

  List<InvitacionesRecord> invitacionesActualizadas = [];
  void addToInvitacionesActualizadas(InvitacionesRecord item) =>
      invitacionesActualizadas.add(item);
  void removeFromInvitacionesActualizadas(InvitacionesRecord item) =>
      invitacionesActualizadas.remove(item);
  void removeAtIndexFromInvitacionesActualizadas(int index) =>
      invitacionesActualizadas.removeAt(index);
  void insertAtIndexInInvitacionesActualizadas(
          int index, InvitacionesRecord item) =>
      invitacionesActualizadas.insert(index, item);
  void updateInvitacionesActualizadasAtIndex(
          int index, Function(InvitacionesRecord) updateFn) =>
      invitacionesActualizadas[index] =
          updateFn(invitacionesActualizadas[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getInvitaciones] action in Invitaciones widget.
  List<InvitacionesRecord>? misInvitaciones;
  // Stores action output result for [Custom Action - getInvitaciones] action in Button widget.
  List<InvitacionesRecord>? misInvitacionesActualizadas;
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
