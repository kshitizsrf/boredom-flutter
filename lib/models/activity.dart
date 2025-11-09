class Activity {
  final String activity;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;
  final double accessibility;

  Activity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    activity: json['activity'],
    type: json['type'],
    participants: json['participants'],
    price: (json['price'] as num).toDouble(),
    link: json['link'],
    key: json['key'],
    accessibility: (json['accessibility'] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'activity': activity,
    'type': type,
    'participants': participants,
    'price': price,
    'link': link,
    'key': key,
    'accessibility': accessibility,
  };
}
