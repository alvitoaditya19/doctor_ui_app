import 'package:doctor_booking_app/shared/theme.dart';
import 'package:flutter/material.dart';


class FacilityItem extends StatelessWidget {
  final String? name;
  final String? imageUrl;

  FacilityItem({this.imageUrl, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl!,
          width: 40,
        ),
        SizedBox(
          height: 4,
        ),
        Text.rich(
          TextSpan(
            text: '$name',
            style: blueTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
