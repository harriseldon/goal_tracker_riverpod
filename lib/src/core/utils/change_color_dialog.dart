import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

typedef OnColorChangedFunction = void Function(Color color);

class ChangeColorDialog extends StatelessWidget {
  const ChangeColorDialog({
    super.key,
    required this.startingColor,
    required this.onColorChanged,
  });

  final Color startingColor;
  final OnColorChangedFunction onColorChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ColorPicker(
          pickerColor: startingColor,
          onColorChanged: onColorChanged,
        ),
      ),
    );
  }
}
