// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';



// class Appointmentconfirmation extends StatefulWidget {
//   const Appointmentconfirmation({super.key});

//   @override

// State createState() => _AppointmentconfirmationState();

// }

// class _AppointmentconfirmationState extends State<Appointmentconfirmation> {
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   final TextEditingController _assignDocController = TextEditingController();
//   //final TextEditingController _Controller = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();


//   void _selectDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   void _selectTime() async {
//     TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//    Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: Text('Book an Appointment'),
//           backgroundColor: Colors.deepPurpleAccent,
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(14.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Patient Name'),
//               ),
//               TextField(
//                 controller: _ageController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(labelText: 'Age'),
//               ),
//               TextField(
//                 controller: _genderController,
//                 decoration: InputDecoration(labelText: 'Gender'),
//               ),
//               TextField(
//                 controller: _assignDocController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(labelText: 'Assign Doctor'),
//               ),
//               TextField(
//                 controller: _phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(selectedDate == null
//                       ? 'Select Date'
//                       : DateFormat('yyyy-MM-dd').format(selectedDate!)),
//                   ElevatedButton(
//                     onPressed: _selectDate,
//                     child: Text('Pick Date'),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(selectedTime == null
//                       ? 'Select Time'
//                       : selectedTime!.format(context)),
//                   ElevatedButton(
//                     onPressed: _selectTime,
//                     child: Text('Pick Time'),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_nameController.text.isNotEmpty &&
//                         _phoneController.text.isNotEmpty &&
//                         selectedDate != null &&
//                         selectedTime != null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Appointment Confirmed!')),
//                       );
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Please complete all fields')),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     backgroundColor: Colors.deepPurpleAccent,
//                   ),
//                   child: Text('Confirm Appointment'),
//                 ),
//               ),
//             ],
//           ),
//         ),
      
//     );
//   }
// }


//2ndapproach to store this card on patientdata screen

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Appointmentconfirmation extends StatefulWidget {
  const Appointmentconfirmation({super.key});

  @override
  State createState() => _AppointmentconfirmationState();
}

class _AppointmentconfirmationState extends State<Appointmentconfirmation> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _assignDocController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _confirmAppointment() {
    if (_nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        selectedDate != null &&
        selectedTime != null) {
      
      // Create appointment data
      Map<String, String> newAppointment = {
        "name": _nameController.text,
        "age": _ageController.text,
        "gender": _genderController.text,
        "doctor": _assignDocController.text,
        "phone": _phoneController.text,
        "date": DateFormat('yyyy-MM-dd').format(selectedDate!),
        "time": selectedTime!.format(context),
      };

      // Send data back to PatientDetailsScreen
      Navigator.pop(context, newAppointment);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please complete all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Book an Appointment',style:TextStyle(color:Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Patient Name')),
            TextField(controller: _ageController, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Age')),
            TextField(controller: _genderController, decoration: InputDecoration(labelText: 'Gender')),
            TextField(controller: _assignDocController, decoration: InputDecoration(labelText: 'Assign Doctor')),
            TextField(controller: _phoneController, keyboardType: TextInputType.phone, decoration: InputDecoration(labelText: 'Phone Number')),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedDate == null ? 'Select Date' : DateFormat('yyyy-MM-dd').format(selectedDate!)),
                ElevatedButton(onPressed: _selectDate, child: Text('Pick Date')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedTime == null ? 'Select Time' : selectedTime!.format(context)),
                ElevatedButton(onPressed: _selectTime, child: Text('Pick Time')),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _confirmAppointment,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  backgroundColor: Colors.deepPurpleAccent,
                ),
                child: Text('Confirm Appointment',style:TextStyle(color:Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

