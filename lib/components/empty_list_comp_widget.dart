import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_list_comp_model.dart';
export 'empty_list_comp_model.dart';

class EmptyListCompWidget extends StatefulWidget {
  const EmptyListCompWidget({
    super.key,
    String? title,
  }) : title = title ?? 'Not found!';

  final String title;

  @override
  State<EmptyListCompWidget> createState() => _EmptyListCompWidgetState();
}

class _EmptyListCompWidgetState extends State<EmptyListCompWidget> {
  late EmptyListCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          widget.title,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Plus Jakarta Sans',
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
