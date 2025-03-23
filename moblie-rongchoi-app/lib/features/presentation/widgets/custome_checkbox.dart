import 'package:flutter/material.dart';

class CustomeCheckbox extends StatelessWidget {
  const CustomeCheckbox({super.key, required this.onChanged, required this.value});

  final Function(bool?)? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    
    return Checkbox(
      checkColor: Colors.white,
      fillColor: WidgetStateProperty.resolveWith(getColor),
      value: this.value,
      onChanged: onChanged
    );
  }
}