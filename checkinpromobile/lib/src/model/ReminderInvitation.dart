
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:json_annotation/json_annotation.dart';

import 'InviteNewVisitor.dart';

part 'ReminderInvitation.g.dart';
@JsonSerializable()
class ReminderInvitation {
  @JsonKey(name: 'titleNoti')
  String titleNoti;

  @JsonKey(name: 'contentNoti')
  String contentNoti;

  @JsonKey(name: 'delayNoti')
  int delayNoti;

  @JsonKey(name: 'reminderValue')
  int reminderValue;

  @JsonKey(name: 'idInvitation')
  double idInvitation;

  @JsonKey(name: 'invitation')
  InviteNewVisitor invitation;

  ReminderInvitation(this.titleNoti, this.contentNoti, this.delayNoti, this.reminderValue, this.idInvitation, this.invitation);

  ReminderInvitation.local(this.titleNoti, this.contentNoti, this.delayNoti, this.reminderValue, this.idInvitation);

  ReminderInvitation.init();

  ReminderInvitation.copyWithEntry(ReminderInvitationEntry entry) {
    this.titleNoti = entry.titleNoti;
    this.contentNoti = entry.contentNoti;
    this.delayNoti = entry.delayNoti;
    this.reminderValue = entry.reminderValue;
    this.idInvitation = entry.idInvitation;
  }

  factory ReminderInvitation.fromJson(Map<String, dynamic> json) =>
      _$ReminderInvitationFromJson(json);
  Map<String, dynamic> toJson() => _$ReminderInvitationToJson(this);
}