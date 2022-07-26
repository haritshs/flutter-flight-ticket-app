import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiket_pesawat_bwa/cubit/auth_cubit.dart';
import 'package:tiket_pesawat_bwa/cubit/destination_cubit.dart';
import 'package:tiket_pesawat_bwa/shared/theme.dart';
import 'package:tiket_pesawat_bwa/ui/widgets/custom_destination_card.dart';
import 'package:tiket_pesawat_bwa/ui/widgets/custom_destination_tile.dart';

import '../../models/destination_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<DestinationCubit>().fecthDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                top: 30,
                right: defaultMargin,
                left: defaultMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, \n${state.user.name}',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Where to fly today?',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/image_profile.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestination(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations.map((DestinationModel destinationModel) {
              return CustomDestinationCard(destinationModel);
            }).toList(),
            //children: [
            // CustomDestinationCard(
            //   title: 'Lake Toba',
            //   city: 'Sumatra Utara',
            //   imageUrl: 'assets/image_destination_1.png',
            //   rating: 4.8,
            // ),
            // CustomDestinationCard(
            //   title: 'Lombok',
            //   city: 'Mataram',
            //   imageUrl: 'assets/image_destination_2.png',
            //   rating: 4.5,
            // ),
            // CustomDestinationCard(
            //   title: 'Bali',
            //   city: 'Denpasar',
            //   imageUrl: 'assets/image_destination_3.png',
            //   rating: 4.3,
            // ),
            // CustomDestinationCard(
            //   title: 'China',
            //   city: 'Denpasar',
            //   imageUrl: 'assets/image_destination_4.png',
            //   rating: 5.0,
            // ),
            // CustomDestinationCard(
            //   title: 'Citayem',
            //   city: 'Denpasar',
            //   imageUrl: 'assets/image_destination_5.png',
            //   rating: 4.8,
            // ),
            //],
          ),
        ),
      );
    }

    Widget newDestination() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 18,
              ),
            ),
            CustomDestinationTile(
              title: 'Danau Kelantan',
              city: 'Singaraja, Bali',
              imageUrl: 'assets/image_destination_6.png',
              rating: 4.5,
            ),
            CustomDestinationTile(
              title: 'Sydney Opera',
              city: 'Sydney, Australia',
              imageUrl: 'assets/image_destination_7.png',
              rating: 4.7,
            ),
            CustomDestinationTile(
              title: 'Pizza Tower',
              city: 'Roma, Italia',
              imageUrl: 'assets/image_destination_8.png',
              rating: 4.9,
            ),
            CustomDestinationTile(
              title: 'Singapore City',
              city: 'Singapore',
              imageUrl: 'assets/image_destination_9.png',
              rating: 4.6,
            ),
            CustomDestinationTile(
              title: 'Rio de Janeiro',
              city: 'Brazil',
              imageUrl: 'assets/image_destination_10.png',
              rating: 4.3,
            ),
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.errorDestination),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              popularDestination(state.destinations),
              newDestination(),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
