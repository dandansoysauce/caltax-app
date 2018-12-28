
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:caltax/result.dart';
import 'package:caltax/salary_model.dart';

void main() => runApp(MaterialApp(
  title: 'Caltax App',
  home: CaltaxForm()
));

class CaltaxForm extends StatefulWidget {
  @override
  _CaltaxFormState createState() => _CaltaxFormState();
}

class _CaltaxFormState extends State<CaltaxForm> {
  final myController = TextEditingController();

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: <String>['48c1da960104', '035ADE0AF3F9B8BA1A5041774B1F8C67']
  );

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: 'ca-app-pub-4056098139575656/2412997466',
      targetingInfo: targetingInfo,
      size: AdSize.smartBanner
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: 'ca-app-pub-4056098139575656/6362306171',
      targetingInfo: targetingInfo
    );
  }

  @override
  void initState() {
    super.initState();

    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-4056098139575656~7402256803');
    _bannerAd = createBannerAd()..load()..show(anchorType: AnchorType.bottom, anchorOffset: 0.0);
    _interstitialAd = createInterstitialAd()..load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _interstitialAd.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Center(
                        child: TextField(
                          controller: myController,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          onEditingComplete: () => _calculateTax(context),
                          style: TextStyle(
                              fontSize: 80.0
                          ),
                          decoration: InputDecoration(
                              helperText: 'Input your basic monthly salary',
                              helperStyle: TextStyle(
                                  fontSize: 20.0
                              ),
                              labelText: 'Monthly Salary',
                              labelStyle: TextStyle(
                                  fontSize: 28.0
                              )
                          ),
                        ),
                      ),
                    )
                )
            ),
            ConstrainedBox(
                constraints: new BoxConstraints(minHeight: 120.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70.0,
                      child: FlatButton(
                        onPressed: () => _calculateTax(context),
                        color: Colors.yellow,
                        child: Center(
                            child: Text(
                              'Calculate',
                              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                            )
                        )
                      ),
                    ),
                    Container(
                      height: 50.0,
                    )
                  ],
                )
            )
          ],
        )
    );
  }

  void _calculateTax(context) {
    var salaryInDouble = double.parse(myController.text);
    Salary mySalary = new Salary(salaryInDouble);
    _interstitialAd.show();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultsPage(salary: mySalary))
    );
  }
}

