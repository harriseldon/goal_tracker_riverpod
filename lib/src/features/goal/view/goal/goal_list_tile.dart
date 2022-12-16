import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal.dart';

class GoalListTile extends ConsumerWidget {
  const GoalListTile({super.key, required this.goal});
  final Goal goal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text('${goal.title}'),
      subtitle: Text('${goal.description}'),
      trailing: Text(
          '${goal.startDate ?? 'not specified'}-${goal.endDate ?? 'not specified'}'),
      onTap: () {
        // set the current goal
        ref.read(currentGoalIdProvider.notifier).state = goal.id;
        //navigation to goals page
      },
    );
  }
}
