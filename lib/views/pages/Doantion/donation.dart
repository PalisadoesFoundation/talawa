import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Donation extends StatefulWidget {
  final String name;
  Donation({this.name});

  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  // initilize the all the butoonCheck to false
  Map<int, bool> buttonCheck = {
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false
  };
  //currencySymbol set to rupees by default
  String currencySymbol = "₹";
  // amount for donation
  int _amount = 0;
  // for validation purpose
  final _formKey = GlobalKey<FormState>();
  // instance of Razorpay
  Razorpay _razorpay = Razorpay();

  // initilizing the Events for Razorpay
  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  // clear the razorpay instance
  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  // Main UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // top Banner
          Expanded(
            flex: 3,
            child: Stack(
              children: <Widget>[
                // picture in the banner
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/donation.jpg'),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                // Text in the Banner
                Positioned(
                  bottom: 20,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 2,
                        width: 50,
                        color: Color(0xFF5B86E5),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Help Us",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white, //Color(0xFF9EA19E),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Buttons for amount Selection
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: CustomButton(1, 50)),
                            SizedBox(width: 10),
                            Expanded(child: CustomButton(2, 100)),
                            SizedBox(width: 10),
                            Expanded(child: CustomButton(3, 500)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: CustomButton(4, 1000)),
                            SizedBox(width: 10),
                            Expanded(child: CustomButton(5, 5000)),
                            SizedBox(width: 10),
                            Expanded(child: CustomButton(6, 0)),
                          ],
                        ),
                      ],
                    ),
                    // Final donation button
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          // start the Razorpay Gateway
                          _openRazorpay();
                        },
                        child: Text(
                          "Donate $currencySymbol $_amount",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// When transaction is Successful
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    showPaymentPopupMessage(context, true, 'Payment Successful!');
  }

  /// When transaction Fails
  void _handlePaymentError(PaymentFailureResponse response) {
    showPaymentPopupMessage(context, false, 'Payment Failed!');
  }

// Display message widget for
  void showPaymentPopupMessage(
      BuildContext ctx, bool isPaymentSuccess, String message) {
    showDialog<void>(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              isPaymentSuccess
                  ? Icon(
                      Icons.done,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
              SizedBox(
                width: 5,
              ),
              Text(
                isPaymentSuccess ? 'Payment Successful' : 'Payment Failed',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(message),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// giving options to Razorpay
  void _openRazorpay() async {
    var options = {
      'key': 'rzp_test_Md1qqpWMrwMR0v',
      'amount': (_amount * 100),
      'name': '${widget.name}',
      'description': 'Thank you for donating us!',
      'theme': {
        'color': '#ffa500',
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  // Logic for Selecting amount from buttons
  void changeAmount(int type, int amt) {
    for (int i = 1; i <= 6; i++) {
      buttonCheck[i] = false;
    }
    if (type == 1) {
      setState(() {
        buttonCheck[1] = true;
        _amount = amt;
      });
    } else if (type == 2) {
      setState(() {
        buttonCheck[2] = true;
        _amount = amt;
      });
    } else if (type == 3) {
      setState(() {
        buttonCheck[3] = true;
        _amount = amt;
      });
    } else if (type == 4) {
      setState(() {
        buttonCheck[4] = true;
        _amount = amt;
      });
    } else if (type == 5) {
      setState(() {
        buttonCheck[5] = true;
        _amount = amt;
      });
    } else if (type == 6) {
      setState(() {
        buttonCheck[6] = true;
        _showCustomPayDialog();
      });
    }
  }

  // Custom pay dialog
  Future<void> _showCustomPayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Amount'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    helperText: "Enter the Amount",
                    icon: Icon(Icons.monetization_on_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  int v = int.tryParse(value);
                  if (v == null) {
                    return "Enter a Number";
                  } else if (value.isEmpty) {
                    return "Enter a Amount";
                  }

                  return null;
                },
                onSaved: (value) {
                  _amount = int.tryParse(value);
                },
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Navigator.of(context).pop();
                }
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                setState(() {
                  _amount = 0;
                  buttonCheck[6] = false;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

// Custom button to select amount for donation
  RaisedButton CustomButton(int type, int amt) {
    return RaisedButton(
      key: Key(type.toString()),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(
            width: 2,
            color: buttonCheck[type] == false
                ? Color(0xFFa2a2a2)
                : Color(0xFF4ea0e8)),
      ),
      color: buttonCheck[type] == false ? Colors.white : Color(0xFFe8f3fe),
      onPressed: () {
        if (buttonCheck[type] == false) {
          changeAmount(type, amt);
        }
      },
      child: Text(
        amt == 0 ? "Other" : "$currencySymbol $amt",
        style: TextStyle(
            fontSize: 17,
            color: buttonCheck[type] == false
                ? Color(0xFFa2a2a2)
                : Color(0xFF4ea0e8)),
      ),
    );
  }
}
