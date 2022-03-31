import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/model/DetailVisitorLog.dart';
import 'package:checkinpromobile/src/model/FormatQRCode.dart';
import 'package:checkinpromobile/src/screens/DetailInviteVisitorLog/DetailInviteVisitorLogNotifier.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/PermissionCallBack.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/LabelDisplayCommon.dart';
import 'package:checkinpromobile/src/widgetUtilities/QRCode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'dart:ui' as ui;
import 'package:checkinpromobile/src/constants/AppImage.dart';

enum E_INVITE_DETAIL_VISITOR_LOG { INVITATION, DASHBOARD }

// ignore: must_be_immutable
class DetailInviteVisitorLogScreen extends StatefulWidget {
  final DetailVisitorLog detailVisitorLog;
  final String visitorTypeName;
  final E_INVITE_DETAIL_VISITOR_LOG eInviteDetailVisitorLog;

  DetailInviteVisitorLogScreen(
      {Key key,
      @required this.detailVisitorLog,
      @required this.eInviteDetailVisitorLog,
      this.visitorTypeName})
      : super(key: key);

  @override
  _DetailInviteVisitorLogScreenState createState() =>
      _DetailInviteVisitorLogScreenState();
}

class _DetailInviteVisitorLogScreenState
    extends State<DetailInviteVisitorLogScreen> {
  GlobalKey _globalKey = GlobalKey();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final numberPhoneController = TextEditingController();
  final companyController = TextEditingController();
  final addressController = TextEditingController();
  final feedbackController = TextEditingController();
  FocusNode fullNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode numberPhoneFocusNode = FocusNode();
  FocusNode companyFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode feedbackFocusNode = FocusNode();

  DetailInviteVisitorLogNotifier provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider =
        Provider.of<DetailInviteVisitorLogNotifier>(context, listen: false);
    provider.model = widget.detailVisitorLog;
  }

  @override
  Widget build(BuildContext context) {
    double rating =
        provider.model.rating == null ? 0.0 : provider.model.rating.toDouble();
    bool isVisibleStatusBtn = false;
    bool isSignOut = false;
    if (provider.model.signIn != null && provider.model.signIn.isNotEmpty) {
      isVisibleStatusBtn = true;
    }
    if (provider.model.signOut != null && provider.model.signOut.isNotEmpty) {
      isVisibleStatusBtn = true;
      isSignOut = true;
    }
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: RepaintBoundary(
              key: _globalKey,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: QRCode(
                      sizeQRCode: 300,
                      data: getDataQR(provider.model.inviteCode)),
                ),
              )),
        ),
        Container(
          color: context.bgSliverAppBar,
          padding:
              EdgeInsets.only(top: locator<Utilities>().paddingTopSizeHeight),
          child: SafeArea(
            bottom: false,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    icon: Icon(Icons.clear_outlined),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                AppLocalizations.of(context)
                                    .infoInviteTitle
                                    .toUpperCase(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(Icons.ios_share),
                                    onPressed: () async {
                                      final RenderBox box = context
                                          .findRenderObject() as RenderBox;
                                      String path =
                                          await _saveWidgetImageToLocal(
                                              provider.model.inviteCode);
                                      await Share.shareFiles([path],
                                          text: provider.model.inviteCode,
                                          sharePositionOrigin:
                                              box.localToGlobal(Offset.zero) &
                                                  box.size);
                                    },
                                  ),
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: _buildPicturePreview(
                              AdaptiveTextSize().getadaptiveTextSize(
                                context,
                                multiplier: 7.0,
                              ),
                              provider.model.faceImg,
                              provider.model.fullname,
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      provider.model.fullname,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(fontSize: 16),
                                    ),
                                  ),
                                  if (widget.visitorTypeName != null)
                                    Text(
                                      widget.visitorTypeName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                            fontSize: 16,
                                            color: AppColors.DARK_BLUE_TEXT,
                                          ),
                                    )
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isVisibleStatusBtn,
                            child: Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, right: 5, left: 5),
                                  decoration: BoxDecoration(
                                    color: isSignOut
                                        ? AppColors.CHECKOUT_BUTTON_BG_COLOR
                                        : AppColors.CHECKIN_BUTTON_BG_COLOR,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            5.0) //         <--- border radius here
                                        ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            isSignOut
                                                ? Icons.logout
                                                : Icons.login,
                                            color: Colors.white,
                                            size: AdaptiveTextSize()
                                                .getadaptiveTextSize(context,
                                                    multiplier: 1.85),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              isSignOut
                                                  ? AppLocalizations.of(context)
                                                      .checkedOutTitle
                                                  : AppLocalizations.of(context)
                                                      .checkedInTitle,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      AppTextStyles.tahomaFont,
                                                  fontSize: AdaptiveTextSize()
                                                      .getadaptiveTextSize(
                                                          context,
                                                          multiplier: 1.6))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                flex: 5),
                          )
                          // Spacer()
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _buildTextFieldBlock(rating),
                      SizedBox(
                        height: 30,
                      ),
                      if (provider.model.inviteCode != null &&
                          provider.model.inviteCode.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: QRCode(
                            funcDownload: () async {
                              _saveScreen();
                            },
                            data: getDataQR(provider.model.inviteCode),
                            notes: AppLocalizations.of(context)
                                .clickToDownloadQRCodeContent,
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAlertPermission(bool isJustCheck) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
      title: Text(
        'Cho phép truy cập vào Thư viện!',
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      content: Container(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                'Vui lòng cho phép CheckinPro Today truy cấp Thư viện hình ảnh để có thể sử dụng tính năng này.',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                'Nhấn "Cho phép truy cập" và Đồng ý / OK.',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                'Hoăc:',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      '1. Vào mục Cài Đặt / Settings',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  AppImage.checkinPro,
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      '2. Tìm chọn icon CheckinPro Today',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Icon(Icons.art_track_outlined),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      '3. Bật quyền truy cập Thư viện ảnh /\n Photos',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 50),
              child: RaisedButton(
                onPressed: () {
                  _saveScreen();
                },
                color: AppColors.DARK_BLUE_TEXT,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  'Cho phép truy cập',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPicturePreview(double size, String path, String fullName) {
    final arrFullName = fullName.split(' ');
    String firstLetter = '';
    String lastLetter = '';
    if (arrFullName.length > 0) {
      if (arrFullName[0].length > 0) {
        firstLetter = arrFullName[0][0];
      }
    }
    if (arrFullName.length > 1) {
      if (arrFullName[1].length > 0) {
        lastLetter = arrFullName[1][0];
      }
    }
    return _buildCircleLayout(
        size,
        Container(
          width: size,
          height: size,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(0),
            child: (path != null)
                ? CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: path ?? "",
                    placeholder: (cx, url) {
                      return Image.asset('assets/images/default_avatar.png');
                    },
                    errorWidget: (context, url, error) => CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/default_avatar.png'),
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Text(
                      "$firstLetter$lastLetter".toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 16),
                    )),
          ), // this is my CameraPreview
        ));
  }

  Widget _buildCircleLayout(double size, Widget child) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(360.0) //         <--- border radius here
              ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1d75d5),
              Color(0xFF2470d0),
              Color(0xFF296acc),
              Color(0xFF2e65c7),
              Color(0xFF335fc2)
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(360.0)),
          child: OverflowBox(
            alignment: Alignment.center,
            child: child,
          ),
        ));
  }

  Widget _buildTextFieldBlock(double rating) {
    return Wrap(
      runSpacing: 20,
      children: <Widget>[
        // Start date
        Visibility(
            visible: widget.eInviteDetailVisitorLog ==
                    E_INVITE_DETAIL_VISITOR_LOG.DASHBOARD &&
                (provider.model.signIn == null ||
                    provider.model.signIn.isEmpty),
            child: FutureProvider<String>(
                create: (_) => locator<Utilities>().convertDateToStringLongDate(
                    provider.model.startDate, context),
                child: Consumer<String>(
                  builder: (_, value, __) =>
                      _buildLabelRowInfo(value, Icons.access_time_outlined),
                ))),
        // Sign in and sign out
        Visibility(
          visible:
              provider.model.signIn != null && provider.model.signIn.isNotEmpty,
          child: _buildLabelRowInfo(
              "${_convertDateStringToTime(provider.model.signIn)} - ${_convertDateStringToTime(provider.model.signIn)}",
              Icons.access_time_outlined),
        ),
        // Email
        _buildLabelRowInfo(
            provider.model.emailAddress ?? '', Icons.markunread_outlined),
        // Number phone
        GestureDetector(
          onTap: () {
            if (provider.model.numberPhone == null ||
                provider.model.numberPhone.isEmpty) {
              return;
            }
            launch(('tel://${provider.model.numberPhone}'));
          },
          child:
              _buildLabelRowInfo(provider.model.numberPhone ?? '', Icons.phone),
        ),
        // Company
        _buildLabelRowInfo(
            provider.model.company ?? '', Icons.apartment_outlined),
      ],
    );
  }

  String _convertDateStringToTime(String dateString) {
    if (dateString == null) {
      return AppLocalizations.of(context).noneContent;
    }
    DateTime date = DateTime.parse(dateString);
    String dateHour = DateFormat('HH:mm').format(date);
    return dateHour;
  }

  Widget _buildLabelRowInfo(String value, IconData icon, {int maxLines = 2}) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: LabelDisplayCommon(
        maxLines: maxLines,
        body: value ?? "",
        prefixIcon: icon,
      ),
    );
  }

  String getDataQR(String inviteCode) {
    FormatQRCode formatQRCode;
    formatQRCode = FormatQRCode(FormatQRCode.INVITATION, inviteCode);
    return jsonEncode(formatQRCode);
  }

  // code cũ k có isJustCheck, để default = false
  _requestPermission(Function callback, isJustCheck) async {
    var permissionCallBack = PermissionCallBack(() async {
      await callback();
    }, () {}, () {});
    List<PermissionGroup> permissions = List();
    permissions = [PermissionGroup.storage];
    await Utilities.requestPermission(
        context, permissions, permissionCallBack, isJustCheck, true);
  }

  Future _saveScreen() async {
    Fluttertoast.showToast(
        msg: AppLocalizations.of(context).downloadingContent,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.blue[600]);
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage(pixelRatio: 4.0);
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
    Fluttertoast.showToast(
        msg: AppLocalizations.of(context).downloadQRCodeSuccessContent,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.blue[600]);
  }

  Future<String> _saveWidgetImageToLocal(String key) async {
    // Render widget to image byte data
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage(pixelRatio: 5.0);
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    // Get folder temp
    final appDir = await syspaths.getTemporaryDirectory();
    File file = File('${appDir.path}/qrCode_$key.png');
    // Write file
    final buffer = byteData.buffer;
    await file.writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file.path;
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
