import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_ui/app/presentation/ui/widgets/favorite_places_title_widget.dart';
import 'package:travel_ui/app/presentation/ui/widgets/place_widget.dart';
import 'package:travel_ui/src/res/svgs.dart';
import 'package:travel_ui/src/utils/margins/x_margin.dart';
import 'package:travel_ui/src/utils/margins/y_margin.dart';
import 'package:travel_ui/src/values/colors.dart';

import '../../../../src/constants/constants.dart';
import '../../../models/place.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final labels = ['Camping', 'Mountain', 'Hiking', 'Climbing', 'Skiing'];
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28.0,
      ),
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              backgroundColor: Colors.white,
              leading: const Offstage(),
              expandedHeight: 387,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                title: _isShrink ? const FavoritePlacesTitleWidget() : null,
                background: SafeArea(
                  child: AnimatedOpacity(
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    opacity: _isShrink ? 0 : 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const YMargin(12),
                        Row(
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: kGrayColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                                image: const DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    myAvatarUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const XMargin(16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Howdy',
                                    style: TextStyle(
                                      color: kGrayColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'Julius Czar',
                                    style: TextStyle(
                                      color: Color(0xFF1E1E1E),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: kPrimaryColor,
                              radius: 22,
                              child: SvgPicture.asset(
                                kHomeNotificationSvg,
                                height: 18,
                              ),
                            )
                          ],
                        ),
                        const YMargin(28),
                        const Text(
                          'Where would you\nlike to go?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const YMargin(20),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kGrayColor.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 13,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Search Location',
                                  ),
                                ),
                              ),
                            ),
                            const XMargin(20),
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  kHomeFilterSvg,
                                  height: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const YMargin(30),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: labels.map(
                              (label) {
                                final index = labels.indexOf(label);
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: EdgeInsets.only(
                                    left: index == 0 ? 0 : 10,
                                    right: index == labels.length - 1 ? 0 : 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: index == 0
                                        ? kPrimaryColor
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    border: index == 0
                                        ? null
                                        : Border.all(
                                            color: kGrayColor,
                                          ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      label,
                                      style: TextStyle(
                                        color: index == 0
                                            ? Colors.white
                                            : kGrayColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        const YMargin(36),
                        const FavoritePlacesTitleWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          scrollBehavior: const ScrollBehavior(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return PlaceWidget(
                    place: Place.places[index],
                  );
                },
                childCount: Place.places.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
