import 'package:flutter/material.dart';

class OptionTileCustom extends StatelessWidget {
  const OptionTileCustom({
    Key? key,
    required this.onTap,
    required this.title,
    required this.urlImage,
    this.flex = 1,
  }) : super(key: key);

  final String title;
  final String urlImage;
  final VoidCallback onTap;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            _buildImage(),
            _buildTitle(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              urlImage,
            ),
          ),
        ),
      );

  Widget _buildTitle() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.black.withOpacity(0),
              ],
            ),
          ),
          child: FittedBox(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
