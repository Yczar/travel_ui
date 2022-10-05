import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../src/utils/margins/y_margin.dart';
import '../../../../src/values/colors.dart';
import '../../../models/place.dart';
import '../screens/place_details_screen.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({
    super.key,
    required this.place,
  });
  final Place place;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PlaceDetailsScreen(
              place: place,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 194,
        child: Stack(
          children: [
            Container(
              height: 164,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                  8,
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    place.image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(
                  horizontal: 28,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kGrayColor.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(
                        0,
                        3,
                      ), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const YMargin(8),
                          Text(
                            place.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const YMargin(4),
                          Text(
                            place.location,
                            style: const TextStyle(
                              color: kGrayColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '\$ ${place.price}',
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
