import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/*
 Second Task : app consists of FAB and container
 when i pressed on FAB it changes container Color
 but when i pressed on FAB it Rebuild Background widget
 which it doesn't no need to rebuild
 you need to optimize build function as
 when i pressed on Button don't rebuild Background widget
 */

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  BackgroundWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    print("Building BackgroundWidget");

    return Container(color: Colors.amber, child: child);
  }
}

// Shady: Change to stateless widget.
class SecondTaskScreen extends StatelessWidget {
  // Shady: Add final and change its type to ValueNotifier.
  final ValueNotifier<Color> _randomColor = ValueNotifier<Color>(Colors.black);
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    print("Building SecondTaskScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text("Second task"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Shady: Remove setState and change its value directrly.
          _randomColor.value =
              Colors.primaries[_random.nextInt(Colors.primaries.length)];
        },
        child: Icon(Icons.colorize),
      ),
      body: BackgroundWidget(
          child: Center(
        child: ValueListenableBuilder(
          builder: (BuildContext context, Color value, Widget? child) {
            // This builder will only get called when the _randomColor
            // is updated.
            return Container(
              width: 100,
              height: 100,
              color: value,
            );
          },
          valueListenable: _randomColor,
        ),
      )),
    );
  }
}
