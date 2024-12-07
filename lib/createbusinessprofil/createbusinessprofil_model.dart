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

  ///  State fields for stateful widgets in this page.

  // State field(s) for companyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  // State field(s) for companyUsername widget.
  FocusNode? companyUsernameFocusNode;
  TextEditingController? companyUsernameTextController;
  String? Function(BuildContext, String?)?
      companyUsernameTextControllerValidator;
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
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
  void initState(BuildContext context) {}

  @override
  void dispose() {
    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    companyUsernameFocusNode?.dispose();
    companyUsernameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
