import '/flutter_flow/flutter_flow_util.dart';
import 'user_chat_view_widget.dart' show UserChatViewWidget;
import 'package:flutter/material.dart';

class UserChatViewModel extends FlutterFlowModel<UserChatViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
