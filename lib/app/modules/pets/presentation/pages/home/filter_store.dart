import 'package:flutter/material.dart';

class FilterStore extends ValueNotifier<int> {
  FilterStore() : super(0);

  setFilter(int v) => value = v;
}
