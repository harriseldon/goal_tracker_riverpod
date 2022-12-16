import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_tracker_riverpod/src/core/common_widgets/no_data_widget.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/goal_collection_manager.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/collection/collection_list_tile.dart';

class GoalDashboard extends ConsumerWidget {
  const GoalDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collections = ref.watch(goalCollectionManagerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Goal Collections'),
        actions: [
          IconButton(
            icon: const Icon(Icons.stars),
            onPressed: () {
              GoRouter.of(context).push('/words');
            },
          ),
          IconButton(
            icon: const Icon(Icons.tag),
            onPressed: () {
              GoRouter.of(context).push('/tags');
            },
          )
        ],
      ),
      body: collections.when(
        data: (goalCollections) {
          if (goalCollections.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,
                ),
                itemBuilder: (_, index) {
                  return CollectionListTile(collection: goalCollections[index]);
                },
                itemCount: goalCollections.length,
              ),
            );
          } else {
            return const NoDataWidget(itemType: 'goal collections');
          }
        },
        error: (error, stack) => Center(child: Text(error.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // final collectionManager = ref.read(collectionManagerProvider.future);
          // collectionManager.then(
          //   (manager) => manager.addCollection('Testing'),
          // );
          GoRouter.of(context).push('/collections/new');
        },
      ),
    );
  }
}
