// ignore_for_file: file_names, deprecated_member_use
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_app/constants/colors.dart';
import 'package:map_app/model/station_model.dart';
import 'package:map_app/pages/station_detail_page.dart';
import 'package:map_app/services/overlay_manager.dart';
import 'package:map_app/services/riverpod_service.dart';

class StationCardWidget extends ConsumerWidget {
  const StationCardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardState = ref.watch(cardStateProvider);
    Station cardData = ref.watch(cardDataProvider);

    return Positioned(
      bottom: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildFabRow(),
          cardState ? _buildCard(context, ref, cardData) : const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, WidgetRef ref, Station cardData) {
    Color stationStateColor = Colors.red;
    String stationStateStr = cardData.isAvailable();

    if (stationStateStr == 'Available') {
      stationStateColor = MyColor.primary;
    } else if (stationStateStr == 'Unavailable') {
      stationStateColor = MyColor.trYellow;
    } else {
      stationStateColor = MyColor.trRed.withOpacity(0.9);
      stationStateStr = 'In Use';
    }

    return WillPopScope(
      onWillPop: () async {
        ref.read(cardStateProvider.notifier).state = false;
        return false;
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 260,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding:
            const EdgeInsets.only(top: 16, bottom: 12, left: 12, right: 12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardData.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Urbanist',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${cardData.city}, ${cardData.addressDetail}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: MyColor.g600,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Urbanist',
                  ),
                ),
                const SizedBox(height: 13),
                Row(
                  children: [
                    Text(
                      cardData.reviewStar.toString(),
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: MyColor.g700,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    const SizedBox(width: 5),
                    RatingBarIndicator(
                      unratedColor: MyColor.trRed,
                      rating: cardData.reviewStar,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          'assets/images/Star.png',
                          color: MyColor.orange,
                        );
                      },
                      itemCount: 5,
                      itemPadding: const EdgeInsets.only(left: 5),
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '(${cardData.commentCount} reviews)',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: MyColor.g600,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Row(
                  children: [
                    Container(
                      width: 46,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                        color: stationStateColor,
                      ),
                      child: Center(
                        child: Text(
                          stationStateStr,
                          style: const TextStyle(
                            color: MyColor.white,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      'assets/images/Location.png',
                      width: 15,
                      height: 15,
                      color: MyColor.g700,
                    ),
                    const SizedBox(width: 7),
                    const Text(
                      '1.9 km',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: MyColor.g600,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Urbanist'),
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      'assets/images/CarBold.png',
                      width: 15,
                      height: 15,
                      color: MyColor.g700,
                    ),
                    const SizedBox(width: 7),
                    const Text(
                      '7 mins',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: MyColor.g600,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Urbanist'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(
                  thickness: 1,
                  color: MyColor.g200,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildChargerImagesRow(cardData.connectors),
                      Row(
                        children: [
                          Text(
                            '${cardData.connectors.length}',
                            style: const TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: MyColor.primary),
                          ),
                          const Text(
                            ' chargers',
                            style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: MyColor.primary),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Image.asset(
                            'assets/images/ArrowRight.png',
                            width: 18,
                            height: 18,
                            color: MyColor.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: MyColor.g200,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromWidth(150),
                            side: const BorderSide(
                              color: MyColor.primary,
                              width: 1.5,
                            ),
                            backgroundColor: MyColor.white,
                            surfaceTintColor: MyColor.white,
                          ),
                          onPressed: () {
                            OverlayManager.hideOverlay();
                            if (Platform.isAndroid) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => StationDetail(
                                        station: cardData,
                                      )));
                            } else if (Platform.isIOS) {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => StationDetail(
                                    station: cardData,
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'View',
                            style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: MyColor.primary),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromWidth(150),
                            side: const BorderSide(
                              color: MyColor.disButton,
                              width: 1.5,
                            ),
                            backgroundColor: MyColor.disButton,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Book',
                            style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: MyColor.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: -24,
              top: -12,
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/images/CardGoIcon.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildChargerImagesRow(List<Connector> connectors) {
    List<Widget> typeList = [];
    try {
      for (var connector in connectors) {
        typeList.add(Padding(
          padding: const EdgeInsets.only(right: 7),
          child: SvgPicture.asset(
            'assets/images/${connector.socketTypeId.toLowerCase()}.svg',
            width: 24,
            height: 24,
            color: MyColor.g700,
          ),
        ));
      }
    } catch (e) {
      log(e.toString());
    }

    return Row(
      children: typeList,
    );
  }

  Row _buildFabRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [MyColor.white, MyColor.primaryGradient],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: FloatingActionButton(
            heroTag: null,
            foregroundColor: MyColor.white,
            backgroundColor: MyColor.primary.withOpacity(0.60),
            shape: const CircleBorder(),
            elevation: 10,
            onPressed: () {},
            child: Image.asset(
              'assets/images/sortList.png',
              color: MyColor.white,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [MyColor.white, MyColor.primaryGradient],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: FloatingActionButton(
            heroTag: null,
            foregroundColor: MyColor.white,
            backgroundColor: MyColor.primary.withOpacity(0.60),
            shape: const CircleBorder(),
            elevation: 10,
            onPressed: () {},
            child: Image.asset(
              'assets/images/mapMarker.png',
              color: MyColor.white,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [MyColor.white, MyColor.primaryGradient],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: FloatingActionButton(
            heroTag: null,
            foregroundColor: MyColor.white,
            backgroundColor: MyColor.primary.withOpacity(0.60),
            shape: const CircleBorder(),
            elevation: 10,
            onPressed: () {},
            child: Image.asset(
              'assets/images/currentLocation.png',
              color: MyColor.white,
            ),
          ),
        ),
      ],
    );
  }
}
