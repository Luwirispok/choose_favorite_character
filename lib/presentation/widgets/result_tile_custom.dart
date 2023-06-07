import 'package:flutter/material.dart';

class ResultTileCustom extends StatelessWidget {
  const ResultTileCustom({
    Key? key,
    required this.title,
    required this.urlImage,
  }) : super(key: key);

  final String title;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              urlImage,
            ),
          ),
        ),
      ),
    );
  }
}
