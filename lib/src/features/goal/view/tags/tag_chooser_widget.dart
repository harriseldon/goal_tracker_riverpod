import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goal_tracker_riverpod/src/core/utils/color_conversions.dart';

import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/tag_collection_manager.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';

typedef OnTagAdded = void Function(List<Tag> tags);

class TagChooserWidget extends ConsumerWidget {
  const TagChooserWidget({super.key, this.onTagAdded});
  final OnTagAdded? onTagAdded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownSearch<Tag>.multiSelection(
      itemAsString: (tag) => tag.name ?? '',
      asyncItems: (text) async {
        ref.read(tagStartsWithProvider.notifier).state = text;

        return ref.watch(tagCollectionManagerProvider.future);
      },
      popupProps: PopupPropsMultiSelection.dialog(
        title: const Text('Choose a tag', style: TextStyle(fontSize: 20)),
        itemBuilder: _tagBuilder,
      ),
      onChanged: onTagAdded,
      compareFn: ((item1, item2) => item1.id == item2.id),
    );
  }

  Widget _tagBuilder(BuildContext context, Tag tag, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.green,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(tag.name ?? ''),
        //subtitle: Text(item?.createdAt?.toString() ?? ''),
        leading: CircleAvatar(
          backgroundColor: ColorConversions.getFromString(tag.rawColor),
        ),
      ),
    );
  }
}
