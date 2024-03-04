import 'package:flutter/material.dart';

class GstCalculator extends StatefulWidget {
  @override
  _GstCalculatorState createState() => _GstCalculatorState();
}

class _GstCalculatorState extends State<GstCalculator> {
  double _amount = 0.0;
  double _gstRate = 0.0;
  double _cgst = 0.0;
  double _sgst = 0.0;
  double _gst = 0.0;
  double _total = 0.0;
  var _controller = TextEditingController();


  void _calculateGst(double gstRate) {
    setState(() {
      _gstRate = gstRate;
      _cgst = _sgst = _amount * (gstRate / 200);
      _gst = _amount * (gstRate / 100);
      _total = _gst + _amount;
    });
  }

  void _clear() {
    setState(() {
      _amount = 0.0;
      _gstRate = 0.0;
      _cgst = 0.0;
      _sgst = 0.0;
      _gst = 0.0;
      _total = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text('GST Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
              ),
              onChanged: (value) {
                setState(() {
                  _amount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: Color.fromARGB(255, 9, 47, 104),
                  // ),
                  onPressed: () => _calculateGst(5),
                  child: Text('5%'),
                ),
                ElevatedButton(
                  onPressed: () => _calculateGst(18),
                  child: Text('18%'),
                ),
                ElevatedButton(
                  onPressed: () => _calculateGst(28),
                  child: Text('28%'),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CGST'),
                Text('₹ ${_sgst.toStringAsFixed(2)}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SGST'),
                Text('₹ ${_cgst.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('GST'),
                Text('₹ ${_gst.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  '₹ ${_total.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    if (_amount > 0) {
                      setState(() {
                        _amount = (_amount / 10).floorToDouble();
                      });
                    }
                  },
                  icon: Icon(Icons.backspace),
                ),
                ElevatedButton(
                  onPressed: () {
                    _clear();
                    _controller.clear();
                  },
                  child: Text('Clear'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GST Calculator',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(244, 3, 41, 71),
          primarySwatch: Colors.amber,
          textTheme: TextTheme(
            bodyMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ).apply(
            bodyColor: Color.fromARGB(255, 255, 255, 255),
            displayColor: Colors.green,
          )),
      home: GstCalculator(),
    );
  }
}
