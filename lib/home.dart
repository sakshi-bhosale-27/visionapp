import 'package:visionapp/AppointmentConfirmation.dart';
import 'package:visionapp/EyeWearInventory.dart';
import 'package:visionapp/MedicineInventory.dart';

import 'PatientList.dart';
import 'PatientManagementScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});
  
  @override
 State createState() => _AppointmentScreenState();
}
class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Eye Clinic",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Add menu action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search doctors or treatments...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              //const SizedBox(height: 20),

              // Tab Options (Appointments, Doctors, Treatments)
              
              //const SizedBox(height: 10),

              // Calendar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TableCalendar(
                firstDay: DateTime(2000),
                lastDay: DateTime(2100),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                  outsideDaysVisible: false,
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                            ),
              ),
              const SizedBox(height: 20),

              // Buttons for Register, Assign Doctor, Track Status
              SingleChildScrollView(
                scrollDirection:Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Navigate to Register Patient Screen
                          Navigator.push<void>(
                    context,MaterialPageRoute<void>(
                                builder: (BuildContext context) => Appointmentconfirmation(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.person_add_alt_1,color: Colors.white,),
                        label: const Text("Book An Appointment",style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Navigate to Assign Doctor Screen
                          Navigator.push<void>(
                    context,MaterialPageRoute<void>(
                                builder: (BuildContext context) =>  PatientListScreen (),
                            ),
                          );
                        },
                        icon: const Icon(Icons.person_2_rounded,color: Colors.white,),
                        label: const Text("Show Patient Details",style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Navigate to Track Status Screen
                          Navigator.push<void>(
                    context,MaterialPageRoute<void>(
                                builder: (BuildContext context) => TrackPatientStatusScreen(),
                            ),
                          );
                          
                        },
                        icon: const Icon(Icons.track_changes,color: Colors.white,),
                        label: const Text("Track Status",style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Example Treatments Section
              Card(
  elevation: 5,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  child: Container(
    width: 450,

    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image placeholder
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 120,
            width:450,
            color: Colors.deepPurpleAccent[100],
            
              child: Container(
                decoration: BoxDecoration(
                 
                ),
                child:Image.asset("assets/medi12.jpg",fit: BoxFit.fill,))
            
          ),
        ),
        SizedBox(height: 16),

        // Heading and subheading
        Text(
          "Medicine Service",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "This is a short description about the card.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 16),

        // Action button
        Center(
          child: ElevatedButton(
            onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineCard(),));
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(250),
              backgroundColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text("Action",
            style:TextStyle(color:Colors.white)
            ),
          ),
        ),
      ],
    ),
  ),
),
Card(
  elevation: 5,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  child: Container(
    width: 450,

    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image placeholder
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 120,
            width:450,
            color: Colors.deepPurpleAccent[100],
            
              child: Container(
                decoration: BoxDecoration(
                 
                ),
                child:Image.asset("assets/frame11.jpg",fit: BoxFit.fill,))
            
          ),
        ),
        SizedBox(height: 16),

        // Heading and subheading
        Text(
          "Eyewear Service",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "This is a short description about the card.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 16),

        // Action button
        Center(
          child: ElevatedButton(
            onPressed: () {
               Navigator.push<void>(
                    context,MaterialPageRoute<void>(
                                builder: (BuildContext context) => EyeglassesCard(),
                            ),
                          );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(250),
              backgroundColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text("Action",
            style:TextStyle(color:Colors.white)
            ),
          ),
        ),
      ],
    ),
  ),
)

              
            ]
              ),
            
          ),
        ),
      );
    
    
  }
}
