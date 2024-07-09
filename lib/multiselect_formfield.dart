import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_dialog.dart';

class MultiSelectFormField extends FormField<dynamic> {
  final Widget hintWidget;
  final bool required;
  final String errorText;
  final List? dataSource;
  final String? textField;
  final String? valueField;
  final Color? fillColor;
  final TextStyle? chipLabelStyle;
  final Color? chipBackGroundColor;
  final TextStyle dialogTextStyle;
  final Color? checkColor;
  final Color? activeColor;
  final bool enabled;

  MultiSelectFormField({
    FormFieldSetter<dynamic>? onSaved,
    FormFieldValidator<dynamic>? validator,
    dynamic initialValue,
    AutovalidateMode autovalidate = AutovalidateMode.disabled,
    this.hintWidget = const Text('Выберите что-нибудь уже'),
    this.required = false,
    this.errorText = 'Заполните поле',
    this.dataSource,
    this.textField,
    this.valueField,
    this.fillColor,
    this.chipLabelStyle,
    this.enabled = true,
    this.chipBackGroundColor,
    this.dialogTextStyle = const TextStyle(),
    this.activeColor,
    this.checkColor,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidateMode: autovalidate,
          builder: (FormFieldState<dynamic> state) {
            List<String> _buildSelectedOptions(state) {
              final List<String> selectedOptions = [];
              if (state.value != null) {
                state.value.forEach((item) {
                  var existingItem = dataSource!.singleWhere(
                      ((itm) => itm[valueField] == item),
                      orElse: () => null);
                  selectedOptions.add(existingItem[textField]);
                });
              }
              return selectedOptions;
            }

            return InkWell(
              onTap: !enabled
                  ? null
                  : () async {
                      List? initialSelected = state.value;
                      initialSelected ??= [];

                      final items = <MultiSelectDialogItem<dynamic>>[];
                      dataSource!.forEach((item) {
                        items.add(MultiSelectDialogItem(
                            item[valueField], item[textField]));
                      });

                      List? selectedValues = await showModalBottomSheet<List>(
                        context: state.context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height*.6,
                            child: MultiSelectDialog(
                              items: items,
                              initialSelectedValues: initialSelected,
                              labelStyle: dialogTextStyle,
                              activeColor: activeColor,
                              checkColor: checkColor,
                            ),
                          );
                        },
                      );

                      if (selectedValues != null) {
                        state.didChange(selectedValues);
                        state.save();
                      }
                    },
              child: InputDecorator(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.blue)),
                  filled: true,
                  errorText: state.hasError ? state.errorText : null,
                  errorMaxLines: 4,
                  fillColor: fillColor ?? Theme.of(state.context).canvasColor,
                ),
                isEmpty: state.value == null || state.value == '',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    state.value != null && state.value.length > 0
                        ? Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: //_buildSelectedOptions(state),
                                _buildSelectedOptions(state)
                                    .map((e) => Chip(
                                          labelStyle: chipLabelStyle,
                                          backgroundColor: chipBackGroundColor,
                                          deleteIcon:
                                              const Icon(CupertinoIcons.clear),
                                          onDeleted: () {
                                            List<dynamic> newItems = [];
                                            newItems.addAll(state.value);
                                            newItems.removeWhere(
                                                (element) => element == e);
                                            print(newItems);
                                            state.didChange(newItems);
                                            state.save();
                                          },
                                          label: Text(
                                            e,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                          )
                        : Container(
                            padding: const EdgeInsets.only(top: 4),
                            child: hintWidget,
                          )
                  ],
                ),
              ),
            );
          },
        );
}
