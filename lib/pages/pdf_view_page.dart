import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';



class PdfViewPageWidget extends StatefulWidget {
  final link;
  final year;
  const PdfViewPageWidget(String this.link, String this.year, {Key? key}) : super(key: key);

  @override
  _PdfViewPageWidgetState createState() => _PdfViewPageWidgetState(link,year);
}

class _PdfViewPageWidgetState extends State<PdfViewPageWidget> {

  _PdfViewPageWidgetState(this.link, this.year);
  final String link;
  final String year;


  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  PdfViewerController? _pdfViewerController;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  void dispose() {

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF3382E2),
      appBar: AppBar(
        backgroundColor: Color(0xFF3382E2),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          year,
          style: FlutterFlowTheme.of(context).title2.override(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 22,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).title2Family),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerController?.previousPage();
            },
          ),
          // Text(_pdfViewerController?.pageNumber as String ),
          // Text(_pdfViewerController?.pageCount as String),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerController?.nextPage();
            },
          )
        ],
        centerTitle: true,
        elevation: 2,
      ),
      body:  Container(
    child: SfPdfViewer.network(
        link,
        enableDoubleTapZooming: true,
      controller: _pdfViewerController,
    ))
    );
  }
}
