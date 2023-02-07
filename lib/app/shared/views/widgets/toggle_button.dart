import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 38) / 5,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
