import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_wallet/widgets/my_button.dart';
import 'package:flutter_wallet/widgets/my_card.dart';
import 'package:flutter_wallet/widgets/my_list_tile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // pagecontroller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(
          Icons.monetization_on,
          size: 28,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 48,
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //appbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        "My",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " Card",
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),

                  // add button
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // cards
            SizedBox(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.purple[300],
                  ),
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.blue[300],
                  ),
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.green[300],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade800,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),

            const SizedBox(height: 20),

            // 3 buttons -> send + pay + bills
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    iconImagePath: "assets/icons/send-money.png",
                    buttonText: "Send",
                  ),
                  MyButton(
                    iconImagePath: "assets/icons/credit-card.png",
                    buttonText: "Pay",
                  ),
                  MyButton(
                    iconImagePath: "assets/icons/bill.png",
                    buttonText: "Bill",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // column -> stats + transactions
            const Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  //statistics
                  MyListTile(
                    iconImagePath: 'assets/icons/statistics.png',
                    tileTitle: 'Statistics',
                    tileSubTitle: 'Payments and Income',
                  ),
                  SizedBox(height: 15),
                  //history
                  MyListTile(
                    iconImagePath: 'assets/icons/history.png',
                    tileTitle: 'Transactions',
                    tileSubTitle: 'Transaction history',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
