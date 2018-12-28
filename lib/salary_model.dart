class Salary {
  final double salary;
  double wholding;
  double philhealth;
  double sss;
  double pagibig = 100;

  Salary(this.salary);

  String calculateTakeHomePay() {
    var holding = double.parse(calculateWithholdingTax());
    var philHealth = double.parse(getPhilhealth());
    var sss = double.parse(getSssValue());
    var pagibig = double.parse(getPagibig());

    var total = salary - (holding + philHealth + sss + pagibig);

    return total.toStringAsFixed(2);
  }

  String calculateWithholdingTax() {
    if (salary == 0.0 || salary == null) {
      return 0.0.toStringAsFixed(2);
    }

    var taxBracket = <Tax>[]
      ..add(new Tax('one', 250000.0, 20.0, 0.0))
      ..add(new Tax('two', 400000.0, 25.0, 30000.0))
      ..add(new Tax('three', 800000.0, 30.0, 130000.0))
      ..add(new Tax('four', 2000000.0, 32.0, 490000.0))
      ..add(new Tax('five', 8000000.0, 35.0, 2410000.0));

    double annualAmount = salary * 12;
    String bracket = '';
    if (annualAmount <= 250000) {
      return 0.0.toStringAsFixed(2);
    } else if (annualAmount > 250000 && annualAmount <= 400000) {
      bracket = 'one';
    } else if (annualAmount > 400000 && annualAmount <= 800000) {
      bracket = 'two';
    } else if (annualAmount > 800000 && annualAmount <= 2000000) {
      bracket = 'three';
    } else if (annualAmount > 2000000 && annualAmount <= 8000000) {
      bracket = 'four';
    } else if (annualAmount > 8000000) {
      bracket = 'five';
    }

    var getBracket = taxBracket.firstWhere((e) => e.name == bracket);
    if (getBracket == null) {
      return 0.0.toStringAsFixed(2);
    }

    double deductAnnualToMin = annualAmount - getBracket.min;
    double getExcessPercentage = (getBracket.percentage / 100) * deductAnnualToMin;
    double withHoldingTax = getExcessPercentage + getBracket.fixed;

    return (withHoldingTax / 12).toStringAsFixed(2);
  }

  String getSssValue() {
    if (salary == 0.0 || salary == null) {
      return 0.toStringAsFixed(2);
    }

    var amount = 0.0;
    
    var sssBracket = <Sss>[]
      ..add(new Sss(1000, 1249.99, 36.30))
      ..add(new Sss(1250, 1746.99, 54.50))
      ..add(new Sss(1750, 2249.99, 72.70))
      ..add(new Sss(2250, 2749.99, 90.80))
      ..add(new Sss(2750, 3249.99, 109))
      ..add(new Sss(3250, 3749.99, 127.20))
      ..add(new Sss(3750, 4249.99, 145.30))
      ..add(new Sss(4250, 4749.99, 163.50))
      ..add(new Sss(4750, 5249.99, 181.70))
      ..add(new Sss(5250, 5749.99, 199.80))
      ..add(new Sss(5750, 6249.99, 218))
      ..add(new Sss(6250, 6749.99, 236.20))
      ..add(new Sss(6750, 7249.99, 254.30))
      ..add(new Sss(7250, 7749.99, 272.50))
      ..add(new Sss(7750, 8249.99, 290.70))
      ..add(new Sss(8250, 8749.99, 308.80))
      ..add(new Sss(8750, 9249.99, 327))
      ..add(new Sss(9250, 9749.99, 345.20))
      ..add(new Sss(9750, 10249.99, 363.30))
      ..add(new Sss(10250, 10749.99, 381.50))
      ..add(new Sss(10750, 11249.99, 399.70))
      ..add(new Sss(11250, 11749.99, 417.80))
      ..add(new Sss(11750, 12249.99, 436))
      ..add(new Sss(12250, 12749.99, 454.20))
      ..add(new Sss(12750, 13249.99, 472.30))
      ..add(new Sss(13250, 13749.99, 490.50))
      ..add(new Sss(13750, 14249.99, 508.70))
      ..add(new Sss(14250, 14749.99, 526.80))
      ..add(new Sss(14750, 15249.99, 545))
      ..add(new Sss(15250, 15749.99, 563.20))
      ..add(new Sss(15750, 9007199254740991, 581.30));

    for (var contrib in sssBracket) {
      if (salary >= contrib.min && salary <= contrib.max) {
        amount = contrib.value;
      }
    }

    return amount.toStringAsFixed(2);
  }

  String getPhilhealth() {
    if (salary == 0.0 || salary == null) {
      return 0.toStringAsFixed(2);
    }

    var amount = 0.0;
    
    var philhealthBracket = <Philhealth>[]
      ..add(new Philhealth(0, 8999.99, 100))
      ..add(new Philhealth(9000, 9999.99, 112.50))
      ..add(new Philhealth(10000, 10999.99, 125))
      ..add(new Philhealth(11000, 11999.99, 137.50))
      ..add(new Philhealth(12000, 12999.99, 150))
      ..add(new Philhealth(13000, 13999.99, 162.50))
      ..add(new Philhealth(14000, 14999.99, 175))
      ..add(new Philhealth(15000, 15999.99, 187.50))
      ..add(new Philhealth(16000, 16999.99, 200))
      ..add(new Philhealth(17000, 17999.99, 212.50))
      ..add(new Philhealth(18000, 18999.99, 225))
      ..add(new Philhealth(19000, 19999.99, 237.50))
      ..add(new Philhealth(20000, 20999.99, 250))
      ..add(new Philhealth(21000, 21999.99, 262.50))
      ..add(new Philhealth(22000, 22999.99, 275))
      ..add(new Philhealth(23000, 23999.99, 287.50))
      ..add(new Philhealth(24000, 24999.99, 300))
      ..add(new Philhealth(25000, 25999.99, 312.50))
      ..add(new Philhealth(26000, 26999.99, 325))
      ..add(new Philhealth(27000, 27999.99, 337.50))
      ..add(new Philhealth(28000, 28999.99, 350))
      ..add(new Philhealth(29000, 29999.99, 362.50))
      ..add(new Philhealth(30000, 30999.99, 375))
      ..add(new Philhealth(31000, 31999.99, 387.50))
      ..add(new Philhealth(32000, 32999.99, 400))
      ..add(new Philhealth(33000, 33999.99, 412.50))
      ..add(new Philhealth(34000, 34999.99, 425))
      ..add(new Philhealth(35000, 9007199254740991, 437.50));

    for (var contrib in philhealthBracket) {
      if (salary >= contrib.min && salary <= contrib.max) {
        amount = contrib.value;
      }
    }

    return amount.toStringAsFixed(2);
  }

  String getPagibig() {
    return pagibig.toStringAsFixed(2);
  }
}

class Philhealth {
  final double min;
  final double max;
  final double value;

  Philhealth(this.min, this.max, this.value);
}

class Sss {
  final double min;
  final double max;
  final double value;

  Sss(this.min, this.max, this.value);
}

class Tax {
  final String name;
  final double min;
  final double percentage;
  final double fixed;

  Tax(this.name, this.min, this.percentage, this.fixed);
}