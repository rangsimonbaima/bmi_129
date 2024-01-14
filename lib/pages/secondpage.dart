import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final double bmiValue;
  final String nameInputType;

  const SecondPage({Key? key, required this.bmiValue, required this.nameInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String result;
    Color resultColor;

    // Determine BMI result and color
    if (bmiValue < 18.5) {
      result = 'น้ำหนักน้อยกว่ามาตรฐาน';
      resultColor = Colors.blue;
    } else if (bmiValue <= 22.9) {
      result = 'น้ำหนักปกติ';
      resultColor = Colors.green;
    } else if (bmiValue <= 24.9) {
      result = 'น้ำหนักเกินมาตรฐาน (อันตราย)';
      resultColor = Colors.orange;
    } else if (bmiValue <= 29.9) {
      result = 'โรคอ้วน';
      resultColor = const Color.fromARGB(255, 241, 60, 160);
    } else {
      result = 'โรคอ้วนขั้นสูง (อันตรายมาก)';
      resultColor = const Color.fromARGB(255, 176, 39, 39);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("ผลการคำนวณ BMI"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfoContainer(nameInputType),
              const SizedBox(height: 20),
              _buildInfoContainer('ค่า BMI ของคุณคือ: ${bmiValue.toStringAsFixed(2)}'),
              const SizedBox(height: 20),
              _buildResultContainer(result, resultColor),
              const SizedBox(height: 85),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: const Color.fromARGB(255, 118, 122, 120),
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 8),  // Add some space between icon and text
            const Text(
              "ย้อนกลับ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 68, 169, 252),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoContainer(String text) {
    return _buildContainer(
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildResultContainer(String result, Color resultColor) {
    return _buildContainer(
      child: Text(
        result,
        style: TextStyle(
          color: resultColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: child,
    );
  }
}
