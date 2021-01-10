// import 'package:DreamsApp/widgets/card.dart';
import 'package:DreamsApp/Screens/save_share.dart';
import 'package:DreamsApp/fonts.dart';

import 'package:DreamsApp/widgets/card_based.dart';

import 'package:DreamsApp/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import '../widgets/color_dialog.dart';
import 'package:flutter/services.dart';
//import 'package:google_fonts/google_fonts.dart';

class EditingScreen extends StatefulWidget {
  @override
  _EditingScreenState createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  Color colorPicked = Color.fromRGBO(255, 247, 237, 1);
  Color textColorPicked = Color.fromRGBO(0, 0, 0, 1);
  String _text = "";
  TextStyle font = fonts[0];
  double textSize = 24.0;

  void onTextSizeChange(double value) {
    setState(() {
      this.textSize = value;
    });
  }

  void onFontChanged(TextStyle fontt) {
    setState(() {
      this.font = fontt;
    });
  }

  void textChanged(String changedText) {
    setState(() {
      this._text = changedText;
    });
  }

  void onColorChanged(val) {
    setState(() {
      colorPicked = val;
    });
  }

  void _onTextSettings(BuildContext context) {
    buildText(context, onFontChanged, textSize, onTextSizeChange);
  }

  Widget buildIcon(IconData icon, Function onPress) {
    return IconButton(
      icon: Icon(
        icon,
        size: 36.0,
      ),
      onPressed: onPress,
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildIcon(Icons.color_lens, () {
                buildDialogColor(context, colorPicked, onColorChanged);
              }),
              buildIcon(Icons.done, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SaveShare(
                            fieldText: _text,
                            fontFamily: font,
                            picked: colorPicked,
                            textSize: textSize)));
              }),
              buildIcon(Icons.text_format, () => _onTextSettings(context)),
            ],
          ),
          elevation: 10,
        ),
        body: CardBased(
          fieldText: _text,
          fontFamily: font,
          isTextField: true,
          ontextChanged: textChanged,
          picked: colorPicked,
          textSize: textSize,
        ));
  }
}
