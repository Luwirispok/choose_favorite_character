class OptionGameEntity {
  final String name;
  final String urlPicture;
  int scope = 0;

  OptionGameEntity({required this.name, required this.urlPicture});

  void addOnePoint() => scope++;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptionGameEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          urlPicture == other.urlPicture;

  @override
  int get hashCode => name.hashCode ^ urlPicture.hashCode;

  @override
  String toString() {
    return 'OptionGameEntity{name: $name, urlPicture: $urlPicture, scope: $scope}';
  }
}
