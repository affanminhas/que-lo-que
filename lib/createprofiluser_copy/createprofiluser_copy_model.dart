import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'createprofiluser_copy_widget.dart' show CreateprofiluserCopyWidget;
import 'package:flutter/material.dart';

class CreateprofiluserCopyModel
    extends FlutterFlowModel<CreateprofiluserCopyWidget> {
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
        'sn1zz5u7' /* Username is required */,
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
        'wiy88vsf' /* First name is required */,
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
        'twmenafy' /* Last name is required */,
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

  // State field(s) for NationalityDropDown widget.
  String? nationalityDropDownValue;
  FormFieldController<String>? nationalityDropDownValueController;
  // State field(s) for MixNationalityDropDown widget.
  String? mixNationalityDropDownValue;
  FormFieldController<String>? mixNationalityDropDownValueController;
  // State field(s) for DateField widget.
  FocusNode? dateFieldFocusNode;
  TextEditingController? dateFieldTextController;
  String? Function(BuildContext, String?)? dateFieldTextControllerValidator;
  String? _dateFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ajvgjd6m' /* required */,
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
        'p8it78w2' /* required */,
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
        'ktj78ynb' /* required */,
      );
    }

    return null;
  }

  // State field(s) for HeightDropDown widget.
  String? heightDropDownValue;
  FormFieldController<String>? heightDropDownValueController;
  // State field(s) for WeightDropDown widget.
  String? weightDropDownValue;
  FormFieldController<String>? weightDropDownValueController;
  // State field(s) for EthnicityField widget.
  FocusNode? ethnicityFieldFocusNode;
  TextEditingController? ethnicityFieldTextController;
  String? Function(BuildContext, String?)?
      ethnicityFieldTextControllerValidator;
  String? _ethnicityFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uoh5yl4c' /* Ethnicity is required */,
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
    dateFieldTextControllerValidator = _dateFieldTextControllerValidator;
    monthFieldTextControllerValidator = _monthFieldTextControllerValidator;
    yearFieldTextControllerValidator = _yearFieldTextControllerValidator;
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

    dateFieldFocusNode?.dispose();
    dateFieldTextController?.dispose();

    monthFieldFocusNode?.dispose();
    monthFieldTextController?.dispose();

    yearFieldFocusNode?.dispose();
    yearFieldTextController?.dispose();

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
