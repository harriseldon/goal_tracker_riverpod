import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';

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

    final goals = ref.watch(goalsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Goals $collectionName'),
      ),
      body: goals.when(
          data: (goalList) {
            return ListView.builder(
              itemBuilder: (goalContext, goalIndex) {
                final goal = goalList[goalIndex];
                return ListTile(
                  title: Text('${goal.title}'),
                  subtitle: Text('${goal.description}'),
                  trailing: Text('${goal.startDate}-${goal.endDate}'),
                  onTap: () {
                    // set the current goal
                    ref.read(currentGoalIdProvider.notifier).state = goal.id;
                    //navigation to goals page
                  },
                );
              },
              itemCount: goalList.length,
            );
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
