import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../widgets/user_widget.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          actions: const [Icon(Icons.menu), SizedBox(width: 15)],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Column(
            children: [
              const UserWidget(),
              const SizedBox(height: 30),
              //Balance section
              SizedBox(
                height: 300,
                width: 600,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 5,
                              blurRadius: 16,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(130),
                        ),
                        child: CircularPercentIndicator(
                          radius: 130,
                          percent: 0.75,
                          progressColor: const Color.fromARGB(159, 1, 64, 172),
                          lineWidth: 3,
                        ),
                      ),
                    ),
                    Center(
                      child: CircularPercentIndicator(
                        radius: 110,
                        percent: 0.55,
                        progressColor: const Color.fromARGB(159, 1, 64, 172),
                        lineWidth: 3,
                      ),
                    ),
                    const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Balance',
                            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 22),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '\$567,57',
                            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 36),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        right: 40,
                        top: 15,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.grey[400]!),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 1,
                                  blurRadius: 30,
                                ),
                              ]),
                          child: const CircleAvatar(
                            radius: 36,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.bar_chart_sharp,
                              color: Color(0xff0141ac),
                              size: 38,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              //incomes and expenses
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Text('INCOMES', style: TextStyle(color: Colors.black, fontSize: 20))
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Text('EXPENSES', style: TextStyle(color: Colors.black, fontSize: 20))
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        '309',
                        style: TextStyle(color: Colors.black, fontSize: 46, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '234',
                        style: TextStyle(color: Colors.black, fontSize: 46, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
