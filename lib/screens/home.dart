import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Detail_deliver.dart';
import 'location_service.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Completer<GoogleMapController> _controller = Completer();
   TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polygonLatLngs = <LatLng>[];

  int _polygonIdCounter = 1;
  int _polylineIdCounter = 1;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();

    _setMarker(LatLng(37.42796133580664, -122.085749655962));
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('marker'),
            position: point),
      );
    });
  }

  void _setPolygon(){
    final String polygonIdVal = 'polygon_$_polygonIdCounter';
    _polygonIdCounter++;

    _polygons.add(
      Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: polygonLatLngs,
        strokeWidth: 2,
        fillColor: Colors.transparent,
      ),
    );
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$_polylineIdCounter';
    _polylineIdCounter++;

    _polylines.add(
      Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 2,
        color: Colors.yellow,
        points: points
            .map(
              (point) => LatLng(point.latitude, point.longitude),
        )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
          Row(
            children: [
              Expanded(
                child: Column(children: [
                  TextFormField(
                    controller: _originController,
                    decoration: const InputDecoration(
                      hintText: 'Origin',
                      hintStyle: TextStyle(
                        color: Color(0xFF9FA5C0),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.10,
                      ),
                      contentPadding:  EdgeInsets.only(
                          left: 25.0, bottom: 8.0, top: 70.0),
                    ),

                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  TextFormField(
                    controller: _destinationController,
                    decoration: const InputDecoration(
                      hintText: 'Destination',
                      hintStyle: TextStyle(
                        color: Color(0xFF9FA5C0),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.10,
                      ),
                      contentPadding:  EdgeInsets.only(
                          left: 25.0, bottom: 2.0, top: 13.0),
                    ),
                    onChanged: (value) {
                      print(value);
                    },
                  )
                ],),
              ),
              IconButton(
                onPressed: () async {
                 var place =  await  LocationService().getPlace(_originController.text);
                  var directions = await  LocationService().getDirections(
                      _originController.text,
                      _destinationController.text
                  );
                  _goToThePlace(
                    directions['start_location']['lat'] ,
                    directions['start_location']['lng'],
                    directions['bounds_ne'] ,
                    directions['bounds_sw'],
                  );
                  _setPolyline(directions['polyline_decoded']);

                },
                icon: Icon(Icons.search , size: 30,),
              ),

            ],
          ),
          Expanded(
            child: SizedBox(
              child: GoogleMap(
                mapType: MapType.normal,
                markers: _markers,
                polygons: _polygons,
                polylines : _polylines,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onTap: (point){
                  setState(() {
                    polygonLatLngs.add(point);
                    _setPolygon();
                  });
                },
              ),
            ),
          ),
          Expanded(child: Container(
            width : double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  top: 230,
                   left: 10,
                  right: 10,
                  child:  Container(
                    width: 372,
                    height: 78,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),),
                Positioned(
                   top: 240,
                   left: 22,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: Color(0xFFE5E7EB),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                Positioned(
                  top: 235,
                  left: 25,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const deliver(),
                        ),
                      );
                    },
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration:  const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/car.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 230,
                  left: 100,
                  child: Text(
                    'Car_01',
                    style: TextStyle(
                      color: Color(0xFF1F2937),
                      fontSize: 17,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      height: 1.65,
                    ),
                  ),
                ),
                const Positioned(
                  left: 100,
                  bottom: 40,
                  child: Text(
                    'Find nearest car',
                    style: TextStyle(
                      color: Color(0xFF1F2937),
                      fontSize: 14,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                ),
                const Positioned(
                  top: 240,
                  left: 320,
                  child: Text(
                    '5min',
                    style: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 14,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Future<void> _goToThePlace(
      //Map<String, dynamic> place,
      double lat,
      double lng,
      Map<String, dynamic> boundsNe,
      Map<String, dynamic> boundsSw,
      )
  async {
    // final double lat = place['geometry']['location']['lat'];
    // final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat, lng), zoom: 12),
    ),);

    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
            northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
          ),
          25 ),
    );
    _setMarker(LatLng(lat, lng));
  }
}

