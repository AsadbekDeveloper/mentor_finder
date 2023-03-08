import 'package:shared_preferences/shared_preferences.dart';

class MentorPreferences {
  static SharedPreferences? _preferences;
  static const mentorKey = 'favouriteMentors';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  static List<String> getMentor() {
    if (_preferences!.containsKey(mentorKey)) {
      return _preferences!.getStringList(mentorKey)!;
    } else {
      return [];
    }
  }

  static Future addMentor(String id) async {
    if (_preferences!.containsKey(mentorKey)) {
      List<String> idList = _preferences!.getStringList(mentorKey)!;
      idList.add(id);
      await _preferences!.setStringList(mentorKey, idList);
    } else {
      await _preferences!.setStringList(mentorKey, [id]);
    }
  }
  static Future removeMentor(String id) async {
    if (_preferences!.containsKey(mentorKey)) {
      List<String> idList = _preferences!.getStringList(mentorKey)!;
      idList.remove(id);
      await _preferences!.setStringList(mentorKey, idList);
    }
  }
}
