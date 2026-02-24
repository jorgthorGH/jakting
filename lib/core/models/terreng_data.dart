class TerrengData {
  final String title;
  final String img;
  final bool isAvailable;
  final String content;
  final String? info;

  const TerrengData({
    required this.title,
    required this.img,
    required this.isAvailable,
    required this.content,
    this.info,
  });
}
