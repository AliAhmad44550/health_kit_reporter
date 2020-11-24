/// Equivalent of [Source]
/// from [HealthKitReporter] https://cocoapods.org/pods/HealthKitReporter
///
/// Supports [map] representation.
///
/// Has a [Source.fromJson] constructor
/// to create instances from JSON payload coming from iOS native code.
/// And supports multiple object creation by [collect] method from JSON list.
///
class Source {
  const Source(
    this.name,
    this.bundleIdentifier,
  );

  final String name;
  final String bundleIdentifier;

  Map<String, String> get map => {
        'name': name,
        'bundleIdentifier': bundleIdentifier,
      };

  Source.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        bundleIdentifier = json['bundleIdentifier'];

  static List<Source> collect(List<dynamic> list) {
    final samples = <Source>[];
    for (final Map<String, dynamic> map in list) {
      final sample = Source.fromJson(map);
      samples.add(sample);
    }
    return samples;
  }
}
