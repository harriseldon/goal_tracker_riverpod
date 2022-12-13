import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';

class WordsView extends ConsumerWidget {
  const WordsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordsFuture = ref.watch(actionWordManagerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Action Words')),
      body: wordsFuture.when(
        data: (manager) {
          final words = manager.getActionWords();
          return FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      title: Text('${snapshot.data![index].word}'),
                      subtitle: Text(
                        '${snapshot.data![index].wordType}',
                      ),
                    ),
                    itemCount: snapshot.data!.length,
                  );
                } else {
                  return Container();
                }
              },
              future: words);
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
