// =======================================================
// main.dart
// Flutter Interest Calculator App
// =======================================================
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// =======================================================
// MAIN APP
// =======================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Interest Calculator",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}

// =======================================================
// HOME SCREEN
// =======================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Interest Calculator"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 20),

            const Icon(
              Icons.calculate,
              size: 100,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 20),

            const Text(
              "Welcome, Student!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Calculate Simple & Compound Interest easily.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 40),

            // SIMPLE INTEREST CARD
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const SimpleInterestScreen(),
                  ),
                );
              },

              child: Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.percent,
                    color: Colors.deepPurple,
                    size: 35,
                  ),
                  title: const Text(
                    "Simple Interest",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    "Calculate simple interest",
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // COMPOUND INTEREST CARD
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CompoundInterestScreen(),
                  ),
                );
              },

              child: Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.account_balance,
                    color: Colors.deepPurple,
                    size: 35,
                  ),
                  title: const Text(
                    "Compound Interest",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    "Calculate compound interest",
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =======================================================
// SIMPLE INTEREST SCREEN
// =======================================================

class SimpleInterestScreen extends StatefulWidget {
  const SimpleInterestScreen({super.key});

  @override
  State<SimpleInterestScreen> createState() =>
      _SimpleInterestScreenState();
}

class _SimpleInterestScreenState
    extends State<SimpleInterestScreen> {

  TextEditingController principalController =
      TextEditingController();

  TextEditingController rateController =
      TextEditingController();

  TextEditingController timeController =
      TextEditingController();

  double result = 0;
  double totalAmount = 0;

  // CALCULATE SI
  void calculateSI() {

    double p =
        double.parse(principalController.text);

    double r =
        double.parse(rateController.text);

    double t =
        double.parse(timeController.text);

    result = (p * r * t) / 100;

    totalAmount = p + result;

    setState(() {});
  }

  // RESET
  void resetFields() {

    principalController.clear();
    rateController.clear();
    timeController.clear();

    result = 0;
    totalAmount = 0;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Simple Interest"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: principalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Principal Amount",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: rateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Rate of Interest",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: timeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Time",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: ElevatedButton(
                    onPressed: calculateSI,
                    child: const Text("Calculate"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: OutlinedButton(
                    onPressed: resetFields,
                    child: const Text("Reset"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 5,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [

                    const Text(
                      "Simple Interest",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "₹ ${result.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "Total Interest : ₹ ${result.toStringAsFixed(2)}",
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Total Amount : ₹ ${totalAmount.toStringAsFixed(2)}",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =======================================================
// COMPOUND INTEREST SCREEN
// =======================================================

class CompoundInterestScreen extends StatefulWidget {
  const CompoundInterestScreen({super.key});

  @override
  State<CompoundInterestScreen> createState() =>
      _CompoundInterestScreenState();
}

class _CompoundInterestScreenState
    extends State<CompoundInterestScreen> {

  TextEditingController principalController =
      TextEditingController();

  TextEditingController rateController =
      TextEditingController();

  TextEditingController timeController =
      TextEditingController();

  TextEditingController numberController =
      TextEditingController();

  double result = 0;
  double totalAmount = 0;

  // CALCULATE CI
  void calculateCI() {

    double p =
        double.parse(principalController.text);

    double r =
        double.parse(rateController.text);

    double t =
        double.parse(timeController.text);

    double n =
        double.parse(numberController.text);

    totalAmount =
        p * (pow((1 + (r / (100 * n))), (n * t)));

    result = totalAmount - p;

    setState(() {});
  }

  // RESET
  void resetFields() {

    principalController.clear();
    rateController.clear();
    timeController.clear();
    numberController.clear();

    result = 0;
    totalAmount = 0;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Compound Interest"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            children: [

              TextField(
                controller: principalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Principal Amount",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: rateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Rate of Interest",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Time",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText:
                  "Number of times interest applied/year",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [

                  Expanded(
                    child: ElevatedButton(
                      onPressed: calculateCI,
                      child: const Text("Calculate"),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: OutlinedButton(
                      onPressed: resetFields,
                      child: const Text("Reset"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 5,

                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    children: [

                      const Text(
                        "Compound Interest",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        "₹ ${result.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        "Total Interest : ₹ ${result.toStringAsFixed(2)}",
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Total Amount : ₹ ${totalAmount.toStringAsFixed(2)}",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =======================================================
// IMPORT REQUIRED FOR pow()
// =======================================================
