import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/tag_collection_manager.dart';

import 'package:goal_tracker_riverpod/src/features/goal/view/tags/tag_widget.dart';

class TagsView extends ConsumerWidget {
  const TagsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagsFuture = ref.watch(tagCollectionManagerProvider);

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
                return TagWidget(tag: tags[index]);
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
