import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PayPage extends StatefulWidget {
  PayPage({super.key});

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
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
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery); // Choose image from gallery
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path); // Store the selected image
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 239, 229),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pay Application'),
            SizedBox(height: 16),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
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
                controller: imageController, // Controller to display image file name
                readOnly: true, // Make it read-only since the image is picked via the button
                decoration: InputDecoration(
                  labelText: 'Upload Image',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.upload_file), // Icon for image upload
                    onPressed: _pickImage, // Trigger image picker
                  ),
                ),
              ),
          ],
          ),
        ),
    );
  }
}