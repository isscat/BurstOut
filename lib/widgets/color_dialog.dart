import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void buildDialogColor(
    BuildContext context, Color colorPicked, Function onChange) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(60.0))),
        child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(60.0))),
            content: SingleChildScrollView(
                child: ColorPicker(
              colorPickerWidth: 300.0,
              pickerAreaHeightPercent: 0.7,
              pickerAreaBorderRadius: BorderRadius.all(Radius.circular(60.0)),
              pickerColor: colorPicked,
              enableAlpha: true,
              paletteType: PaletteType.hsl,
              displayThumbColor: true,
              onColorChanged: (val) => onChange(val),
            ))),
      );
    },
  );
}
