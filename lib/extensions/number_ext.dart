extension ParseNullableInt on int? {
  int get nullToInt => this ?? 0;
  double get parseDouble => this == null ? 0 : this!.toDouble();
  double get intToDouble => this == null ? 0 : this!.toDouble();
}
