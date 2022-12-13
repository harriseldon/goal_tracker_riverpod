import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_tracker_riverpod/src/core/utils/color_conversions.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';

import 'package:goal_tracker_riverpod/src/features/goal/view/tags/tag_widget.dart';

class TagsView extends ConsumerWidget {
  const TagsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagsFuture = ref.watch(tagsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tags'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              GoRouter.of(context).push('/tags/new');
            },
          )
        ],
      ),
      body: tagsFuture.when(
        data: (tags) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final tagColor =
                    ColorConversions.getFromString(tags[index].rawColor);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tags[index].name ?? 'unknown',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    TagWidget(
                        currentColor: tagColor,
                        onColorChanged: (newColor) {
                          ref
                              .read(tagCollectionManagerProvider.future)
                              .then((manager) {
                            manager.changeTagColor(tags[index].id,
                                newColor: newColor);
                          });
                        }),
                  ],
                );
              },
              separatorBuilder: (_, __) => const Divider(
                    height: 5,
                    color: Colors.grey,
                  ),
              itemCount: tags.length);
        },
        error: (err, trace) => Center(child: Text('$err\n${trace.toString()}')),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
