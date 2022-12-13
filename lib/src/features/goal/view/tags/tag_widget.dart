import 'package:flutter/material.dart';
import 'package:goal_tracker_riverpod/src/core/utils/change_color_dialog.dart';
import 'package:ndialog/ndialog.dart';

class TagWidget extends StatelessWidget {
  const TagWidget(
      {super.key, required this.currentColor, required this.onColorChanged});
  final Color currentColor;
  final OnColorChangedFunction onColorChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: currentColor,
        ),
      ),
      onTap: () {
        // open a color picker and change the color of this tag
        NDialog(
          title: const Text('Choose a color'),
          content: (ChangeColorDialog(
              startingColor: currentColor, onColorChanged: onColorChanged)),
          actions: [
            TextButton(
                child: const Text("Ok"),
                onPressed: () => Navigator.pop(context)),
          ],
        ).show(context);
      },
    );
  }
}
