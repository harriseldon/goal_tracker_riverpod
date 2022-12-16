import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_tracker_riverpod/src/core/utils/color_conversions.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal_collection.dart';

class CollectionListTile extends ConsumerWidget {
  const CollectionListTile({super.key, required this.collection});
  final GoalCollection collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = collection.tags;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            ...tags.map<Color>(
                (tag) => ColorConversions.getFromString(tag.rawColor)),
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorLight,
          ], transform: const GradientRotation(1))),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        style: ListTileStyle.drawer,
        title: Text(
          collection.name,
          style: Theme.of(context).textTheme.headline4,
        ),
        tileColor: Colors.transparent,
        trailing: Wrap(
          children: tags
              .map<Widget>(
                (tag) => Chip(
                  label: Text('${tag.name}',
                      style: TextStyle(
                        color: ColorConversions.getOptimalTextColor(
                          backgroundColor:
                              ColorConversions.getFromString(tag.rawColor),
                        ),
                      )),
                  backgroundColor: ColorConversions.getFromString(tag.rawColor),
                ),
              )
              .toList(),
        ),
        onTap: () {
          ref.read(currentCollectionIdProvider.notifier).state = collection.id;
          GoRouter.of(context).push('/collections/${collection.id}');
        },
      ),
    );
  }
}
