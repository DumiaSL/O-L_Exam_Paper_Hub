import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pdf_view_page.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subject_setting_page_model.dart';
export 'subject_setting_page_model.dart';

class SubjectSettingPageWidget extends StatefulWidget {
  final String subjectType;
  const SubjectSettingPageWidget({Key? key, required this.subjectType}) : super(key: key);

  @override
  _SubjectSettingPageWidgetState createState() =>
      _SubjectSettingPageWidgetState(subjectType);
}

class _SubjectSettingPageWidgetState extends State<SubjectSettingPageWidget> {
  late SubjectSettingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  _SubjectSettingPageWidgetState(this.subjectType);
  final String subjectType;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubjectSettingPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  double opacityLevelSinhala = 1;
  double opacityLevelEnglish = 1;
  bool isButtonSelect=false;
  late String subjectCategory;
  late String link;
  late var year;
  List <String> option = [];
  Map<String, dynamic>? paper;

  getPaperLink() async {
    QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore.instance
        .collection("Subject")
        .doc(subjectType)
        .collection(subjectCategory)
        .where('Year', isEqualTo: year)
        .get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>>subject = snap.docs;
    paper = subject[0].data();
    link=paper?['Paper'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF3382E2),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFC0DDFF),
                        Color(0xFF73B3FF),
                        Color(0xFF7BB5FA)
                      ],
                      stops: [0.0, 1.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: Image.asset(
                          'assets/images/subject_selec_image-removebg-preview.png',
                          width: 160.0,
                          height: 160.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Text(
                          'Select your options',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily:
                                    FlutterFlowTheme.of(context).bodyText1Family,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context).bodyText1Family),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Container(
                          width: 358.0,
                          height: 418.7,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: Text(
                                  subjectType,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  'Medium ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: Color(0xFF1510EF),
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 5.0, 0.0),
                                      child: Opacity(
                                        opacity: opacityLevelSinhala,
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            subjectCategory = "Sinhala";
                                            setState(()  {
                                              isButtonSelect = true;
                                              opacityLevelEnglish =0.5;
                                              opacityLevelSinhala = 1;
                                            });
                                            option= await getYearsList() ;
                                          },
                                          text: 'Sinhala Medium ',
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 40.0,
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF3382E2),
                                            textStyle: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(context)
                                                          .subtitle2Family,
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2Family),
                                                ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100.0,
                                      child: VerticalDivider(
                                        thickness: 4.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Opacity(
                                        opacity: opacityLevelEnglish,
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            subjectCategory = "English";
                                            setState(() {
                                              opacityLevelSinhala=0.5;
                                              opacityLevelEnglish = 1;
                                            });
                                            option = await getYearsList() ;
                                          },
                                          text: 'English Medium ',
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 40.0,
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF3382E2),
                                            textStyle: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(context)
                                                          .subtitle2Family,
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2Family),
                                                ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 3.0, 0.0, 0.0),
                                child: Visibility(
                                  visible: !isButtonSelect,
                                  child: Text(
                                    'Please select subject Medium',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: FlutterFlowTheme.of(context)
                                              .bodyText1Family,
                                          color: Color(0xFFFA0707),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Visibility(
                                  visible: isButtonSelect,
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model.dropDownController ??=
                                        FormFieldController<String>(null),
                                    options: option,
                                    onChanged: (val) =>
                                        setState(() => year = val!),
                                    width: 200.0,
                                    height: 50.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    hintText: 'Please select year',
                                    fillColor: Color(0xFF76B9FF),
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 20.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    try
                                    {
                                      if (isButtonSelect){
                                        await getPaperLink();
                                        if (link.isEmpty){
                                          AnimatedSnackBar.material(
                                            "Something went wrong. Can't Find Paper !",
                                            type: AnimatedSnackBarType.error,
                                          ).show(context);
                                        }else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  PdfViewPageWidget(link,(subjectType +"-"+ year))),
                                          );
                                        }
                                      }
                                    }catch(error){
                                      AnimatedSnackBar.material(
                                        "Something went wrong. Please try again",
                                        type: AnimatedSnackBarType.error,
                                      ).show(context);
                                    }
                                  },
                                  text: 'Submit',
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF3382E2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: FlutterFlowTheme.of(context)
                                              .subtitle2Family,
                                          color: Colors.white,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family),
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            context.goNamed('Main_page');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<String>> getYearsList() async {
    List<String> templist= [];
    QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore.instance
        .collection("Subject")
        .doc(subjectType)
        .collection(subjectCategory)
        .get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>>subject = snap.docs;

    for(var index = 0; index < subject.length; index++) {
      templist.add(subject[index]['Year'] ?? '');
    }
    setState(() {
      isButtonSelect = true;
    });
    return templist;
  }
}
