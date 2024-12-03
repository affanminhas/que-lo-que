import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_view_widget.dart' show LoginViewWidget;
import 'package:flutter/material.dart';

class LoginViewModel extends FlutterFlowModel<LoginViewWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IndividualUserRecord? invidualUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  BusinessOwnerRecord? businessOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IndividualUserRecord? invidualUserGoogle;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  BusinessOwnerRecord? businessOwnerGoogle;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IndividualUserRecord? invidualUserApple;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  BusinessOwnerRecord? businessOwnerApple;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
