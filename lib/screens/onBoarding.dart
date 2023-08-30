import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_geno/screens/login.dart';

class onboard extends StatefulWidget {
  const onboard({Key? key}) : super(key: key);

  @override
  State<onboard> createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SingleChildScrollView(
        child: Container(
         // padding: const EdgeInsets.fromLTRB(3, 3, 0.2, 3),
            width: 470,
            height: 812,  //900
           clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                const Positioned(
                  left: 50,
                  right: 50,
                  top: 510,
                  child: Text(
                    'Initiating Global Deliveries',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF2D3D5C),
                      fontSize: 22,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.45,
                      letterSpacing: 0.50,
                    ),
                  ),
                ),
                const Positioned(
                  left: 60,
                  right: 60,
                  top: 558,
                  child: Text(
                    'Step into a world of seamless \ncargo services \nwelcome to our community!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9FA5C0),
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.59,
                      letterSpacing: 0.50,
                    ),
                  ),
                ),
                Positioned(
                  left: 121,
                  top: 778,
                  child: Container(
                    width: 134,
                    height: 34,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 21,
                          child: Container(
                            width: 134,
                            height: 5,
                            decoration: ShapeDecoration(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                                Positioned(
                                  left: 2,
                                  top: 2,
                                  child: Container(
                                    width: 18,
                                    height: 7.33,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1.33),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                         Positioned(
                          left:  296, //318
                          top: 17.33,
                          child:  SvgPicture.asset("assets/Cellular Connection.svg")
                        ),
                        Positioned(
                          left: 318,
                          top: 17.67,
                          child: Container(
                            width: 17,
                            height: 10.67,
                            child: SvgPicture.asset("assets/Wifi.svg")
                          ),
                        ),
                       const Positioned(
                          left: 31,
                          top: 14.33,
                          child: Text(
                            '9:41',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               /* Positioned(
                  left: 16,
                  right:16 ,
                  top: 684,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 56,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 19),
                          decoration: ShapeDecoration(
                            color: Color(0xFF1FCC79),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: Container(
                           padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                            child: Column(
                             mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                             children: const [
                                Text(
                                  'Get Started',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.10,
                                  ),
                                ),
                              ],

                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed : () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_){
                        return login();

    }));
                    },
                  ),

                ),*/
                Positioned(
                  left: 16,
                  right:16 ,
                  top: 684,
                  child: Center(
                    child:  MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                     // elevation: 5.0,
                      padding: const EdgeInsets.fromLTRB(120, 0, 120, 0),
                      height: 56,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  login(),
                          ),
                        );

                      },
                      color: Color(0xFF1FCC79), //color
                      child: const Text(
                        "Get Started",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.10,
                        ),
                      ),
                    ),
                  ),
                ),
                   /*const Positioned(
                      height: 350,
                      width: 350,
                      left: 43,
                      top: 102,
                        child:FadeInImage(
                          placeholder: AssetImage("https://via.placeholder.com/350x350"),
                          image: AssetImage("assets/global.png"),
                          fit: BoxFit.contain,
                        ),
                         ),*/
                Positioned(
                  height: 350,
                  width: 350,
                  left: 60,
                  top: 102,
                  child: Container(
                    decoration:  const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/global.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      )
    );
  }
}
