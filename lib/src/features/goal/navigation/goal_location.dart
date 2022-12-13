/* import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/goal/goals_view.dart';

import 'package:goal_tracker_riverpod/src/features/goal/view/goal_dashboard.dart';

class GoalLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('collections'),
          child: GoalDashboard(),
        ),
        if (state.uri.pathSegments.contains('collections'))
          const BeamPage(
            key: ValueKey('collections'),
            child: GoalDashboard(),
          ),
        if (state.pathParameters.containsKey('collectionId'))
          BeamPage(
            key: ValueKey("colletion-${state.pathParameters['collectionId']}"),
            child: GoalsView(
              key: ValueKey(
                  "colletion-${state.pathParameters['collectionId']}-view"),
              collectionId: int.parse(state.pathParameters['collectionId']!),
            ),
          ),
      ];

  @override
  List<Pattern> get pathPatterns => [
        'collections/:collectionId',
        'collections/:collectionId/goals/:goalId',
        'collection/:collectionId/goals/:goalId/progress/',
        'collection/:collectionId/goals/:goalId/progress/:progressId'
      ];
}
 */