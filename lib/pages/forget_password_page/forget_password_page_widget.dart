import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../login_page/login_page_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'forget_password_page_model.dart';
export 'forget_password_page_model.dart';
import 'package:material_dialogs/material_dialogs.dart';

class ForgetPasswordPageWidget extends StatefulWidget {
  const ForgetPasswordPageWidget({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageWidgetState createState() =>
      _ForgetPasswordPageWidgetState();
}

class _ForgetPasswordPageWidgetState extends State<ForgetPasswordPageWidget> {
  late ForgetPasswordPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final FirebaseAuth  _auth= FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  var _emailRedError= false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgetPasswordPageModel());

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
                            EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Image.asset(
                          'assets/images/forgetpassword-removebg-preview.png',
                          width: 220.0,
                          height: 211.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'Forget Password',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Montserrat',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context).bodyText1Family),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Container(
                            width: 348.3,
                            height: 350.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 30.0, 25.0, 0.0),
                                  child: Text(
                                    'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
                                    textAlign: TextAlign.justify,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: FlutterFlowTheme.of(context)
                                              .bodyText1Family,
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Text(
                                    'User Name',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: FlutterFlowTheme.of(context)
                                              .bodyText1Family,
                                          color: Color(0xFF1510EF),
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Visibility(
                                    visible: _emailRedError,
                                    child: Text(
                                      'Not valid user name',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: FlutterFlowTheme.of(context)
                                                .bodyText1Family,
                                            color: Color(0xFFFA0707),
                                            fontSize: 11.0,
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
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    width: 300.0,
                                    child: Autocomplete<String>(
                                      initialValue: TextEditingValue(),
                                      optionsBuilder: (textEditingValue) {
                                        if (textEditingValue.text == '') {
                                          return const Iterable<String>.empty();
                                        }
                                        return ['Option 1'].where((option) {
                                          final lowercaseOption =
                                              option.toLowerCase();
                                          return lowercaseOption.contains(
                                              textEditingValue.text
                                                  .toLowerCase());
                                        });
                                      },
                                      optionsViewBuilder:
                                          (context, onSelected, options) {
                                        return AutocompleteOptionsList(
                                          textFieldKey: _model.textFieldKey,
                                          textController: _model.textController!,
                                          options: options.toList(),
                                          onSelected: onSelected,
                                          textStyle: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                          textHighlightStyle: TextStyle(),
                                          elevation: 4.0,
                                          optionBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          optionHighlightColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          maxHeight: 200.0,
                                        );
                                      },
                                      onSelected: (String selection) {
                                        setState(() => _model
                                            .textFieldSelectedOption = selection);
                                        FocusScope.of(context).unfocus();
                                      },
                                      fieldViewBuilder: (
                                        context,
                                        textEditingController,
                                        focusNode,
                                        onEditingComplete,
                                      ) {
                                        _model.textController =
                                            textEditingController;
                                        return TextFormField(
                                          key: _model.textFieldKey,
                                          controller: _emailController,
                                          focusNode: focusNode,
                                          onEditingComplete: onEditingComplete,
                                          autofocus: false,
                                          autofillHints: [AutofillHints.email],
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Email / Mobile Number',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            filled: true,
                                            fillColor: Color(0xFFC0DDFF),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                          textAlign: TextAlign.center,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      var email = _emailController.text;
                                      setState(() {
                                        if (EmailValidator.validate(email) || email.length==10){
                                          _emailRedError=false;
                                          resetpasswordprocess(email);
                                        }else{
                                          _emailRedError=true;
                                        }
                                      });
                                    },
                                    text: 'Send Request',
                                    options: FFButtonOptions(
                                      width: 190.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF3382E2),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Montserrat',
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
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 40.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 25.0,
                          borderWidth: 2.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            context.pushNamed('Login_page');
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

  resetpasswordprocess(String email) async {
    try {
      await resetpassword(email);
      Dialogs.materialDialog(
          msg: 'Please Check Your Email !',
          title: "Reset Password",
          color: Colors.white,
          context: context,
          actions: [
            IconsOutlineButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'Cancel',
              color: Colors.red,
              iconData: Icons.cancel_outlined,
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
            IconsButton(
              onPressed: () {
                context.goNamed('Login_page');
              },
              text: 'Ok',
              iconData: Icons.tag_faces_rounded,
              color: Colors.green,
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]);
    }catch(error){
      AnimatedSnackBar.material(
        "Something went wrong. Please check your email and try again",
        type: AnimatedSnackBarType.error,
      ).show(context);
    }
  }

  Future<void> resetpassword(
      String email) async{
    await _auth.sendPasswordResetEmail(
      email: email,
    );
    //you can also store the user in Database
  }
}
