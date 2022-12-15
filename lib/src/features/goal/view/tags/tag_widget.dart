import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goal_tracker_riverpod/src/core/utils/color_conversions.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/tag_collection_manager.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/tags/tag_color_widget.dart';

class TagWidget extends ConsumerWidget {
  const TagWidget({super.key, required this.tag});
  final Tag tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagColor = ColorConversions.getFromString(tag.rawColor);
    return ListTile(
      title: Text(
        tag.name ?? 'unknown',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      trailing: TagColorWidget(
          currentColor: tagColor,
          onColorChanged: (newColor) {
            ref
                .read(tagCollectionManagerProvider.notifier)
                .changeTagColor(tag.id, newColor: newColor);
          }),
    );
  }
}
