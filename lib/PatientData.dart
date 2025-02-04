import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// ignore: unused_import
import 'package:share_plus/share_plus.dart';
import 'package:open_filex/open_filex.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';

class PatientDataScreen extends StatefulWidget {
  final Map<String, String> patient;

   const PatientDataScreen({super.key, required this.patient});

  @override
   State createState() =>_PatientDataScreenState();
}

class _PatientDataScreenState extends State <PatientDataScreen> {
  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String _selectedPaymentMethod = "Cash"; // Default value
final TextEditingController _amountController = TextEditingController();
bool _isPaid = false;


Future<void> requestPermissions() async {
  // Request storage permissions
  var status = await Permission.storage.request();

  if (status.isGranted) {
    // Permission granted, you can now access the file
    print('Permission granted');
  } else if (status.isDenied) {
    // Permission denied
    print('Permission denied');
  } else if (status.isPermanentlyDenied) {
    // If the permission is permanently denied, open settings to allow the user to change it
    openAppSettings();
  }
}



late Razorpay _razorpay;

@override
void initState() {
  super.initState();
  _razorpay = Razorpay();
  
  _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
}

void _startPayment() {
  var options = {
    'key': 'rzp_test_yourapikey', // Replace with Razorpay Key
    'amount': (double.parse(_amountController.text) * 100).toInt(), // Amount in paise
    'name': 'Eye Clinic',
    'description': 'Payment for consultation',
    'prefill': {
      'contact': widget.patient['contact'],
      'email': 'example@email.com'
    }
  };

  _razorpay.open(options);
}

void _handlePaymentSuccess(PaymentSuccessResponse response) {
  setState(() {
    _isPaid = true;
  });

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Successful!")));
}

void _handlePaymentError(PaymentFailureResponse response) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Failed!")));
}

void _handleExternalWallet(ExternalWalletResponse response) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("External Wallet Selected!")));
}

void _confirmCashPayment() {
  setState(() {
    _isPaid = true;
  });

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Confirmed (Cash)")));
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAE2FF), // Light purple background
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        title: Text(
          "Patient Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width:450,
                decoration: BoxDecoration(),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: ${widget.patient['name']}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text("Age: ${widget.patient['age']}"),
                        Text("Gender: ${widget.patient['gender']}"),
                        Text("Phone No: ${widget.patient['contact']}"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Text("Prescription", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),

              TextField(
                controller: _medicineController,
                decoration: InputDecoration(
                  labelText: "Medicine Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: _dosageController,
                decoration: InputDecoration(
                  labelText: "Dosage",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: _notesController,
                decoration: InputDecoration(
                  labelText: "Additional Notes",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              

DropdownButtonFormField<String>(
  value: _selectedPaymentMethod,
  onChanged: (value) {
    setState(() {
      _selectedPaymentMethod = value!;
    });
  },
  items: ["Cash", "Online"].map((method) {
    return DropdownMenuItem(value: method, child: Text(method));
  }).toList(),
  decoration: InputDecoration(labelText: "Payment Method"),
),

TextField(
  controller: _amountController,
  keyboardType: TextInputType.number,
  decoration: InputDecoration(labelText: "Amount"),
),
const SizedBox(height: 30,),
ElevatedButton(
  
  onPressed: _selectedPaymentMethod == "Online" ? _startPayment : _confirmCashPayment,
  child: Text("Make Payment"),
),


              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    _generatePrescription();
                  },
                  child: Text("Generate Prescription", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
//pdf generation only****************************************
//   void _generatePrescription() {
//     String medicine = _medicineController.text;
//     String dosage = _dosageController.text;
//     String notes = _notesController.text;

//     if (medicine.isEmpty || dosage.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please enter medicine name and dosage")),
//       );
//       return;
//     }

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Prescription Generated"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Patient: ${widget.patient['name']}"),
//               Text("Medicine: $medicine"),
//               Text("Dosage: $dosage"),
//               Text("Notes: $notes"),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }



// void _generatePrescription() async {
//   String medicine = _medicineController.text;
//   String dosage = _dosageController.text;
//   String notes = _notesController.text;

//   if (medicine.isEmpty || dosage.isEmpty) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Please enter medicine name and dosage")),
//     );
//     return;
//   }

//   final pdf = pw.Document();

//   pdf.addPage(
//     pw.Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) {
//         return pw.Padding(
//           padding: pw.EdgeInsets.all(20),
//           child: pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text("Patient Prescription", style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 10),
//               pw.Text("Patient: ${widget.patient['name']}", style: pw.TextStyle(fontSize: 18)),
//               pw.Text("Age: ${widget.patient['age']}", style: pw.TextStyle(fontSize: 16)),
//               pw.Text("Gender: ${widget.patient['gender']}", style: pw.TextStyle(fontSize: 16)),
//               pw.Text("Phone No: ${widget.patient['phone']}", style: pw.TextStyle(fontSize: 16)),
//               pw.SizedBox(height: 20),
//               pw.Text("Prescription Details:", style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 10),
//               pw.Text("Medicine: $medicine", style: pw.TextStyle(fontSize: 16)),
//               pw.Text("Dosage: $dosage", style: pw.TextStyle(fontSize: 16)),
//               pw.Text("Notes: $notes", style: pw.TextStyle(fontSize: 16)),
//               pw.SizedBox(height: 30),
//               pw.Text("Doctor's Signature: ____________________", style: pw.TextStyle(fontSize: 16)),
//             ],
//           ),
//         );
//       },
//     ),
//   );

//   // Get a directory to save the file
//   final output = await getExternalStorageDirectory();
//   final file = File("${output!.path}/prescription_${widget.patient['name']}.pdf");
  
//   // Save the PDF
//   await file.writeAsBytes(await pdf.save());

//   // Show confirmation and share
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text("PDF Saved: ${file.path}")),
//   );

//   // Open Share dialog
//   Share.shareXFiles([XFile(file.path)], text: "Patient Prescription");
// }



//*************************pdf is generated and also stored in mobile device****************
// void _generatePrescription() async {
//   String medicine = _medicineController.text;
//   String dosage = _dosageController.text;
//   String notes = _notesController.text;

//   if (medicine.isEmpty || dosage.isEmpty) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Please enter medicine name and dosage")),
//     );
//     return;
//   }

//   final pdf = pw.Document();

//   pdf.addPage(
//     pw.Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) {
//         return pw.Padding(
//           padding: pw.EdgeInsets.all(20),
//           child: pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text("Patient Prescription", style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 10),
//               pw.Text("Patient: ${widget.patient['name']}", style: pw.TextStyle(fontSize: 18)),
//               pw.Text("Age: ${widget.patient['age']}", style: pw.TextStyle(fontSize: 16)),
//               pw.Text("Gender: ${widget.patient['gender']}", style: pw.TextStyle(fontSize: 16)),
//               pw.Text("Phone No: ${widget.patient['phone']}", style: pw.TextStyle(fontSize: 16)),
//               pw.SizedBox(height: 20),
//               pw.Text("Prescription Details:", style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 10),
//               pw.Text("Medicine: $medicine", style: pw.TextStyle(fontSize: 16)),
//               pw.Text("Dosage: $dosage", style: pw.TextStyle(fontSize: 16)),
//               pw.Text("Notes: $notes", style: pw.TextStyle(fontSize: 16)),
//               pw.SizedBox(height: 30),
//               pw.Text("Doctor's Signature: ____________________", style: pw.TextStyle(fontSize: 16)),
//             ],
//           ),
//         );
//       },
//     ),
//   );

//   // 📂 Save to Downloads folder for easy access
//   Directory? downloadsDir;
//   if (Platform.isAndroid) {
//     downloadsDir = Directory("/storage/emulated/0/Download"); // Android downloads folder
//   } else {
//     downloadsDir = await getApplicationDocumentsDirectory(); // iOS storage
//   }

//   final file = File("${downloadsDir!.path}/Prescription_${widget.patient['name']}.pdf");
//   await file.writeAsBytes(await pdf.save());

//   // ✅ Show Snackbar confirming file saved location
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text("PDF Saved: ${file.path}")),
//   );

//   // 📂 Open the saved PDF file
//   OpenFilex.open(file.path);

//   // 📤 Option to share the file
//   Share.shareXFiles([XFile(file.path)], text: "Patient Prescription");
// }


Future<void> pickFile() async {
  // Allow the user to pick a file
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    // Get the selected file's path
    String? filePath = result.files.single.path;

    if (filePath != null) {
      // You can now access the file using the path
      print('Picked file path: $filePath');
    }
  } else {
    // User canceled the picker
    print('No file selected');
  }
}


//3 *************Pdf generation with direct open option


void _generatePrescription() async {
  String medicine = _medicineController.text;
  String dosage = _dosageController.text;
  String notes = _notesController.text;
  //String payment = _paymentController;
  String amount = _amountController.text;

  if (medicine.isEmpty || dosage.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please enter medicine name and dosage")),
    );
    return;
  }

  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Padding(
          padding: pw.EdgeInsets.all(20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text("Patient Prescription", style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text("Patient: ${widget.patient['name']}", style: pw.TextStyle(fontSize: 18)),
               pw.SizedBox(height: 10),
              pw.Text("Age: ${widget.patient['age']}", style: pw.TextStyle(fontSize: 16)),
               pw.SizedBox(height: 10),
              pw.Text("Gender: ${widget.patient['gender']}", style: pw.TextStyle(fontSize: 16)),
               pw.SizedBox(height: 10),
              pw.Text("Phone No: ${widget.patient['phone']}", style: pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 20),
              pw.Text("Prescription Details:", style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text("Medicine: $medicine", style: pw.TextStyle(fontSize: 16)),
               pw.SizedBox(height: 10),
              pw.Text("Dosage: $dosage", style: pw.TextStyle(fontSize: 16)),
               pw.SizedBox(height: 10),
              pw.Text("Notes: $notes", style: pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 10),
              pw.Text("Payment Details:", style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text("Method: $_selectedPaymentMethod", style: pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 10),
              pw.Text("Amount: $amount", style: pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 10),
              pw.Text("Status: ${_isPaid ? 'Paid' : 'Pending'}", style: pw.TextStyle(fontSize: 16, color: _isPaid ? PdfColors.green : PdfColors.red)),
              pw.SizedBox(height: 30),
              pw.Text("Doctor's Signature: ____________________", style: pw.TextStyle(fontSize: 16)),
            ],
          ),
        );
      },
    ),
  );

  // 📂 Save to Downloads folder for easy access
  Directory? downloadsDir;
  if (Platform.isAndroid) {
    downloadsDir = Directory("/storage/emulated/0/Download"); // Android downloads folder
  } else {
    downloadsDir = await getApplicationDocumentsDirectory(); // iOS storage
  }

  final file = File("${downloadsDir.path}/Prescription_${widget.patient['name']}.pdf");
  await file.writeAsBytes(await pdf.save());

  // ✅ Show Dialog Box with Open/Cancel options
  _showOpenPdfDialog(file.path);
}

// 🛠 Show Dialog Box to Open PDF
void _showOpenPdfDialog(String filePath) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Prescription Saved"),
        content: Text("The prescription PDF has been saved successfully.\nDo you want to open it?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close Dialog
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close Dialog
              OpenFilex.open(filePath); // Open PDF
            },
            child: Text("Open"),
          ),
        ],
      );
    },
  );
}



 }
