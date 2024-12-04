import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/controllers/pay_controller.dart';  // Make sure to import the payment controller
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PayPage extends ConsumerStatefulWidget {
  final Function(double, {bool isPayment}) updateBalance;

  PayPage({super.key, required this.updateBalance});

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends ConsumerState<PayPage> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController referenceNumberController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  List<String> disburstmentType = ['BDO', 'BPI', 'Gcash', 'Paymaya'];
  String? selectedDisburstment;
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        imageController.text = pickedFile.name; // Display file name in the text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 239, 229),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text('Pay Application', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedDisburstment,
                items: disburstmentType.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedDisburstment = newValue;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Disbursement Type',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: accountNameController,
                decoration: InputDecoration(
                  labelText: 'Account Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: referenceNumberController,
                decoration: InputDecoration(
                  labelText: 'Reference Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: imageController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Upload Image',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.upload_file),
                    onPressed: _pickImage,
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    double paymentAmount = double.parse(amountController.text);
                    widget.updateBalance(paymentAmount, isPayment: true);  // Subtract the payment from the balance
                  },
                  child: const Text('Apply Pay'),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
