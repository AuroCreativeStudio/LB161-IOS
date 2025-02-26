import '/flutter_flow/flutter_flow_util.dart';
import 'single_profession_info_widget.dart' show SingleProfessionInfoWidget;
import 'package:flutter/material.dart';

class SingleProfessionInfoModel
    extends FlutterFlowModel<SingleProfessionInfoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
