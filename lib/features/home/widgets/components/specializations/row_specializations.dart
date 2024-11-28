import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/data/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/widgets/components/specializations/row_specializations_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RowSpecializations extends StatefulWidget {
  final List<SpecializationsData?>? specializationDataList;

  RowSpecializations({super.key,required this.specializationDataList});

  @override
  State<RowSpecializations> createState() => _RowSpecializationsState();
}

class _RowSpecializationsState extends State<RowSpecializations> {
  var selectedSpecializationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationDataList?.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print("select specializations");
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                specializationId: widget.specializationDataList?[index]?.id ?? 0,
              );
            },
            child: RowSpecializationsViewItem(
              specializationsData: widget.specializationDataList?[index],
              itemIndex: index,
              selectedIndex: selectedSpecializationIndex,
            ),
          );
        },
      ),
    );
  }
}