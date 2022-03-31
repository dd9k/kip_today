import 'package:checkinpromobile/src/model/IdEmployeeInfo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'EmployeeSearch.g.dart';

@JsonSerializable()
class EmployeeSearch {
  @JsonKey(name: 'totalCount')
  int totalCount;

  @JsonKey(name: 'employees')
  List<IdEmployeeInfo> employees;

  EmployeeSearch(
    this.totalCount,
    this.employees,
  );

  EmployeeSearch._();

  factory EmployeeSearch.fromJson(Map<String, dynamic> json) =>
      _$EmployeeSearchFromJson(json);
}
