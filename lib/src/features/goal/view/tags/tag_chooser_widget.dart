import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
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
    return ChipsInput(
      decoration: const InputDecoration(
        labelText: "Select Tags",
      ),
      maxChips: 3,
      findSuggestions: (String query) async {
        if (query.isNotEmpty) {
          ref.read(tagStartsWithProvider.notifier).state = query;

          final tagData = await ref.read(tagCollectionManagerProvider.future);

          return tagData;
        } else {
          return const <Tag>[];
        }
      },
      onChanged: (data) => onTagAdded,
      chipBuilder: (context, state, tag) {
        return InputChip(
          key: ObjectKey(tag),
          label: Text('${tag.name}'),
          onDeleted: () => state.deleteChip(tag),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      },
      suggestionBuilder: (context, state, tag) {
        return ListTile(
          key: ObjectKey(tag),
          //
          title: Text('{$tag.name}'),
          //subtitle: Text(profile.email),
          onTap: () => state.selectSuggestion(tag),
        );
      },
    );

    // final tags = ref.watch(tagCollectionManagerProvider);

    // return tags.when(
    //   data: (tags) => ChipsInput<Tag>(
    //     //initialValue: tags,
    //     //controller: chipsController,

    //     findSuggestions: (query) {
    //       ref.read(tagStartsWithProvider.notifier).state = query;

    //       return tags;
    //     },
    //     suggestionBuilder: (context, state, data) {
    //       final backgroundColor = Color(int.parse(data.rawColor ?? '0'));
    //       return Chip(
    //         label: Text(
    //           '${data.name}',
    //           style: TextStyle(
    //               color: ColorConversions.getOptimalTextColor(
    //                   backgroundColor: backgroundColor)),
    //         ),
    //         backgroundColor: backgroundColor,
    //       );
    //     },
    //     chipBuilder: (context, state, tag) {
    //       final backgroundColor = Color(int.parse(tag.rawColor ?? '0'));
    //       // return Text(
    //       //   '${tag.name}',
    //       // );
    //       return InputChip(
    //         key: ObjectKey(tag),
    //         label: Text(
    //           '${tag.name}',
    //           style: TextStyle(
    //             color: ColorConversions.getOptimalTextColor(
    //               backgroundColor: backgroundColor,
    //             ),
    //           ),
    //         ),
    //         //backgroundColor: backgroundColor,
    //         onDeleted: () => state.deleteChip(tag),
    //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //       );
    //     },
    //     onChanged: (tags) {
    //       if (onTagAdded != null) {
    //         onTagAdded!(tags);
    //       }
    //     },
    //   ),
    //   loading: (() => const CircularProgressIndicator()),
    //   error: ((error, stackTrace) => Text('$error $stackTrace')),
    // );
  }
}


    // final tags = ref.watch(tagsProvider);

    // return tags.when(
    //   data: (tagList) {
    //     return CheckBoxSelectorDialog(
    //       dialogTitle: const Text('Choose a Tag'),
    //       items: tagList.map<String>((e) => e.name ?? '').toList(),
    //       controller: controller,
    //     );
    //   },
    //   error: (err, trace) => const Text('Unable to load tags'),
    //   loading: () => const CircularProgressIndicator(),
    // );