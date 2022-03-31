import 'dart:io';
import 'package:checkinpromobile/src/constants/AppDestination.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/model/EventGuest.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/TemplatePrint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../main.dart';
import 'ScanQRNotifier.dart';

class ScanQRScreen extends MainScreen {
  static const String route_name = '/scanQR';

  @override
  _ScanQRScreenState createState() => _ScanQRScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _ScanQRScreenState extends MainScreenState<ScanQRNotifier>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  AnimationController _animationController;
  // bool _animationStopped = false;
  bool scanning = false;
  bool isFirstInit = true;

  @override
  void initState() {
    super.initState();
    isFirstInit = true;
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      provider.controller.pauseCamera();
    } else if (Platform.isIOS) {
      provider.controller.resumeCamera();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider.parent = MyApp.of(context);
    provider.sizeQR = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        provider.isShowLogo = !visible;
      },
    );
    if (_animationController == null) {
      _animationController = new AnimationController(
          duration: new Duration(seconds: 2),
          lowerBound: provider.calculateLowerBound(
              heightScreen * 100, provider.sizeQR / 1.5),
          vsync: this);

      _animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animateScanAnimation(true);
        } else if (status == AnimationStatus.dismissed) {
          animateScanAnimation(false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (provider.arguments != null) {
      provider.badgeTemplateId =
          provider.arguments["badgeTemplateId"] as String;
      provider.isPrintForEvent = provider.arguments["isPrint"] as int;
      provider.eventId = provider.arguments["eventId"] as double;
      provider.branchId = provider.arguments["branchId"] as double;
      provider.employeeId = provider.arguments["employeeId"] as double;
    }
    animateScanAnimation(false);
    if (isFirstInit) {
      isFirstInit = false;
      provider.doTimerOutBack(context);
    }
    return Stack(children: <Widget>[
      Scaffold(
          backgroundColor: Colors.transparent,
          body: RepaintBoundary(
            key: provider.repaintBoundary,
            child: Container(
              height: AppDestination.CARD_HEIGHT,
              width: AppDestination.CARD_WIGHT,
              color: Colors.white,
              child: new Center(child: _cardTemplate(provider.badgeTemplateId)),
            ),
          )),
      Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(alignment: Alignment.topCenter, children: [
            _buildQrView(context),
            // ImageScannerAnimation(
            //   _animationStopped,
            //   provider.sizeQR,
            //   provider.topAnimation,
            //   animation: _animationController,
            // ),
            Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(top: Utilities().paddingTopSizeHeight),
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.5),
                  height: MediaQuery.of(context).size.height / 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              AppRouter.pop(context);
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: AppImage.backBtnWhite,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(
                                appLocalizations.scanQrCodeTitle.toUpperCase(),
                                style: TextStyle(
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context,
                                            multiplier: 1.85),
                                    // color: Colors.white,
                                    color: Colors.white,
                                    fontFamily: AppTextStyles.tahomaFont,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none))),
                      ),
                      // Opacity(
                      //   opacity: 0.0,
                      //   child: Expanded(
                      //     flex: 2,
                      //     child: Container(
                      //       margin: EdgeInsets.only(right: 20),
                      //       child: Align(
                      //           alignment: Alignment.center,
                      //           child: AppImage.backBtnWhite),
                      //     ),
                      //   ),
                      // )
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Align(
                            alignment: Alignment.center,
                            child: Opacity(
                              opacity: 0.0,
                              child: AppImage.backBtnWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                bottom: 25,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: AppImage.checkinProWhite,
                      width: 100,
                    ))),
            Selector<ScanQRNotifier, bool>(
              builder: (cx, data, child) {
                return Visibility(
                  visible: provider.isLoading,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              },
              selector: (cx, provider) => provider.isLoading,
            ),
          ]))
    ]);
  }

  Widget _cardTemplate(String badgeIndex) {
    return Selector<ScanQRNotifier, EventGuest>(
      builder: (context, data, child) => TemplatePrint(
        visitorName: data?.visitorName ?? "",
        phoneNumber: data?.visitorPhoneNumber ?? "",
        fromCompany: data?.fromCompany ?? "",
        visitorType: data?.visitorType ?? "",
        indexTemplate: badgeIndex,
        printerModel: provider.printerModel,
        inviteCode: provider.eventGuest?.inviteCode ?? "",
      ),
      selector: (buildContext, provider) => provider.eventGuest,
    );
  }

  Widget _buildQrView(BuildContext context) {
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return NotificationListener<SizeChangedLayoutNotification>(
        onNotification: (notification) {
          Future.microtask(() => provider.controller
              ?.updateDimensions(qrKey, scanArea: provider.sizeQR));
          return false;
        },
        child: SizeChangedLayoutNotifier(
            key: const Key('qr-size-notifier'),
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              // overlay: QrScannerOverlayShape(
              //   borderColor: Colors.lightBlue,
              //   borderRadius: 10,
              //   borderLength: 30,
              //   borderWidth: 10,
              //   cutOutSize: provider.sizeQR,
              // ),
            )));
  }

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController.reverse(from: 1.0);
    } else {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    provider.controller.dispose();
    provider.timerDoneAnyWay?.cancel();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    provider.controller = controller;
    provider.startStream(context);
  }
}
