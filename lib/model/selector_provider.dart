import 'package:flutter/material.dart';

class SelectorProvider<T extends Object> extends ChangeNotifier{
  List<T> _selectedItems=[];

  List<T> get selectedItems => _selectedItems;

  void add(T item){
    _selectedItems.add(item);
    notifyListeners();
  }
  void remove(T item){
    _selectedItems.remove(item);
    notifyListeners();
  }
}