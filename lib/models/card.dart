class Card {
  String eng;
  String tur;

  Card({this.eng, this.tur});

  Card.fromJson(Map<String, dynamic> json) {
    eng = json['eng'];
    tur = json['tur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eng'] = this.eng;
    data['tur'] = this.tur;
    return data;
  }
}
