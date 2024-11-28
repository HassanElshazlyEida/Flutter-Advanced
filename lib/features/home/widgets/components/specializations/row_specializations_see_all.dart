import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/themes/styles.dart';

class RowSpecializationsSeeAll extends StatelessWidget {
  const RowSpecializationsSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Specializations', style: TextStyles.font18DarkBlueSemiBold,),
            const Spacer(),
            Text('See All',style: TextStyles.font12BlueRegular,)
          ],
        ),
        
      ],
    );
  }
}