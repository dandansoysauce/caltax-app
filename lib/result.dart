import 'package:flutter/material.dart';
import 'package:caltax/salary_model.dart';

class ResultsPage extends StatelessWidget {
  final Salary salary;

  ResultsPage({Key key, @required this.salary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Deductions"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Your Salary: ${salary.salary.toString()}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0
              ),
            ),
          ),
          Card(
            elevation: 3.0,
            color: Colors.lightGreenAccent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('Your Take Home Pay'),
                  subtitle: Text('Your salary after all the deductions.'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 14.0),
                  child: Text(
                    salary.calculateTakeHomePay(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('Withholding Tax'),
                  subtitle: Text('Your BIR Withholding Tax Deduction.'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 14.0),
                  child: Text(
                    salary.calculateWithholdingTax(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('SSS'),
                  subtitle: Text('Your Social Security System contribution.'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 14.0),
                  child: Text(
                    salary.getSssValue(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('Philhealth'),
                  subtitle: Text('Your monthly Philhealth contribution.'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 14.0),
                  child: Text(
                    salary.getPhilhealth(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('Pag-Ibig Fund'),
                  subtitle: Text('Your Pag-Igib fund contribution.'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 14.0),
                  child: Text(
                    salary.getPagibig(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(height: 50.0)
        ],
      )
    );
  }
}