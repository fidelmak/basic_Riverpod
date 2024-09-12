class Suggestions {
  final String activity;
  final String type;

  Suggestions({
    required this.activity,
    required this.type,
  });

  // Factory constructor to create an instance from JSON
  factory Suggestions.fromJson(Map<String, dynamic> json) {
    return Suggestions(
      activity: json['activity'],
      type: json['type'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'activity': activity,
      'type': type,
    };
  }
}
