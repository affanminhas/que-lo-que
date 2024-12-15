import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_create_advertise_view_widget.dart'
    show UserCreateAdvertiseViewWidget;
import 'package:flutter/material.dart';

class UserCreateAdvertiseViewModel
    extends FlutterFlowModel<UserCreateAdvertiseViewWidget> {
  ///  Local state fields for this component.

  ContentType? contentType;

  String? adPhoto;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ContentDropDown widget.
  String? contentDropDownValue;
  FormFieldController<String>? contentDropDownValueController;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TitleField widget.
  FocusNode? titleFieldFocusNode;
  TextEditingController? titleFieldTextController;
  String? Function(BuildContext, String?)? titleFieldTextControllerValidator;
  String? _titleFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xzz8ho8b' /* title is required */,
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
        'xs5xn6mm' /* description is required */,
      );
    }

    return null;
  }

  // State field(s) for PromoLinkField widget.
  FocusNode? promoLinkFieldFocusNode;
  TextEditingController? promoLinkFieldTextController;
  String? Function(BuildContext, String?)?
      promoLinkFieldTextControllerValidator;
  String? _promoLinkFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hz21pxyf' /* promo link is required */,
      );
    }

    return null;
  }

  // State field(s) for CategoryField widget.
  FocusNode? categoryFieldFocusNode;
  TextEditingController? categoryFieldTextController;
  String? Function(BuildContext, String?)? categoryFieldTextControllerValidator;
  String? _categoryFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2gn82e6v' /* category is required */,
      );
    }

    return null;
  }

  // State field(s) for PlanetDropDown widget.
  String? planetDropDownValue;
  FormFieldController<String>? planetDropDownValueController;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue1 = const FFPlace();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue2 = const FFPlace();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue3 = const FFPlace();
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Custom Action - uploadMediaToCustomFolder] action in Button widget.
  String? adsPhotoAction;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  List<AdvertisementsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    titleFieldTextControllerValidator = _titleFieldTextControllerValidator;
    descriptionFieldTextControllerValidator =
        _descriptionFieldTextControllerValidator;
    promoLinkFieldTextControllerValidator =
        _promoLinkFieldTextControllerValidator;
    categoryFieldTextControllerValidator =
        _categoryFieldTextControllerValidator;
  }

  @override
  void dispose() {
    titleFieldFocusNode?.dispose();
    titleFieldTextController?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldTextController?.dispose();

    promoLinkFieldFocusNode?.dispose();
    promoLinkFieldTextController?.dispose();

    categoryFieldFocusNode?.dispose();
    categoryFieldTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}
