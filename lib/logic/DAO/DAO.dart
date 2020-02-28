import 'dart:convert';
import 'dart:convert' show json;
import 'dart:io' show File;
import 'dart:io';

import 'package:jsonfiles/logic/models/game.dart';

String path = '/Users/jesushedo/Flutter/jsonfiles/assets/data/',
       gamesImportFile = path + 'games.json',
       gamesExportFile = path + 'exportgames.json';

List<Game> getAllGamesfromfile(){
  try{
    var stringContent = File(gamesImportFile).readAsStringSync();
    List jsonList = json.decode(stringContent);
    return new List<Game>.from(
      jsonList.map((json) => new Game.fromJson(json)).toList()
    );
  } catch (e) {
    print('Error: $e');
  }
  
}

void exportGames(List<Game> data) {
  try{
    data.sort((a,b) => a.id.compareTo(b.id));
    List jsonList = [];
    data.forEach((item) => jsonList.add(json.encode(item.toJson())));
    File(gamesExportFile).writeAsStringSync(jsonList.toString());
    print('Saved data successfully!');
  } catch (e) {
    print('Error: $e');
  }
  
}