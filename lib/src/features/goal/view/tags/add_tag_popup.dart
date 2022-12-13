import 'package:flutter/material.dart';
import 'package:goal_tracker_riverpod/src/features/goal/view/tags/tag_widget.dart';

typedef OnStringAdded = void Function(String name, {Color? color});

class AddTagPopup extends StatefulWidget {
  const AddTagPopup({super.key, required this.onTagAdded});
  final OnStringAdded onTagAdded;
  @override
  State<AddTagPopup> createState() => _AddTagPopupState();
}

class _AddTagPopupState extends State<AddTagPopup> {
  final _formKey = GlobalKey<FormState>();
  late Color _chosenColor;
  String? _tagName;

  @override
  void initState() {
    _chosenColor = Colors.black;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        TextFormField(
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Tags must have a name';
            }
            return null;
          },
          decoration: const InputDecoration(
              hintText: 'Tag Name', icon: Icon(Icons.abc)),
          onSaved: (newTag) {
            setState(() {
              _tagName = newTag;
            });
          },
        ),
        TagWidget(
            currentColor: _chosenColor,
            onColorChanged: (newColor) {
              setState(() {
                _chosenColor = newColor;
              });
            }),
        IconButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
              widget.onTagAdded(_tagName ?? 'unknown', color: _chosenColor);
            }
          },
          icon: const Icon(Icons.save),
        ),
      ]),
    );
  }
}
