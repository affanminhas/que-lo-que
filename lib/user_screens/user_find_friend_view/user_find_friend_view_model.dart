import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_find_friend_view_widget.dart' show UserFindFriendViewWidget;
import 'package:flutter/material.dart';

class UserFindFriendViewModel
    extends FlutterFlowModel<UserFindFriendViewWidget> {
  ///  Local state fields for this component.

  bool isFilterEnabled = false;

  List<IndividualUserRecord> searchUserResults = [];
  void addToSearchUserResults(IndividualUserRecord item) =>
      searchUserResults.add(item);
  void removeFromSearchUserResults(IndividualUserRecord item) =>
      searchUserResults.remove(item);
  void removeAtIndexFromSearchUserResults(int index) =>
      searchUserResults.removeAt(index);
  void insertAtIndexInSearchUserResults(int index, IndividualUserRecord item) =>
      searchUserResults.insert(index, item);
  void updateSearchUserResultsAtIndex(
          int index, Function(IndividualUserRecord) updateFn) =>
      searchUserResults[index] = updateFn(searchUserResults[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<IndividualUserRecord> simpleSearchResults = [];
  // State field(s) for GenderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // State field(s) for MinAge widget.
  FocusNode? minAgeFocusNode;
  TextEditingController? minAgeTextController;
  String? Function(BuildContext, String?)? minAgeTextControllerValidator;
  // State field(s) for MaxAge widget.
  FocusNode? maxAgeFocusNode;
  TextEditingController? maxAgeTextController;
  String? Function(BuildContext, String?)? maxAgeTextControllerValidator;
  // State field(s) for HeightField widget.
  FocusNode? heightFieldFocusNode;
  TextEditingController? heightFieldTextController;
  String? Function(BuildContext, String?)? heightFieldTextControllerValidator;
  // State field(s) for WeightField widget.
  FocusNode? weightFieldFocusNode;
  TextEditingController? weightFieldTextController;
  String? Function(BuildContext, String?)? weightFieldTextControllerValidator;
  // State field(s) for EthinicityField widget.
  FocusNode? ethinicityFieldFocusNode;
  TextEditingController? ethinicityFieldTextController;
  String? Function(BuildContext, String?)?
      ethinicityFieldTextControllerValidator;
  // State field(s) for EyeDropDown widget.
  String? eyeDropDownValue;
  FormFieldController<String>? eyeDropDownValueController;
  // State field(s) for HairDropDown widget.
  String? hairDropDownValue;
  FormFieldController<String>? hairDropDownValueController;
  // State field(s) for LanguageDropDown widget.
  String? languageDropDownValue;
  FormFieldController<String>? languageDropDownValueController;
  // State field(s) for ReligionDropDown widget.
  String? religionDropDownValue;
  FormFieldController<String>? religionDropDownValueController;
  // State field(s) for SignDropDown widget.
  String? signDropDownValue;
  FormFieldController<String>? signDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    minAgeFocusNode?.dispose();
    minAgeTextController?.dispose();

    maxAgeFocusNode?.dispose();
    maxAgeTextController?.dispose();

    heightFieldFocusNode?.dispose();
    heightFieldTextController?.dispose();

    weightFieldFocusNode?.dispose();
    weightFieldTextController?.dispose();

    ethinicityFieldFocusNode?.dispose();
    ethinicityFieldTextController?.dispose();
  }
}
