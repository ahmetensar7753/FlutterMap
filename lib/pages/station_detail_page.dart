// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app/constants/colors.dart';
import 'package:map_app/model/station_model.dart';
import 'package:map_app/services/riverpod_service.dart';
import 'package:map_app/util.dart';
import 'package:readmore/readmore.dart';

class StationDetail extends ConsumerStatefulWidget {
  Station station;
  StationDetail({super.key, required this.station});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StationDetailState();
}

class _StationDetailState extends ConsumerState<StationDetail>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: 270,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.station.imageLink),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 55,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: _buildToolBar(context),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: double.maxFinite,
              child: _createListView(widget.station, tabController),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildToolBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.canPop(context),
          child: Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColor.white.withOpacity(0.5),
            ),
            child: Image.asset(
              'assets/images/ArrowLeft.png',
              color: MyColor.white,
            ),
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColor.white.withOpacity(0.5),
                ),
                child: Image.asset(
                  'assets/images/Bookmark.png',
                  color: MyColor.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.only(left: 15, right: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColor.white.withOpacity(0.5),
                ),
                child: Image.asset(
                  'assets/images/Send.png',
                  color: MyColor.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container _createListView(Station station, TabController tabController) {
    Color stationStateColor = Colors.red;
    String stationStateStr = station.isAvailable();

    if (stationStateStr == 'Available') {
      stationStateColor = MyColor.primary;
    } else if (stationStateStr == 'Unavailable') {
      stationStateColor = MyColor.trYellow;
    } else {
      stationStateColor = MyColor.trRed.withOpacity(0.9);
      stationStateStr = 'In Use';
    }

    return Container(
      color: MyColor.white,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${station.name} - ${station.city}, ${station.district}',
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Urbanist',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${station.city}, ${station.addressDetail}',
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: MyColor.g600,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Urbanist',
                  ),
                ),
                const SizedBox(height: 13),
                Row(
                  children: [
                    Text(
                      station.reviewStar.toString(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: MyColor.g700,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    const SizedBox(width: 5),
                    RatingBarIndicator(
                      unratedColor: MyColor.trRed,
                      rating: station.reviewStar,
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
                      '(${station.commentCount} reviews)',
                      style: const TextStyle(
                        fontSize: 14.0,
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
                      width: 54,
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
                          fontSize: 14.0,
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
                          fontSize: 14.0,
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(170, 40),
                          side: const BorderSide(
                            color: MyColor.primary,
                            width: 1.5,
                          ),
                          backgroundColor: MyColor.primary,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/NavigationBold.png',
                              width: 15,
                              height: 15,
                              color: MyColor.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Get Direction',
                              style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: MyColor.white),
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(170, 40),
                          side: const BorderSide(
                            color: MyColor.primary,
                            width: 1.5,
                          ),
                          backgroundColor: MyColor.white,
                          surfaceTintColor: MyColor.white,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'View',
                          style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: MyColor.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: MyColor.g200,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TabBar(
                tabAlignment: TabAlignment.start,
                indicatorColor: MyColor.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                controller: tabController,
                indicatorWeight: 3.5,
                labelColor: MyColor.primary,
                labelStyle: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelColor: MyColor.g500,
                tabs: const [
                  Tab(
                    child: SizedBox(
                      width: 75,
                      child: Center(
                        child: Text(
                          'Info',
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: 75,
                      child: Center(
                        child: Text(
                          'Chargers',
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: 75,
                      child: Center(
                        child: Text(
                          'Check-ins',
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: 75,
                      child: Center(
                        child: Text(
                          'Recyle?',
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TabBarView(
              controller: tabController,
              children: [
                _createInfoPage(station),
                _createChargersPage(station),
                _createCheckinsPage(),
                _createRecylePage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createInfoPage(Station station) {
    bool isExpanded = ref.watch(stationInfoContainerStateProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ReadMoreText(
            station.about,
            trimLines: 4,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: 'Urbanist',
            ),
            colorClickableText: MyColor.primary,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read more...',
            trimExpandedText: ' Show less',
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              color: MyColor.g50,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border(
                top: BorderSide(width: 0.5, color: MyColor.g200),
                bottom: BorderSide(width: 0.5, color: MyColor.g200),
                right: BorderSide(width: 0.5, color: MyColor.g200),
                left: BorderSide(width: 0.5, color: MyColor.g200),
              ),
            ),
            child: const Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Parking',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: MyColor.g600),
                  ),
                  Text(
                    'Pay',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: MyColor.black),
                  )
                ],
              ),
              Divider(
                thickness: 1,
                color: MyColor.g200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cost',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: MyColor.g600),
                  ),
                  Text(
                    'Payment is required',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: MyColor.black),
                  )
                ],
              ),
            ]),
          ),
          Flexible(
            child: AnimatedContainer(
              duration: const Duration(
                microseconds: 300,
              ),
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: isExpanded ? 400 : 120,
              decoration: const BoxDecoration(
                color: MyColor.g50,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border(
                  top: BorderSide(width: 0.5, color: MyColor.g200),
                  bottom: BorderSide(width: 0.5, color: MyColor.g200),
                  right: BorderSide(width: 0.5, color: MyColor.g200),
                  left: BorderSide(width: 0.5, color: MyColor.g200),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Image.asset(
                      'assets/images/TimeCircle.png',
                      width: 18,
                      height: 18,
                      color: MyColor.black,
                    ),
                    title: const Row(
                      children: [
                        Text(
                          'Open',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Urbanist',
                            color: MyColor.primary,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '24 hours',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: MyColor.g600,
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: MyColor.black,
                    ),
                    onTap: () {
                      ref
                          .read(stationInfoContainerStateProvider.notifier)
                          .state = !isExpanded;
                    },
                  ),
                  const Divider(
                    thickness: 1,
                    color: MyColor.g200,
                  ),
                  SizedBox(
                    height: isExpanded ? 300 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _createDays('Monday'),
                        _createDays('Tuesday'),
                        _createDays('Wednesday'),
                        _createDays('Thursday'),
                        _createDays('Friday'),
                        _createDays('Saturday'),
                        _createDays('Sunday'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset('assets/images/Amenities.png'),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Location',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Urbanist',
            ),
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/Location.png',
                width: 18,
                height: 18,
                color: MyColor.primary,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                '${station.city}, ${station.addressDetail}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Urbanist',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.maxFinite,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: FutureBuilder(
                  future: getCustomMarker(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          'Error',
                        ),
                      );
                    } else {
                      return GoogleMap(
                        liteModeEnabled: true,
                        onTap: (position) {
                          ref.watch(cardStateProvider.notifier).state = false;
                        },
                        mapToolbarEnabled: false,
                        compassEnabled: false,
                        myLocationButtonEnabled: false,
                        markers: {
                          Marker(
                            markerId: MarkerId('${station.id}'),
                            position:
                                LatLng(station.latitude, station.longitude),
                            icon: snapshot.data as BitmapDescriptor,
                          ),
                        },
                        zoomControlsEnabled: false,
                        fortyFiveDegreeImageryEnabled: true,
                        buildingsEnabled: false,
                        onMapCreated: (GoogleMapController controller) {
                          controller.setMapStyle(mapStyleJSON);
                        },
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                              station.latitude,
                              station
                                  .longitude), // The camera position starts from the user location.
                          zoom: 17.0,
                        ),
                      );
                    }
                  }),
            ),
          ),
          const SizedBox(
            height: 40,
            child: Center(
              child: Divider(
                thickness: 1,
                color: MyColor.g200,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColor.trGreen.withOpacity(0.1),
                  ),
                  child: Image.asset(
                    'assets/images/Scan.png',
                    color: MyColor.primary,
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(265, 55),
                    elevation: 8,
                    backgroundColor: MyColor.primary,
                    shadowColor: MyColor.success.withOpacity(0.5),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Book',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyColor.white),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _createChargersPage(Station station) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: station.connectors.length,
        itemBuilder: (context, index) {
          Connector connector = station.connectors[index];
          Color statusColor = MyColor.amber;
          String connectorImageSrc =
              'assets/images/${connector.socketTypeId.toLowerCase()}.svg';

          if (connector.status == 'Available') {
            statusColor = MyColor.primary;
          } else if (connector.status == 'In Use') {
            statusColor = MyColor.red;
          }

          return Container(
            width: double.maxFinite,
            height: 200,
            margin: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: MyColor.g50,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border(
                left: BorderSide(
                  color: MyColor.primary,
                  width: 4,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('24 hours'),
                      SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              connector.status,
                              style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: statusColor),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: statusColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: MyColor.g200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${connector.socketTypeId} · ${station.stationType}',
                                style: const TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: MyColor.g600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SvgPicture.asset(
                                connectorImageSrc,
                                width: 42,
                                height: 42,
                                color: MyColor.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 65,
                        child: VerticalDivider(
                          thickness: 1,
                          width: 0.8,
                          color: MyColor.g200,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Max. power',
                                style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: MyColor.g600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${connector.power.toString()} kW',
                                style: const TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: MyColor.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: MyColor.g200,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7.5, bottom: 2.5),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromWidth(350),
                            side: BorderSide(
                              color: connector.status == 'Available'
                                  ? MyColor.primary
                                  : MyColor.disButton,
                              width: 1.5,
                            ),
                            backgroundColor: connector.status == 'Available'
                                ? MyColor.primary
                                : MyColor.disButton,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Book',
                            style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: MyColor.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _createCheckinsPage() {
    return Container(
      color: MyColor.amber,
    );
  }

  Widget _createRecylePage() {
    return Container(
      color: MyColor.cyan,
    );
  }

  Row _createDays(String day) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Urbanist',
            color: MyColor.black,
          ),
        ),
        const Text(
          '00:00 - 00:00',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Urbanist',
            color: MyColor.black,
          ),
        ),
      ],
    );
  }

  Future<BitmapDescriptor> getCustomMarker() async {
    return await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(32, 32)),
      'assets/images/StationGreenMarker.png',
    );
  }
}
