import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for newPasswordField widget.
  FocusNode? newPasswordFieldFocusNode;
  TextEditingController? newPasswordFieldTextController;
  String? Function(BuildContext, String?)?
      newPasswordFieldTextControllerValidator;
  String? _newPasswordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u5c8223m' /* new password is required */,
      );
    }

    return null;
  }

  // State field(s) for confirmPasswordField widget.
  FocusNode? confirmPasswordFieldFocusNode;
  TextEditingController? confirmPasswordFieldTextController;
  String? Function(BuildContext, String?)?
      confirmPasswordFieldTextControllerValidator;
  String? _confirmPasswordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oz6h1m5u' /* confirm password is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    newPasswordFieldTextControllerValidator =
        _newPasswordFieldTextControllerValidator;
    confirmPasswordFieldTextControllerValidator =
        _confirmPasswordFieldTextControllerValidator;
  }

  @override
  void dispose() {
    newPasswordFieldFocusNode?.dispose();
    newPasswordFieldTextController?.dispose();

    confirmPasswordFieldFocusNode?.dispose();
    confirmPasswordFieldTextController?.dispose();
  }
}
