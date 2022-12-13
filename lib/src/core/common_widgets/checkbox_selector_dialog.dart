import 'package:flutter/material.dart';

class CheckBoxSelectorDialog extends StatefulWidget {
  const CheckBoxSelectorDialog({
    super.key,
    required this.dialogTitle,
    required this.items,
    this.controller,
  });
  final List<String> items;
  final Widget dialogTitle;
  final CheckboxSelectorController? controller;

  @override
  State<CheckBoxSelectorDialog> createState() => _CheckBoxSelectorDialogState();
}

class _CheckBoxSelectorDialogState extends State<CheckBoxSelectorDialog> {
  final List<String> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.dialogTitle,
      content: SingleChildScrollView(
          child: ListBody(
        children: widget.items
            .map((item) => CheckboxListTile(
                  title: Text(item),
                  value: _selectedItems.contains(item),
                  onChanged: (isSelected) => _itemSelected(item, isSelected!),
                  controlAffinity: ListTileControlAffinity.leading,
                ))
            .toList(),
      )),
      actions: [
        ElevatedButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Ok'),
        ),
      ],
    );
  }

  void _itemSelected(String item, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(item);
      } else {
        _selectedItems.remove(item);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    if (widget.controller != null) {
      widget.controller?.selectedItems.addAll(_selectedItems);
    }
    Navigator.pop(context, _selectedItems);
  }
}

@immutable
class CheckBoxValue {
  const CheckBoxValue({required this.selectedItems});

  final List<String> selectedItems;
}

class CheckboxSelectorController extends ValueNotifier<CheckBoxValue> {
  CheckboxSelectorController(super.value);

  List<String> get selectedItems => value.selectedItems;
}
