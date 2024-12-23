import '/backend/backend.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'listas_widget.dart' show ListasWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListasModel extends FlutterFlowModel<ListasWidget> {
  ///  Local state fields for this page.

  String? paginaActualizada;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListadodeListas widget.

  PagingController<DocumentSnapshot?, ListasRecord>?
      listadodeListasPagingController;
  Query? listadodeListasPagingQuery;
  List<StreamSubscription?> listadodeListasStreamSubscriptions = [];

  // Model for Navegador component.
  late NavegadorModel navegadorModel;

  @override
  void initState(BuildContext context) {
    navegadorModel = createModel(context, () => NavegadorModel());
  }

  @override
  void dispose() {
    for (var s in listadodeListasStreamSubscriptions) {
      s?.cancel();
    }
    listadodeListasPagingController?.dispose();

    navegadorModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, ListasRecord>
      setListadodeListasController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listadodeListasPagingController ??=
        _createListadodeListasController(query, parent);
    if (listadodeListasPagingQuery != query) {
      listadodeListasPagingQuery = query;
      listadodeListasPagingController?.refresh();
    }
    return listadodeListasPagingController!;
  }

  PagingController<DocumentSnapshot?, ListasRecord>
      _createListadodeListasController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ListasRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryListasRecordPage(
          queryBuilder: (_) => listadodeListasPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listadodeListasStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
