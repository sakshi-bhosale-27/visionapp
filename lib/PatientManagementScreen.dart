//import 'package:eyecare/AppointmentPage.dart';
import 'HomePage.dart';
import 'package:flutter/material.dart';
//import 'home.dart';



class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    NewPatientRegistrationScreen(),
    AssignDoctorScreen(),
    TrackPatientStatusScreen(),
  ];

  void _navigateToScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.pop(context); // Close the drawer after selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Patient Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_add_alt),
              title: Text('Register New Patient'),
              onTap: () => _navigateToScreen(0),
            ),
            ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('Assign Doctor'),
              onTap: () => _navigateToScreen(1),
            ),
            ListTile(
              leading: Icon(Icons.track_changes),
              title: Text('Track Patient Status'),
              onTap: () => _navigateToScreen(2),
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
}

// class PatientRegistrationScreen extends StatelessWidget {
//   const PatientRegistrationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(leading: IconButton(
//         icon:Icon(Icons.arrow_back_ios_new_rounded),
//         onPressed: (){
//            Navigator.push<void>(
//                     context,MaterialPageRoute<void>(
//                                 builder: (BuildContext context) => HomePageScreen(),
//                             ),
//                           );
//         },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Patient Registration',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               Text(
//                 'Patient Details',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               _buildTextField('Full Name'),
//               _buildTextField('Age', keyboardType: TextInputType.number),
//               _buildDropdown('Gender', ['Male', 'Female', 'Other']),
//               _buildTextField('Contact Info'),
//               _buildTextField('Assign Doctor'),
//               _buildTextField('Medical History', maxLines: 3),
//               SizedBox(height: 20),
//               Text(
//                 'Upload ID Proof',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//         color: Colors.white.withValues(), // Semi-transparent background
//         borderRadius: BorderRadius.circular(12), // Rounded corners
//         boxShadow: [
//           BoxShadow(
//             color: Colors.white.withValues(), // Subtle shadow color
//             offset: Offset(0, 2), // Shadow position
//             blurRadius: 2, // Spread of the shadow
//           ),
//         ],
//         border: Border.all(
//           color: Colors.white.withValues(), // Border for glassy effect
//         ),
//       ),
//                       child: ElevatedButton.icon(
//                         onPressed: () {},
//                         icon: Icon(Icons.upload_file,color:Colors.black),
//                         label: Text('Upload ID',style:TextStyle(color:Colors.black)),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           fixedSize: Size.fromWidth(250),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: Container(

//                   decoration: BoxDecoration(

//                     color: Colors.deepPurpleAccent.withValues(), // Semi-transparent background
//         borderRadius: BorderRadius.circular(12), // Rounded corners
//         boxShadow: [
//           BoxShadow(
//             color: Colors.deepPurpleAccent.withValues(), // Subtle shadow color
//             offset: Offset(0, 0), // Shadow position
//             blurRadius: 2, // Spread of the shadow
//           ),
//         ],
//         border: Border.all(
//           color: Colors.deepPurpleAccent.withValues(), // Border for glassy effect
//         ),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       fixedSize: Size.fromWidth(250),
//                       backgroundColor: Colors.deepPurpleAccent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                     ),
//                     child: Text('Submit',
//                     style:TextStyle(color:Colors.white)
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//  Widget _buildTextField(String label,
//       {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         keyboardType: keyboardType,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//     );
//   }



class NewPatientRegistrationScreen extends StatefulWidget {

@override
  State<StatefulWidget> createState() => _NewPatientRegistrationScreenState();


}
class _NewPatientRegistrationScreenState extends State{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController doctorController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController historyController = TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFEAE2FF), // Light purple background
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("New Patient Registration",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField("Patient Name", nameController),
            _buildTextField("Age", ageController),
            _buildTextField("Gender", genderController),
            _buildTextField("Assign Doctor", doctorController),
            _buildTextField("Contact Info", contactController),
            _buildTextField("Medical History", historyController, maxLines: 3),
            const SizedBox(height: 20),
            _buildButton("Upload Id Proof", Colors.deepPurpleAccent, () {
              // Upload file logic
            }),
            const SizedBox(height: 10),
            _buildButton("Submit", Colors.deepPurpleAccent, () {
              // Submit form logic
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}

// ignore: unused_element
Widget _buildTextField(String label,
    {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(), // Semi-transparent background
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(), // Subtle shadow color
            offset: Offset(0, 2), // Shadow position
            blurRadius: 2, // Spread of the shadow
          ),
        ],
        // border: Border.all(
        //   color: Colors.white.withValues(), // Border for glassy effect
        // ),
      ),
      child: TextField(
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: TextStyle(
          color: const Color.fromARGB(255, 18, 17, 17), // Text color
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: const Color.fromARGB(255, 19, 19, 19).withValues(), // Label color
          ),
          border: InputBorder.none, // Remove default border
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ), // Padding inside the text field
        ),
      ),
    ),
  );
}

  // ignore: unused_element
  Widget _buildDropdown(String label, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
        color: Colors.white.withValues(), // Semi-transparent background
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(), // Subtle shadow color
            offset: Offset(0, 2), // Shadow position
            blurRadius: 2, // Spread of the shadow
          ),
        ],
        // border: Border.all(
        //   color: Colors.white.withValues(), // Border for glassy effect
        // ),
      ),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: label,
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8),
            // ),
          ),
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }
//}

class AssignDoctorScreen extends StatelessWidget {
  const AssignDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assign Doctor'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 3, // Example doctor count
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent,
                  child: Icon(Icons.person),
                ),
                title: Text('Dr. Name ${index + 1}'),
                subtitle: Text('Specialization'),
                trailing: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Assign'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TrackPatientStatusScreen extends StatefulWidget {
  const TrackPatientStatusScreen({super.key});

  @override
  State createState() =>
      _TrackPatientStatusScreenState();
}

class _TrackPatientStatusScreenState extends State<TrackPatientStatusScreen> {
  final List<Map<String, String>> patients = [
    {'name': 'John Doe', 'status': 'Waiting'},
    {'name': 'Jane Smith', 'status': 'Undergoing Checkup'},
    {'name': 'Bob Johnson', 'status': 'Complete'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
             Navigator.push<void>(
                    context,MaterialPageRoute<void>(
                                builder: (BuildContext context) => HomePageScreen(),
                            ),
                          );
          },
          icon:Icon(Icons.arrow_back),),
        title: Text('Track Patient Status'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: patients.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent,
                  child: Icon(Icons.person),
                ),
                title: Text(patients[index]['name']!),
                subtitle: Text('Status: ${patients[index]['status']}'),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    setState(() {
                      patients[index]['status'] = value;
                    });
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Waiting',
                      child: Text('Waiting'),
                    ),
                    PopupMenuItem(
                      value: 'Undergoing Checkup',
                      child: Text('Undergoing Checkup'),
                    ),
                    PopupMenuItem(
                      value: 'Complete',
                      child: Text('Complete'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
