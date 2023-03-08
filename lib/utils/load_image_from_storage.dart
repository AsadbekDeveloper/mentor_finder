  import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> loadImage(String image) async {
    String url = '';
    try {
      Reference ref = FirebaseStorage.instance.refFromURL(image);
      url = await ref.getDownloadURL();
    } catch (e) {
      log(e.toString());
    }
    return url;
  }