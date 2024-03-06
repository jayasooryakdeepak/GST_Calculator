import 'package:flutter/material.dart';

class GstCalculator extends StatefulWidget {
  const GstCalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GstCalculatorState createState() => _GstCalculatorState();
}

class _GstCalculatorState extends State<GstCalculator> {
  double _amount = 0.0;
  double _gstRate = 0.0;
  double _cgst = 0.0;
  double _sgst = 0.0;
  double _gst = 0.0;
  double _total = 0.0;
  final _controller = TextEditingController();


  void _calculateGst(double gstRate) {
    setState(() {
      _gstRate = gstRate;
      _cgst = _sgst = _amount * (gstRate / 200);
      _gst = _amount * (gstRate / 100);
      _total = _gst + _amount;
    });
  }

void _calculateSubGst(double gstRate) {
  setState(() {
    _gstRate = gstRate;
    _total = _amount / ((100+_gstRate) / 100);
    _cgst = _sgst = _total * (_gstRate / 200);
    _gst = _cgst + _sgst;
    _gstRate = 0.0;
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
        title: const Text('GST Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Amount',
                ),
                onChanged: (value) {
                  setState(() {
                    _amount = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              const SizedBox(
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
                    child: const Text('5%'),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculateGst(18),
                    child: const Text('18%'),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculateGst(28),
                    child: const Text('28%'),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: Color.fromARGB(255, 9, 47, 104),
                    // ),
                    onPressed: () => _calculateSubGst(5),
                    child: const Text('-5%'),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculateSubGst(18),
                    child: const Text('-18%'),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculateSubGst(28),
                    child: const Text('-28%'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('CGST'),
                  Text('₹ ${_sgst.toStringAsFixed(2)}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('SGST'),
                  Text('₹ ${_cgst.toStringAsFixed(2)}'),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('GST'),
                  Text('₹ ${_gst.toStringAsFixed(2)}'),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    '₹ ${_total.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 30),
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
                    icon: const Icon(Icons.backspace),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _clear();
                      _controller.clear();
                    },
                    child: const Text('Clear'),
                  ),
                ],
              )
            ],
          ),
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
          scaffoldBackgroundColor: const Color.fromARGB(244, 3, 41, 71),
          primarySwatch: Colors.amber,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ).apply(
            bodyColor: const Color.fromARGB(255, 255, 255, 255),
            displayColor: Colors.green,
          )),
      home: GstCalculator(),
    );
  }
}
