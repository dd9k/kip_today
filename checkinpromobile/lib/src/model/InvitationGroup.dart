import 'package:json_annotation/json_annotation.dart';
import 'InviteNewVisitor.dart';

part 'InvitationGroup.g.dart';

@JsonSerializable()
class InvitationGroup {
  @JsonKey(name: 'inviteNewVisitor')
  List<InviteNewVisitor> inviteNewVisitor;

  @JsonKey(name: 'startDate')
  String startDate;

  // ignore: unused_element
  InvitationGroup.init();

  InvitationGroup(this.inviteNewVisitor, this.startDate);

  factory InvitationGroup.fromJson(Map<String, dynamic> json) =>
      _$InvitationGroupFromJson(json);

  Map<String, dynamic> toJson() => _$InvitationGroupToJson(this);
}
