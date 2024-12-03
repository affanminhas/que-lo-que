import '/flutter_flow/flutter_flow_util.dart';
import 'businesschatpage_widget.dart' show BusinesschatpageWidget;
import 'package:flutter/material.dart';

class BusinesschatpageModel extends FlutterFlowModel<BusinesschatpageWidget> {
  ///  State fields for stateful widgets in this page.

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
