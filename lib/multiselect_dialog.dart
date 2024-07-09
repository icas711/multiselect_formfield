import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String? label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  final List<MultiSelectDialogItem<V>>? items;
  final List<V>? initialSelectedValues;
  final Widget? title;
  final TextStyle labelStyle;
  final Color? checkColor;
  final Color? activeColor;

  const MultiSelectDialog(
      {Key? key,
      this.items,
      this.initialSelectedValues,
      this.title,
      this.labelStyle = const TextStyle(),
      this.activeColor,
      this.checkColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = <V>[];

  //late final _selectedValues;
  @override
  void initState() {
    //_selectedValues=context.read<SelectedOptions>();
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues!);
    }
  }

  void _onItemCheckedChange(V itemValue, bool? checked) {
    setState(() {
      if (checked!) {
        _selectedValues.remove(itemValue);
      } else {
        _selectedValues.add(itemValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListTileTheme(
        contentPadding: const EdgeInsets.fromLTRB(24, 0, 36, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: ListBody(
            children: widget.items!.map(_buildItem).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(12),
              color: checked ? widget.activeColor : widget.checkColor),
          child: Text(
            item.label!,
            style: widget.labelStyle,
          ),
          //onChanged: (checked) => _onItemCheckedChange(item.value, checked),
        ),
        onTap: () {
          _onItemCheckedChange(item.value, checked);
          Navigator.pop(context, _selectedValues);
        },
      ),
    );
  }
}
