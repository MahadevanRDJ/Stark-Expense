import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/product_response.dart';
import '../model/user_response.dart';
import '../resource/color_resource.dart';
import '../resource/size_resource.dart';
import '../resource/string_resource.dart';
import '../resource/widget_resource.dart';
import '../service/transaction_service.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<StatefulWidget> createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
  double _totalBalance = 0;
  double _expenseAmount = 0;
  double _incomeAmount = 0;

  // late Future<List<Product>?> products;

  static Future<List<Product>?> getProduct() async {
    final data = await TransactionService.getInstance().getProduct();
    final list = data.products;
    log("Dashboard");
    return list;
  }

  late Future<List<User?>> people;

  static Future<List<User?>> getPeoples() async {
    final people = await TransactionService.getInstance().getAllPeople();
    final list = people.users;
    return list!;
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      people = getPeoples();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _totalBalance = 2548.0;
    _expenseAmount = 1840.0;
    _incomeAmount = 1500.0;
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF429690),
                  Color(0xFF2E8079),
                ],
                begin: Alignment.topLeft,
              ),
            ),
          ),
          elevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ),
        body: Expanded(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: SizeResource.getSize(context).height * 0.28,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF429690),
                                    Color(0xFF2E8079),
                                  ],
                                  begin: Alignment.topLeft,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(170, 27),
                                  bottomRight: Radius.elliptical(170, 27),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                          child: Text(
                                        'Good Morning',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0),
                                      )),
                                      Flexible(
                                          child: Text(
                                        'Krishna Chander',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ))
                                    ],
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withAlpha(6),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.notifications_none_rounded,
                                        size: 25.0,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: SizeResource.getSize(context).height * 0.125,
                            child: _balanceCard(context, _totalBalance,
                                _incomeAmount, _expenseAmount),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 120, left: 24, right: 24),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringResource.sTransactionHistory,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFF222222),
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              StringResource.sSeeAll,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF666666),
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              Expanded(
                  child: FutureBuilder<List<User?>>(
                future: people,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return WidgetResource.getLoader(context);
                  } else if (snapshot.hasData) {
                    final list = snapshot.data;
                    return listPeoples(list!);
                  } else {
                    return const Center(child: Text('No data available'));
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget listProducts(List<Product?> productList) {
    // ListView Builder to show data in a list
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        final Product product = productList[index]!;
        return Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(child: Image.network(product!.images!.first)),
              const SizedBox(width: 10),
              Expanded(
                  flex: 3,
                  child: Text(
                    product.title!,
                    style: const TextStyle(fontSize: 16.0),
                  )),
            ],
          ),
        );
      },
    );
  }

  Widget listPeoples(List<User?> userList) {
    // ListView Builder to show data in a list
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            final User? people = userList[index];
            return Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              width: double.maxFinite,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle),
                    child: Image.network(
                      people!.image!,
                      height: 35,
                      width: 35,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      flex: 3,
                      child: Text(
                        people.username!,
                        style: const TextStyle(fontSize: 16.0),
                      )),
                ],
              ),
            );
          },
        ));
  }

  Container _balanceCard(
    BuildContext context,
    double totalBalance,
    double incomeAmount,
    double expenseAmount,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.bottomCenter,
      width: SizeResource.getSize(context).width * 0.88,
      height: SizeResource.getSize(context).height * 0.25,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.normal,
            color: Colors.grey.shade600,
            spreadRadius: 1,
            blurRadius: 18,
            offset: const Offset(0, 5),
          ),
          const BoxShadow(
            blurStyle: BlurStyle.inner,
            color: ColorResource.onPrimary,
            spreadRadius: 5,
            blurRadius: 1,
            offset: Offset(5, 0),
          ),
          const BoxShadow(
            blurStyle: BlurStyle.inner,
            color: ColorResource.onPrimary,
            spreadRadius: 5,
            blurRadius: 1,
            offset: Offset(-5, 0),
          )
        ],
        shape: BoxShape.rectangle,
        color: ColorResource.onPrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  StringResource.sTotalBalance,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.white,
                      size: 20,
                    ))
              ],
            ),
            WidgetResource.getBalance(
                "\$", totalBalance, Colors.white, FontWeight.bold, 30),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            alignment: Alignment.center,
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                color: Colors.white.withAlpha(35),
                                shape: BoxShape.circle),
                            child: IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const Text(
                              StringResource.sIncome,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFFD0E5E4)),
                            ),
                          )
                        ],
                      ),
                      WidgetResource.getBalance(
                          "\$", incomeAmount, Colors.white, FontWeight.w600, 20)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            alignment: Alignment.center,
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                color: Colors.white.withAlpha(35),
                                shape: BoxShape.circle),
                            child: IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_upward_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const Text(
                              StringResource.sExpenses,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFFD0E5E4)),
                            ),
                          )
                        ],
                      ),
                      WidgetResource.getBalance(
                          "\$", incomeAmount, Colors.white, FontWeight.w600, 20,
                          mainAxisAlignment: MainAxisAlignment.end)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
