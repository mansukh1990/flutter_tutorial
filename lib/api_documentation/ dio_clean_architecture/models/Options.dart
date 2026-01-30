class Options {
  final List<String>? validation;
  final bool isAvailable;

  Options({this.validation, this.isAvailable = false});

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      validation: List<String>.from(json['validation'] ?? []),
      isAvailable: json['is_available'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'validation': validation,
      'is_available': isAvailable,
    };
  }
}
