import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.5),
      ),
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.check_box_outline_blank),
            title: Text('Task 1'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
      ),
    );
  }
}
