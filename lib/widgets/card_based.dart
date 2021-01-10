import 'package:flutter/material.dart';

class CardBased extends StatelessWidget {
  final Color picked;

  final double textSize;
  final Function ontextChanged;
  final String fieldText;
  final TextStyle fontFamily;
  final bool isTextField;
  CardBased(
      {this.fontFamily,
      this.fieldText,
      this.ontextChanged,
      this.textSize,
      this.picked,
      this.isTextField});
  @override
  Widget build(BuildContext context) {
    int maxLength = estimateLength(textSize, fieldText);
    return Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: picked,
        child: (isTextField) ? buildTextField(maxLength) : buildText());
  }

  Widget buildTextField(int maxLength) {
    return TextFormField(
      initialValue: fieldText,
      decoration: InputDecoration(
          border: InputBorder.none, counterText: fieldText.length.toString()),
      maxLines: 100,
      maxLength: maxLength,
      style: TextStyle(
          height: fontFamily.height,
          fontFamily: fontFamily.fontFamily,
          fontSize: textSize),
      onChanged: ontextChanged,
    );
  }

  Widget buildText() {
    return Text(
      fieldText,
      style: TextStyle(
          fontFamily: fontFamily.fontFamily,
          fontSize: textSize,
          height: fontFamily.height),
    );
  }

  int estimateLength(double textSize, String fieldText) {
    final numLines = '\n'.allMatches(fieldText).length + 1;
    if (numLines > 15 && textSize > 30) return 100;
    if (numLines < 23 && textSize < 30) return 500;
  }
}
