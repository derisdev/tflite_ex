// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:tensorflow/result.dart';
// import 'package:tensorflow/scan_image.dart';
// import 'package:tflite/tflite.dart';
// import 'package:fab_circular_menu/fab_circular_menu.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   File _image;

//   final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();

//     loadModel();
//   }

//   loadModel() async {
//     setState(() {
//       isLoading = true;
//     });
//     await Tflite.loadModel(
//       model: "assets/model_unquant.tflite",
//       labels: "assets/labels.txt",
//       numThreads: 1,
//     ).then((value) {
//       setState(() {
//         isLoading = false;
//       });
//     });
//   }

//   getImage(ImageSource imageSource) async {
//     var image = await ImagePicker.pickImage(source: imageSource);
//     if (image == null) return null;
//     setState(() {
//       isLoading = true;
//       _image = image;
//     });
//     classifyImage(_image);
//   }

//   classifyImage(File image) async {
//     var output = await Tflite.runModelOnImage(
//         path: image.path,
//         imageMean: 0.0,
//         imageStd: 255.0,
//         numResults: 2,
//         threshold: 0.2,
//         asynch: true);
//     toResultPage(output, image);
//   }

//   toResultPage(List listOutput, File image) async {
//     await Future.delayed(Duration(seconds: 2), () {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => Result(
//                     listOutput: listOutput,
//                     image: image,
//                   )));
//     });
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void dispose() {
//     Tflite.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.dark,
//       ),
//       child: Scaffold(
//           floatingActionButton: isLoading
//               ? SizedBox()
//               : FabCircularMenu(
//                   key: fabKey,
//                   fabColor: Colors.lightBlue,
//                   ringColor: Colors.lightBlue,
//                   fabOpenColor: Colors.white,
//                   fabOpenIcon: Icon(Icons.add, color: Colors.white),
//                   children: <Widget>[
//                       InkWell(
//                           child: Icon(
//                             Icons.camera,
//                             size: 50,
//                             color: Colors.white,
//                           ),
//                           onTap: () {
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (_) => ScanImage()));
//                           }),
//                       InkWell(
//                           child: Icon(
//                             Icons.photo,
//                             size: 50,
//                             color: Colors.white,
//                           ),
//                           onTap: () {
//                             fabKey.currentState.close();
//                             getImage(ImageSource.gallery);
//                           })
//                     ]),
//           body: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Stack(
//               children: [
//                 Positioned.fill(
//                     child: isLoading
//                         ? Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Memindai Gambar...',
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 SpinKitThreeBounce(
//                                   size: 30,
//                                   color: Colors.lightBlue,
//                                 )
//                               ],
//                             ),
//                           )
//                         : Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Hallo,',
//                                 style: TextStyle(
//                                     fontSize: 23, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 'Silahkan pick gambar terlebih dahulu',
//                                 style: TextStyle(fontSize: 17),
//                               ),
//                             ],
//                           )),
//               ],
//             ),
//           )),
//     ));
//   }
// }
