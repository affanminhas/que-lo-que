import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'user_find_friend_view_model.dart';
export 'user_find_friend_view_model.dart';

class UserFindFriendViewWidget extends StatefulWidget {
  /// This screen is for the user find friend
  const UserFindFriendViewWidget({super.key});

  @override
  State<UserFindFriendViewWidget> createState() =>
      _UserFindFriendViewWidgetState();
}

class _UserFindFriendViewWidgetState extends State<UserFindFriendViewWidget> {
  late UserFindFriendViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserFindFriendViewModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.minAgeTextController ??= TextEditingController();
    _model.minAgeFocusNode ??= FocusNode();

    _model.maxAgeTextController ??= TextEditingController();
    _model.maxAgeFocusNode ??= FocusNode();

    _model.heightFieldTextController ??= TextEditingController();
    _model.heightFieldFocusNode ??= FocusNode();

    _model.weightFieldTextController ??= TextEditingController();
    _model.weightFieldFocusNode ??= FocusNode();

    _model.ethinicityFieldTextController ??= TextEditingController();
    _model.ethinicityFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.minAgeTextController?.text =
              FFLocalizations.of(context).getText(
            'w0nexjtc' /* 12 */,
          );
          _model.maxAgeTextController?.text =
              FFLocalizations.of(context).getText(
            'pt0up0ql' /* 40 */,
          );
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 180.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).tertiary
                  ],
                  stops: const [0.0, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        't28kmajs' /* Find Friends */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                font: GoogleFonts.outfit(),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '6lrkzeg0' /* Discover new connections */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.plusJakartaSans(),
                            color: const Color(0xFFE0E0E0),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.search,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController1',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    if (_model.textController1.text != '') {
                                      await queryIndividualUserRecordOnce()
                                          .then(
                                            (records) =>
                                                _model.simpleSearchResults =
                                                    TextSearch(
                                              records
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record, [
                                                      record.firstName,
                                                      record.lastName,
                                                      record.username
                                                    ]),
                                                  )
                                                  .toList(),
                                            )
                                                        .search(_model
                                                            .textController1
                                                            .text)
                                                        .map((r) => r.object)
                                                        .toList(),
                                          )
                                          .onError((_, __) =>
                                              _model.simpleSearchResults = [])
                                          .whenComplete(
                                              () => safeSetState(() {}));

                                      _model.searchUserResults = _model
                                          .simpleSearchResults
                                          .toList()
                                          .cast<IndividualUserRecord>();
                                      safeSetState(() {});
                                    } else {
                                      _model.searchUserResults = [];
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    'rqqxzkm4' /* Search friends, companies, or ... */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(),
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(),
                                      letterSpacing: 0.0,
                                    ),
                                minLines: 1,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                            if (!_model.isFilterEnabled)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.isFilterEnabled = true;
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.filter_list,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            if (_model.isFilterEnabled)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.isFilterEnabled = false;
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  if (_model.isFilterEnabled)
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'g8d0j1wk' /* Filter Options */,
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.genderDropDownValueController ??=
                                          FormFieldController<String>(null),
                                  options: [
                                    FFLocalizations.of(context).getText(
                                      'eb0ntvct' /* Male */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'kd7ftuid' /* Female */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'h17cg11m' /* Any */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '1rizjzbm' /* Alien */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'du37eq2p' /* Robot */,
                                    )
                                  ],
                                  onChanged: (val) => safeSetState(
                                      () => _model.genderDropDownValue = val),
                                  width: double.infinity,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'q91u19vi' /* Select gender   */,
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
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                              FlutterFlowPlacePicker(
                                iOSGoogleMapsApiKey:
                                    'AIzaSyBxyS9PadPdIndFq4-DH9xKBAgrN_lB_hI',
                                androidGoogleMapsApiKey:
                                    'AIzaSyC3twTtbkt-6kr_YdQgOyiZZC9xnIredbE',
                                webGoogleMapsApiKey:
                                    'AIzaSyCD7valhGeAqpijAjNTgji5BEuw7B2UUbY',
                                onSelect: (place) async {
                                  safeSetState(
                                      () => _model.placePickerValue = place);
                                },
                                defaultText:
                                    FFLocalizations.of(context).getText(
                                  'fnojqy19' /* Select Country */,
                                ),
                                icon: Icon(
                                  Icons.place,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 16.0,
                                ),
                                buttonOptions: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(),
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 30.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'kmkmvqgt' /* Age Range */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _model.minAgeTextController,
                                      focusNode: _model.minAgeFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'ufnkcyne' /* Min */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
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
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
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
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .minAgeTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'uv2h6nyz' /* to */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _model.maxAgeTextController,
                                      focusNode: _model.maxAgeFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(),
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'ch0b3cl9' /* Min */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
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
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
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
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(),
                                            letterSpacing: 0.0,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .maxAgeTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: _model.heightFieldTextController,
                                focusNode: _model.heightFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'x98n56d0' /* Height */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(),
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(),
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
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
                                controller: _model.weightFieldTextController,
                                focusNode: _model.weightFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'q8pftaac' /* Weight */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(),
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(),
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
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
                                controller:
                                    _model.ethinicityFieldTextController,
                                focusNode: _model.ethinicityFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '8q2na8s8' /* Ethinicity */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(),
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(),
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
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
                                    .ethinicityFieldTextControllerValidator
                                    .asValidator(context),
                              ),
                              FlutterFlowDropDown<String>(
                                controller:
                                    _model.eyeDropDownValueController ??=
                                        FormFieldController<String>(null),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    '49vy5ymw' /* Brown */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '7m3vu9gb' /* Blue */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '0pt6bmhi' /* Green */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '05w2jfg2' /* Hazel */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '2vu0qkaf' /* Gray */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'aqi6pggm' /* Other */,
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
                                hintText: FFLocalizations.of(context).getText(
                                  '5ll03qyi' /* Select eye color */,
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
                                    .primaryBackground,
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
                                        FormFieldController<String>(null),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    '3pyyasr7' /* Black */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '2enhnmk2' /* Brown */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'z7av5ue0' /* Blonde */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '5uw71oks' /* Red */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'm8eg3u5w' /* Gray */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'cpe9hvco' /* Other */,
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
                                hintText: FFLocalizations.of(context).getText(
                                  '85ffeoyw' /* Select hair color */,
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
                                    .primaryBackground,
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
                                    _model.languageDropDownValueController ??=
                                        FormFieldController<String>(null),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'qc1pm9vv' /* English */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '0uwocuev' /* Spanish */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '24wicgrx' /* French */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'hhp0nb0p' /* German */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'u4n6doa5' /* Chinese */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'qn8vut7z' /* Arabic */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '4lrgyqeh' /* Other */,
                                  )
                                ],
                                onChanged: (val) => safeSetState(
                                    () => _model.languageDropDownValue = val),
                                width: double.infinity,
                                height: 50.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(),
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'd82jyazh' /* Select language */,
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
                                    .primaryBackground,
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
                                    _model.religionDropDownValueController ??=
                                        FormFieldController<String>(null),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'mzzxawf6' /* N/A */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '3yprxpwr' /* Atheist */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'la1hs686' /* Buddhist */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '15qr5pqx' /* Christian */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'oda9a75f' /* Hindu */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '7aw7w0ok' /* Jewish */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'p7n1kje1' /* Muslim */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '4r4pqjkd' /* Other */,
                                  )
                                ],
                                onChanged: (val) => safeSetState(
                                    () => _model.religionDropDownValue = val),
                                width: double.infinity,
                                height: 50.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(),
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  '4184fora' /* Select religion */,
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
                                    .primaryBackground,
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
                                    _model.signDropDownValueController ??=
                                        FormFieldController<String>(null),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'yqt8s3fw' /* Aries */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'whtu25sr' /* Taurus */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'y7qrjy02' /* Gemini */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '2gmgdvuz' /* Cancer */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '8u6qyeh3' /* Leo */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '3rt7tm9y' /* Virgo */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'm1zull5u' /* Libra */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'yosox8hr' /* Scorpio */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '93ckicvb' /* Sagittarius */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    't6fmcke0' /* Capricorn */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'l175fxup' /* Aquarius */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'fh4g3bnl' /* Pisces */,
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
                                hintText: FFLocalizations.of(context).getText(
                                  'd5qn75rc' /* Select astrological sign */,
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
                                    .primaryBackground,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.isFilterEnabled = false;
                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'h09w8ysr' /* Apply Filters */,
                                ),
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 50.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(),
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ].divide(const SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          safeSetState(() {
                            _model.textController1?.clear();
                            _model.heightFieldTextController?.clear();
                            _model.weightFieldTextController?.clear();
                            _model.ethinicityFieldTextController?.clear();
                          });
                          safeSetState(() {
                            _model.genderDropDownValueController?.reset();
                            _model.eyeDropDownValueController?.reset();
                            _model.hairDropDownValueController?.reset();
                            _model.languageDropDownValueController?.reset();
                            _model.religionDropDownValueController?.reset();
                            _model.signDropDownValueController?.reset();
                          });
                          _model.isFilterEnabled = false;
                          safeSetState(() {});
                          safeSetState(() {
                            _model.minAgeTextController?.text = '12';
                          });
                          safeSetState(() {
                            _model.maxAgeTextController?.text = '40';
                          });
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'u833wj12' /* Clear filters */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.outfit(),
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                  ),
                  if (_model.searchUserResults.isNotEmpty)
                    Text(
                      FFLocalizations.of(context).getText(
                        'thzz0fwa' /* Search Results */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.outfit(),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                    ),
                  if (_model.searchUserResults.isNotEmpty)
                    Builder(
                      builder: (context) {
                        final searchResults = _model.searchUserResults
                            .where((e) =>
                                ((e.gender == _model.genderDropDownValue) ||
                                    (_model.genderDropDownValue == null ||
                                        _model.genderDropDownValue == '')) &&
                                ((e.height == _model.heightFieldTextController.text) ||
                                    (_model.heightFieldTextController.text ==
                                            '')) &&
                                ((e.weight == _model.weightFieldTextController.text) ||
                                    (_model.weightFieldTextController.text ==
                                            '')) &&
                                ((e.ethinicity == _model.ethinicityFieldTextController.text) ||
                                    (_model.ethinicityFieldTextController.text ==
                                            '')) &&
                                ((e.eyeColor == _model.eyeDropDownValue) ||
                                    (_model.eyeDropDownValue == null || _model.eyeDropDownValue == '')) &&
                                ((e.hairColor == _model.hairDropDownValue) || (_model.hairDropDownValue == null || _model.hairDropDownValue == '')) &&
                                ((e.hairColor == _model.hairDropDownValue) || (_model.hairDropDownValue == null || _model.hairDropDownValue == '')) &&
                                ((e.language == _model.languageDropDownValue) || (_model.languageDropDownValue == null || _model.languageDropDownValue == '')) &&
                                ((e.religion == _model.religionDropDownValue) || (_model.religionDropDownValue == null || _model.religionDropDownValue == '')) &&
                                ((e.astrologicalSign == _model.signDropDownValue) || (_model.signDropDownValue == null || _model.signDropDownValue == '')) &&
                                functions.checkAgeLimit(functions.calculateAge(e.birthday), _model.minAgeTextController.text, _model.maxAgeTextController.text) &&
                                ((e.location == _model.placePickerValue.country) || (_model.placePickerValue == null)))
                            .toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: searchResults.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                          itemBuilder: (context, searchResultsIndex) {
                            final searchResultsItem =
                                searchResults[searchResultsIndex];
                            return Material(
                              color: Colors.transparent,
                              elevation: 2.0,
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
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 80.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE0E0E0),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              functions
                                                  .convertStringToImagePath(
                                                      searchResultsItem
                                                          .profilePhoto),
                                              'https://firebasestorage.googleapis.com/v0/b/que-lo-que-2-05vr7v.firebasestorage.app/o/AppAssets%2Fuser_default%20(1).png?alt=media&token=402ca7ea-8208-43ce-abaa-7a0af96c367e',
                                            ),
                                            width: 80.0,
                                            height: 80.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${searchResultsItem.firstName} ${searchResultsItem.lastName}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              '${valueOrDefault<String>(
                                                searchResultsItem.address,
                                                'address not provided',
                                              )} • ${searchResultsItem.birthday != '' ? '${functions.calculateAge(searchResultsItem.birthday).toString()} years' : 'age not provided'}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: const Icon(
                                              Icons.person_add,
                                              color: Color(0xFF2D2A2A),
                                              size: 24.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            icon: const Icon(
                                              Icons.chat,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
                                      ),
                                    ].divide(const SizedBox(width: 16.0)),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '7w4d6dl0' /* Suggested Friends */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.outfit(),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                  StreamBuilder<List<IndividualUserRecord>>(
                    stream: queryIndividualUserRecord(
                      queryBuilder: (individualUserRecord) =>
                          individualUserRecord.orderBy('createdAt',
                              descending: true),
                      limit: 3,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<IndividualUserRecord>
                          listViewIndividualUserRecordList = snapshot.data!;

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewIndividualUserRecordList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewIndividualUserRecord =
                              listViewIndividualUserRecordList[listViewIndex];
                          return Material(
                            color: Colors.transparent,
                            elevation: 2.0,
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
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE0E0E0),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            functions.convertStringToImagePath(
                                                listViewIndividualUserRecord
                                                    .profilePhoto),
                                            'https://firebasestorage.googleapis.com/v0/b/que-lo-que-2-05vr7v.firebasestorage.app/o/AppAssets%2Fuser_default%20(1).png?alt=media&token=402ca7ea-8208-43ce-abaa-7a0af96c367e',
                                          ),
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${listViewIndividualUserRecord.firstName} ${listViewIndividualUserRecord.lastName}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Text(
                                            '${listViewIndividualUserRecord.address} • ${listViewIndividualUserRecord.birthday != '' ? '${functions.calculateAge(listViewIndividualUserRecord.birthday).toString()} years' : 'age not provided'}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          icon: const Icon(
                                            Icons.person_add,
                                            color: Color(0xFF2D2A2A),
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          icon: const Icon(
                                            Icons.chat,
                                            color: Colors.white,
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                  ].divide(const SizedBox(width: 16.0)),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ].divide(const SizedBox(height: 24.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
