import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:bike_mso/services/lat_long_list_converter.dart';

NetworkUtil util = NetworkUtil();

//List<PointLatLng> pLineList = util.decodeEncodedPolyline(
//    "aq`}G~dwvTc@_AAcLQ}FDiBAsAiEa@D?C@ESyBOiAQaHwBkE}ByDyBBYCy@k@aCs@_BoA{ADQQc@oA_Ay@u@u@eAoBeEmAu@WI@@MDIWBYDIAGb@eADWRMBI@a@CG?KLYNKNE\FPXhCqE}@_B{A_CaDaHsBoDwHiM|BsD{C_Fs@_AORqG?eMCaCBsPABwAAgCcTEY`@KZgDvAkAfA_@PK?i@i@]IIIK?e@@[NMPY?QG{@N]GOYGAOZQHa@?ODSWWF_A?Eo@?}HFaToG@cDAkC?uSA{EEkAFsDjBsAHyJ@iICgA~EoCyA_AGq@ZOdA@RuBXU?cAQMO[m@g@k@_AA_BQ]Q]Ei@w@_A{@o@iAo@wAg@[e@m@c@u@g@c@k@a@i@m@a@k@{@eCs@c@w@[uEoAc@FkAc@_FY{@OyBm@o@u@cBmAo@Ss@IoAGoBc@YHa@AuCu@i@a@s@}@_@Ae@PaA?a@G{AgAoA[{AWcCKKAmBpHQZWPWFi@?m@HaAl@");

class MapDisplay extends StatefulWidget {
  MapDisplay(this.encodedString, this.markers, this.mapCenter, this.mapZoom);

  final dynamic encodedString;
  dynamic markers;
  dynamic mapCenter;
  dynamic mapZoom;

  @override
  _MapDisplayState createState() => _MapDisplayState();
}

class _MapDisplayState extends State<MapDisplay> {
  GoogleMapController mapController;

  final Set<Polyline> _polyline = {};
  LatLng _center = LatLng(46.8721, -113.9940);
  List<LatLng> thisRide = [];
  Set<Marker> _markers = {};
  double _mapZoom = 12;

  void _onMapCreated(GoogleMapController controller) {
    setState(
      () {
        mapController = controller;

        _polyline.add(Polyline(
          polylineId: PolylineId('Current Polyline'),
          visible: true,
          //latlng is List<LatLng>
          points: thisRide,
          color: Colors.blue,
        ));
      },
    );
    //check to see if markers exist, also check to make sure that marker array contains data
    if (widget.markers.length > 0 && widget.markers[0] != '') {
      for (dynamic marker in widget.markers) {
        _markers.add(
          Marker(
            markerId: MarkerId(marker['markerId']),
            position: LatLng(marker['position']['latitude'],
                marker['position']['longitude']),
            infoWindow: InfoWindow(
                title: marker['infoWindow']['title'],
                snippet: marker['infoWindow']['snippet']),
            onTap: () {},
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    List<PointLatLng> pLineList =
        util.decodeEncodedPolyline(widget.encodedString);

    ListConverter converter = ListConverter(pLineList);
    print(pLineList);
    thisRide = converter.mapCoords();

    if (widget.mapCenter != null) {
      _center = LatLng(widget.mapCenter['lat'], widget.mapCenter['long']);
    }

    if (widget.mapZoom != null) {
      _mapZoom = widget.mapZoom.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          polylines: _polyline,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: _mapZoom,
          ),
        ),
      ),
    );
  }
}
