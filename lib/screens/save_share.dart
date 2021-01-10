import 'dart:convert';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui';
import 'dart:io';
import 'package:DreamsApp/widgets/card_based.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';
import 'package:screenshot/screenshot.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';

class SaveShare extends StatefulWidget {
  final Color picked;
  final double textSize;
  final String fieldText;
  final TextStyle fontFamily;
  SaveShare({this.fieldText, this.fontFamily, this.picked, this.textSize});
  @override
  _SaveShareState createState() => _SaveShareState();
}

class _SaveShareState extends State<SaveShare> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ScreenshotController screenshotController = ScreenshotController();
  GlobalKey imageKey = GlobalKey();
  String path;

  void onSaveGallery() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    RenderRepaintBoundary imageObject =
        imageKey.currentContext.findRenderObject();
    final image = await imageObject.toImage(pixelRatio: 2);
    ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngBytes = await byteData.buffer.asUint8List();
    final str = randomString(10);
    var file = File("/storage/emulated/0/DCIM/Camera/$str.png");
    await file.writeAsBytes(pngBytes);
    //   path = '/storage/emulated/0/DCIM/Camera/indhu.jpg';

    //   screenshotController.capture(path: path).then((File image) async {
    //     final result = await ImageGallerySaver.saveImage(
    //       image.readAsBytesSync(),
    //     );
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text("File Saved to Gallery")));
  }

  void onSave() async {
    final str = randomAlphaNumeric(7);
    RenderRepaintBoundary imageObject =
        imageKey.currentContext.findRenderObject();
    final image = await imageObject.toImage(pixelRatio: 2);
    ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngBytes = await byteData.buffer.asUint8List();
    final base64 = base64Encode(pngBytes);
    await Share.file('esys image', '$str.png', pngBytes, 'image/png',
        text: 'My optional text.');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.save,
                    size: 34,
                  ),
                  onPressed: onSaveGallery,
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    size: 34,
                  ),
                  onPressed: onSave,
                )
              ],
            ),
          ),
        ),
        body: Center(
            child: RepaintBoundary(
          key: imageKey,
          child: CardBased(
            fieldText: widget.fieldText,
            fontFamily: widget.fontFamily,
            isTextField: false,
            picked: widget.picked,
            textSize: widget.textSize,
            ontextChanged: null,
          ),
        )));
  }
}
