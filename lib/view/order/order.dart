import 'dart:async';

import 'package:angkut/config/config.dart';
import 'package:angkut/config/theme.dart';
import 'package:angkut/custom_widget/widgets/search_builder.dart';
import 'package:angkut/util/map_helper.dart';
import 'package:angkut/util/route.dart';
import 'package:angkut/view/order/order_calculate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'order_detail.dart';
import 'order_nearest.dart';

const double CAMERA_ZOOM = 17;
const double CAMERA_TILT = 10;
const double CAMERA_BEARING = 0;

const LatLng CAR_FULL_LOCATION =
    LatLng(-6.9366669330862845, 107.60309681472287);
const LatLng CAR_LOCATION = LatLng(-6.937285, 107.602506);
const LatLng USER_LOCATION = LatLng(-6.937306, 107.60087);

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  Set<Polyline> _polyLines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  BitmapDescriptor carFullIcon;
  BitmapDescriptor carAvailableIcon;
  BitmapDescriptor personPinIIcon;
  int indexContent = 0;
  bool showSearch = true;
  var data;
  Timer timer;


  List<Widget> listContent;

  @override
  void initState() {
    listContent = [
      CalculateOrder(
        onTap: () {
          setState(() {
            setMapPins();
            showSearch = false;
            indexContent = 1;
          });
        },
      ),
      OrderNearest(
        onTap: () {
          setState(() {
            indexContent = 2;
          });
        },
      ),
      OrderDetail(
        onTap: () {
          indexContent = 3;
             getLocation();
                   },
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Mohon Tunggu...",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Angkot akan sampai dalam",
            style: TextStyle(
              fontSize: 14.0,
              color: ThemeColor.secondaryTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text("1 menit",
            style: TextStyle(
              fontSize: 14.0,
              color: ThemeColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Angkotmu telah tiba",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Selamat menikmati perjalanan",
            style: TextStyle(
              fontSize: 14.0,
              color: ThemeColor.secondaryTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ];
    super.initState();
    setSourceAndDestinationIcons();
  }

  void setSourceAndDestinationIcons() async {
    carFullIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 2.5,
        ),
        'assets/icons/car_full.png');
    carAvailableIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 2.5,
        ),
        'assets/icons/car_available.png');
    personPinIIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 2.5,
        ),
        'assets/icons/person_pin.png');
  }


  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
      zoom: CAMERA_ZOOM,
      bearing: CAMERA_BEARING,
      tilt: CAMERA_TILT,
      target: CAR_LOCATION,
    );
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              myLocationEnabled: true,
              compassEnabled: true,
              tiltGesturesEnabled: false,
              markers: _markers,
              polylines: _polyLines,
              mapType: MapType.normal,
              initialCameraPosition: initialLocation,
              onMapCreated: onMapCreated),
          showSearch
              ? Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 28, right: 28, top: 50),
                    child: SearchBuilder(),
                  ),
                )
              : Container(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white,
          boxShadow: ThemeShadow.shadow,
        ),
        height: [
          _height * 0.45,
          _height * 0.4,
          _height * 0.95,
          _height * 0.3,
          _height * 0.3,
          _height * 0,
        ].elementAt(indexContent),
        duration: Duration(milliseconds: 500),
        child: listContent.elementAt(indexContent),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyles);
    _controller.complete(controller);

    //setPolyLines();
  }

  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
          markerId: MarkerId('carAvailablePin'),
          position: CAR_LOCATION,
          icon: carAvailableIcon));
      // destination pin
      _markers.add(Marker(
          markerId: MarkerId('userPin'),
          position: USER_LOCATION,
          icon: personPinIIcon));
      _markers.add(Marker(
        markerId: MarkerId('carFullPin'),
        position: CAR_FULL_LOCATION,
        icon: carFullIcon,
      ));
    });
  }

  setPolyLines() async {
    Polyline polyline = Polyline(
      polylineId: PolylineId("polyline"),
      color: ThemeColor.primaryColor,
      points: polylineCoordinates,
      width: 5,
    );
    _polyLines.add(polyline);
    setState(() {});
  }

  getLocation() async{
    await getJsonData();
    _markers.remove(Marker(
      markerId: MarkerId('carFullPin'),
      position: CAR_FULL_LOCATION,
      icon: carFullIcon,
    ));
    setState(() {
    });
    polylineCoordinates = polylineCoordinates.reversed.toList();
    _markers.remove(
        Marker(
            markerId: MarkerId('carAvailablePin'),
            position: CAR_LOCATION,
            icon: carAvailableIcon)
    );
    _markers.add(
        Marker(
            markerId: MarkerId('carAvailablePin'),
            position: polylineCoordinates.last,
            icon: carAvailableIcon)
    );
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if(polylineCoordinates.isEmpty){
          setState(() {
            indexContent = 5;
          });
          timer.cancel();
          setState(() {
            indexContent = 4;
          });
          Future.delayed(Duration(seconds: 2),(){
            Navigator.pushReplacementNamed(context, Routers.payment);
          });
        }else{
          print(polylineCoordinates);
            _markers.add(
                Marker(
                    markerId: MarkerId('carAvailablePin'),
                    position: polylineCoordinates.elementAt(polylineCoordinates.length <= 1 ? polylineCoordinates.length - 1 :polylineCoordinates.length-2),
                    icon: carAvailableIcon)
            );
          polylineCoordinates.removeLast();
          setPolyLines();
        }
    });
  }

   getJsonData() async {
    MapHelper map = MapHelper(
      startLng: CAR_LOCATION.longitude,
      startLat: CAR_LOCATION.latitude,
      endLat: USER_LOCATION.latitude,
      endLng: USER_LOCATION.longitude,
    );

    try {
      data = await map.getData();
      LineString ls =
          LineString(data['features'][0]['geometry']['coordinates']);

      print(ls.lineString.length);
      for (int i = 0; i < ls.lineString.length; i++) {
        polylineCoordinates
            .add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }

      setPolyLines();
     } catch (e) {
      print(e);
    }
  }
}

class LineString {
  final List<dynamic> lineString;

  LineString(this.lineString);
}

class Utils {
  static String mapStyles = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
}
