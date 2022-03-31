import 'package:json_annotation/json_annotation.dart';
import 'VisitorLog.dart';

part 'LogGroup.g.dart';

@JsonSerializable()
class LogGroup {
  @JsonKey(name: 'inviteNewVisitor')
  List<VisitorLog> logVisitor;

  @JsonKey(name: 'signIn')
  String signIn;

  @JsonKey(name: 'signOut')
  String signOut;

  // ignore: unused_element
  LogGroup.init();

  LogGroup(this.logVisitor, this.signIn, this.signOut);

  factory LogGroup.fromJson(Map<String, dynamic> json) =>
      _$LogGroupFromJson(json);

  Map<String, dynamic> toJson() => _$LogGroupToJson(this);
}
