import 'package:flutter/material.dart';
import '../fonts.dart';
import './slider.dart';

Widget buildIcon(IconData icon, Function onPress) {
  return IconButton(
      icon: Icon(
        icon,
        size: 30,
      ),
      onPressed: onPress);
}

void buildText(BuildContext context, Function onSelected, double sliderInVal,
    Function onTextChange) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60.0),
                topRight: Radius.circular(60.0))),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 200,
            child: Column(
              children: <Widget>[
                buildRow(onTextChange, sliderInVal),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return buildCard(fonts[index], onSelected);
                    },
                    itemCount: fonts.length,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget buildCard(TextStyle font, Function onSelected) {
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
    elevation: 1,
    child: ListTile(
      onTap: () {
        onSelected(font);
      },
      title: Center(
        child: Text("You're your own healer",
            style: TextStyle(fontFamily: font.fontFamily, fontSize: 24)),
      ),
    ),
  );
}

Widget buildRow(Function onTextSizeChange, double value) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SliderWid(
          initialVal: value,
          onChange: onTextSizeChange,
        ),
      ],
    ),
  );
}
