import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiket_pesawat_bwa/cubit/seat_cubit.dart';

import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  //NOTE
  // 0. AVAILABLE 1. SELECTED 2. UNAVAILABLE
  //final int status;
  final String id;
  final bool isAvailable;

  const SeatItem({
    Key? key,
    //required this.status,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelect = context.watch<SeatCubit>().isSelected(id);
    backgroundColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelect) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
      // switch (status) {
      //   case 0:
      //     return kAvailableColor;
      //   case 1:
      //     return kPrimaryColor;
      //   case 2:
      //     return kUnavailableColor;
      //   default:
      //     return kUnavailableColor;
      // }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        return kPrimaryColor;
      }
      // switch (status) {
      //   case 0:
      //     return kPrimaryColor;
      //   case 1:
      //     return kPrimaryColor;
      //   case 2:
      //     return kUnavailableColor;
      //   default:
      //     return kUnavailableColor;
      // }
    }

    textSetting() {
      // switch (status) {
      //   case 0:
      //     return SizedBox();
      //   case 1:
      //     return Center(
      //       child: Text(
      //         'YOU',
      //         style: whiteTextStyle.copyWith(
      //           fontSize: 12,
      //           fontWeight: semiBold,
      //         ),
      //       ),
      //     );
      //   case 2:
      //     return SizedBox();
      //   default:
      //     return SizedBox();
      // }

      if (isSelect) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
        ),
        child: textSetting(),
      ),
    );
  }
}
