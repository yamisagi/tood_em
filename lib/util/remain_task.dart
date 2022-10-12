
import 'package:flutter/material.dart';

class RemainTask extends StatelessWidget {
  const RemainTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.5),
      ),
      // Remaining Tasks && Today's Date
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '14 Tasks ',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Today, 12th May',
              style: Theme.of(context).textTheme.headline6,
            ),
          ]),
    );
  }
}
