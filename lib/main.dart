import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiket_pesawat_bwa/cubit/auth_cubit.dart';
import 'package:tiket_pesawat_bwa/cubit/destination_cubit.dart';
import 'package:tiket_pesawat_bwa/cubit/page_cubit.dart';
import 'package:tiket_pesawat_bwa/cubit/seat_cubit.dart';
import 'package:tiket_pesawat_bwa/cubit/transaction_cubit.dart';
import 'package:tiket_pesawat_bwa/ui/pages/bonus_page.dart';
import 'package:tiket_pesawat_bwa/ui/pages/get_started_page.dart';
import 'package:tiket_pesawat_bwa/ui/pages/main_page.dart';
import 'package:tiket_pesawat_bwa/ui/pages/setting_page.dart';
import 'package:tiket_pesawat_bwa/ui/pages/sign_in_page.dart';
import 'package:tiket_pesawat_bwa/ui/pages/sign_up_page.dart';
import 'package:tiket_pesawat_bwa/ui/pages/splash_page.dart';
import 'package:tiket_pesawat_bwa/ui/pages/success_checkout_page.dart';
import 'package:tiket_pesawat_bwa/ui/pages/transaction_page.dart';
import 'package:tiket_pesawat_bwa/ui/pages/wallet_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/success': (context) => SuccessCheckoutPage(),
          '/transaction': (context) => TransactionPage(),
          '/wallet': (context) => WalletPage(),
          '/setting': (context) => SettingPage(),
        },
      ),
    );
  }
}
