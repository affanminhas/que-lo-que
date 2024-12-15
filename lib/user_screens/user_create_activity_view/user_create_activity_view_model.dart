import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_create_activity_view_widget.dart'
    show UserCreateActivityViewWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class UserCreateActivityViewModel
    extends FlutterFlowModel<UserCreateActivityViewWidget> {
  ///  Local state fields for this component.

  List<UserActivityRecord> searchedActivityList = [];
  void addToSearchedActivityList(UserActivityRecord item) =>
      searchedActivityList.add(item);
  void removeFromSearchedActivityList(UserActivityRecord item) =>
      searchedActivityList.remove(item);
  void removeAtIndexFromSearchedActivityList(int index) =>
      searchedActivityList.removeAt(index);
  void insertAtIndexInSearchedActivityList(
          int index, UserActivityRecord item) =>
      searchedActivityList.insert(index, item);
  void updateSearchedActivityListAtIndex(
          int index, Function(UserActivityRecord) updateFn) =>
      searchedActivityList[index] = updateFn(searchedActivityList[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in userCreateActivityView widget.
  List<UserActivityRecord>? allActivities;
  // State field(s) for PlanetDropDown widget.
  String? planetDropDownValue;
  FormFieldController<String>? planetDropDownValueController;
  // State field(s) for CountryPicker widget.
  FFPlace countryPickerValue = const FFPlace();
  // State field(s) for RegionPicker widget.
  FFPlace regionPickerValue = const FFPlace();
  // State field(s) for CityPicker widget.
  FFPlace cityPickerValue = const FFPlace();
  // State field(s) for activityAddressField widget.
  FocusNode? activityAddressFieldFocusNode;
  TextEditingController? activityAddressFieldTextController;
  String? Function(BuildContext, String?)?
      activityAddressFieldTextControllerValidator;
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
  String? _participantsNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ehwawahx' /* participant is required */,
      );
    }

    return null;
  }

  // State field(s) for TitleField widget.
  FocusNode? titleFieldFocusNode;
  TextEditingController? titleFieldTextController;
  String? Function(BuildContext, String?)? titleFieldTextControllerValidator;
  String? _titleFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3o7s0arc' /* title is required */,
      );
    }

    return null;
  }

  // State field(s) for DescriptionField widget.
  FocusNode? descriptionFieldFocusNode;
  TextEditingController? descriptionFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionFieldTextControllerValidator;
  String? _descriptionFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7h2x0hrr' /* description is required */,
      );
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for LocationLinkField widget.
  FocusNode? locationLinkFieldFocusNode;
  TextEditingController? locationLinkFieldTextController;
  String? Function(BuildContext, String?)?
      locationLinkFieldTextControllerValidator;
  // State field(s) for PromoteActivity widget.
  bool? promoteActivityValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  List<UserActivityRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    participantsNumberTextControllerValidator =
        _participantsNumberTextControllerValidator;
    titleFieldTextControllerValidator = _titleFieldTextControllerValidator;
    descriptionFieldTextControllerValidator =
        _descriptionFieldTextControllerValidator;
  }

  @override
  void dispose() {
    activityAddressFieldFocusNode?.dispose();
    activityAddressFieldTextController?.dispose();

    participantsNumberFocusNode?.dispose();
    participantsNumberTextController?.dispose();

    titleFieldFocusNode?.dispose();
    titleFieldTextController?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldTextController?.dispose();

    locationLinkFieldFocusNode?.dispose();
    locationLinkFieldTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();
  }
}
