import '/flutter_flow/flutter_flow_util.dart';
import 'accommodations_widget.dart' show AccommodationsWidget;
import 'package:flutter/material.dart';

class AccommodationsModel extends FlutterFlowModel<AccommodationsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
