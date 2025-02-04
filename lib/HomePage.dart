import 'package:visionapp/PatientDetail.dart';
import 'package:visionapp/PaymentScreen.dart';

import 'DashboardScreen.dart';
import 'ProfileScreen.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:badges/badges.dart';
//import 'AppointmentPage.dart';
// ignore: unused_import
import 'PatientManagementScreen.dart';
import 'home.dart';


// class HomePageScreen extends StatefulWidget{

//    const HomePageScreen({super.key});
//   @override
//   State createState() => _HomePageScreenState();

// }
// class _HomePageScreenState extends State{



// int _selectedIndex = 0;
// PageController _pageController = PageController(); // Current selected index

//   // List of pages for navigation
//   static  final List<Widget> _pages = <Widget>[
//     Center(child: AppointmentScreen()),
    
//     Center(child: DashboardPage()),
//     Center(child: ProfileScreen()),
//      Center(child: PatientDetailsScreen()),
//   ];

//   // ignore: unused_element
//   void _onItemTapped(int index) {
//      _pageController.jumpToPage(index);
//     setState(() {
     
      
//       _selectedIndex = index;
//     });
//   }

// @override
//   Widget build(BuildContext context){

//     return Scaffold(
//      // appBar: AppBar(backgroundColor:Colors.deepPurpleAccent),

//        body: PageView(
//        // index: _selectedIndex,
//        controller: _pageController,
//         children: _pages,

//         onPageChanged:(index) {
//           setState(() {
//           _selectedIndex = index;
//         });
//         }
//       ),
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 8.0,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               icon: Icon(Icons.home),
//               color: _selectedIndex == 0 ? Colors.deepPurpleAccent : Colors.grey,
//               onPressed: () {
//                 setState(() {
//                   _selectedIndex = 0;
                  
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentScreen(),));
//                 });
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.calendar_today),
//               color: _selectedIndex == 1 ? Colors.deepPurpleAccent : Colors.grey,
//               onPressed: () {
//                 setState(() {
//                   _selectedIndex = 1;
//                    Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage(),));
//                 });
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.person),
//               color: _selectedIndex == 2 ? Colors.deepPurpleAccent : Colors.grey,
//               onPressed: () {
//                 setState(() {
//                   _selectedIndex = 2;
//                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
//                 });
//               },
//             ),
//              IconButton(
//               icon: Icon(Icons.personal_injury_outlined),
//               color: _selectedIndex == 3 ? Colors.deepPurpleAccent : Colors.grey,
//               onPressed: () {
//                 setState(() {
//                   _selectedIndex = 3;
//                    Navigator.push(context, MaterialPageRoute(builder: (context) => PatientDetailsScreen(),));
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'appointment_screen.dart';
// import 'dashboard_screen.dart';
// import 'profile_screen.dart';
// import 'patient_details_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    AppointmentScreen(),
    DashboardPage(),
     PatientDetailsScreen(),
    ProfileScreen(),
    PaymentHistoryScreen(),
   
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              color: _selectedIndex == 0 ? Colors.deepPurpleAccent : Colors.grey,
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              color: _selectedIndex == 1 ? Colors.deepPurpleAccent : Colors.grey,
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: Icon(Icons.personal_injury_rounded),
              color: _selectedIndex == 2 ? Colors.deepPurpleAccent : Colors.grey,
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: _selectedIndex == 3 ? Colors.deepPurpleAccent : Colors.grey,
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              icon: Icon(Icons.payment),
              color: _selectedIndex == 4 ? Colors.deepPurpleAccent : Colors.grey,
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}

        
        
   