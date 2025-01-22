import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_user_profile_model.dart';
export 'edit_user_profile_model.dart';

class EditUserProfileWidget extends StatefulWidget {
  const EditUserProfileWidget({super.key});

  @override
  State<EditUserProfileWidget> createState() => _EditUserProfileWidgetState();
}

class _EditUserProfileWidgetState extends State<EditUserProfileWidget> {
  late EditUserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditUserProfileModel());

    _model.userNameFieldFocusNode ??= FocusNode();

    _model.firstNameFieldFocusNode ??= FocusNode();

    _model.lastNameFieldFocusNode ??= FocusNode();

    _model.nationalityFieldFocusNode ??= FocusNode();

    _model.dateFieldFocusNode ??= FocusNode();

    _model.monthFieldFocusNode ??= FocusNode();

    _model.yearFieldFocusNode ??= FocusNode();

    _model.heightFieldFocusNode ??= FocusNode();

    _model.weightFieldFocusNode ??= FocusNode();

    _model.ethnicityFieldFocusNode ??= FocusNode();

    _model.addressFieldFocusNode ??= FocusNode();

    _model.socialMediaLinkField1FocusNode ??= FocusNode();

    _model.socialMediaLinkField2FocusNode ??= FocusNode();

    _model.descriptionFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<IndividualUserRecord>(
        stream: IndividualUserRecord.getDocument(
            currentUserDocument!.individualUserRef!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }

          final editUserProfileIndividualUserRecord = snapshot.data!;

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).tertiary
                    ],
                    stops: const [0.0, 1.0],
                    begin: const AlignmentDirectional(0.87, -1.0),
                    end: const AlignmentDirectional(-0.87, 1.0),
                  ),
                ),
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '36t572jt' /* Edit Your Profile */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  font: GoogleFonts.outfit(),
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'ra1kuext' /* Kindly provide the required de... */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.plusJakartaSans(),
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 24.0, 24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '5uack36k' /* Personal Information */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.outfit(),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    TextFormField(
                                      controller:
                                          _model.userNameFieldTextController ??=
                                              TextEditingController(
                                        text:
                                            editUserProfileIndividualUserRecord
                                                .username,
                                      ),
                                      focusNode: _model.userNameFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          '76apaou7' /* Username */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      validator: _model
                                          .userNameFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    TextFormField(
                                      controller: _model
                                              .firstNameFieldTextController ??=
                                          TextEditingController(
                                        text:
                                            editUserProfileIndividualUserRecord
                                                .firstName,
                                      ),
                                      focusNode: _model.firstNameFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'wwjd5kxj' /* First Name */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      validator: _model
                                          .firstNameFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    TextFormField(
                                      controller:
                                          _model.lastNameFieldTextController ??=
                                              TextEditingController(
                                        text:
                                            editUserProfileIndividualUserRecord
                                                .lastName,
                                      ),
                                      focusNode: _model.lastNameFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'uqyrwkob' /* Last Name */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      validator: _model
                                          .lastNameFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .genderDropDownValueController ??=
                                          FormFieldController<String>(
                                        _model.genderDropDownValue ??=
                                            editUserProfileIndividualUserRecord
                                                .gender,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          's66i2esx' /* Male */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'seqpvu1m' /* Female */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '2cnutboa' /* Other */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '1qb2ejww' /* Prefer not to say */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.genderDropDownValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'czgpw09d' /* Select gender */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'tgrppinb' /* Upload Profile Picture */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts
                                                    .plusJakartaSans(),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 24.0,
                                          buttonSize: 48.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              allowPhoto: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              safeSetState(() => _model
                                                  .isDataUploading = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              var downloadUrls = <String>[];
                                              try {
                                                showUploadMessage(
                                                  context,
                                                  'Uploading file...',
                                                  showLoading: true,
                                                );
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                _model.isDataUploading = false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl =
                                                      downloadUrls.first;
                                                });
                                                showUploadMessage(
                                                    context, 'Success!');
                                              } else {
                                                safeSetState(() {});
                                                showUploadMessage(context,
                                                    'Failed to upload data');
                                                return;
                                              }
                                            }
                                          },
                                        ),
                                        if ((_model.uploadedFileUrl != '') ||
                                            (editUserProfileIndividualUserRecord
                                                        .profilePhoto !=
                                                    ''))
                                          Stack(
                                            alignment:
                                                const AlignmentDirectional(1.5, -1.5),
                                            children: [
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  _model.uploadedFileUrl !=
                                                              ''
                                                      ? _model.uploadedFileUrl
                                                      : functions
                                                          .convertStringToImagePath(
                                                              editUserProfileIndividualUserRecord
                                                                  .profilePhoto),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: _model
                                              .nationalityFieldTextController ??=
                                          TextEditingController(
                                        text:
                                            editUserProfileIndividualUserRecord
                                                .nationality,
                                      ),
                                      focusNode:
                                          _model.nationalityFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'mgsf5x6h' /* Nationality */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      validator: _model
                                          .nationalityFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'fpj3bvcz' /* Enter your birthday */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 3.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                        .dateFieldTextController ??=
                                                    TextEditingController(
                                                  text: (String var1) {
                                                    return var1
                                                        .split('/')
                                                        .first;
                                                  }(editUserProfileIndividualUserRecord
                                                      .birthday),
                                                ),
                                                focusNode:
                                                    _model.dateFieldFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ryzmft7s' /* Day */,
                                                  ),
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .plusJakartaSans(),
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            font: GoogleFonts
                                                                .plusJakartaSans(),
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                minLines: 1,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .dateFieldTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: TextFormField(
                                              controller: _model
                                                      .monthFieldTextController ??=
                                                  TextEditingController(
                                                text: (String var1) {
                                                  return var1.split('/')[1];
                                                }(editUserProfileIndividualUserRecord
                                                    .birthday),
                                              ),
                                              focusNode:
                                                  _model.monthFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'f0wquphi' /* Month */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(),
                                                        letterSpacing: 0.0,
                                                      ),
                                              minLines: 1,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .monthFieldTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(3.0, 0.0, 0.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                        .yearFieldTextController ??=
                                                    TextEditingController(
                                                  text: (String var1) {
                                                    return var1.split('/')[2];
                                                  }(editUserProfileIndividualUserRecord
                                                      .birthday),
                                                ),
                                                focusNode:
                                                    _model.yearFieldFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'hwasdcd9' /* Year */,
                                                  ),
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .plusJakartaSans(),
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            font: GoogleFonts
                                                                .plusJakartaSans(),
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                minLines: 1,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .yearFieldTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller:
                                          _model.heightFieldTextController ??=
                                              TextEditingController(
                                        text:
                                            editUserProfileIndividualUserRecord
                                                .height,
                                      ),
                                      focusNode: _model.heightFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'dg4fv9ne' /* Height */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .heightFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    TextFormField(
                                      controller:
                                          _model.weightFieldTextController ??=
                                              TextEditingController(
                                        text:
                                            editUserProfileIndividualUserRecord
                                                .weight,
                                      ),
                                      focusNode: _model.weightFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'cze7jard' /* Weight */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .weightFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    TextFormField(
                                      controller: _model
                                              .ethnicityFieldTextController ??=
                                          TextEditingController(
                                        text:
                                            editUserProfileIndividualUserRecord
                                                .ethinicity,
                                      ),
                                      focusNode: _model.ethnicityFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          '7a9ptnq6' /* Ethnicity */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      validator: _model
                                          .ethnicityFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller:
                                          _model.eyeDropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.eyeDropDownValue ??=
                                            editUserProfileIndividualUserRecord
                                                .eyeColor,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'gknguig9' /* Brown */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'pxd9pvb0' /* Blue */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '6rca0704' /* Green */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'z9zdnay8' /* Hazel */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          's8oac6yp' /* Gray */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'z14bkdw9' /* Other */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(
                                          () => _model.eyeDropDownValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'k2bl9ock' /* Select eye color */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller:
                                          _model.hairDropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.hairDropDownValue ??=
                                            editUserProfileIndividualUserRecord
                                                .hairColor,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'hksgfeqe' /* Black */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'pykv2kuz' /* Brown */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'k51yqgeg' /* Blonde */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'rukgp54r' /* Red */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'k66hwokv' /* Gray */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'm0v88yg0' /* Other */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(
                                          () => _model.hairDropDownValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'afvnvqfl' /* Select hair color */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .hairStyleDropDownValueController ??=
                                          FormFieldController<String>(
                                        _model.hairStyleDropDownValue ??=
                                            editUserProfileIndividualUserRecord
                                                .hairStyle,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'bf9tun6i' /* Bald */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'llbx8hxf' /* Straight */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'bv8g3wof' /* Curly */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'wdh7oybr' /* Wavy */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'dydbtk04' /* Other */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.hairStyleDropDownValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '9jv4x3b2' /* Select hair style */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .planetDropDownValueController ??=
                                          FormFieldController<String>(
                                        _model.planetDropDownValue ??=
                                            editUserProfileIndividualUserRecord
                                                .planet,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'sbjbwfau' /* Mercury */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'hmhqat7z' /* Venus */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'rceflkl0' /* Earth */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'nyc160tb' /* Mars */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'ui8vg47g' /* Jupiter */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '9ezxt03n' /* Saturn */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'pev3zddt' /* Uranus */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'cnpcrdoh' /* Neptune */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'f9phb2an' /* Moon */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.planetDropDownValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '32avdcb7' /* Select planet */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowPlacePicker(
                                          iOSGoogleMapsApiKey:
                                              'AIzaSyBxyS9PadPdIndFq4-DH9xKBAgrN_lB_hI',
                                          androidGoogleMapsApiKey:
                                              'AIzaSyC3twTtbkt-6kr_YdQgOyiZZC9xnIredbE',
                                          webGoogleMapsApiKey:
                                              'AIzaSyCD7valhGeAqpijAjNTgji5BEuw7B2UUbY',
                                          onSelect: (place) async {
                                            safeSetState(() => _model
                                                .placePickerValue = place);
                                          },
                                          defaultText:
                                              FFLocalizations.of(context)
                                                  .getText(
                                            'xqg0mmij' /* Select Country */,
                                          ),
                                          icon: Icon(
                                            Icons.place,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 16.0,
                                          ),
                                          buttonOptions: FFButtonOptions(
                                            width: double.infinity,
                                            height: 50.0,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts
                                                          .plusJakartaSans(),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller:
                                          _model.addressFieldTextController ??=
                                              TextEditingController(
                                        text:
                                            editUserProfileIndividualUserRecord
                                                .address,
                                      ),
                                      focusNode: _model.addressFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'k075jqes' /* Address (Optional) */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      validator: _model
                                          .addressFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .languageDropDownValueController ??=
                                          FormFieldController<String>(
                                        _model.languageDropDownValue ??=
                                            editUserProfileIndividualUserRecord
                                                .language,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'ukjd7p2v' /* English */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'ruhm2o4h' /* Spanish */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'higtcyrp' /* French */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '9l14untp' /* German */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'nb1uu2wd' /* Chinese */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'xm01kwk7' /* Arabic */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'kh0xeosj' /* Other */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.languageDropDownValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'vvnpk7et' /* Select language */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .religionDropDownValueController ??=
                                          FormFieldController<String>(
                                        _model.religionDropDownValue ??=
                                            editUserProfileIndividualUserRecord
                                                .religion,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'pcq7hch0' /* N/A */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'kwu89kmz' /* Atheist */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'prnowxt9' /* Buddhist */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'shucgokc' /* Christian */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'e1ctcrei' /* Hindu */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'donqc9z0' /* Jewish */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '9j6zg0on' /* Muslim */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'dpkqiboj' /* Other */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.religionDropDownValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'byjrqd16' /* Select religion */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    TextFormField(
                                      controller: _model
                                              .socialMediaLinkField1TextController ??=
                                          TextEditingController(
                                        text: editUserProfileIndividualUserRecord
                                                .socialLinks.isNotEmpty
                                            ? (editUserProfileIndividualUserRecord
                                                .socialLinks
                                                .toList()
                                                .first)
                                            : '',
                                      ),
                                      focusNode:
                                          _model.socialMediaLinkField1FocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'acehmbv8' /* Social Media Link 1 (Optional) */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      keyboardType: TextInputType.url,
                                      validator: _model
                                          .socialMediaLinkField1TextControllerValidator
                                          .asValidator(context),
                                    ),
                                    TextFormField(
                                      controller: _model
                                              .socialMediaLinkField2TextController ??=
                                          TextEditingController(
                                        text: editUserProfileIndividualUserRecord
                                                .socialLinks.isNotEmpty
                                            ? ((List<String> var1) {
                                                return var1.length > 1
                                                    ? var1[1]
                                                    : "";
                                              }(editUserProfileIndividualUserRecord
                                                .socialLinks
                                                .toList()))
                                            : '',
                                      ),
                                      focusNode:
                                          _model.socialMediaLinkField2FocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'v62cffh3' /* Social Media Link 2 (Optional) */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      keyboardType: TextInputType.url,
                                      validator: _model
                                          .socialMediaLinkField2TextControllerValidator
                                          .asValidator(context),
                                    ),
                                    TextFormField(
                                      controller: _model
                                              .descriptionFieldTextController ??=
                                          TextEditingController(
                                        text:
                                            editUserProfileIndividualUserRecord
                                                .description,
                                      ),
                                      focusNode:
                                          _model.descriptionFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'bnnwgxc7' /* Description (Optional) */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font:
                                                  GoogleFonts.plusJakartaSans(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: 3,
                                      minLines: 1,
                                      validator: _model
                                          .descriptionFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'dk3elusg' /* Private Profile */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts
                                                    .plusJakartaSans(),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Switch(
                                          value: _model.switchValue1 ??=
                                              editUserProfileIndividualUserRecord
                                                  .privateProfile,
                                          onChanged: (newValue) async {
                                            safeSetState(() => _model
                                                .switchValue1 = newValue);
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '4bom8772' /* Hide All Friends */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts
                                                    .plusJakartaSans(),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Switch(
                                          value: _model.switchValue2 ??=
                                              editUserProfileIndividualUserRecord
                                                  .hideFriends,
                                          onChanged: (newValue) async {
                                            safeSetState(() => _model
                                                .switchValue2 = newValue);
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                      ],
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller:
                                          _model.signDropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.signDropDownValue ??=
                                            editUserProfileIndividualUserRecord
                                                .astrologicalSign,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'vtr13us0' /* Aries */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'jh98kl55' /* Taurus */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '8ima60st' /* Gemini */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'v6fbn111' /* Cancer */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'zwb5bq2j' /* Leo */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '5cde7h9p' /* Virgo */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '617cet5l' /* Libra */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '70xgtklm' /* Scorpio */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'e7wkrqpq' /* Sagittarius */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'iqa839ij' /* Capricorn */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'tnf7rm8n' /* Aquarius */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'enscw5j9' /* Pisces */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(
                                          () => _model.signDropDownValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'dhr6owbh' /* Select sign */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .relationDropDownValueController ??=
                                          FormFieldController<String>(
                                        _model.relationDropDownValue ??=
                                            editUserProfileIndividualUserRecord
                                                .relationship,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'u1tyuh7e' /* Single */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          's4xsbf4e' /* In a relationship */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'keohngun' /* Married */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'b36z4cgq' /* Divorced */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'vot6rllc' /* Widowed */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'wxj3wj2d' /* It's Complicated */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.relationDropDownValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'h9fwo7jf' /* Select relation */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .childrenDropDownValueController ??=
                                          FormFieldController<String>(
                                        _model.childrenDropDownValue ??=
                                            editUserProfileIndividualUserRecord
                                                .status,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'ocuuqmv4' /* Has Children  */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'i9xf1r38' /* No Children */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'by0sftin' /* Wants Children */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'scnae992' /* Prefer not to say */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.childrenDropDownValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '5gxv7q3y' /* Select status */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '112magjh' /* Driver's License */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts
                                                    .plusJakartaSans(),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Switch(
                                          value: _model.switchValue3 ??=
                                              editUserProfileIndividualUserRecord
                                                  .drivingLicense,
                                          onChanged: (newValue) async {
                                            safeSetState(() => _model
                                                .switchValue3 = newValue);
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                      ],
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .occupationDropDownValueController ??=
                                          FormFieldController<String>(
                                        _model.occupationDropDownValue ??=
                                            editUserProfileIndividualUserRecord
                                                .occupation,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          '00pe7y1z' /* Worker */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'tj788xlq' /* Student */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'icr58svf' /* Retired */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'f45b2ypl' /* Unemployed */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'obsg18q0' /* Other */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.occupationDropDownValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '4q83jb99' /* Select occupation */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .tattooDropDownValueController ??=
                                          FormFieldController<String>(
                                        _model.tattooDropDownValue ??=
                                            editUserProfileIndividualUserRecord
                                                .tattoo,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          '805tyct0' /* Tattooed */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          's0mjux9z' /* Not Tattooed */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '27bvba41' /* Prefer not to say */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.tattooDropDownValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'df6ym9d6' /* Select tattoo */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ].divide(const SizedBox(height: 20.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            if (_model.genderDropDownValue == null) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'gender field is required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              return;
                            }
                            if (_model.eyeDropDownValue == null) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'eye field is required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              return;
                            }
                            if (_model.hairDropDownValue == null) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'hair field is required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              return;
                            }
                            if (_model.hairStyleDropDownValue == null) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'hair style field is required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              return;
                            }
                            if (_model.planetDropDownValue == null) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'planet field is required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              return;
                            }
                            if (_model.languageDropDownValue == null) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'language field is required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              return;
                            }
                            if (_model.religionDropDownValue == null) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'religion field is required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              return;
                            }
                            if (_model.signDropDownValue == null) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'sign field is required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              return;
                            }
                            if (_model.relationDropDownValue == null) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'relation field is required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              return;
                            }
                            if (_model.childrenDropDownValue == null) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'children field is required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              return;
                            }
                            if (_model.occupationDropDownValue == null) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'occupation field is required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              return;
                            }
                            if (_model.tattooDropDownValue == null) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'tattoo field is required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              return;
                            }

                            await editUserProfileIndividualUserRecord.reference
                                .update({
                              ...createIndividualUserRecordData(
                                username:
                                    _model.userNameFieldTextController.text,
                                firstName:
                                    _model.firstNameFieldTextController.text,
                                lastName:
                                    _model.lastNameFieldTextController.text,
                                gender: _model.genderDropDownValue,
                                profilePhoto: _model.uploadedFileUrl != ''
                                    ? _model.uploadedFileUrl
                                    : editUserProfileIndividualUserRecord
                                        .profilePhoto,
                                nationality:
                                    _model.nationalityFieldTextController.text,
                                height: _model.heightFieldTextController.text,
                                weight: _model.weightFieldTextController.text,
                                ethinicity:
                                    _model.ethnicityFieldTextController.text,
                                eyeColor: _model.eyeDropDownValue,
                                hairColor: _model.hairDropDownValue,
                                hairStyle: _model.hairStyleDropDownValue,
                                planet: _model.planetDropDownValue,
                                location: _model.placePickerValue != null
                                    ? _model.placePickerValue.country
                                    : editUserProfileIndividualUserRecord
                                        .location,
                                address: _model.addressFieldTextController.text,
                                language: _model.languageDropDownValue,
                                religion: _model.religionDropDownValue,
                                description:
                                    _model.descriptionFieldTextController.text,
                                privateProfile: _model.switchValue1,
                                hideFriends: _model.switchValue2,
                                relationship: _model.relationDropDownValue,
                                status: _model.childrenDropDownValue,
                                drivingLicense: _model.switchValue3,
                                occupation: _model.occupationDropDownValue,
                                tattoo: _model.tattooDropDownValue,
                                birthday:
                                    '${_model.dateFieldTextController.text}/${_model.monthFieldTextController.text}/${_model.yearFieldTextController.text}',
                                astrologicalSign: _model.signDropDownValue,
                              ),
                              ...mapToFirestore(
                                {
                                  'socialLinks': functions.newCustomFunction(
                                      _model.socialMediaLinkField1TextController
                                          .text,
                                      _model.socialMediaLinkField2TextController
                                          .text),
                                },
                              ),
                            });

                            await currentUserReference!
                                .update(createUsersRecordData(
                              displayName:
                                  '${_model.firstNameFieldTextController.text} ${_model.lastNameFieldTextController.text}',
                              photoUrl: _model.uploadedFileUrl != ''
                                  ? _model.uploadedFileUrl
                                  : functions.convertStringToImagePath(
                                      editUserProfileIndividualUserRecord
                                          .profilePhoto),
                            ));
                            context.safePop();
                          },
                          text: FFLocalizations.of(context).getText(
                            'rb21lcdp' /* Update Profile */,
                          ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 56.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(),
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                        ),
                      ].divide(const SizedBox(height: 24.0)),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
