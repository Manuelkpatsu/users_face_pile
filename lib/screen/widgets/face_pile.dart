import 'package:face_pile_app/models/user.dart';
import 'package:flutter/material.dart';

import 'avatar_circle.dart';

class FacePile extends StatelessWidget {
  final List<User> users;
  final double faceSize;
  final double faceOverlapPercent;

  const FacePile({
    Key? key,
    required this.users,
    this.faceSize = 40,
    this.faceOverlapPercent = 0.1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    users.sort((a, b) => a.createdAt.compareTo(b.createdAt));

    return LayoutBuilder(builder: (context, constraints) {
      final facesCount = users.length;
      double facePercentVisible = (1.0 - faceOverlapPercent);

      final intrinsicWidth = facesCount > 1
          ? (1 + (facePercentVisible * (facesCount - 1))) * faceSize
          : faceSize;

      late double leftOffset;
      if (intrinsicWidth > constraints.maxWidth) {
        leftOffset = 0;
        facePercentVisible =
            ((constraints.maxWidth / faceSize) - 1) / (facesCount - 1);
      } else {
        leftOffset = (constraints.maxWidth - intrinsicWidth) / 2;
      }

      return SizedBox(
        height: faceSize,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            for (var i = 0; i < users.length; i += 1)
              Positioned(
                key: ValueKey(users[i].id),
                left: leftOffset + (i * facePercentVisible * faceSize),
                top: 0,
                width: faceSize,
                height: faceSize,
                child: AvatarCircle(
                  user: users[i],
                  nameLabelColor: const Color(0xff222222),
                  backgroundColor: const Color(0xffbac0ca),
                ),
              ),
          ],
        ),
      );
    });
  }
}
