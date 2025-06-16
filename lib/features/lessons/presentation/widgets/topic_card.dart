import 'package:flutter/material.dart';
import 'package:roadwise/topic_entity.dart';

class TopicCard extends StatelessWidget {
  final TopicEntity topic;
  final VoidCallback onTap;

  const TopicCard({super.key, required this.topic, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(topic.name),
        subtitle: topic.content.isNotEmpty ? Text(topic.content) : null,
        onTap: onTap,
      ),
    );
  }
}
