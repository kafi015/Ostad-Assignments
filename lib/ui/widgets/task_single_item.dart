import 'package:flutter/material.dart';

class TaskSingleItem extends StatelessWidget {
  const TaskSingleItem({
    Key? key,
    required this.onEditPress,
    required this.onDeletePress,
    required this.subject,
    required this.description,
    required this.date,
    required this.type,
  }) : super(key: key);

  final String subject, description, date, type;
  final VoidCallback onEditPress, onDeletePress;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(description),
            const SizedBox(
              height: 8,
            ),
            Text("Date: $date"),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Chip(
                  label: Text(type),
                  backgroundColor: Colors.blueAccent,
                ),
                const Spacer(),
                IconButton(
                    onPressed: onEditPress, icon: const Icon(Icons.edit)),
                IconButton(
                    onPressed: onDeletePress, icon: const Icon(Icons.delete)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}