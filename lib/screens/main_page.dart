import 'package:flutter/material.dart';

import '../widgets/user_widget.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final List<IconData> iconList = [Icons.add, Icons.search, Icons.bar_chart];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          actions: const [
            Icon(Icons.menu),
            SizedBox(width: 15),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const UserWidget(),
                const SizedBox(height: 30),
                //Balance
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '  Balance',
                      style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 22),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '\$567,57',
                      style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 32),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                border: Border.all(width: 2, color: Colors.grey),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  iconList[index],
                                  size: 34,
                                  color: const Color(0xff0141ac),
                                ),
                              ),
                            ),
                          )),
                ),
                const SizedBox(height: 20),
                //Card
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
                    height: 210,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(5)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'CARD',
                                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        //Card number
                        const Text(
                          '3567 55437 9080 5600',
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          'Card Number',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 30),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tommy Berns',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '05 / 20      ',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Card Holder',
                              style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Expiry             ',
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                //List of My cards and transaction
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('My cards', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 22)),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    )
                  ],
                ),
                const Divider(thickness: 1),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transactions', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 22)),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    )
                  ],
                ),
                const Divider(thickness: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
