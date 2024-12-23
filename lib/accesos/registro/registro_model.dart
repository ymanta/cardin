import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'registro_widget.dart' show RegistroWidget;
import 'package:flutter/material.dart';

class RegistroModel extends FlutterFlowModel<RegistroWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    return null;
  }

  // State field(s) for Ocupacion widget.
  FocusNode? ocupacionFocusNode;
  TextEditingController? ocupacionTextController;
  String? Function(BuildContext, String?)? ocupacionTextControllerValidator;
  // State field(s) for Empresa widget.
  FocusNode? empresaFocusNode;
  TextEditingController? empresaTextController;
  String? Function(BuildContext, String?)? empresaTextControllerValidator;
  // State field(s) for Pais widget.
  String? paisValue;
  FormFieldController<String>? paisValueController;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingresar formato de email válido.';
    }
    return null;
  }

  // State field(s) for Tele widget.
  FocusNode? teleFocusNode;
  TextEditingController? teleTextController;
  String? Function(BuildContext, String?)? teleTextControllerValidator;
  String? _teleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    return null;
  }

  // State field(s) for TipoDoc widget.
  String? tipoDocValue;
  FormFieldController<String>? tipoDocValueController;
  // State field(s) for NumDoc widget.
  FocusNode? numDocFocusNode;
  TextEditingController? numDocTextController;
  String? Function(BuildContext, String?)? numDocTextControllerValidator;
  String? _numDocTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    return null;
  }

  // State field(s) for Pass widget.
  FocusNode? passFocusNode;
  TextEditingController? passTextController;
  late bool passVisibility;
  String? Function(BuildContext, String?)? passTextControllerValidator;
  String? _passTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    if (val.length < 6) {
      return 'La contraseña debe contener al menos 6 caracteres';
    }

    return null;
  }

  // State field(s) for PassConfirm widget.
  FocusNode? passConfirmFocusNode;
  TextEditingController? passConfirmTextController;
  late bool passConfirmVisibility;
  String? Function(BuildContext, String?)? passConfirmTextControllerValidator;
  String? _passConfirmTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    teleTextControllerValidator = _teleTextControllerValidator;
    numDocTextControllerValidator = _numDocTextControllerValidator;
    passVisibility = false;
    passTextControllerValidator = _passTextControllerValidator;
    passConfirmVisibility = false;
    passConfirmTextControllerValidator = _passConfirmTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    ocupacionFocusNode?.dispose();
    ocupacionTextController?.dispose();

    empresaFocusNode?.dispose();
    empresaTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    teleFocusNode?.dispose();
    teleTextController?.dispose();

    numDocFocusNode?.dispose();
    numDocTextController?.dispose();

    passFocusNode?.dispose();
    passTextController?.dispose();

    passConfirmFocusNode?.dispose();
    passConfirmTextController?.dispose();
  }
}
