import 'dart:convert';

import 'package:http/http.dart';

class MapHelper{
  final String url = 'https://api.openrouteservice.org/v2/directions/';
  final String apiKey = '5b3ce3597851110001cf624881d23beed11a48b48ae1093868b322e8';
  final String pathParam = 'driving-car';
  final double startLng;
  final double startLat;
  final double endLng;
  final double endLat;

  MapHelper({this.startLng, this.startLat, this.endLng, this.endLat});

  Future getData() async {
    Response response = await get('$url$pathParam?api_key=$apiKey&start=$startLng,$startLat&end=$endLng,$endLat');

    if(response.statusCode == 200){
        String data = response.body;
        print(data);
        return jsonDecode(data);
    }else{
      print(response.statusCode);
    }
  }

}