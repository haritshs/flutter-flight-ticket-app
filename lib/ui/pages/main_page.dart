import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiket_pesawat_bwa/cubit/page_cubit.dart';
import 'package:tiket_pesawat_bwa/ui/pages/home_page.dart';
import 'package:tiket_pesawat_bwa/ui/pages/setting_page.dart';
import 'package:tiket_pesawat_bwa/ui/pages/transaction_page.dart';
import 'package:tiket_pesawat_bwa/ui/pages/wallet_page.dart';
import 'package:tiket_pesawat_bwa/ui/widgets/custom_button_navigation.dart';
import '../../shared/theme.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
// }

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customButtonNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButtonNavigation(
                imageUrl: 'assets/icon_home.png',
                index: 0,
              ),
              CustomButtonNavigation(
                imageUrl: 'assets/icon_book.png',
                index: 1,
              ),
              CustomButtonNavigation(
                imageUrl: 'assets/icon_card.png',
                index: 2,
              ),
              CustomButtonNavigation(
                imageUrl: 'assets/icon_setting.png',
                index: 3,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBGColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customButtonNav(),
            ],
          ),
        );
      },
    );
  }
}
