import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'createbusinessprofil_widget.dart' show CreatebusinessprofilWidget;
import 'package:flutter/material.dart';

class CreatebusinessprofilModel
    extends FlutterFlowModel<CreatebusinessprofilWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> medias = [];
  void addToMedias(FFUploadedFile item) => medias.add(item);
  void removeFromMedias(FFUploadedFile item) => medias.remove(item);
  void removeAtIndexFromMedias(int index) => medias.removeAt(index);
  void insertAtIndexInMedias(int index, FFUploadedFile item) =>
      medias.insert(index, item);
  void updateMediasAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      medias[index] = updateFn(medias[index]);

  String? businessDocument;

  List<String> businessMediaURLSLocal = [];
  void addToBusinessMediaURLSLocal(String item) =>
      businessMediaURLSLocal.add(item);
  void removeFromBusinessMediaURLSLocal(String item) =>
      businessMediaURLSLocal.remove(item);
  void removeAtIndexFromBusinessMediaURLSLocal(int index) =>
      businessMediaURLSLocal.removeAt(index);
  void insertAtIndexInBusinessMediaURLSLocal(int index, String item) =>
      businessMediaURLSLocal.insert(index, item);
  void updateBusinessMediaURLSLocalAtIndex(
          int index, Function(String) updateFn) =>
      businessMediaURLSLocal[index] = updateFn(businessMediaURLSLocal[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for companyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  String? _companyNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'x8y1ti1w' /* company name is required */,
      );
    }

    return null;
  }

  // State field(s) for companyUsername widget.
  FocusNode? companyUsernameFocusNode;
  TextEditingController? companyUsernameTextController;
  String? Function(BuildContext, String?)?
      companyUsernameTextControllerValidator;
  String? _companyUsernameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7yhfeipk' /* username is required */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for PlanetDropDown widget.
  String? planetDropDownValue;
  FormFieldController<String>? planetDropDownValueController;
  // State field(s) for CountryPicker widget.
  FFPlace countryPickerValue = const FFPlace();
  // State field(s) for RegionPicker widget.
  FFPlace regionPickerValue = const FFPlace();
  // State field(s) for CityPicker widget.
  FFPlace cityPickerValue = const FFPlace();
  // State field(s) for BusinessNumber widget.
  FocusNode? businessNumberFocusNode;
  TextEditingController? businessNumberTextController;
  String? Function(BuildContext, String?)?
      businessNumberTextControllerValidator;
  String? _businessNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yuezruah' /* business number is required */,
      );
    }

    return null;
  }

  // State field(s) for BusinessAddress widget.
  FocusNode? businessAddressFocusNode;
  TextEditingController? businessAddressTextController;
  String? Function(BuildContext, String?)?
      businessAddressTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadMediaToCustomFolder] action in Button widget.
  String? businessDocAction;
  // Stores action output result for [Custom Action - uploadMediaListToCustomFolder] action in Button widget.
  List<String>? businessMediaURLS;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BusinessOwnerRecord? businessOwner;

  @override
  void initState(BuildContext context) {
    companyNameTextControllerValidator = _companyNameTextControllerValidator;
    companyUsernameTextControllerValidator =
        _companyUsernameTextControllerValidator;
    businessNumberTextControllerValidator =
        _businessNumberTextControllerValidator;
  }

  @override
  void dispose() {
    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    companyUsernameFocusNode?.dispose();
    companyUsernameTextController?.dispose();

    businessNumberFocusNode?.dispose();
    businessNumberTextController?.dispose();

    businessAddressFocusNode?.dispose();
    businessAddressTextController?.dispose();
  }
}
