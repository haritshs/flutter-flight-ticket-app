import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiket_pesawat_bwa/cubit/page_cubit.dart';
import '../../shared/theme.dart';

class CustomButtonNavigation extends StatelessWidget {
  //parameter setiap icon
  final String imageUrl;
  //setting icon active
  //final bool isSelected;
  final int index;
  const CustomButtonNavigation({
    Key? key,
    required this.imageUrl,
    //this.isSelected = false,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? kPrimaryColor
                : kGreyColor,
          ),
          Container(
            height: 2,
            width: 30,
            decoration: BoxDecoration(
              //jika true tampilkan primary color, jika false tampilkan transparant
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kTransparentColor,
              borderRadius: BorderRadius.circular(18),
            ),
          )
        ],
      ),
    );
  }
}
