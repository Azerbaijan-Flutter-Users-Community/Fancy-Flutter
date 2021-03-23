import 'package:flutter/material.dart';

import 'widgets/length_indicator.dart';

class LengthIndicatorExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: LengthIndicator(
            label: '10',
            leadingLabel: '0',
            trailingLabel: '50',
            height: 100,
            thumbRadius: 18,
            percentage: 66,
            activeBarColor: Colors.yellow,
            barColor: Colors.grey.withOpacity(0.4),
            thumbColor: Colors.orangeAccent,
          ),
        ),
      ),
    );
  }
}
