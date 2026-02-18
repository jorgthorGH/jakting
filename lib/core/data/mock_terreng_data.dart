import 'package:jaktapp/core/constants/app_assets_terreng.dart';
import 'package:jaktapp/core/models/terreng_data.dart';

class MockTerrengData {
  static final List<TerrengData> list = [
    TerrengData(
      title: "Båt & henger",
      img: AppAssetsTerreng.boat,
      isAvailable: true,

      content: "Båt med henger og elektrisk påhengsmotor står i container ved Meitjenn for utlån til våre medlemmer. "
      " Nøkkelen kan hentes i skap på Wattenberg(7-Eleven) i Skien. Båten er 14 fot. \n\n"
      "Redningsvester og årer ligger også i container",

      info: "*Anbefaler å hente batteri og lade dette dagen før bruk så dette er fulladet.",
    ),
    TerrengData(
      title: "Kano",
      img: AppAssetsTerreng.canoe,
      isAvailable: false,
      content: "",
    ),
    TerrengData(
      title: "Omdalsterrenget",
      img: AppAssetsTerreng.omdalsterrenget,
      isAvailable: true,
      keyId: 1,
      area: "32km^2",
      roadClosed: true,
      hasCabin: false,
      hasFishingWater: "Kilevannet",
      content: "",
    ),
    TerrengData(
      title: "Hvitsteinsåsen",
      img: AppAssetsTerreng.hvitsteinsasen,
      isAvailable: true,
      keyId: 1,
      area: "43km^2",
      roadClosed: false,
      hasCabin: true,
      hasFishingWater: "Vannet",
      content: "",
    ),
    TerrengData(
      title: "Flakvarp",
      img: AppAssetsTerreng.flakvarp,
      isAvailable: true,
      content: "",
    ),
    TerrengData(
      title: "Bjorstaddalen",
      img: AppAssetsTerreng.bjorstaddalen,
      isAvailable: true,
      content: "",
    ),
  ];
}