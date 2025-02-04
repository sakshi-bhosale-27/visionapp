import 'package:flutter/material.dart';
import 'package:visionapp/AppointmentConfirmation.dart';

import 'PatientData.dart';
//import 'PatientManagementScreen.dart';


class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({super.key});


@override
  State<StatefulWidget> createState() => _PatientDetailsScreenState();


}
class _PatientDetailsScreenState extends State{

  final List<Map<String, String>> patients = [
    {"name": "Ana Watson", "age": "22", "gender": "Female", "phone": "9988776655"},
    {"name": "Jon doe", "age": "30", "gender": "Male", "phone": "9988776655"},
    {"name": "James William", "age": "20", "gender": "Male", "phone": "9988776655"},
    {"name": "Ana Belle", "age": "25", "gender": "Female", "phone": "9988776655"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAE2FF), // Light purple background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Today's Appointments", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child:ListView.builder(
  padding: EdgeInsets.all(10),
  itemCount: patients.length,
  itemBuilder: (context, index) {
    return PatientCard(patient: patients[index]); // Pass patient map
  },
),

            // child: ListView.builder(
            //   padding: EdgeInsets.all(10),
            //   itemCount: patients.length,
            //   itemBuilder: (context, index) {
            //     return PatientCard(
            //       name: patients[index]["name"]!,
            //       age: patients[index]["age"]!,
            //       gender: patients[index]["gender"]!,
            //       phone: patients[index]["phone"]!,
            //     );
            //   },
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                // New Registration action
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  Appointmentconfirmation()));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: (Size.fromWidth(450)),
                backgroundColor: Colors.deepPurpleAccent,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text("Book an Appointment", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ],
      ),
      
    );
  }
}

// class PatientCard extends StatelessWidget {
//   final String name, age, gender, phone;

//   const PatientCard({super.key, required this.name, required this.age, required this.gender, required this.phone});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: Colors.black,
//           child: Icon(Icons.person, color: Colors.white),
//         ),
//         title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text("Age: $age\nGender: $gender\nPhone No: $phone"),
//         trailing: IconButton(icon:Icon(Icons.arrow_forward_ios),
//         onPressed: () {
//          Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PatientDataScreen(patient: patients[index]),
//                 ),
//          );
        

             
//              },),));
         
        
      
//   }
// }
class PatientCard extends StatelessWidget {
  final Map<String, String> patient; // Pass entire patient data

  const PatientCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(patient["name"]!, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Age: ${patient["age"]}\nGender: ${patient["gender"]}\nPhone No: ${patient["phone"]}"),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PatientDataScreen(patient: patient),
              ),
            );
          },
        ),
      ),
    );
  }
}
