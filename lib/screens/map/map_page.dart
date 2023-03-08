import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mentor_finder/helper/color.dart';
import '../../cubit/mentor_cubit.dart';
import '../../helper/text.dart';
import '../../widget/mentor_card.dart';
import '../../widget/ratings.dart';
import 'cubit/marker_cubit.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> mapController = Completer();
  final CameraPosition _centerTashkent = const CameraPosition(
    target: LatLng(41.2995, 69.2401),
    zoom: 12,
  );
  onCardClick(LatLng position) async {
    if (mapController.isCompleted) {
      final c = await mapController.future;
      c.animateCamera(
        CameraUpdate.newLatLng(position),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<MarkerCubit, MarkerState>(
      builder: (context, state) {
        return SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  mapController.complete(controller);
                },
                zoomControlsEnabled: false,
                zoomGesturesEnabled: true,
                mapType: MapType.hybrid,
                initialCameraPosition: _centerTashkent,
                markers: state.markers,
              ),
              BlocBuilder<MentorCubit, MentorState>(
                builder: (context, state) {
                  if (state is MentorLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is MentorLoaded) {
                    return Positioned(
                      bottom: 10,
                      right: 0,
                      child: SizedBox(
                        height: 150.h,
                        width: size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () async {
                              await onCardClick(
                                  state.mentors[index].coordinates!);
                            },
                            child: Container(
                              width: 150.w,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: mainwhite,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 120.h,
                                        height: 120.h,
                                        child: Image.asset(
                                            'assets/images/personPlaceholder.png'),
                                      ),
                                      Text(state.mentors[index].name)
                                    ],
                                  ),
                                  const Positioned(
                                    top: 5,
                                    right: 5,
                                    child: CircleAvatar(
                                      radius: 15,
                                      child: Icon(
                                        Icons.favorite,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          itemCount: state.mentors.length,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
