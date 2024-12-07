import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_create_activity_view_widget.dart'
    show UserCreateActivityViewWidget;
import 'package:flutter/material.dart';

class UserCreateActivityViewModel
    extends FlutterFlowModel<UserCreateActivityViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PlanetDropDown widget.
  String? planetDropDownValue;
  FormFieldController<String>? planetDropDownValueController;
  // State field(s) for CountryPicker widget.
  FFPlace countryPickerValue = const FFPlace();
  // State field(s) for RegionPicker widget.
  FFPlace regionPickerValue = const FFPlace();
  // State field(s) for CityPicker widget.
  FFPlace cityPickerValue = const FFPlace();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for IsActivityFree widget.
  bool? isActivityFreeValue;
  // State field(s) for CategoryDropDown widget.
  String? categoryDropDownValue;
  FormFieldController<String>? categoryDropDownValueController;
  // State field(s) for PrivacyChips widget.
  FormFieldController<List<String>>? privacyChipsValueController;
  String? get privacyChipsValue =>
      privacyChipsValueController?.value?.firstOrNull;
  set privacyChipsValue(String? val) =>
      privacyChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for ParticipantsNumber widget.
  FocusNode? participantsNumberFocusNode;
  TextEditingController? participantsNumberTextController;
  String? Function(BuildContext, String?)?
      participantsNumberTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for PromoteActivity widget.
  bool? promoteActivityValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    participantsNumberFocusNode?.dispose();
    participantsNumberTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();
  }
}
