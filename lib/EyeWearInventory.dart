
import 'package:flutter/material.dart';

import 'HomePage.dart';

class EyeglassesCard extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
      appBar: AppBar(
        title: const Text('Eye Wear Inventory'),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageScreen(),));
          },
          icon:Icon(
          Icons.arrow_back)),
      ),
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                            onPressed: () {
                              // Navigate to Assign Doctor Screen
                        //       Navigator.push<void>(
                        // context,MaterialPageRoute<void>(
                        //             builder: (BuildContext context) =>  AssignDoctorScreen (),
                        //         ),
                        //       );
                          },
                            //icon: const Icon(Icons.medical_services,color: Colors.white,),
                            label: const Text("Frame",style: TextStyle(color: Colors.white),),
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
                        //       Navigator.push<void>(
                        // context,MaterialPageRoute<void>(
                        //             builder: (BuildContext context) =>  AssignDoctorScreen (),
                        //         ),
                        //       );
                          },
                           // icon: const Icon(Icons.medical_services,color: Colors.white,),
                            label: const Text("Update Stock",style: TextStyle(color: Colors.white),),
                    
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
                        //       Navigator.push<void>(
                        // context,MaterialPageRoute<void>(
                        //             builder: (BuildContext context) =>  AssignDoctorScreen (),
                        //         ),
                        //       );
                          },
                           // icon: const Icon(Icons.medical_services,color: Colors.white,),
                            label: const Text("Add Stock",style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                ),
                      
              ],),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.asset(
                            'assets/frame11.jpg', // Replace with actual image URL
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Icon(Icons.favorite_border, color: Colors.black),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text("138mm Size L", style: TextStyle(color: Colors.grey, fontSize: 12)),
                          // SizedBox(height: 4),
                          // Text("John Jacobs", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          // SizedBox(height: 4),
                          // Row(
                          //   children: [
                          //     Text("₹4000", style: TextStyle(fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                          //     SizedBox(width: 6),
                          //     Text("13% OFF", style: TextStyle(fontSize: 14, color: Colors.deepPurpleAccent)),
                          //   ],
                          // ),
                          SizedBox(height: 4),
                          Text("₹3500 with lenses", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Row(
                              //   children: [
                              //     Icon(Icons.local_shipping, color: Colors.deepPurpleAccent, size: 18),
                              //     SizedBox(width: 4),
                              //     Text("5 day delivery", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 12)),
                              //   ],
                              // ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                child: Text("Available", style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.asset(
                            'assets/e2.jpeg', // Replace with actual image URL
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Icon(Icons.favorite_border, color: Colors.black),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text("138mm Size L", style: TextStyle(color: Colors.grey, fontSize: 12)),
                          // SizedBox(height: 4),
                          // Text("John Jacobs", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          // SizedBox(height: 4),
                          // Row(
                          //   children: [
                          //     Text("₹4000", style: TextStyle(fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                          //     SizedBox(width: 6),
                          //     Text("13% OFF", style: TextStyle(fontSize: 14, color: Colors.deepPurpleAccent)),
                          //   ],
                          // ),
                          SizedBox(height: 4),
                          Text("₹3500 with lenses", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Row(
                              //   children: [
                              //     Icon(Icons.local_shipping, color: Colors.deepPurpleAccent, size: 18),
                              //     SizedBox(width: 4),
                              //     Text("5 day delivery", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 12)),
                              //   ],
                              // ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                child: Text("Available", style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.asset(
                              'assets/eyewear1.jpeg', // Replace with actual image URL
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(Icons.favorite_border, color: Colors.black),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text("138mm Size L", style: TextStyle(color: Colors.grey, fontSize: 12)),
                            // SizedBox(height: 4),
                            // Text("John Jacobs", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            // SizedBox(height: 4),
                            // Row(
                            //   children: [
                            //     Text("₹4000", style: TextStyle(fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                            //     SizedBox(width: 6),
                            //     Text("13% OFF", style: TextStyle(fontSize: 14, color: Colors.deepPurpleAccent)),
                            //   ],
                            // ),
                            SizedBox(height: 4),
                            Text("₹3500 with lenses", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Row(
                                //   children: [
                                //     Icon(Icons.local_shipping, color: Colors.deepPurpleAccent, size: 18),
                                //     SizedBox(width: 4),
                                //     Text("5 day delivery", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 12)),
                                //   ],
                                // ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  child: Text("Available", style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}