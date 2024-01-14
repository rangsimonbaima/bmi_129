import 'package:flutter/material.dart';
import 'package:bmi_129/pages/secondpage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController nameInputType = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    heightController.text = '';
    weightController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "BMI",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 192, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: nameInputType,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณาใส่ชื่อ',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Height',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณาใส่ส่วนสูง (cm)',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Weight',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณาใส่น้ำหนัก (kg)',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  double weight = double.tryParse(weightController.text) ?? 0;
                  double heightInCm =
                      double.tryParse(heightController.text) ?? 0;
                  double bmi;

                  if (heightInCm > 0 && weight > 0) {
                    double heightInMeters = heightInCm / 100;
                    bmi = weight / (heightInMeters * heightInMeters);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                          bmiValue: bmi,
                          nameInputType: nameInputType.text,
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Please enter valid numbers'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 114, 192, 255),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                ),
                child: const Text(
                  'คำนวณ BMI',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
