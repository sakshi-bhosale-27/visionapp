import 'package:flutter/material.dart';
import 'package:visionapp/PatientManagementScreen.dart';

class PatientListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  final List<Map<String, String>> patients = [
    {"name": "Ana Watson", "age": "22", "gender": "Female", "phone": "9988776655"},
    {"name": "Jon Doe", "age": "30", "gender": "Male", "phone": "9988776655"},
    {"name": "James William", "age": "20", "gender": "Male", "phone": "9988776655"},
    {"name": "Ana Belle", "age": "25", "gender": "Female", "phone": "9988776655"},
  ];

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void addNewPatient(Map<String, String> newPatient) {
    bool isDuplicate = patients.any((patient) =>
        patient['name'] == newPatient['name'] &&
        patient['age'] == newPatient['age'] &&
        patient['phone'] == newPatient['phone']);

    if (isDuplicate) {
      // Show a message for duplicate entries
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Duplicate patient entry detected!')),
      );
    } else {
      // Add the patient to the list
      setState(() {
        patients.add(newPatient);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Patient added successfully!')),
      );
    }
  }

  void showAddPatientDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("New Patient Registration"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the patient's name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(labelText: "Age"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the patient's age";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: genderController,
                  decoration: InputDecoration(labelText: "Gender"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the patient's gender";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: "Phone"),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the patient's phone number";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  addNewPatient({
                    "name": nameController.text,
                    "age": ageController.text,
                    "gender": genderController.text,
                    "phone": phoneController.text,
                  });

                  // Clear the form fields
                  nameController.clear();
                  ageController.clear();
                  genderController.clear();
                  phoneController.clear();

                  Navigator.pop(context);
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE2FF), // Light purple background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Patient Details",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Patients...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: patients.length,
              itemBuilder: (context, index) {
                final patient = patients[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(patient['name']!),
                    subtitle: Text(
                        'Age: ${patient['age']}, Gender: ${patient['gender']}, Phone: ${patient['phone']}'),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> NewPatientRegistrationScreen()));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: (Size.fromWidth(450)),
                backgroundColor: Colors.deepPurpleAccent,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text("New Registration",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}



