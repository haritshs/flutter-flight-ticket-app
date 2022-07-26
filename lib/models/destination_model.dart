import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String about;
  final String imageUrl;
  final double rating;
  final int price;

  DestinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.about = '',
    this.imageUrl = '',
    this.rating = 0.0,
    this.price = 0,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'],
        city: json['city'],
        about: json['about'],
        imageUrl: json['imageUrl'],
        rating: json['rating'],
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'imageUrl': imageUrl,
        'about': about,
        'rating': rating,
        'price': price,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        city,
        about,
        imageUrl,
        rating,
        price,
      ];
}
