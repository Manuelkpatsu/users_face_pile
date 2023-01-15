import 'package:face_pile_app/models/user.dart';
import 'package:face_pile_app/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class AvatarCircle extends StatelessWidget {
  final User user;
  final double size;
  final Color nameLabelColor;
  final Color backgroundColor;

  const AvatarCircle({
    Key? key,
    required this.user,
    this.size = 40,
    required this.nameLabelColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              StringUtil.getInitialsForName(user.name),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: nameLabelColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          user.avatarUrl != null
              ? FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: user.avatarUrl!,
                  fadeInDuration: const Duration(milliseconds: 250),
                )
              : Center(
                  child: Text(
                    StringUtil.getInitialsForName(user.name),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: nameLabelColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
