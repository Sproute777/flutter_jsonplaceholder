import 'package:flutter/material.dart';
import 'package:json_repository/json_repository.dart';

class PhotoListItem extends StatelessWidget {
  const PhotoListItem({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${photo.id}', style: textTheme.bodySmall),
        title: Text(photo.title),
        isThreeLine: true,
        subtitle: SizedBox(
          height: 100,
          child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(photo.url),
            ),
          ),
        ),
        dense: true,
      ),
    );
  }
}
