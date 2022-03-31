import 'dart:convert';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/PrinterInfor.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PrinterModel {
  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'ipAddress')
  String ipAddress;

  @JsonKey(name: 'model')
  String model;

  @JsonKey(name: 'isConnect')
  bool isConnect;

  PrinterModel.init();

  PrinterModel(this.type, this.ipAddress, this.model, this.isConnect);

  Future<List<PrinterModel>> findPrinter();

  Future connectPrinter();

  Future<String> printTemplate(RenderRepaintBoundary boundary);

  Future<String> printTest();

  Future<bool> checkPrinterConnect() async {
    var preferences = await SharedPreferences.getInstance();
    var data = preferences.getString(Constants.KEY_PRINTER);
    if (data == null || data.isEmpty) {
      return false;
    }
    var savedPrinter = PrinterInfor.fromJson(jsonDecode(data));
    if (savedPrinter.ipAddress == ipAddress) {
      return true;
    }
    return false;
  }

  PrinterModel fromJson(Map<String, dynamic> data);

  Map<String, dynamic> toJson();

  Future savePrinterToPreferences() async {
    var jsonString = jsonEncode(toJson());
    var preferences = await SharedPreferences.getInstance();
    preferences.setString(Constants.KEY_PRINTER, jsonString);
  }

  String getErrorCodePrinter(BuildContext context, String errorCodePrinter) {
    switch (errorCodePrinter) {
      case ErrorCodePrinter.NOT_SAME_MODEL:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.BROTHER_PRINTER_NOT_FOUND:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.PAPER_EMPTY:
        {
          return AppLocalizations.of(context).emptyPaper;
        }
      case ErrorCodePrinter.BATTERY_EMPTY:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.COMMUNICATION_ERROR:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.OVERHEAT:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.PAPER_JAM:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.HIGH_VOLTAGE_ADAPTER:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.FEED_OR_CASSETTE_EMPTY:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.SYSTEM_ERROR:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.NO_CASSETTE:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.WRONG_CASSETTE_DIRECT:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.CREATE_SOCKET_FAILED:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.CONNECT_SOCKET_FAILED:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.GET_OUTPUT_STREAM_FAILED:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.GET_INPUT_STREAM_FAILED:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.CLOSE_SOCKET_FAILED:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.OUT_OF_MEMORY:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.SET_OVER_MARGIN:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.NO_SD_CARD:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.FILE_NOT_SUPPORTED:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.EVALUATION_TIMEUP:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.WRONG_CUSTOM_INFO:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.NO_ADDRESS:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.NOT_MATCH_ADDRESS:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.FILE_NOT_FOUND:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.TEMPLATE_FILE_NOT_MATCH_MODEL:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.TEMPLATE_NOT_TRANS_MODEL:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.COVER_OPEN:
        {
          return AppLocalizations.of(context).coverOpen;
        }
      case ErrorCodePrinter.WRONG_LABEL:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.PORT_NOT_SUPPORTED:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.WRONG_TEMPLATE_KEY:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.BUSY:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.TEMPLATE_NOT_PRINT_MODEL:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.CANCEL:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.PRINTER_SETTING_NOT_SUPPORTED:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.INVALID_PARAMETER:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.INTERNAL_ERROR:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.TEMPLATE_NOT_CONTROL_MODEL:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.TEMPLATE_NOT_EXIST:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.BUFFER_FULL:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.TUBE_EMPTY:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.TUBE_RIBBON_EMPTY:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.UPDATE_FRIM_NOT_SUPPORTED:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.OS_VERSION_NOT_SUPPORTED:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.RESOLUTION_MODE:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.POWER_CABLE_UNPLUGGING:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.BATTERY_TROUBLE:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.UNSUPPORTED_MEDIA:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.TUBE_CUTTER:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.UNSUPPORTED_TWO_COLOR:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.UNSUPPORTED_MONO_COLOR:
        {
          return AppLocalizations.of(context).communicationError;
        }
      case ErrorCodePrinter.MINIMUM_LENGTH_LIMIT:
        {
          return AppLocalizations.of(context).communicationError;
        }
      default:
        {
          return AppLocalizations.of(context).communicationError;
        }
    }
  }
}
