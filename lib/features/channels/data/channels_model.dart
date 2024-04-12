class ChannelsModel {
  int? id;
  String? uid;
  int? position;
  String? type;
  String? resolution;
  bool? isMcast;
  bool? isOtt;
  bool? isDvbt;
  String? urlMcast;
  dynamic urlOtt;
  bool? recordable;
  int? recDuration;
  bool? timeshiftable;
  int? tsRecDuration;
  bool? parentalHidden;
  String? dvbtTag;
  String? streamPriority;
  dynamic backgroundImageId;
  String? metadata;
  bool? highlightsEnabled;
  String? ottType;
  String? name;
  String? shortName;
  String? epgChannel;
  Logos logos;
  MosaicAlignmentValues mosaicAlignmentValues;
  String? cmChannel;

  ChannelsModel({
    required this.id,
    required this.uid,
    required this.position,
    required this.type,
    required this.resolution,
    required this.isMcast,
    required this.isOtt,
    required this.isDvbt,
    required this.urlMcast,
    required this.urlOtt,
    required this.recordable,
    required this.recDuration,
    required this.timeshiftable,
    required this.tsRecDuration,
    required this.parentalHidden,
    required this.dvbtTag,
    required this.streamPriority,
    required this.backgroundImageId,
    required this.metadata,
    required this.highlightsEnabled,
    required this.ottType,
    required this.name,
    required this.shortName,
    required this.epgChannel,
    required this.logos,
    required this.mosaicAlignmentValues,
    required this.cmChannel,
  });

  factory ChannelsModel.fromJson(Map<String, dynamic> json) => ChannelsModel(
        id: json["id"],
        uid: json["uid"],
        position: json["position"],
        type: json["type"],
        resolution: json["resolution"],
        isMcast: json["is_mcast"],
        isOtt: json["is_ott"],
        isDvbt: json["is_dvbt"],
        urlMcast: json["url_mcast"],
        urlOtt: json["url_ott"],
        recordable: json["recordable"],
        recDuration: json["rec_duration"],
        timeshiftable: json["timeshiftable"],
        tsRecDuration: json["ts_rec_duration"],
        parentalHidden: json["parental_hidden"],
        dvbtTag: json["dvbt_tag"],
        streamPriority: json["stream_priority"],
        backgroundImageId: json["background_image_id"],
        metadata: json["metadata"],
        highlightsEnabled: json["highlights_enabled"],
        ottType: json["ott_type"],
        name: json["name"],
        shortName: json["short_name"],
        epgChannel: json["epg_channel"],
        logos: Logos.fromJson(json["logos"]),
        mosaicAlignmentValues:
            MosaicAlignmentValues.fromJson(json["mosaic_alignment_values"]),
        cmChannel: json["cm_channel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "position": position,
        "type": type,
        "resolution": resolution,
        "is_mcast": isMcast,
        "is_ott": isOtt,
        "is_dvbt": isDvbt,
        "url_mcast": urlMcast,
        "url_ott": urlOtt,
        "recordable": recordable,
        "rec_duration": recDuration,
        "timeshiftable": timeshiftable,
        "ts_rec_duration": tsRecDuration,
        "parental_hidden": parentalHidden,
        "dvbt_tag": dvbtTag,
        "stream_priority": streamPriority,
        "background_image_id": backgroundImageId,
        "metadata": metadata,
        "highlights_enabled": highlightsEnabled,
        "ott_type": ottType,
        "name": name,
        "short_name": shortName,
        "epg_channel": epgChannel,
        "logos": logos.toJson(),
        "mosaic_alignment_values": mosaicAlignmentValues.toJson(),
        "cm_channel": cmChannel,
      };
}

class Logos {
  int? card;
  dynamic legacy;
  int? normal;
  int? shadow;

  Logos({
    required this.card,
    required this.legacy,
    required this.normal,
    required this.shadow,
  });

  factory Logos.fromJson(Map<String, dynamic> json) => Logos(
        card: json["CARD"],
        legacy: json["LEGACY"],
        normal: json["NORMAL"],
        shadow: json["SHADOW"],
      );

  Map<String, dynamic> toJson() => {
        "CARD": card,
        "LEGACY": legacy,
        "NORMAL": normal,
        "SHADOW": shadow,
      };
}

class MosaicAlignmentValues {
  dynamic gridHeight;
  dynamic gridWidth;
  dynamic offsetX;
  dynamic offsetY;

  MosaicAlignmentValues({
    required this.gridHeight,
    required this.gridWidth,
    required this.offsetX,
    required this.offsetY,
  });

  factory MosaicAlignmentValues.fromJson(Map<String, dynamic> json) =>
      MosaicAlignmentValues(
        gridHeight: json["gridHeight"],
        gridWidth: json["gridWidth"],
        offsetX: json["offsetX"],
        offsetY: json["offsetY"],
      );

  Map<String, dynamic> toJson() => {
        "gridHeight": gridHeight,
        "gridWidth": gridWidth,
        "offsetX": offsetX,
        "offsetY": offsetY,
      };
}
