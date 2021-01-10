import 'package:flutter/material.dart';

class SliderWid extends StatefulWidget {
  double initialVal = 20.0;
  final Function onChange;
  SliderWid({this.initialVal, this.onChange});

  @override
  _SliderWidState createState() => _SliderWidState();
}

class _SliderWidState extends State<SliderWid> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.blue,
        inactiveTrackColor: Colors.blue,
        trackShape: RectangularSliderTrackShape(),
        trackHeight: 7.0,
        thumbColor: Colors.blueAccent,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayColor: Colors.red.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
      ),
      child: Column(
        children: [
          Container(
            width: 250,
            child: Slider(
              value: widget.initialVal,
              onChanged: (value) {
                setState(() {
                  widget.initialVal = value;
                  widget.onChange(value);
                });
              },
              min: 20,
              max: 60,
              divisions: 12,
              activeColor: Colors.pink[200],
              inactiveColor: Colors.pink[50],
            ),
          ),
        ],
      ),
    );
  }
}
