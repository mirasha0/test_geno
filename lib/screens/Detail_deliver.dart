import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'home.dart';

class deliver extends StatefulWidget {
  const deliver({Key? key}) : super(key: key);

  @override
  State<deliver> createState() => _deliverState();
}

class _deliverState extends State<deliver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body : Container(
         width : double.maxFinite,
          height: double.maxFinite,
         child: Stack(
           children: [
             Container(
               width: 40,
               height: 5,
               decoration: ShapeDecoration(
                 color: Color(0xFFD0DAE9),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(100),
                 ),
               ),
             ),
             Positioned(
                 left: 0,
                 right: 0,
                 child: Container(
                   width: double.maxFinite,
                   height: 350,
                   decoration: const BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage("assets/track.png"),
                         fit: BoxFit.cover,
                       )
                   ),
                 )),
             Positioned(     //battry
               left: 0,
               top: 0,
               child: Container(
                 width: 375,
                 height: 44,
                 child: Stack(
                   children: [
                     Positioned(
                       left: 338.33,
                       top: 17.33,
                       child: Container(
                         width: 24.33,
                         height: 11.33,
                         child: Stack(
                           children: [
                             Positioned(
                               left: 0,
                               top: 0,
                               child: Opacity(
                                 opacity: 0.35,
                                 child: Container(
                                   width: 22,
                                   height: 11.33,
                                   decoration: ShapeDecoration(
                                     shape: RoundedRectangleBorder(
                                       side: BorderSide(width: 0.50),
                                       borderRadius: BorderRadius.circular(2.67),
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),),
                   ],
                 ),
               ),),
             Positioned(
                 left:  296, //318
                 top: 17.33,
                 child:  SvgPicture.asset("assets/Cellular Connection.svg" , color: Colors.white,)
             ),
             Positioned(
               left: 318,
               top: 17.67,
               child: Container(
                   width: 17,
                   height: 10.67,
                   child: SvgPicture.asset("assets/Wifi.svg" , color: Colors.white,)
               ),
             ),
             const Positioned(
               left: 31,
               top: 14.33,
               child: Text(
                 '9:41',
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 15,
                   fontFamily: 'SF Pro Text',
                   fontWeight: FontWeight.w600,
                   letterSpacing: -0.30,
                 ),
               ),
             ),
             Positioned(
               left: 20,
                 top: 70,
                 child: Row(
                   children: [
                     Container(
                       decoration: ShapeDecoration(
                         color: Colors.white.withOpacity(0.20000000298023224),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(28),
                         ),
                       ),
                       child: IconButton(
                           onPressed: () {
                             Navigator.pop(context,const home());
                           }, icon: Icon(Icons.navigate_before , color: Colors.white, size: 35,),
                       ),
                     ),
                   ],
                 )
             ),
             Positioned(
                 top: 320,
                 child: Container(
           padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
               width: MediaQuery.of(context).size.width,
                   height: 500,
                   decoration: const BoxDecoration(
                       color: Colors.white,
                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(35),
                       topRight: Radius.circular(35),
                     )
                   ),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: const [
                           Text(
                             'Truck_03',
                             style: TextStyle(
                               color: Color(0xFF3D5480),
                               fontSize: 17,
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w700,
                               height: 1.59,
                               letterSpacing: 0.50,
                             ),
                           )
                         ],
                       ),
                       const SizedBox(height: 10,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: const [
                           Text(
                             'Pol',
                             style: TextStyle(
                               color: Color(0xFF9FA5C0),
                               fontSize: 15,
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w500,
                               height: 1.67,
                               letterSpacing: 0.50,
                             ),
                           ),
                           SizedBox(width: 30,),
                           Text(
                             '60 mins',
                             style: TextStyle(
                               color: Color(0xFF9FA5C0),
                               fontSize: 15,
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w500,
                               height: 1.67,
                               letterSpacing: 0.50,
                             ),
                           ),
                         ],
                       ),
                       const SizedBox(height: 20,),
                       Row(
                         children: [
                           Container(
                             width: 32,
                             height: 32,
                             decoration: ShapeDecoration(
                               image: const DecorationImage(
                                 image: AssetImage("assets/girl.png"),
                                 fit: BoxFit.cover,
                               ),
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(16),
                               ),
                             ),
                           ),
                           const SizedBox(width: 20,),
                           const Text(
                             'Elena Shelby',
                             style: TextStyle(
                               color: Color(0xFF3D5480),
                               fontSize: 15,
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w700,
                               height: 1.67,
                               letterSpacing: 0.50,
                             ),
                           )
                         ],
                       ),
                       const SizedBox(height: 50,),
                       Row(
                         children: const [
                           Text(
                             'Details',
                             style: TextStyle(
                               color: Color(0xFF3D5480),
                               fontSize: 17,
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w700,
                               height: 1.59,
                               letterSpacing: 0.50,
                             ),
                           )
                         ],
                       ),
                       const SizedBox(height: 10,),
                       Row(
                         children: const [
                         SizedBox(
                         width: 339,
                         height: 160,
                         child: Text(
                             'Elena Shelby, a determined and skilled driver, possesses an unyielding passion for navigating the open roads. With an innate ability to blend precision and adaptability, Elena is more than just a driver; she is a conductor orchestrating a symphony of gears and asphalt.',
                         style: TextStyle(
                         color: Color(0xFF9FA5C0),
                         fontSize: 14,
                         fontFamily: 'Inter',
                         fontWeight: FontWeight.w500,
                         height: 1.29,
                         letterSpacing: 0.50,
                       ),
                 ),
             ),
                         ],
                       ),
                     ],
                   )
             ))
           ],
         ),
       ),
    );
  }
}
