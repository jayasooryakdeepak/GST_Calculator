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

  void _calculateGst(double gstRate) {
    setState(() {
      _gstRate = gstRate;
      _cgst = _sgst = _amount * (gstRate / 200);
    });
  }

  void _clear() {
    setState(() {
      _amount = 0.0;
      _gstRate = 0.0;
      _cgst = 0.0;
      _sgst = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GST Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
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
              height: 10.0,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('GST'),
                Text('₹ ${_amount.toStringAsFixed(2)}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total'),
                Text('₹ ${(_amount + _cgst + _sgst).toStringAsFixed(2)}'),
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
                  onPressed: _clear,
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
        primarySwatch: Colors.yellow,
      ),
      home: GstCalculator(),
    );
  }
}
