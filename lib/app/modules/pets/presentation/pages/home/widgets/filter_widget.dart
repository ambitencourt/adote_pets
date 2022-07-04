import 'package:flutter/material.dart';

import 'option_widget.dart';

class FilterWidget extends StatelessWidget {
  final ValueChanged<int?> onChanged;
  final int groupValue;
  const FilterWidget({
    super.key,
    required this.onChanged,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OptionWidget(
          value: 0,
          onChanged: onChanged,
          groupValue: groupValue,
        ),
        OptionWidget(
          value: 1,
          onChanged: onChanged,
          groupValue: groupValue,
        ),
        OptionWidget(
          value: 2,
          onChanged: onChanged,
          groupValue: groupValue,
        ),
      ],
    );
  }
}
