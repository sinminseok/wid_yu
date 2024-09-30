import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/utils/FilePath.dart';
import '../controller/YoungHealthInformationController.dart';
import 'NotConnectMap.dart';

class CurrentPosition extends StatelessWidget {
  YoungHealthInformationController controller;

  CurrentPosition({required this.controller});

  @override
  Widget build(BuildContext context) {
    // Define the initial camera position
    final CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(controller.currentUser!.latitude, controller.currentUser!.longitude),
      zoom: 18,
    );

    // Create a marker
    final Marker marker = Marker(
      markerId: MarkerId('currentPositionMarker'),
      position: LatLng(controller.currentUser!.latitude, controller.currentUser!.longitude),
      infoWindow: InfoWindow(
        title: 'Current Position',
        snippet: 'This is your current position.',
      ),
    );

    // Add the marker to a set
    final Set<Marker> markers = {marker};

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Text(
            "위치",
            style: TextStyle(
              color: wGrey700Color,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ),
         Container(
          width: 272.w,
          height: 300.h,
          margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
          decoration: BoxDecoration(
            border: Border.all(color: wGrey200Color),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: initialCameraPosition,
            markers: markers,
          ),
        )
      ],
    );
  }
}
