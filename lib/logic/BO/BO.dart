

import 'package:jsonfiles/logic/models/player.dart';

Map<Player,List<int>> mappingDatafromMaps(Map<String, dynamic> data){
  Map<Player,List<int>> result = {};
  for(var map in data.entries){
    Player key = new Player(map.key);
    List<int> value = new List<int>.from(map.value.whereType<dynamic>()).toList();
    value.forEach((goal) => key.setGaoals(goal));
    result.addAll({key:value});
  }
  return result;
}

Map<String, dynamic> mappingDatatoJson(Map<Player,List<int>> data){
  Map<String, dynamic> result = {};
  for(var map in data.entries){
    String key = map.key.name;
    dynamic value = map.value as dynamic;
    result.addAll({key:value});
  }
  return result;
}