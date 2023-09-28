import 'package:casureco/handler/models/feeder_updates.dart';
import 'package:casureco/utilities/constant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feeder.freezed.dart';
part 'feeder.g.dart';

enum FeederStatus{
  @JsonValue(0)
  unknown,
  @JsonValue(1)
  not_energized,
  @JsonValue(2)
  energized
}

@freezed
class Feeder with _$Feeder {
  const factory Feeder({
    @JsonKey(name: "id") int? id,
    @Default(emptyString) @JsonKey(name: "name") String? name,
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "areas") String? areas,
    @JsonKey(name: "updates") List<FeederUpdates>? updates,
  }) = _Feeder;

  factory Feeder.fromJson(Map<String, dynamic> json) => _$FeederFromJson(json);
}
