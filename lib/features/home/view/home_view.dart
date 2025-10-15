
import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:e_commerce_app/features/cart/view/cart_view.dart';
import 'package:e_commerce_app/features/favorite/view/favorite_view.dart';
import 'package:e_commerce_app/features/home/view/widgets/home_app_bar.dart';
import 'package:e_commerce_app/features/home/view/widgets/home_body_widget.dart';
import 'package:e_commerce_app/features/profile/view/profile_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeBodyWidget(), 
    const FavoriteView(),
    const CartView(),
    const ProfileView(),
  ];


  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: selectedIndex == 0 ? const HomeAppBar() : null,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: pages[selectedIndex],),

        bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.kPrimaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      )
    );
  }
}



