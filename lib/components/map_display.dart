import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:bike_mso/services/lat_long_list_converter.dart';

NetworkUtil util = NetworkUtil();

List<PointLatLng> pLineList = util.decodeEncodedPolyline(
    "yw~|Gx`vvTgHA?OiGAMa@DYAASZQIOa@g@m@MYS}@Ey@?a@JqA`@uA?[aABaFC_@NwD??KsD?Ec@gMCSMbCmKt@}@Tc@Ts@dIsYxK_`@b@_Ft@qAC}E~@uIo@iR}@oTC_[}AqRyBwSy@aPJkCm@{Hk@mCwAqFwAaD_DkGeGwQsAgDcAeBuJoOm@QsAWq@gAu@cDeJsWoAcEe@sDcAwFQiDIiDGqGMaZOcSm@sl@Ew@tE{GVs@T{FHwHXiDnAaUXgAhCaFdByAxXuPHHPHN|@LPHFP@^GTStA_BbAsAvBmCZc@`@[\\Gp@D`Cq@ZCp@OXEf@?VDXAxBHfARNHtAFn@Pv@Fd@Hf@?\\Gb@?^Ip@EbAAt@I~@ENDZGp@?\\HRNbAlBRVL@PAh@Qj@AT@THv@Nx@d@NXHl@CzBK`BApBR`A|@zBPNd@Hb@M\\FfAF|@GdAF|@`@n@d@PRDTETML[Cg@Qc@Bi@LWVc@n@sAdA]`@[Pi@JWBg@PqABYA]Ko@y@O[a@e@e@a@q@YMOQIOSG?EDIPAJFPn@`@Zt@Pj@^~@b@lBj@vARr@TPl@HVNb@\\v@~@N`@LJTh@J`@Fr@@^EdBDJB|@Db@Ll@LDPCF]PYh@c@LA`@Hf@TVT`AhBTHJEFIPk@`@Qb@c@d@Qn@[N?|@Y~@Qd@Gn@?z@XHFX`@Hb@D|AKbCFVFDLJH@DGR?f@N`Ad@r@b@p@J\\A^@JCN?z@ZXRb@r@Fv@WlDMv@i@`B?PDXLHh@KvABVC\\HVPR^Np@Bb@?fA@RFTTPFLXBh@Jv@t@t@j@`@j@b@dAvAdC\\fA^lBVdCDn@?j@UhCKd@OrBAZBXDFF?NOVeAJSFERAx@c@Vi@NMPIPg@Po@Xi@LIX?PPJXBdANbBRl@XNj@H~BPr@Zh@`@d@l@HVD~@IrAHf@RDd@ARFf@Zt@Zd@h@Jd@Ah@IpAa@xDDd@NVTHx@JdBAjBa@dAYhA_@tBW\\SZMPAj@?VF^HPH`@r@h@jBXtANrAN|C?d@KdCAbBCh@OzA[PFfA?fA[lC?\\ZlAZXdCMfAV`Ah@K\\Kr@Et@EXEhAKj@AnA]zFM~CQbBM~CC|BKdAMvE]|FIrBGVe@rKMjEAbBM|BIx@ShF]fE?rDM~CQhBcA`AYN}ARSNQZ?b@l@zBHdAu@`F[pDgA|Ds@r@OFS?w@_@a@][[m@Om@Q_@@_@I_@SEW{@uA[MMDIHo@vAKd@K|@EPUf@?FRDNZNnATpAXr@HFXd@RPHNVv@Hr@?PKt@_@jBGj@O|@EJILGRBFLPDPBh@J]?SBID?BHHb@@pANlCA|@Mn@KFw@PSV?HEFFDJZHBBHDB?ZHZ`@D|@ERAFFr@JT^b@\\l@n@x@j@ZLf@Zf@V?JT\\BLDBFB@n@Jr@HRTNNZDN@THN@Nz@jBZlAFEp@b@P?p@HEH?Lp@v@FZ\\jAPPZBHV^RRr@pArBHXBTE`CaAdGc@|BC`@o@pAaBbBG`@JZpBd@r@p@PfAk@pFEfAPbEQfAQv@u@lAs@PSd@HdEQlA_A|BQt@g@ZIZBbCj@`D`@nABl@Qh@sAt@cA|@Jb@v@Zf@j@fHdLf@|@VjBZxME@Kh@o@fA[Rk@z@i@b@g@f@ULSZsAXmAb@QPc@F}@Z}Bn@iAh@Q?y@ZcC`@CJBLv@d@h@j@CFq@Zc@GQIK@EN@Fb@b@VPd@JZCnAP`AFFG^HP?JFAHg@XW?EH@FjB~@h@`@r@P@PEHu@RHNTFj@@ANGPyBpAMNk@PSPeAZ?PaAl@_APYN_L?yTGoC?_GNe@JqANoBAmE@MQoA?bDPeA?MQoJ@cJ?wIAiQ?");

class MapDisplay extends StatefulWidget {
  @override
  _MapDisplayState createState() => _MapDisplayState();
}

class _MapDisplayState extends State<MapDisplay> {
  GoogleMapController mapController;

  final Set<Polyline> _polyline = {};
  final LatLng _center = const LatLng(46.8721, -113.9940);
  List<LatLng> thisRide = List();

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;

      _polyline.add(Polyline(
        polylineId: PolylineId('Current Polyline'),
        visible: true,
        //latlng is List<LatLng>
        points: thisRide,
        color: Colors.blue,
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    ListConverter converter = ListConverter(pLineList);
    thisRide = converter.mapCoords();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          polylines: _polyline,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
        ),
      ),
    );
  }
}