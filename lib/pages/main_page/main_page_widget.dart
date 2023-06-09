import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../subject_setting_page/subject_setting_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final  _db= FirebaseFirestore.instance;
  final FirebaseAuth  _auth= FirebaseAuth.instance;

  String? userAccountEmail= FirebaseAuth.instance.currentUser?.email;
  Map<String, dynamic>? user;
  late num subjectCount =0 ;
  late List<QueryDocumentSnapshot<Map<String, dynamic>>>subjects;
  

  getUser(String userAccountEmail) async {
    QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore.instance
        .collection("Users")
        .where('Email', isEqualTo: userAccountEmail)
        .get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>>Users = snap.docs;
    if (Users.isNotEmpty) {
      setState(() {
        user = Users[0].data();
      });
    } else {
      setState(() {
        user = null;
      });
    }
  }

  getSubjectCount() async{
    QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore.instance
        .collection("Subject").get();
    subjects = snap.docs;
    subjectCount=subjects.length;
  }


  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());
    getUser(userAccountEmail!);
    getSubjectCount();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Container(
        width: 265.0,
        child: Drawer(
          elevation: 16.0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 319.9,
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                        child: Container(
                          width: 130.0,
                          height: 130.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                           imageUrl(),
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          user?['Name'] ?? '',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context).bodyText1Family),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 20.0),
                        child: Text(
                          userAccountEmail!,
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily:
                                    FlutterFlowTheme.of(context).bodyText1Family,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context).bodyText1Family),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 4.0,
                ),
                InkWell(
                  onTap: () async {
                    context.pushNamed('Edit_profile_Page');
                  },
                  child: ListTile(
                    title: Text(
                      'Edit profile',
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Montserrat',
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).title3Family),
                          ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20.0,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
                Divider(
                  thickness: 2.0,
                ),
                InkWell(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Rate Us'),
                          content: Text('Not yet Published !'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ListTile(
                    title: Text(
                      'Rate Us',
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Montserrat',
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).title3Family),
                          ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20.0,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
                Divider(
                  thickness: 2.0,
                ),
                InkWell(
                  onTap: () async {
                    context.pushNamed('Login_page');
                  },
                  child: ListTile(
                    onTap: () async {
                      //Use this log out user
                      await logout();
                      FirebaseAuth.instance.signOut();
                      context.goNamed('Login_page');
                    },
                    title: Text(
                      'Sign out',
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: FlutterFlowTheme.of(context).title3Family,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).title3Family),
                          ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20.0,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
                Divider(
                  thickness: 2.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 268.0, 0.0, 0.0),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('Login_page');
                    },
                    child: ListTile(
                      onTap: (){
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      },
                      title: Text(
                        'Exit',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Montserrat',
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).title3Family),
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20.0,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF3382E2),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: width,
            height: height,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Text(
                    'Choose The Subject ',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyText1Family,
                          fontSize: 23.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 40.0, 30.0, 10.0),
                    child: Container(
                      child: GridView(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 5.0,
                          childAspectRatio: 1.0,
                        ),
                        scrollDirection: Axis.vertical,
                        children: [
                          for (var index = 0; index < subjectCount; index++)
                        Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                        0.0, 25.0, 0.0, 25.0),
                    child: FFButtonWidget(
                      text: subjects[index]['SName'] ?? '',
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  SubjectSettingPageWidget(subjectType: subjects[index]['SName'] ?? '')),
                        );
                      },
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
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap()
                              .containsKey(
                              FlutterFlowTheme.of(context)
                                  .subtitle2Family),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //google sing out service
  Future<void> logout() async {
    final GoogleSignIn googleSign = GoogleSignIn();
    await googleSign.signOut();
  }

  String imageUrl() {
    if((user?['ProfilePhoto'] ?? '').isEmpty){
      return "https://firebasestorage.googleapis.com/v0/b/ol-exam-paper-hub.appspot.com/o/profile_avatar.jpg?alt=media&token=910c2450-d12d-4ce9-b461-df6c113908b8";
    }else{
      return user?['ProfilePhoto'] ?? '';
    }
  }
}
