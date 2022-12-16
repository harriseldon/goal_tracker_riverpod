import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, required this.itemType});
  final String itemType;

  @override
  Widget build(Object context) {
    return Center(
      child: Text('No $itemType exist yet.'),
    );
  }
}
