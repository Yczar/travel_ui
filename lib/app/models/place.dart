// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Place extends Equatable {
  final String title;
  final String description;
  final String image;
  final String location;
  final num price;
  const Place({
    required this.title,
    required this.description,
    required this.image,
    required this.location,
    required this.price,
  });

  Place copyWith({
    String? title,
    String? description,
    String? image,
    String? location,
    num? price,
  }) {
    return Place(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      location: location ?? this.location,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'location': location,
      'price': price,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      location: map['location'] as String,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) =>
      Place.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      title,
      description,
      image,
      location,
      price,
    ];
  }

  static List<Place> get places => [
        const Place(
          title: 'Tanjung Aan',
          description:
              "The most beautiful beach in Lombok and the closest to Kuta. It's only 15 minutes ride by scooter on a paved road from Kuta.",
          image:
              'https://blog.tiket.com/wp-content/uploads/Tanjung-Aan-Beach-Lombok_Blog-new-update-mei2020-Tanjung-Aan-Beach2-min.jpg',
          location: 'Pujut, Lombok Tengah',
          price: 230,
        ),
        const Place(
          title: 'Gili Trawangan',
          description:
              'Gili Trawangan is the most popular island in the Gili Islands. It is the largest of the three islands and is the most developed.',
          image:
              'https://3.bp.blogspot.com/-jkiKzjS5TPM/WWWkAiAdvPI/AAAAAAAAECw/Mn4QqxtRqogCPRUz1ZXpPJwBOIKWAOeyACLcBGAs/s1600/IMG_8205.JPG',
          location: 'North Lombok',
          price: 250,
        ),
        const Place(
          title: 'Gili Meno',
          description:
              'Gili Meno is the second largest island in the Gili Islands. It is the most peaceful and quiet island in the Gili Islands.',
          image:
              'https://www.indonesia-tourism.com/blog/wp-content/uploads/2020/01/158904305.jpg',
          location: 'North Lombok',
          price: 200,
        ),
        const Place(
          title: 'Gili Air',
          description:
              'Gili Air is the smallest island in the Gili Islands. It is the most developed island in the Gili Islands.',
          image:
              'https://media-cdn.tripadvisor.com/media/photo-s/12/bb/c3/7c/afternoon-pool-view.jpg',
          location: 'North Lombok',
          price: 200,
        ),
        const Place(
          title: 'Kuta Beach',
          description:
              'Kuta Beach is the most famous beach in Lombok. It is the most developed beach in Lombok and is the most popular tourist destination in Lombok.',
          image:
              'https://upload.wikimedia.org/wikipedia/commons/f/fe/Kuta_Beach_%286924448550%29.jpg',
          location: 'South Lombok',
          price: 200,
        ),
        const Place(
          title: 'Senggigi Beach',
          description:
              'Senggigi Beach is the second most famous beach in Lombok. It is the most developed beach in Lombok and is the second most popular tourist destination in Lombok.',
          image:
              'https://www.oyster.com/wp-content/uploads/sites/35/2019/05/pool-v11489578-1440-1024x683.jpg',
          location: 'West Lombok',
          price: 200,
        ),
        const Place(
          title: 'Mawun Beach',
          description:
              'Mawun Beach is the most beautiful beach in Lombok and the closest to Kuta. It is only 15 minutes ride by scooter on a paved road from Kuta.',
          image:
              'https://sempiakvillas.com/wp-content/uploads/2017/03/c27e1920.jpg',
          location: 'South Lombok',
          price: 200,
        ),
        const Place(
          title: 'Gili Nanggu',
          description:
              'Gili Nanggu is the smallest island in the Gili Islands. It is the most peaceful and quiet island in the Gili Islands.',
          image:
              'https://www.sudamalaresorts.com/lombok/wp-content/uploads/sites/4/2016/01/main_tour_gili_nanggu_snorkeling.jpg',
          location: 'North Lombok',
          price: 200,
        ),
        const Place(
          title: 'Gili Sudak',
          description:
              'Gili Sudak is the smallest island in the Gili Islands. It is the most peaceful and quiet island in the Gili Islands.',
          image:
              'https://media-cdn.tripadvisor.com/media/photo-s/07/30/e0/ef/getlstd-property-photo.jpg',
          location: 'North Lombok',
          price: 200,
        ),
        const Place(
          title: 'Gili Kedis',
          description:
              'Gili Kedis is the smallest island in the Gili Islands. It is the most peaceful and quiet island in the Gili Islands.',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTIBSTmC_uG_T-yUtpXI1CUjldHFFXhtLlEw&usqp=CAU',
          location: 'North Lombok',
          price: 200,
        ),
      ];
}
