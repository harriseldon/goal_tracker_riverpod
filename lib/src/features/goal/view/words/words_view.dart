import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/action_word_manager.dart';

class WordsView extends ConsumerWidget {
  const WordsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordsFuture = ref.watch(actionWordManagerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Action Words')),
      body: wordsFuture.when(
        data: (words) {
          //final words = manager.getActionWords();
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text('${words[index].word}'),
              subtitle: Text(
                '${words[index].wordType}',
              ),
            ),
            itemCount: words.length,
          );
        },
        error: (error, stackTrace) =>
            Center(child: Text('$error - ${stackTrace.toString()}')),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          GoRouter.of(context).push('/words/new');
        },
      ),
    );
  }
}
