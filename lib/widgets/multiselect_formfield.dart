import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/model/selector_provider.dart';
import 'package:multiselect_formfield/widgets/multiselect_dialog.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class MultiSelectFormField<T extends Object> extends StatelessWidget {
  final Widget hintWidget;
  final bool required;
  final String errorText;
  final List<T>? dataSource;
  final Color? fillColor;
  final TextStyle? chipLabelStyle;
  final Color? chipBackGroundColor;
  final TextStyle dialogTextStyle;
  final Color? checkColor;
  final Color? activeColor;

  const MultiSelectFormField({
    super.key,
    this.hintWidget = const Text('Выберите что-нибудь уже'),
    this.required = false,
    this.errorText = 'Заполните поле',
    this.dataSource,
    this.fillColor,
    this.chipLabelStyle,
    this.chipBackGroundColor,
    this.dialogTextStyle = const TextStyle(),
    this.activeColor,
    this.checkColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        List<T>? initialSelected = [];

        await showModalBottomSheet<List>(
          context: context,
          isScrollControlled: true,
          shape: const ContinuousRectangleBorder(),
          builder: (BuildContext ctx) {
            return ChangeNotifierProvider<SelectorProvider>.value(
              value: context.read<SelectorProvider>(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: MultiSelectDialog<T>(
                  items: dataSource,
                  initialSelectedValues: initialSelected,
                  labelStyle: dialogTextStyle,
                  activeColor: activeColor,
                  checkColor: checkColor,
                ),
              ),
            );
          },
        );
      },
      child: InputDecorator(
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        child: Consumer<SelectorProvider>(builder: (context, items, _) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                items.selectedItems.isNotEmpty
                    ? Wrap(
                  spacing: 28.0,
                  runSpacing: 8.0,
                  children: items.selectedItems
                      .map(
                        (e) => Container(
                      decoration: BoxDecoration(
                        color: kDropdownMenuFillBackground,
                        borderRadius: kDropdownMenuBorderRadius,
                        border: Border.all(color: kDropdownMenuBorder),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(e.toString()),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () {
                              items.remove(e);
                            },
                            icon: const Icon(CupertinoIcons.clear),
                          ),
                        ],
                      ),
                    ),
                  )
                      .toList(),
                )
                    : Container(
                  padding: const EdgeInsets.only(top: 4),
                  child: hintWidget,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
