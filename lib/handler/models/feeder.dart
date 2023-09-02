import 'package:casureco/handler/models/feeder_updates.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feeder.freezed.dart';
part 'feeder.g.dart';

@freezed
class Feeder with _$Feeder {
  const factory Feeder({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "areas") List<String>? areas,
    @JsonKey(name: "updates") List<FeederUpdates>? updates,
  }) = _Feeder;

  factory Feeder.fromJson(Map<String, dynamic> json) => _$FeederFromJson(json);
}
