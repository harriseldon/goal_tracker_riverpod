import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_tracker_riverpod/src/core/common_widgets/no_data_widget.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/goal_manager.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/goal/goal_list_tile.dart';

class GoalsView extends ConsumerWidget {
  const GoalsView({super.key, required this.collectionId});
  final int collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCollectionId = ref.watch(currentCollectionIdProvider);
    if (collectionId != currentCollectionId) {
      ref.read(currentCollectionIdProvider.notifier).state = collectionId;
    }

    final currentCollection = ref.watch(currentCollectionProvider);

    final collectionName = currentCollection.when(
      data: (collection) => collection?.name,
      error: (_, __) => 'Unknown',
      loading: () => 'Loading ...',
    );

    final goals = ref.watch(goalManagerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Goals $collectionName'),
      ),
      body: goals.when(
          data: (goalList) {
            if (goalList.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (goalContext, goalIndex) {
                  final goal = goalList[goalIndex];
                  return GoalListTile(goal: goal);
                },
                itemCount: goalList.length,
              );
            } else {
              return const NoDataWidget(itemType: 'goals');
            }
          },
          error: (error, stackTrace) =>
              Center(child: Text('$error: $stackTrace')),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          GoRouter.of(context).push('/collections/$collectionId/goals/new');
        },
      ),
    );
  }
}
