import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/action_word_manager.dart';

import 'package:goal_tracker_riverpod/src/features/goal/model/action_word.dart';

class AddWordPage extends StatefulWidget {
  const AddWordPage({super.key});

  @override
  State<AddWordPage> createState() => _AddWordPageState();
}

class _AddWordPageState extends State<AddWordPage> {
  final wordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ActionWordType wordType = ActionWordType.undefined;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add a word'),
            actions: [
              IconButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ref
                          .read(actionWordManagerProvider.notifier)
                          .addActionWord(
                              actionWord: wordController.text,
                              actionWordType: wordType);

                      Navigator.of(context).pop();
                    }
                  },
                  icon: const Icon(Icons.save))
            ],
          ),
          body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  TextFormField(
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an action word';
                      } else {
                        return null;
                      }
                    }),
                    controller: wordController,
                    decoration: const InputDecoration(
                        hintText: 'Enter an action word',
                        icon: Icon(Icons.abc)),
                  ),
                  DropdownButtonFormField<ActionWordType>(
                      onChanged: ((value) {
                        setState(() {
                          wordType = value ?? ActionWordType.undefined;
                        });
                      }),
                      items: ActionWordType.values
                          .map<DropdownMenuItem<ActionWordType>>((wType) {
                        switch (wType) {
                          case ActionWordType.undefined:
                            return const DropdownMenuItem(
                              value: ActionWordType.undefined,
                              child: Text('Undefined'),
                            );

                          case ActionWordType.leadership:
                            return const DropdownMenuItem(
                              value: ActionWordType.leadership,
                              child: Text('Leadership'),
                            );
                          case ActionWordType.management:
                            return const DropdownMenuItem(
                              value: ActionWordType.management,
                              child: Text('Management'),
                            );
                          case ActionWordType.coordination:
                            return const DropdownMenuItem(
                              value: ActionWordType.coordination,
                              child: Text('Coordination'),
                            );
                          case ActionWordType.teamwork:
                            return const DropdownMenuItem(
                              value: ActionWordType.teamwork,
                              child: Text('Teamwork'),
                            );
                        }
                      }).toList()),
                ],
              ))),
        );
      }),
    );
  }

  @override
  void dispose() {
    wordController.dispose();
    super.dispose();
  }
}
