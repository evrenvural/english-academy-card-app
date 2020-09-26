class ResponsedCard {
  String eng;
  String tur;
  bool response;

  ResponsedCard({this.eng, this.tur, this.response});

  ResponsedCard.fromJson(Map<String, dynamic> json) {
    eng = json['eng'];
    tur = json['tur'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eng'] = this.eng;
    data['tur'] = this.tur;
    data['response'] = this.response;
    return data;
  }
}
