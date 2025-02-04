// import 'package:flutter/material.dart';

// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dashboard"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             // Overview of the Day
//             Text(
//               "Overview of the Day",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Appointments Today",
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           "5 Appointments",
//                           style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//                         ),
//                       ],
//                     ),
//                     Icon(Icons.calendar_today, size: 40, color: Colors.blue),
//                   ],
//                 ),
//               ),
//             ),

//             SizedBox(height: 20),

//             // Appointments
//             Text(
//               "Appointments",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage('assets/doctor1.jpg'), // Replace with your image
//                     ),
//                     title: Text("Dr. Emily"),
//                     subtitle: Text("Time: 10:00 AM"),
//                     trailing: TextButton(
//                       onPressed: () {},
//                       child: Text("Details"),
//                     ),
//                   ),
//                   Divider(),
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage('assets/doctor2.jpg'), // Replace with your image
//                     ),
//                     title: Text("Dr. Michael"),
//                     subtitle: Text("Time: 12:30 PM"),
//                     trailing: TextButton(
//                       onPressed: () {},
//                       child: Text("Details"),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20),

//             // Payments
//             Text(
//               "Payments",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Pending Payments",
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           "\$200",
//                           style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//                         ),
//                       ],
//                     ),
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.deepPurpleAccent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: Text("Pay Now"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             SizedBox(height: 20),

//             // Quick Actions
//             Text(
//               "Quick Actions",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             GridView.count(
//               shrinkWrap: true,
//               crossAxisCount: 3,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               childAspectRatio: 1,
//               physics: NeverScrollableScrollPhysics(),
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     shape: CircleBorder(),
//                     backgroundColor: Colors.deepPurpleAccent,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.add, size: 30, color: Colors.white),
//                       SizedBox(height: 5),
//                       Text("Add", style: TextStyle(fontSize: 12, color: Colors.white)),
//                     ],
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     shape: CircleBorder(),
//                     backgroundColor: Colors.orange,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.edit, size: 30, color: Colors.white),
//                       SizedBox(height: 5),
//                       Text("Edit", style: TextStyle(fontSize: 12, color: Colors.white)),
//                     ],
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     shape: CircleBorder(),
//                     backgroundColor: Colors.red,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.delete, size: 30, color: Colors.white),
//                       SizedBox(height: 5),
//                       Text("Delete", style: TextStyle(fontSize: 12, color: Colors.white)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: DashboardScreen(),
//   ));
// }


// ignore: unused_import
import 'package:visionapp/AppointmentConfirmation.dart';
import 'package:visionapp/EyeWearInventory.dart';
import 'package:visionapp/MedicineInventory.dart';
import 'package:visionapp/PatientDetail.dart';

import 'HomePage.dart';
import 'package:flutter/material.dart';

import 'PatientList.dart';

//import 'home.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State createState() => _DashboardPageState();
}
class _DashboardPageState extends State{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageScreen(),));
          },
          icon:Icon(
          Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Metrics Section
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildMetricCard('Appointments', '345', Colors.deepPurpleAccent, "assets/schedule.png"),
                _buildMetricCard('Eyewear Inventory', '2,000', Colors.deepPurpleAccent, "assets/man-with-glasses.png",),
                _buildMetricCard('Revenue', '\$5,432', Colors.deepPurpleAccent, "assets/revenue (2).png",),
                 _buildMetricCard('Medicine Inventory', '2,000', Colors.deepPurpleAccent, "assets/pharmacy.png"),
              ],
            ),
            const SizedBox(height: 24.0),

            // Quick Links Section
            const Text(
              'Quick Links',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            _buildQuickLink('Appointments',PatientDetailsScreen()),
            _buildQuickLink('Patient Details',PatientListScreen()),
            _buildQuickLink('Eyewear Inventory',EyeglassesCard()),
            _buildQuickLink('Staff',HomePageScreen()),
            _buildQuickLink('Medicine Inventory',MedicineCard()),

            const SizedBox(height: 24.0),

            // Recent Feedback Section
            const Text(
              'Recent Feedback',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            _buildFeedbackCard('Sara M', 'Jan 12, 2023', 5,
                'The service was great. The staff was very friendly and professional.'),
            const SizedBox(height: 16.0),
            _buildFeedbackCard('Jason A', 'Jan 10, 2023', 4,
                'I had a great experience, the clinic is clean and the doctor was great.'),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.calendar_today),
      //       label: 'Appointments',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bar_chart),
      //       label: 'Reports',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   selectedItemColor: Colors.deepPurpleAccent,
      //   unselectedItemColor: Colors.grey,
      //   currentIndex: 0, // Set the current index here
      //   onTap: (index) {
      //     // Handle bottom navigation tap
      //   },
      // ),
    );
  }

  // Metric Card Widget
  Widget _buildMetricCard(String title, String value, Color color,String imagePath) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withValues(),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 20),
          Image.asset(
            imagePath,
            width: 50,  // Set appropriate width
            height: 50, // Set appropriate height
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16,
          height:16,
          ),
          
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 16.0),
          Text(
            value,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white
            ),
          ),
         
        ],
      ),
    );
  }

  // Quick Link Widget
  // Widget _buildQuickLink(String title) {
  //   return ListTile(
  //     contentPadding: EdgeInsets.zero,
  //     title: Text(
  //       title,
  //       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  //     ),
  //     trailing: const Icon(Icons.arrow_forward),
  //     onTap: () {
  //       // Handle quick link navigation
  //       Navigator.push(context,MaterialPageRoute(builder: (context)=> Appointmentconfirmation()));
  //     },
  //   );
  // }
  Widget _buildQuickLink(String title, Widget destinationScreen) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
    trailing: const Icon(Icons.arrow_forward),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destinationScreen),
      );
    },
  );
}


  // Feedback Card Widget
  Widget _buildFeedbackCard(
      String name, String date, int rating, String feedback) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    color: index < rating ? Colors.deepPurpleAccent : Colors.grey[300],
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                feedback,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
