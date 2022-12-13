import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/tags/tag_chooser_widget.dart';

// String? title;

// String? description;

// String? measures;

// DateTime? startDate;

// DateTime? endDate;

// final tags = IsarLinks<Tag>();

class AddGoalPage extends ConsumerStatefulWidget {
  const AddGoalPage({super.key, required this.collectionId});
  final int collectionId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddGoalPageState();
}

class _AddGoalPageState extends ConsumerState<AddGoalPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final measuresController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  List<String> _selectedTags = [];

  @override
  Widget build(BuildContext context) {
    final currentCollection = ref.watch(currentCollectionProvider);

    final collectionName = currentCollection.when(
      data: (collection) => collection?.name,
      error: (_, __) => 'Unknown',
      loading: () => 'Loading ...',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding goal to $collectionName'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                ref.read(goalManagerProvider.future).then((manager) =>
                    manager.addGoal(titleController.text,
                        description: descriptionController.text,
                        tags: _selectedTags));
              }
            },
          )
        ],
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration:
                    const InputDecoration(hintText: 'Enter the goal title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Goals must have a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    hintText: 'Enter the goal description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Goals must have a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: measuresController,
                maxLines: 10,
                decoration: const InputDecoration(
                    hintText: 'Enter the success measures'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Goals must have a description';
                  }
                  return null;
                },
              ),
              TagChooserWidget(
                onTagAdded: (tags) {
                  _selectedTags =
                      tags.map<String>((tag) => tag.name ?? '').toList();
                },
              )
            ],
          )),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    measuresController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    // tagController.dispose();
    super.dispose();
  }
}
