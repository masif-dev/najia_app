import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../utils/constant.dart';

class SubscriptionsPlansPage extends StatefulWidget {
  const SubscriptionsPlansPage({super.key});

  @override
  _SubscriptionsIndexState createState() => _SubscriptionsIndexState();
}

class _SubscriptionsIndexState extends State<SubscriptionsPlansPage> {
  bool _isLoading = true;
  late Offerings offerings;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await Purchases.setLogLevel(LogLevel.debug);

    late PurchasesConfiguration configuration;
    if (Platform.isAndroid) {
      configuration =
          PurchasesConfiguration(RevenueConstants.revenueCatAndroidKeyNajiaApp);
    } else {
      configuration =
          PurchasesConfiguration(RevenueConstants.revenueCatIosKeyNajiaApp);
    }
    await Purchases.configure(configuration);
    initStoreInfo();
  }

  Future<void> initStoreInfo() async {
    try {
      offerings = await Purchases.getOfferings();
      if (offerings.current != null &&
          offerings.current!.availablePackages.isNotEmpty) {
        setState(() {
          _isLoading = false;
        });
      }
    } on PlatformException {
      // optional error handling
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: _buildDetails());
  }

  Widget _buildDetails() {
    final Size screenSize = MediaQuery.of(context).size;

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Row(
        children: <Widget>[
          Expanded(child: createAnnual()),
          SizedBox(
            width: screenSize.width * 0.03,
          ),
          Expanded(child: createMonthly()),
        ],
      );
    }
  }

  Widget createMonthly() {
    final Size screenSize = MediaQuery.of(context).size;
    late Widget tempWidget;

    if (offerings.current!.availablePackages.isNotEmpty) {
      for (Package package in offerings.current!.availablePackages) {
        if (package.storeProduct.title.toLowerCase().contains('monthly')) {
          tempWidget = Container(
              height: screenSize.height * 0.1,
              margin: EdgeInsets.only(
                top: screenSize.height * 0.02,
                bottom: screenSize.height * 0.02,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: Colors.transparent,
              ),
              child: RawMaterialButton(
                onPressed: () async {
                  try {
                    CustomerInfo purchaserInfo =
                        await Purchases.purchasePackage(package);
                    print('got purchaser info');
                    print(
                        'got purchaser info ${purchaserInfo.activeSubscriptions}');
                    print('got purchaser info ${purchaserInfo.entitlements}');
                    print(
                        'got purchaser info ${purchaserInfo.allPurchasedProductIdentifiers}');
                    if (purchaserInfo
                        .entitlements.all["subscription"]!.isActive) {
                      // Unlock that great "pro" content

                      print('purchaserInfo.originalAppUserId: ');
                      // print('purchaserInfo.firstSeen: ' +
                      //     purchaserInfo.firstSeen);
                      // print(
                      //     'purchaserInfo.originalPurchaseDate: ${purchaserInfo.originalPurchaseDate}');
                      // print(
                      //     'purchaserInfo.latestExpirationDate: ${purchaserInfo.latestExpirationDate!}');
                    } else {
                      print("Error occur in Activating Subscription");
                    }
                  } catch (e) {
                    print("Error occur in Activating Subscription");
                  }
                },
                child: SizedBox(
                  width: screenSize.width * 0.85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: screenSize.height * 0.0025,
                          bottom: screenSize.height * 0.0025,
                        ),
                        child: Text(package.storeProduct.priceString,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenSize.height * 0.028,
                                fontWeight: FontWeight.w600)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: screenSize.height * 0.0025,
                          bottom: screenSize.height * 0.0025,
                        ),
                        child: Text('monthly',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenSize.height * 0.025)),
                      ),
                    ],
                  ),
                ),
              ));
        }
      }
      return tempWidget;
    } else {
      return const Text('create monthly');
    }
  }

  Widget createAnnual() {
    final Size screenSize = MediaQuery.of(context).size;
    late Widget tempWidget;

    if (offerings.current!.availablePackages.isNotEmpty) {
      for (var package in offerings.current!.availablePackages) {
        if (package.storeProduct.title.toLowerCase().contains('annual')) {
          tempWidget = Container(
              height: screenSize.height * 0.1,
              margin: EdgeInsets.only(
                top: screenSize.height * 0.02,
                bottom: screenSize.height * 0.02,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Colors.transparent),
              child: RawMaterialButton(
                onPressed: () async {
                  try {
                    CustomerInfo purchaserInfo =
                        await Purchases.purchasePackage(package);
                    print('got purchaser info');
                    if (purchaserInfo
                        .entitlements.all["subscription"]!.isActive) {
                      // Unlock that great "pro" content

                      // print('purchaserInfo.originalAppUserId: ' +
                      //     purchaserInfo.originalAppUserId);
                      // print('purchaserInfo.firstSeen: ' +
                      //     purchaserInfo.firstSeen);
                    } else {
                      print("Error Activating Subscription");
                    }
                  } catch (e) {
                    print("Error Activating Subscription");
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: screenSize.height * 0.0025,
                        bottom: screenSize.height * 0.0025,
                      ),
                      child: Text(package.storeProduct.priceString,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenSize.height * 0.028,
                              fontWeight: FontWeight.w600)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: screenSize.height * 0.0025,
                        bottom: screenSize.height * 0.0025,
                      ),
                      child: Text('yearly',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenSize.height * 0.025)),
                    ),
                  ],
                ),
              ));
        }
      }
      return tempWidget;
    } else {
      return const Text('createAnnual');
    }
  }
}
