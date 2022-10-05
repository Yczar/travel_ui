import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_ui/app/models/place.dart';
import 'package:travel_ui/src/res/svgs.dart';
import 'package:travel_ui/src/utils/margins/x_margin.dart';
import 'package:travel_ui/src/utils/margins/y_margin.dart';
import 'package:travel_ui/src/values/colors.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({
    super.key,
    required this.place,
  });
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: UnconstrainedBox(
            child: CircleAvatar(
              backgroundColor: kSecondaryColor,
              radius: 20,
              child: SvgPicture.asset(
                kMainBackArrowSvg,
              ),
            ),
          ),
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        actions: [
          UnconstrainedBox(
            child: CircleAvatar(
              backgroundColor: kSecondaryColor,
              radius: 20,
              child: SvgPicture.asset(
                kMainMoreSvg,
              ),
            ),
          ),
          const XMargin(10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YMargin(33),
            Hero(
              tag: place.image,
              child: Container(
                width: double.infinity,
                height: 320,
                margin: const EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(place.image),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const YMargin(24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: place.title,
                        child: Text(
                          place.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const YMargin(4),
                      Hero(
                        tag: place.location,
                        child: Text(
                          place.location,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Hero(
                  tag: place.price.toString(),
                  child: Container(
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
                ),
              ],
            ),
            const YMargin(34),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const YMargin(10),
            Text(
              place.description,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: kGrayColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
