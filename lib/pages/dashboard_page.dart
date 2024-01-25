import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_app/constants/colors.dart';
import 'package:map_app/pages/home_page.dart';
import 'package:map_app/services/riverpod_service.dart';

final _pages = <Widget>[
  const HomePage(),
  const Text('SAVED PAGE'),
  const Text('MY BOOKING PAGE'),
  const Text('MY WALLET PAGE'),
  const Text('ACCOUNT PAGE'),
];

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, watch, _) {
          return _pages[selectedIndex];
        }),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, watch, _) {
          return BottomNavigationBar(
            useLegacyColorScheme: false,
            backgroundColor: MyColor.white,
            selectedLabelStyle: const TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
                color: MyColor.primary,
                fontSize: 10),
            unselectedLabelStyle: const TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                color: MyColor.g500,
                fontSize: 10),
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) {
              ref.read(selectedIndexProvider.notifier).state = index;
            },
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/HomeBold.png',
                    color: MyColor.primary),
                label: 'Home',
                icon: Image.asset(
                  'assets/images/Home.png',
                  color: MyColor.g500,
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/BookmarkBold.png',
                    color: MyColor.info),
                label: 'Saved',
                icon: Image.asset(
                  'assets/images/Bookmark.png',
                  color: MyColor.g500,
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/TickSquareBold.png',
                    color: MyColor.info),
                label: 'My Booking',
                icon: Image.asset(
                  'assets/images/TickSquare.png',
                  color: MyColor.g500,
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/WalletBold.png',
                    color: MyColor.info),
                label: 'My Wallet',
                icon: Image.asset(
                  'assets/images/Wallet.png',
                  color: MyColor.g500,
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/ProfileBold.png',
                    color: MyColor.info),
                label: 'Account',
                icon: Image.asset(
                  'assets/images/Profile.png',
                  color: MyColor.g500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
