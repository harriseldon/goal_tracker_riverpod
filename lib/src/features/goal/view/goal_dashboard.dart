import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_tracker_riverpod/src/core/utils/color_conversions.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal_collection.dart';

class GoalDashboard extends ConsumerWidget {
  const GoalDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collections = ref.watch(collectionsProvider);

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
                final tags = goalCollections[index].tags;

                return Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Theme.of(context).primaryColorLight,
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColorDark
                  ], transform: const GradientRotation(1))),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    style: ListTileStyle.drawer,
                    title: Text(
                      goalCollections[index].name,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    tileColor: Colors.transparent,
                    trailing: Wrap(
                      children: tags
                          .toList()
                          .map<Widget>((tag) => Chip(
                                label: Text('${tag.name}'),
                                backgroundColor:
                                    ColorConversions.getOptimalTextColor(
                                        backgroundColor:
                                            ColorConversions.getFromString(
                                                tag.rawColor)),
                              ))
                          .toList(),
                    ),
                    onTap: () {
                      ref.read(currentCollectionIdProvider.notifier).state =
                          goalCollections[index].id;
                      GoRouter.of(context)
                          .push('/collections/${goalCollections[index].id}');
                    },
                  ),
                );
              },
              itemCount: goalCollections.length,
            ),
          );
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
