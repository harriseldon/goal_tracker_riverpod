import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/collection/add_collection_page.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/goal/add_goal_page.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/goal/goals_view.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/goal_dashboard.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/tags/add_tag_page.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/tags/tags_view.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/words/add_word_page.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/words/words_view.dart';

final goalRouter = GoRouter(initialLocation: '/collections', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const GoalDashboard(),
  ),
  GoRoute(
    path: '/collections',
    builder: (context, state) => const GoalDashboard(),
  ),
  GoRoute(
    path: '/collections/new',
    builder: (context, state) => const AddCollectinPage(),
  ),
  GoRoute(
    path: '/collections/:collectionId',
    builder: (context, state) => GoalsView(
      collectionId: int.parse(state.params['collectionId'] ?? '0'),
    ),
  ),
  GoRoute(
    path: '/collections/:collectionId/goals/new',
    builder: (context, state) => AddGoalPage(
      collectionId: int.parse(
        state.params['collectionId'] ?? '0',
      ),
    ),
  ),
  GoRoute(
    path: '/tags',
    builder: (context, _) => const TagsView(),
  ),
  GoRoute(
    path: '/tags/new',
    builder: (context, state) => const AddTagPage(),
  ),
  GoRoute(
    path: '/words',
    builder: (context, _) => const WordsView(),
  ),
  GoRoute(
    path: '/words/new',
    builder: (context, _) => const AddWordPage(),
  ),
]);
