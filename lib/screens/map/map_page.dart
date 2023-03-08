import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../cubit/mentor_cubit.dart';
import 'cubit/marker_cubit.dart';
import 'map_mentor_card.dart';

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
                        width: size.width,
                        child: CarouselSlider.builder(
                          itemCount: state.mentors.length,
                          itemBuilder: (context, index, realIndex) =>
                              GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () async {
                              await onCardClick(
                                  state.mentors[index].coordinates!);
                            },
                            child: MapMentorCard(
                              mentor: state.mentors[index],
                            ),
                          ),
                          options: CarouselOptions(
                            height: 100,
                            aspectRatio: 3,
                            autoPlay: true,
                            enlargeFactor: 0.3,
                            enlargeCenterPage: true,
                          ),
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
