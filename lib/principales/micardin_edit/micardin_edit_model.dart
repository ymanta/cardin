import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'micardin_edit_widget.dart' show MicardinEditWidget;
import 'package:flutter/material.dart';

class MicardinEditModel extends FlutterFlowModel<MicardinEditWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Bottom Sheet - ImageComponentBottomSheet] action in Button widget.
  String? croppedImagenUrl;
  // State field(s) for EditarNombre widget.
  FocusNode? editarNombreFocusNode;
  TextEditingController? editarNombreTextController;
  String? Function(BuildContext, String?)? editarNombreTextControllerValidator;
  // State field(s) for EditarOcupacion widget.
  FocusNode? editarOcupacionFocusNode;
  TextEditingController? editarOcupacionTextController;
  String? Function(BuildContext, String?)?
      editarOcupacionTextControllerValidator;
  // State field(s) for EditarEmpresa widget.
  FocusNode? editarEmpresaFocusNode;
  TextEditingController? editarEmpresaTextController;
  String? Function(BuildContext, String?)? editarEmpresaTextControllerValidator;
  // State field(s) for EditarPais widget.
  String? editarPaisValue;
  FormFieldController<String>? editarPaisValueController;
  // State field(s) for EditarTelefono widget.
  FocusNode? editarTelefonoFocusNode;
  TextEditingController? editarTelefonoTextController;
  String? Function(BuildContext, String?)?
      editarTelefonoTextControllerValidator;
  // State field(s) for EditarTipoDoc widget.
  String? editarTipoDocValue;
  FormFieldController<String>? editarTipoDocValueController;
  // State field(s) for EditarNumDoc widget.
  FocusNode? editarNumDocFocusNode;
  TextEditingController? editarNumDocTextController;
  String? Function(BuildContext, String?)? editarNumDocTextControllerValidator;
  // State field(s) for EditarWhatsapp widget.
  FocusNode? editarWhatsappFocusNode;
  TextEditingController? editarWhatsappTextController;
  String? Function(BuildContext, String?)?
      editarWhatsappTextControllerValidator;
  // State field(s) for EditarFace widget.
  FocusNode? editarFaceFocusNode;
  TextEditingController? editarFaceTextController;
  String? Function(BuildContext, String?)? editarFaceTextControllerValidator;
  // State field(s) for EditarInsta widget.
  FocusNode? editarInstaFocusNode;
  TextEditingController? editarInstaTextController;
  String? Function(BuildContext, String?)? editarInstaTextControllerValidator;
  // State field(s) for EditarLinkedin widget.
  FocusNode? editarLinkedinFocusNode;
  TextEditingController? editarLinkedinTextController;
  String? Function(BuildContext, String?)?
      editarLinkedinTextControllerValidator;
  // State field(s) for EditarTwitter widget.
  FocusNode? editarTwitterFocusNode;
  TextEditingController? editarTwitterTextController;
  String? Function(BuildContext, String?)? editarTwitterTextControllerValidator;
  // State field(s) for EditarWeb widget.
  FocusNode? editarWebFocusNode;
  TextEditingController? editarWebTextController;
  String? Function(BuildContext, String?)? editarWebTextControllerValidator;
  // State field(s) for EditarResumen widget.
  FocusNode? editarResumenFocusNode;
  TextEditingController? editarResumenTextController;
  String? Function(BuildContext, String?)? editarResumenTextControllerValidator;
  // State field(s) for EditarDireccion widget.
  FocusNode? editarDireccionFocusNode;
  TextEditingController? editarDireccionTextController;
  String? Function(BuildContext, String?)?
      editarDireccionTextControllerValidator;
  // State field(s) for EditaNacimiento widget.
  FocusNode? editaNacimientoFocusNode;
  TextEditingController? editaNacimientoTextController;
  String? Function(BuildContext, String?)?
      editaNacimientoTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  // State field(s) for EditarEvento widget.
  FocusNode? editarEventoFocusNode;
  TextEditingController? editarEventoTextController;
  String? Function(BuildContext, String?)? editarEventoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editarNombreFocusNode?.dispose();
    editarNombreTextController?.dispose();

    editarOcupacionFocusNode?.dispose();
    editarOcupacionTextController?.dispose();

    editarEmpresaFocusNode?.dispose();
    editarEmpresaTextController?.dispose();

    editarTelefonoFocusNode?.dispose();
    editarTelefonoTextController?.dispose();

    editarNumDocFocusNode?.dispose();
    editarNumDocTextController?.dispose();

    editarWhatsappFocusNode?.dispose();
    editarWhatsappTextController?.dispose();

    editarFaceFocusNode?.dispose();
    editarFaceTextController?.dispose();

    editarInstaFocusNode?.dispose();
    editarInstaTextController?.dispose();

    editarLinkedinFocusNode?.dispose();
    editarLinkedinTextController?.dispose();

    editarTwitterFocusNode?.dispose();
    editarTwitterTextController?.dispose();

    editarWebFocusNode?.dispose();
    editarWebTextController?.dispose();

    editarResumenFocusNode?.dispose();
    editarResumenTextController?.dispose();

    editarDireccionFocusNode?.dispose();
    editarDireccionTextController?.dispose();

    editaNacimientoFocusNode?.dispose();
    editaNacimientoTextController?.dispose();

    editarEventoFocusNode?.dispose();
    editarEventoTextController?.dispose();
  }
}
