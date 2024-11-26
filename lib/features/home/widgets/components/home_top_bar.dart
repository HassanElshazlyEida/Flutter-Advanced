import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/themes/colors.dart';
import 'package:flutter_advanced/core/themes/styles.dart';
import 'package:flutter_svg/svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi, Hassan ', style: TextStyles.font18DarkBlueBold,),
              Text('How Are you Today?', style: TextStyles.font12greyRegular,),
             
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: CircleAvatar(
            radius: 24,
            backgroundColor: ColorsManager.moreLighterGray,
            child: SvgPicture.asset('assets/images/notifications.svg'),
          ),
        )
      ]
    );
  }
}