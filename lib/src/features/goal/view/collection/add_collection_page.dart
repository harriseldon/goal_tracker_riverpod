import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_tracker_riverpod/src/core/utils/color_conversions.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/goal_collection_manager.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/tags/tag_chooser_widget.dart';
import 'package:isar/isar.dart';

class AddCollectinPage extends ConsumerStatefulWidget {
  const AddCollectinPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddCollectinPageState();
}

class _AddCollectinPageState extends ConsumerState<AddCollectinPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  List<String> _selectedTags = [];
  //final chipsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Collection'),
        actions: [
          IconButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ref
                      .read(goalCollectionManagerProvider.notifier)
                      .addCollection(nameController.text, tags: _selectedTags);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Collection Saved')),
                  );
                  GoRouter.of(context).pop();
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: 'Collection Name', icon: Icon(Icons.text_snippet)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Collections must have a name';
                }
                return null;
              },
            ),
            TagChooserWidget(
              onTagAdded: (tags) {
                setState(() {
                  _selectedTags =
                      tags.map<String>((tag) => tag.name ?? '').toList();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    //chipsController.dispose();
    super.dispose();
  }
}
