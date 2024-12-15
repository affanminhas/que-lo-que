import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'createprofiluser_widget.dart' show CreateprofiluserWidget;
import 'package:flutter/material.dart';

class CreateprofiluserModel extends FlutterFlowModel<CreateprofiluserWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> mandatoryPhoto = [];
  void addToMandatoryPhoto(FFUploadedFile item) => mandatoryPhoto.add(item);
  void removeFromMandatoryPhoto(FFUploadedFile item) =>
      mandatoryPhoto.remove(item);
  void removeAtIndexFromMandatoryPhoto(int index) =>
      mandatoryPhoto.removeAt(index);
  void insertAtIndexInMandatoryPhoto(int index, FFUploadedFile item) =>
      mandatoryPhoto.insert(index, item);
  void updateMandatoryPhotoAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      mandatoryPhoto[index] = updateFn(mandatoryPhoto[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for UserNameField widget.
  FocusNode? userNameFieldFocusNode;
  TextEditingController? userNameFieldTextController;
  String? Function(BuildContext, String?)? userNameFieldTextControllerValidator;
  String? _userNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pxo5d7s9' /* Username is required */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for FirstNameField widget.
  FocusNode? firstNameFieldFocusNode;
  TextEditingController? firstNameFieldTextController;
  String? Function(BuildContext, String?)?
      firstNameFieldTextControllerValidator;
  String? _firstNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6aql9gvt' /* First name is required */,
      );
    }

    return null;
  }

  // State field(s) for LastNameField widget.
  FocusNode? lastNameFieldFocusNode;
  TextEditingController? lastNameFieldTextController;
  String? Function(BuildContext, String?)? lastNameFieldTextControllerValidator;
  String? _lastNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k352kgow' /* Last name is required */,
      );
    }

    return null;
  }

  // State field(s) for GenderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for NationalityField widget.
  FocusNode? nationalityFieldFocusNode;
  TextEditingController? nationalityFieldTextController;
  String? Function(BuildContext, String?)?
      nationalityFieldTextControllerValidator;
  String? _nationalityFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm6grou32' /* Nationality is required */,
      );
    }

    return null;
  }

  // State field(s) for DateField widget.
  FocusNode? dateFieldFocusNode;
  TextEditingController? dateFieldTextController;
  String? Function(BuildContext, String?)? dateFieldTextControllerValidator;
  String? _dateFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd6707ib7' /* required */,
      );
    }

    return null;
  }

  // State field(s) for MonthField widget.
  FocusNode? monthFieldFocusNode;
  TextEditingController? monthFieldTextController;
  String? Function(BuildContext, String?)? monthFieldTextControllerValidator;
  String? _monthFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dap9ggn8' /* required */,
      );
    }

    return null;
  }

  // State field(s) for YearField widget.
  FocusNode? yearFieldFocusNode;
  TextEditingController? yearFieldTextController;
  String? Function(BuildContext, String?)? yearFieldTextControllerValidator;
  String? _yearFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qqhio50h' /* required */,
      );
    }

    return null;
  }

  // State field(s) for HeightField widget.
  FocusNode? heightFieldFocusNode;
  TextEditingController? heightFieldTextController;
  String? Function(BuildContext, String?)? heightFieldTextControllerValidator;
  String? _heightFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8j1b802s' /* Height is required */,
      );
    }

    return null;
  }

  // State field(s) for WeightField widget.
  FocusNode? weightFieldFocusNode;
  TextEditingController? weightFieldTextController;
  String? Function(BuildContext, String?)? weightFieldTextControllerValidator;
  String? _weightFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'czrxyrxf' /* Weight is required */,
      );
    }

    return null;
  }

  // State field(s) for EthnicityField widget.
  FocusNode? ethnicityFieldFocusNode;
  TextEditingController? ethnicityFieldTextController;
  String? Function(BuildContext, String?)?
      ethnicityFieldTextControllerValidator;
  String? _ethnicityFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rwmzn273' /* Ethnicity is required */,
      );
    }

    return null;
  }

  // State field(s) for EyeDropDown widget.
  String? eyeDropDownValue;
  FormFieldController<String>? eyeDropDownValueController;
  // State field(s) for HairDropDown widget.
  String? hairDropDownValue;
  FormFieldController<String>? hairDropDownValueController;
  // State field(s) for HairStyleDropDown widget.
  String? hairStyleDropDownValue;
  FormFieldController<String>? hairStyleDropDownValueController;
  // State field(s) for PlanetDropDown widget.
  String? planetDropDownValue;
  FormFieldController<String>? planetDropDownValueController;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // State field(s) for AddressField widget.
  FocusNode? addressFieldFocusNode;
  TextEditingController? addressFieldTextController;
  String? Function(BuildContext, String?)? addressFieldTextControllerValidator;
  // State field(s) for LanguageDropDown widget.
  String? languageDropDownValue;
  FormFieldController<String>? languageDropDownValueController;
  // State field(s) for ReligionDropDown widget.
  String? religionDropDownValue;
  FormFieldController<String>? religionDropDownValueController;
  // State field(s) for SocialMediaLinkField1 widget.
  FocusNode? socialMediaLinkField1FocusNode;
  TextEditingController? socialMediaLinkField1TextController;
  String? Function(BuildContext, String?)?
      socialMediaLinkField1TextControllerValidator;
  // State field(s) for SocialMediaLinkField2 widget.
  FocusNode? socialMediaLinkField2FocusNode;
  TextEditingController? socialMediaLinkField2TextController;
  String? Function(BuildContext, String?)?
      socialMediaLinkField2TextControllerValidator;
  // State field(s) for DescriptionField widget.
  FocusNode? descriptionFieldFocusNode;
  TextEditingController? descriptionFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionFieldTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for SignDropDown widget.
  String? signDropDownValue;
  FormFieldController<String>? signDropDownValueController;
  // State field(s) for RelationDropDown widget.
  String? relationDropDownValue;
  FormFieldController<String>? relationDropDownValueController;
  // State field(s) for ChildrenDropDown widget.
  String? childrenDropDownValue;
  FormFieldController<String>? childrenDropDownValueController;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for OccupationDropDown widget.
  String? occupationDropDownValue;
  FormFieldController<String>? occupationDropDownValueController;
  // State field(s) for TattooDropDown widget.
  String? tattooDropDownValue;
  FormFieldController<String>? tattooDropDownValueController;
  // Stores action output result for [Custom Action - uploadMediaListToCustomFolder] action in Button widget.
  List<String>? mandatoryImages;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  IndividualUserRecord? individualUser;

  @override
  void initState(BuildContext context) {
    userNameFieldTextControllerValidator =
        _userNameFieldTextControllerValidator;
    firstNameFieldTextControllerValidator =
        _firstNameFieldTextControllerValidator;
    lastNameFieldTextControllerValidator =
        _lastNameFieldTextControllerValidator;
    nationalityFieldTextControllerValidator =
        _nationalityFieldTextControllerValidator;
    dateFieldTextControllerValidator = _dateFieldTextControllerValidator;
    monthFieldTextControllerValidator = _monthFieldTextControllerValidator;
    yearFieldTextControllerValidator = _yearFieldTextControllerValidator;
    heightFieldTextControllerValidator = _heightFieldTextControllerValidator;
    weightFieldTextControllerValidator = _weightFieldTextControllerValidator;
    ethnicityFieldTextControllerValidator =
        _ethnicityFieldTextControllerValidator;
  }

  @override
  void dispose() {
    userNameFieldFocusNode?.dispose();
    userNameFieldTextController?.dispose();

    firstNameFieldFocusNode?.dispose();
    firstNameFieldTextController?.dispose();

    lastNameFieldFocusNode?.dispose();
    lastNameFieldTextController?.dispose();

    nationalityFieldFocusNode?.dispose();
    nationalityFieldTextController?.dispose();

    dateFieldFocusNode?.dispose();
    dateFieldTextController?.dispose();

    monthFieldFocusNode?.dispose();
    monthFieldTextController?.dispose();

    yearFieldFocusNode?.dispose();
    yearFieldTextController?.dispose();

    heightFieldFocusNode?.dispose();
    heightFieldTextController?.dispose();

    weightFieldFocusNode?.dispose();
    weightFieldTextController?.dispose();

    ethnicityFieldFocusNode?.dispose();
    ethnicityFieldTextController?.dispose();

    addressFieldFocusNode?.dispose();
    addressFieldTextController?.dispose();

    socialMediaLinkField1FocusNode?.dispose();
    socialMediaLinkField1TextController?.dispose();

    socialMediaLinkField2FocusNode?.dispose();
    socialMediaLinkField2TextController?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldTextController?.dispose();
  }
}
