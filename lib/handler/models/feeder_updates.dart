import 'package:freezed_annotation/freezed_annotation.dart';

part 'feeder_updates.freezed.dart';
part 'feeder_updates.g.dart';

@freezed
class FeederUpdates with _$FeederUpdates {
    const factory FeederUpdates({
        @JsonKey(name: "id") int? id,
        @JsonKey(name: "startDate") String? startDate,
        @JsonKey(name: "endDate") String? endDate,
        @JsonKey(name: "description") String? description,
        @JsonKey(name: "status") int? status,
    }) = _FeederUpdates;

    factory FeederUpdates.fromJson(Map<String, dynamic> json) => _$FeederUpdatesFromJson(json);
}
