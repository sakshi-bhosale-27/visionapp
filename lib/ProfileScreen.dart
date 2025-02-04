import 'HomePage.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import 'home.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State createState()=>_ProfileScreenState();




}
class _ProfileScreenState extends State{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageScreen(),));
          },
        ),
        title: const Text(
          "Clinic Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const CircleAvatar(
              radius: 60,
              // child:Icon(
              //   size:50,
              //   Icons.person)
              backgroundImage: AssetImage('assets/receptionist (2).png'),
             ),
            // const SizedBox(height: 10),
            // const Text(
            //   "Ava Johnson",
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // const Text("Receptionist"),
            // const Text("Joined in 2020"),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(170),
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
                  ),
                ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                     fixedSize: Size.fromWidth(170),
                                    backgroundColor: Colors.deepPurpleAccent,
                                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  
                                    //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                                    child: Text("Log out", style: TextStyle(color: Colors.white)),
                                  
                                ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            buildListTile("Clinic Information", "Eye Care Clinic..."),
            buildListTile("Notifications", "Weekly Summary"),
            buildListTile("", "Appointments"),
            buildListTile("Settings", "Password"),
            buildListTile("", "Privacy Policy"),
             //buildListTile("", "Edit Profile"),
            const Spacer(),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //      fixedSize: Size.fromWidth(450),
            //     backgroundColor: Colors.deepPurpleAccent,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            //   onPressed: () {},
            //   child: const Padding(
            //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            //     child: Text("Log out", style: TextStyle(color: Colors.white)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String header, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Text(
              header,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ListTile(
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
      ],
    );
  }
}
