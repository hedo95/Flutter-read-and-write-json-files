

import 'package:jsonfiles/logic/BO/BO.dart';

import 'player.dart';
import 'team.dart';

class Game{

  int id, journey, localgoals, awaygoals;
  List<int> season;
  DateTime date;
  Team localteam, awayteam;
  Map<Player,List<int>> goalscorers;

  Game(this.id, List<dynamic> season, this.journey, String date, String localteam,
      this.localgoals, String awayteam, this.awaygoals, Map<String,dynamic> goalscorers){
      
    this.season = season.cast<int>();
    this.date = DateTime.parse(date);
    this.localteam = new Team(localteam);
    this.awayteam = new Team(awayteam);
    this.goalscorers = mappingDatafromMaps(goalscorers);
  }

  toPrint() {
    print('ID: $id');
    print('Journey: $journey');
    print('${localteam.name} $localgoals - $awaygoals ${awayteam.name}.');
    print('Goal scorers:');
    for(var map in goalscorers.entries){
      print('${map.key.name}: ${map.value.length} goals.');
    }
    print('');
  }

  toJson()  => {
    'id': id,
    'season': season.cast<dynamic>(),
    'journey': journey,
    'date': date.toString(),
    'localtean': localteam.name,
    'localgoals': localgoals,
    'awayteam': awayteam.name,
    'awaygoals': awaygoals,
    'goalscorers': mappingDatatoJson(goalscorers)
  };

  factory Game.fromJson(Map<String,dynamic> json){
    return new Game(
      json['id'] as int,
      json['season'] as List<dynamic>,
      json['journey'] as int,
      json['date'] as String,
      json['localteam'] as String,
      json['localgoals'] as int,
      json['awayteam'] as String,
      json['awaygoals'] as int,
      json['goalscorers'] as Map<String,dynamic>
    );
  }
}