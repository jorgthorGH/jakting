class TerrengData {
  final String title;
  final String img;
  final bool isAvailable;
  final String content;
  final int? keyId;
  final String? area;
  final bool? roadClosed;
  final bool? hasCabin;
  final String? hasFishingWater;
  final String? species;
  final String? info;

  const TerrengData({
    required this.title,
    required this.img,
    required this.isAvailable,
    required this.content,
    this.keyId,
    this.area,
    this.roadClosed,
    this.hasCabin,
    this.hasFishingWater,
    this.species,
    this.info,
  });
}
