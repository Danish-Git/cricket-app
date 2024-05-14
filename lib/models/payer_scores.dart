class PayerScores {
/*
{
  "teamId": "5",
  "playerId": "2",
  "playerName": "Player One",
  "r": "1",
  "b": "1",
  "fours": "1",
  "six": "2",
  "isBatsman": true,
  "o": "2",
  "m": "2",
  "w": "2"
}
*/

  String? teamId;
  String? playerId;
  String? playerName;
  String? r;
  String? b;
  String? fours;
  String? six;
  String? sr;
  bool? isBatsman;
  String? o;
  String? m;
  String? w;
  String? eco;

  PayerScores({
    this.teamId,
    this.playerId,
    this.playerName,
    this.r,
    this.b,
    this.fours,
    this.six,
    this.sr,
    this.isBatsman,
    this.o,
    this.m,
    this.w,
    this.eco,
  });

  PayerScores.fromJson(Map<String, dynamic> json) {
    teamId = json['teamId']?.toString();
    playerId = json['playerId']?.toString();
    playerName = json['playerName']?.toString();
    r = json['r']?.toString() ?? '0';
    b = json['b']?.toString() ?? '0';
    fours = json['fours']?.toString() ?? '0';
    six = json['six']?.toString() ?? '0';
    sr = (((num.tryParse(r ?? '0') ?? 0) / (num.tryParse(b ?? '0') ?? 0)) * 100 ).toStringAsFixed(1);
    isBatsman = json['isBatsman']?.toString().toLowerCase() == 'true';
    o = json['o']?.toString() ?? '0';
    m = json['m']?.toString() ?? '0';
    w = json['w']?.toString() ?? '0';
    eco = (((num.tryParse(r ?? '0') ?? 0) / (num.tryParse(o ?? '0') ?? 0)) * 100 ).toStringAsFixed(1);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['teamId'] = teamId;
    data['playerId'] = playerId;
    data['playerName'] = playerName;
    data['r'] = r;
    data['b'] = b;
    data['fours'] = fours;
    data['six'] = six;
    data['isBatsman'] = isBatsman;
    data['o'] = o;
    data['m'] = m;
    data['w'] = w;
    return data;
  }
}