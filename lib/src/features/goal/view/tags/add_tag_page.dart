import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/tag_collection_manager.dart';

import 'package:goal_tracker_riverpod/src/features/goal/view/tags/add_tag_popup.dart';

class AddTagPage extends ConsumerWidget {
  const AddTagPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a tag'),
      ),
      body: AddTagPopup(onTagAdded: (newTag, {Color? color}) {
        ref
            .read(tagCollectionManagerProvider.notifier)
            .addTag(name: newTag, color: color);
      }),
    );
  }
}
