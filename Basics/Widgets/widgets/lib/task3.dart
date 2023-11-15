//  Arrange a list of text widgets vertically and horizontally using Column and Row widgets.

import 'package:flutter/material.dart';

class Task3 extends StatelessWidget {
  const Task3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vertical and Horizontal Arrangement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Vertical Arrangement:'),
            const SizedBox(height: 8),
            const Text('Item 1'),
            const Text('Item 2'),
            const Text('Item 3'),
            const Divider(),
            const SizedBox(height: 16),
            const Text('Horizontal Arrangement:'),
            const SizedBox(height: 8),
            Row(
              children: const [
                Text('Item 1'),
                SizedBox(width: 16),
                Text('Item 2'),
                SizedBox(width: 16),
                Text('Item 3'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
