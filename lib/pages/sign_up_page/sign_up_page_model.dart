import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey1 = GlobalKey();
  TextEditingController? textController1;
  String? textFieldSelectedOption1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  final textFieldKey2 = GlobalKey();
  TextEditingController? textController2;
  String? textFieldSelectedOption2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  final textFieldKey3 = GlobalKey();
  TextEditingController? textController3;
  String? textFieldSelectedOption3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  final textFieldKey4 = GlobalKey();
  TextEditingController? textController4;
  String? textFieldSelectedOption4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  final textFieldKey5 = GlobalKey();
  TextEditingController? textController5;
  String? textFieldSelectedOption5;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController5Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
