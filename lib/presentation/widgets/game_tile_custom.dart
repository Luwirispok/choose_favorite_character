import 'package:flutter/material.dart';

class GameTileCustom extends StatelessWidget {
  const GameTileCustom({
    Key? key,
    this.loading = false,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final bool loading;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      trailing:
          loading ? const CircularProgressIndicator(strokeWidth: 2) : null,
      selected: true,
      title: Text(title),
      onTap: onTap,
    );
  }
}
