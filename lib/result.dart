// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:scalable_image/scalable_image.dart';

// class Result extends StatefulWidget {
//   final List listOutput;
//   final File image;
//   Result({this.listOutput, this.image});
//   @override
//   _ResultState createState() => _ResultState();
// }

// class _ResultState extends State<Result> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           ScalableImage(
//               imageProvider: new FileImage(widget.image),
//               dragSpeed: 4.0,
//               maxScale: 16.0),
//           DraggableScrollableSheet(
//               maxChildSize: 0.96,
//               minChildSize: 0.05,
//               initialChildSize: 0.15,
//               builder:
//                   (BuildContext context, ScrollController scrollController) {
//                 return Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: const Radius.circular(30.0),
//                         topRight: const Radius.circular(30.0),
//                       ),
//                     ),
//                     child: SingleChildScrollView(
//                       controller: scrollController,
//                       child: Column(
//                         children: [
//                           SizedBox(height: 30),
//                           Container(
//                             width: 50,
//                             height: 7,
//                             decoration: BoxDecoration(
//                                 color: Color(0xffCBD3DC),
//                                 borderRadius: BorderRadius.circular(20)),
//                           ),
//                           ListView.builder(
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: widget.listOutput.length,
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 20.0, vertical: 5),
//                                   child: Center(
//                                       child: Text(
//                                     widget.listOutput[index]['label'],
//                                     style: TextStyle(
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.bold),
//                                   )),
//                                 );
//                               }),
//                           SizedBox(
//                             height: 30,
//                           )
//                         ],
//                       ),
//                     ));
//               })
//         ],
//       ),
//     );
//   }
// }
