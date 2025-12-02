import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostCard extends StatelessWidget {
  final dynamic data;
  PostCard(this.data);

  @override
  Widget build(BuildContext context) {
    final d = data.data();
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: d["image"],
            placeholder: (_, __) =>
                Container(height: 250, color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(d["caption"] ?? ""),
          ),
        ],
      ),
    );
  }
}
