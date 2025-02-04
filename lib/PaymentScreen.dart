// import 'package:flutter/material.dart';

// class PaymentHistoryScreen extends StatelessWidget {
//   // Sample data for payment history with patient details
//   final List<Map<String, dynamic>> transactions = [
//     {
//       'patientName': 'John Doe',
//       'amount': 500.00,
//       'date': '2025-01-10',
//       'status': 'Completed',
//       'method': 'Online',
//     },
//     {
//       'patientName': 'Jane Smith',
//       'amount': 300.00,
//       'date': '2025-01-12',
//       'status': 'Pending',
//       'method': 'Cash',
//     },
//     {
//       'patientName': 'Mark Johnson',
//       'amount': 700.00,
//       'date': '2025-01-15',
//       'status': 'Failed',
//       'method': 'Online',
//     },
//     // Add more data as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Payment History')),
//       body: ListView.builder(
//         itemCount: transactions.length,
//         itemBuilder: (context, index) {
//           final transaction = transactions[index];
//           return Card(
//             margin: EdgeInsets.all(8.0),
//             child: ListTile(
//               contentPadding: EdgeInsets.all(16.0),
//               title: Text('${transaction['patientName']} - ₹${transaction['amount']}'),
//               subtitle: Text('${transaction['method']} - ${transaction['date']}'),
//               trailing: Chip(
//                 label: Text(transaction['status'],style:TextStyle(color:Colors.white)),
//                 backgroundColor: transaction['status'] == 'Completed'
//                     ? Colors.green
//                     : transaction['status'] == 'Pending'
//                         ? Colors.orange
//                         : Colors.red,
//               ),
//               onTap: () {
//                 // Handle navigation to transaction details
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text('Transaction Details'),
//                     content: Text('Patient: ${transaction['patientName']}\n'
//                         'Amount: ₹${transaction['amount']}\n'
//                         'Date: ${transaction['date']}\n'
//                         'Status: ${transaction['status']}\n'
//                         'Method: ${transaction['method']}'),
//                     actions: <Widget>[
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: Text('Close'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

//*************2nd approach */

import 'package:flutter/material.dart';
//import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
//import 'package:share_plus/share_plus.dart';

class PaymentHistoryScreen extends StatelessWidget {
  // Sample data for payment history with patient details
  final List<Map<String, dynamic>> transactions = [
    {
      'patientName': 'John Doe',
      'amount': 500.00,
      'date': '2025-01-10',
      'status': 'Completed',
      'method': 'Online',
    },
    {
      'patientName': 'Jane Smith',
      'amount': 300.00,
      'date': '2025-01-12',
      'status': 'Pending',
      'method': 'Cash',
    },
    {
      'patientName': 'Mark Johnson',
      'amount': 700.00,
      'date': '2025-01-15',
      'status': 'Failed',
      'method': 'Online',
    },
    // Add more data as needed
  ];

  Future<void> generateReceipt(Map<String, dynamic> transaction) async {
    // Generate a simple PDF receipt
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Payment Receipt\n\n'
                'Patient: ${transaction['patientName']}\n'
                'Amount: ₹${transaction['amount']}\n'
                'Date: ${transaction['date']}\n'
                'Status: ${transaction['status']}\n'
                'Method: ${transaction['method']}'),
          );
        },
      ),
    );
     // Get the platform directory
    final directory = await getExternalStorageDirectory();

    // Android - Get Downloads directory
    String downloadPath = directory!.path;
    if (Platform.isAndroid) {
      downloadPath = '${downloadPath}/Download'; // Use Download folder for Android
    } else {
      downloadPath = '${directory.path}/Documents'; // Default Documents directory for iOS
    }

    final downloadsFolder = Directory(downloadPath);
    if (!await downloadsFolder.exists()) {
      await downloadsFolder.create(recursive: true); // Create folder if doesn't exist
    }

    final file = File("${downloadsFolder.path}/payment_receipt_${transaction['patientName']}.pdf");
    await file.writeAsBytes(await pdf.save());

    // Notify user that the file is saved
    print("Receipt saved at: ${file.path}");

    // // Save PDF to local storage
    // final output = await getTemporaryDirectory();
    // final file = File("${output.path}/payment_receipt_${transaction['patientName']}.pdf");
    // await file.writeAsBytes(await pdf.save());

    // // Notify user that the file is saved
    // print("Receipt saved at: ${file.path}");

    // Share the receipt
    //await Share.shareFiles([file.path], text: 'Here is your payment receipt!');
   // await Share.share('Here is your payment receipt!', subject: 'Payment Receipt', files: [file.path]);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment History')),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              title: Text('${transaction['patientName']} - ₹${transaction['amount']}'),
              subtitle: Text('${transaction['method']} - ${transaction['date']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Chip(
                    label: Text(transaction['status'], style: TextStyle(color: Colors.white)),
                    backgroundColor: transaction['status'] == 'Completed'
                        ? Colors.green
                        : transaction['status'] == 'Pending'
                            ? Colors.orange
                            : Colors.red,
                  ),
                  IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () async {
                      await generateReceipt(transaction); // Generate and download the receipt
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Receipt downloaded")));
                    },
                  ),
                ],
              ),
              onTap: () {
                // Handle navigation to transaction details
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Transaction Details'),
                    content: Text('Patient: ${transaction['patientName']}\n'
                        'Amount: ₹${transaction['amount']}\n'
                        'Date: ${transaction['date']}\n'
                        'Status: ${transaction['status']}\n'
                        'Method: ${transaction['method']}'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

