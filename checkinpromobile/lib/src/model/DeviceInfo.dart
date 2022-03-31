class DeviceInfo {
  String deviceName;
  String identifier;
  String model;
  String osVersion;

  DeviceInfo({this.deviceName, this.identifier, this.model, this.osVersion});

  Map<String, dynamic> toMap() {
    return {
      'name': deviceName,
      'type': model,
      'deviceId': identifier,
      'osVersion': osVersion,
      'appVersion': ''
    };
  }
}

class DeviceEmployee {
  String deviceId;
  String os;
  String deviceName;

  DeviceEmployee({this.deviceId, this.os, this.deviceName});

  Map<String, dynamic> toMap() {
    return {'deviceId': deviceId, 'os': os, "deviceName": deviceName};
  }
}
