import 'dart:typed_data';

import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:checkinpromobile/src/screens/AttendanceScreen/CalendarScreen.dart';
import 'package:checkinpromobile/src/screens/Notification/NotificationScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/HomeNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/dashBoard/DashBoardNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorInviteNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorLogNotifier.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/createInvitation/DetailEventsCalendar.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/IconContainer.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checkinpromobile/src/screens/AttendanceScreen/CalendarNotifier.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';

import 'awesomeDialog/awesome_dialog.dart';

class CustomAppBar extends PreferredSize {
  final BuildContext context;

  // index = -1 for Screen not in HomeScreen
  final int index;
  final double height;
  final AppBarNotifier provider;
  final Widget childLeft;
  final Widget childRight;
  final TitleName userName;
  final Function callbackLeftChild;
  final Function callbackTabAvatar;
  final bool isAttendance;
  final bool isHaveSizeButton;

  CustomAppBar(
      {@required this.context,
      @required this.provider,
      @required this.index,
      this.height = 50,
      this.childLeft,
      this.childRight,
      this.callbackLeftChild,
      this.userName,
      this.callbackTabAvatar,
      this.isAttendance = false,
      this.isHaveSizeButton = false});

  @override
  Size get preferredSize => Size.fromHeight(
      height + (locator<Utilities>().paddingTopSizeHeight <= 0 ? 10.0 : 0));

  @override
  Widget build(BuildContext _) {
    Widget child = Container();
    switch (index) {
      case -1:
        {
          var paddingHorizontal = preferredSize.height / 4;
          child = Container(
            color: context.bgSliverAppBar,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () {
                    if (callbackLeftChild != null) {
                      callbackLeftChild();
                    } else {
                      AppRouter.pop(context);
                    }
                  },
                  child: (isHaveSizeButton && childLeft != null) ? childLeft : Container(
                    width: 50,
                    padding: EdgeInsets.only(
                        left: 0,
                        top: paddingHorizontal,
                        bottom: paddingHorizontal),
                    child: childLeft == null
                        ? Container(
                            height: 45,
                            width: 45,
                            child: AppImage.backBtn,
                          )
                        : childLeft,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    provider.getTitle(context).toUpperCase(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).appBarTheme.textTheme.headline1,
                  ),
                ),
                GestureDetector(
                  onTap: () => provider.onClickRight(context),
                  child: (isHaveSizeButton && childRight != null) ? childRight : Container(
                    width: 50,
                    padding: EdgeInsets.only(
                        top: paddingHorizontal, bottom: paddingHorizontal),
                    child: childRight != null
                        ? childRight
                        : SizedBox(
                            width: 45,
                            height: 45,
                          ),
                  ),
                ),
              ],
            ),
          );
          break;
        }
      case 0:
        {
          DashBoardNotifier notifier = provider as DashBoardNotifier;
          child = Container(
            color: context.bgSliverAppBar,
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      callbackTabAvatar();
                    },
                    child: Selector<DashBoardNotifier, String>(
                      builder: (context, data, child) {
                        return FutureBuilder<Uint8List>(
                          future: (provider as DashBoardNotifier).getAvatar(),
                          builder: (_, s) {
                            if ((provider as DashBoardNotifier).savedAvatar == null) {
                              return _buildCircleLayout(
                                  50,
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/default_avatar.png'),
                                        )),
                                  ));
                            }
                            try {
                              return CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: Image.memory((provider as DashBoardNotifier).savedAvatar).image,
                                radius: 50 * 0.5,
                              );
                            } catch (_) {
                              return _buildCircleLayout(
                                  50,
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/default_avatar.png'),
                                        )),
                                  ));
                            }
                          },
                        );
                      },
                      selector: (buildContext, modelProvider) => modelProvider.valueImage,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Selector<DashBoardNotifier, Authenticate>(
                      builder: (context, data, child) {
                        if (data == null) {
                          return Container();
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${locator<Utilities>().greetingMessage(context).mess}!",
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .appBarTheme
                                    .textTheme
                                    .headline3
                                    .copyWith(color: Color(0xff0671d1)),
                              ),
                              Text(
                                "${data.employeeInfo.personalInfo.fullName != null ? data.employeeInfo.personalInfo.fullName : ""}",
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .appBarTheme
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        fontSize: 16, color: Color(0xff999999)),
                              ),
                            ],
                          );
                        }
                      },
                      selector: (context, provider) => provider.authenAppbar,
                    ),
                  ),
                  if (notifier.isEventTicket) Selector<DashBoardNotifier, int>(
                    builder: (context, index, child) => Visibility(
                      visible: true,
                      child: IconContainer(icon: index == 0 ? Icons.sync : Icons.delete_outline, color: context.bgIcon, onTap: () {
                        if (index == 0) {
                          notifier.refreshController.requestRefresh();
                          notifier.onRefreshEventTicket();
                        } else if (index == 1) {
                          notifier.updateMode();
                        }
                      },),
                    ),
                    selector: (buildContext, provider) => provider.selectedBarIndex,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (provider is DashBoardNotifier) {
                        AppRouter.pushTo(context, NotificationScreen.route_name).then(
                          (value) {
                            if (value != null) {
                              var isReloadNotification = value["isReloadNotification"];
                              if (isReloadNotification == true)
                                Provider.of<DashBoardNotifier>(context, listen: true)
                                    .updateTotalCountNotification(context);
                            }
                          },
                        );
                      }
                    },
                    child: Stack(
                      children: [
                        IconContainer(icon: Icons.notifications_none_sharp, color: context.bgIcon),
                        Selector<DashBoardNotifier, int>(
                          builder: (context, value, child) {
                            return Positioned(
                                left: locator<Utilities>().paddingTopSizeHeight <= 0 ? 30 : 25,
                                top: locator<Utilities>().paddingTopSizeHeight <= 0 ? 10 : 5,
                                child: (value <= 0)
                                    ? Container()
                                    : CircleAvatar(
                                        child: Text(
                                          value > 99 ? '99+' : '$value',
                                          style: TextStyle(
                                              fontSize: 8,
                                              fontFamily: AppTextStyles.tahomaFont,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        backgroundColor: AppColors.CHECKOUT_BUTTON_BG_COLOR,
                                        radius: 8,
                                      ));
                          },
                          selector: (cx, provider) => provider.notiCount,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
          break;
        }
      case 1:
        {
          // var paddingHorizontal = preferredSize.height / 4;
          child = Container(
            color: context.bgSliverAppBar,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                isAttendance
                    ? Opacity(
                        opacity: 0,
                        child: Container(
                          width: 40,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: 0),
                          child: Icon(Icons.calendar_today),
                        ),
                      )
                    : Opacity(
                        opacity: 0,
                        child: Wrap(
                          alignment: WrapAlignment.end,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            IconContainer(
                              icon: Icons.today,
                            ),
                            IconContainer(
                              icon: Icons.add,
                            ),
                            Container(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                Expanded(
                  flex: 1,
                  child: Text(
                    provider.getTitle(context).toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).appBarTheme.textTheme.headline1,
                  ),
                ),
                isAttendance
                    ? GestureDetector(
                        onTap: () => provider.onClickRight(context),
                        child: Container(
                          width: 50,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: 0),
                          child: GestureDetector(
                            child: Icon(
                              Icons.event,
                            ),
                            onTap: () {
                              showModalBottomSheet<void>(
                                  builder: (_) {
                                    return ChangeNotifierProvider(
                                      create: (_) => CalendarNotifier(),
                                      child: CalendarPage(),
                                    );
                                  },
                                  context: context,
                                  isScrollControlled: true);
                            },
                          ),
                        ),
                      )
                    : Selector<VisitorLogNotifier, int>(
                        builder: (context, selectedBarIndex, child) {
                          return Opacity(
                            opacity: selectedBarIndex == 0 ? 1.0 : 0,
                            child: Selector<VisitorInviteNotifier, bool>(
                              builder: (context, isCalendar, child) {
                                return Wrap(
                                  alignment: WrapAlignment.end,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    IconContainer(
                                        icon: (isCalendar)
                                            ? Icons.list
                                            : Icons.today,
                                        onTap: () =>
                                            provider.onClickLeft(context)),
                                    IconContainer(
                                        icon: Icons.add,
                                        onTap: () {
                                          if (provider.parent.isConnection) {
                                            InviteNewVisitor newInvite =
                                            InviteNewVisitor.init();
                                            AppRouter.pushToWithArguments(context, DetailEventsPage.route_name, arguments: {
                                              'inviteOld': newInvite
                                            }, transitionType: TransitionType.inFromBottom, transitionDuration: Duration(milliseconds: 500)).then((value) {
                                              if (newInvite.isSent) {
                                                Provider.of<VisitorInviteNotifier>(
                                                    context,
                                                    listen: false)
                                                    .addNewInvite(newInvite);
                                              }
                                            });
                                          } else {
                                            locator<Utilities>().showOneButtonDialog(
                                                context,
                                                DialogType.ERROR,
                                                null,
                                                "",
                                                provider.appLocalizations.noInternet,
                                                provider.appLocalizations.btnOk, () {
                                            });
                                          }
                                        }),
                                    Container(
                                      width: 5,
                                    ),
                                  ],
                                );
                              },
                              selector: (context, provider) =>
                                  provider.isCalendar,
                            ),
                          );
                        },
                        selector: (context, provider) =>
                            provider.selectedBarIndex,
                      ),
              ],
            ),
          );
          break;
        }
      case 3:
        {
          child = Container(
            color: context.bgSliverAppBar,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Opacity(
                    opacity: 0,
                    child: Container(
                      width: 40,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(right: 0),
                      child: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    provider.getTitle(context).toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).appBarTheme.textTheme.headline1,
                  ),
                ),
                isAttendance
                    ? Expanded(
                        child: Selector<VisitorLogNotifier, int>(
                          builder: (context, selectedBarIndex, child) {
                            return Opacity(
                              opacity: selectedBarIndex == 0 ? 1.0 : 0,
                              child: Selector<VisitorInviteNotifier, bool>(
                                builder: (context, isCalendar, child) {
                                  return Wrap(
                                    alignment: WrapAlignment.end,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      IconContainer(
                                          icon: (isCalendar)
                                              ? Icons.list
                                              : Icons.today,
                                          onTap: () =>
                                              provider.onClickLeft(context)),
                                      IconContainer(
                                          icon: Icons.add,
                                          onTap: () {
                                            if (provider.parent.isConnection) {
                                              InviteNewVisitor newInvite =
                                              InviteNewVisitor.init();
                                              AppRouter.pushToWithArguments(context, DetailEventsPage.route_name, arguments: {
                                                'inviteOld': newInvite,
                                              }, transitionType: TransitionType.inFromBottom, transitionDuration: Duration(milliseconds: 500)).then((value) {
                                                if (newInvite.isSent) {
                                                  Provider.of<VisitorInviteNotifier>(
                                                      context,
                                                      listen: false)
                                                      .addNewInvite(newInvite);
                                                }
                                              });
                                            } else {
                                              locator<Utilities>().showOneButtonDialog(
                                                  context,
                                                  DialogType.ERROR,
                                                  null,
                                                  "",
                                                  provider.appLocalizations.noInternet,
                                                  provider.appLocalizations.btnOk, () {
                                              });
                                            }
                                          }),
                                      Container(
                                        width: 5,
                                      ),
                                    ],
                                  );
                                },
                                selector: (context, provider) =>
                                    provider.isCalendar,
                              ),
                            );
                          },
                          selector: (context, provider) =>
                              provider.selectedBarIndex,
                        ),
                      )
                    : Expanded(
                        child: Opacity(
                          opacity: 0,
                          child: Container(
                            width: 40,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 0),
                            child: Icon(
                              Icons.calendar_today,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          );
          break;
        }
      case 4:
        {
          child = Container(
            color: context.bgSliverAppBar,
            child: Center(
              child: Text(
                provider.getTitle(context).toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).appBarTheme.textTheme.headline1,
              ),
            ),
          );
          break;
        }
    }
    return Container(
      height: preferredSize.height,
      child: child,
    );
  }

  Widget _buildCircleLayout(double size, Widget child) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(360.0) //         <--- border radius here
              ),
          color: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(360.0)),
          child: OverflowBox(
            alignment: Alignment.center,
            child: child,
          ),
        ));
  }
}
