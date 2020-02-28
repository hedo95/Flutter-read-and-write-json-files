class Player {
  String name;
  int goals;

  Player(this.name){
    this.goals = 0;
  }

  setGaoals(int value){
    this.goals += value;
  }
}