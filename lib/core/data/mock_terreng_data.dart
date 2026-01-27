import 'package:jaktapp/core/constants/app_assets_terreng.dart';
import 'package:jaktapp/core/models/terreng_data.dart';

class MockTerrengData {
  static final List<TerrengData> list = [
    TerrengData(
      title: "Båt & henger",
      img: AppAssetsTerreng.boat,
      isAvailable: true,
    ),
    TerrengData(
      title: "Kano",
      img: AppAssetsTerreng.canoe,
      isAvailable: false,
    ),
    TerrengData(
      title: "Omdalsterrenget",
      img: AppAssetsTerreng.omdalsterrenget,
      isAvailable: true,
    ),
    TerrengData(
      title: "Hvitsteinsåsen",
      img: AppAssetsTerreng.hvitsteinsasen,
      isAvailable: true,
    ),
    TerrengData(
      title: "Flakvarp",
      img: AppAssetsTerreng.flakvarp,
      isAvailable: true,
    ),
    TerrengData(
      title: "Bjorstaddalen",
      img: AppAssetsTerreng.bjorstaddalen,
      isAvailable: true,
    ),
  ];
}