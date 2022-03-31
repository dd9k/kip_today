import 'dart:io';
import 'dart:typed_data';

import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/DetailVisitorLog.dart';
import 'package:checkinpromobile/src/screens/DetailHistoryVisitorLog/DetailHistoryVisitorLogNotifier.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/LabelDisplayCommon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;

// ignore: must_be_immutable
class DetailHistoryVisitorLogScreen extends StatefulWidget {
  final DetailVisitorLog detailVisitorLog;

  DetailHistoryVisitorLogScreen({Key key, @required this.detailVisitorLog})
      : super(key: key);

  @override
  _DetailHistoryVisitorLogScreenState createState() =>
      _DetailHistoryVisitorLogScreenState();
}

class _DetailHistoryVisitorLogScreenState
    extends State<DetailHistoryVisitorLogScreen> {
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
  DetailHistoryVisitorLogNotifier provider;

  final _controller = ScrollController();
  double maxHeight;
  double get minHeight =>
      kToolbarHeight + locator<Utilities>().paddingTopSizeHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider =
        Provider.of<DetailHistoryVisitorLogNotifier>(context, listen: false);
    provider.loadCoverPic(widget.detailVisitorLog.faceImg);
    provider.model = widget.detailVisitorLog;
    // Add locale message timeago
    timeago.setLocaleMessages('vi', timeago.ViMessages());
  }

  @override
  Widget build(BuildContext context) {
    maxHeight = MediaQuery.of(context).size.height / 2.5 +
        locator<Utilities>().paddingTopSizeHeight;
    double rating =
        provider.model.rating == null ? 0.0 : provider.model.rating.toDouble();
    int statusChecked = 1; // Checked in
    if (provider.model.signOut != null && provider.model.signOut.isNotEmpty) {
      statusChecked = 2; // Checked out
    }
    return Container(
      color: context.bgSliverAppBar,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: NotificationListener<ScrollEndNotification>(
            onNotification: (_) {
              _snapAppbar();
              return false;
            },
            child: CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              controller: _controller,
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    icon: Icon(Icons.clear_outlined),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0.0),
                    child: Transform.translate(
                        offset: const Offset(0, 0.0),
                        child: _buildCheckedButton(context, statusChecked)),
                  ),
                  toolbarHeight: minHeight,
                  pinned: true,
                  stretch: true,
                  flexibleSpace:
                      Selector<DetailHistoryVisitorLogNotifier, Uint8List>(
                    builder: (_, data, __) {
                      return Header(
                        maxHeight: maxHeight,
                        minHeight: minHeight,
                        coverImageLocal: data,
                        coverAvatarPath: provider.model.faceImg,
                        dateTimeChecked: statusChecked == 1
                            ? provider.model.signIn
                            : provider.model.signOut,
                        fullName: provider.model.fullname,
                        statusChecked: statusChecked,
                      );
                    },
                    selector: (_, provider) => provider.coverPic,
                  ),
                  expandedHeight:
                      maxHeight - MediaQuery.of(context).padding.top,
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildTextFieldBlock(rating);
                  }, childCount: 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckedButton(BuildContext context, int statusChecked) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
            decoration: BoxDecoration(
              color: statusChecked == 2
                  ? AppColors.CHECKOUT_BUTTON_BG_COLOR
                  : AppColors.CHECKIN_BUTTON_BG_COLOR,
              borderRadius: BorderRadius.all(
                  Radius.circular(5.0) //         <--- border radius here
                  ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      statusChecked == 2 ? Icons.logout : Icons.login,
                      size: AdaptiveTextSize()
                          .getadaptiveTextSize(context, multiplier: 2.0),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      statusChecked == 2
                          ? AppLocalizations.of(context).checkedOutTitle
                          : AppLocalizations.of(context).checkedInTitle,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontSize: 14,
                            color: AppColors.BG_COLOR_LIGHT,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 7,
            child: FutureBuilder<String>(
                future: _getSignTimeAgo(
                    provider.model.signOut ?? provider.model.signIn),
                builder: (_, snapshot) {
                  return Text(snapshot.data,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppTextStyles.tahomaFont,
                          fontSize:
                              AdaptiveTextSize().getadaptiveTextSize(context)));
                }))
      ],
    );
  }

  Future<String> _getSignTimeAgo(String signTime) async {
    print('Call _geSignTimeAgo func');
    if (signTime.isEmpty) {
      return AppLocalizations.of(context).noneContent;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var langSaved =
        prefs.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
    final now = new DateTime.now();
    final DateTime dateChecked = DateTime.parse(signTime);
    final difference = now.difference(dateChecked);
    return timeago.format(now.subtract(difference),
        locale: langSaved == Constants.EN_CODE ? 'en' : 'vi');
  }

  void _snapAppbar() {
    final scrollDistance = maxHeight - minHeight;

    if (_controller.offset > 0 && _controller.offset < scrollDistance) {
      final double snapOffset =
          _controller.offset / scrollDistance > 0.5 ? scrollDistance : 0;

      Future.microtask(() => _controller.animateTo(snapOffset,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn));
    }
  }

  Widget _buildRatingStarRow(double rating) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Icon(
            Icons.class__outlined,
            //color: AppColors.ICON_COLOR,
          ),
        ),
        Expanded(
          flex: 9,
          child: RatingBar.builder(
            initialRating: rating,
            minRating: 0,
            direction: Axis.horizontal,
            ignoreGestures: true,
            itemCount: 5,
            itemSize: AdaptiveTextSize()
                .getadaptiveTextSize(context, multiplier: 2.5),
            itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) => null,
          ),
        )
      ],
    );
  }

  Widget _buildTextFieldBlock(double rating) {
    return Wrap(
      runSpacing: 20,
      children: <Widget>[
        // Checkin
        FutureProvider<String>(
          create: (_) {
            return locator<Utilities>()
                .convertDateToStringLongDate(provider.model.signIn, context);
          },
          child: Consumer<String>(
            builder: (_, value, __) {
              if (value == AppLocalizations.of(context).noData) {
                value = '';
              }
              return _buildLabelRowInfo(value, Icons.login);
            },
          ),
        ),
        // Checkout
        FutureProvider<String>(
          create: (_) {
            return locator<Utilities>()
                .convertDateToStringLongDate(provider.model.signOut, context);
          },
          child: Consumer<String>(
            builder: (_, value, __) {
              if (value == AppLocalizations.of(context).noData) {
                value = '';
              }
              return _buildLabelRowInfo(value, Icons.logout);
            },
          ),
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
        // Address
        _buildLabelRowInfo(
            provider.model.branchName ?? '', Icons.location_city_outlined),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: _buildRatingStarRow(rating),
        ),
        _buildLabelRowInfo(
            provider.model.feedback ?? '', Icons.feedback_outlined,
            maxLines: 3),
      ],
    );
  }

  Widget _buildLabelRowInfo(String value, IconData icon, {int maxLines = 2}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: LabelDisplayCommon(
        maxLines: maxLines,
        body: value ?? "",
        prefixIcon: icon,
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class Header extends StatelessWidget {
  final double maxHeight;
  final double minHeight;
  final Uint8List coverImageLocal;
  final String coverAvatarPath;
  final String fullName;
  final int statusChecked;
  final String dateTimeChecked;

  const Header(
      {Key key,
      this.maxHeight,
      this.minHeight,
      this.coverImageLocal,
      @required this.coverAvatarPath,
      @required this.fullName,
      @required this.statusChecked,
      @required this.dateTimeChecked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final expandRatio = _calculateExpandRatio(constraints);
        final animation = AlwaysStoppedAnimation(expandRatio);

        return Stack(
          fit: StackFit.expand,
          children: [
            Center(child: CircularProgressIndicator()),
            _buildImage(),
            _buildGradient(animation),
            _buildTitle(animation, context)
          ],
        );
      },
    );
  }

  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio =
        (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }

  Align _buildTitle(Animation<double> animation, BuildContext context) {
    final fontSizeBegin =
        AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 2.0);
    final fontSizeEnd =
        AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 2.5);
    return Align(
      alignment: AlignmentTween(
              begin: Alignment.bottomCenter, end: Alignment.bottomLeft)
          .evaluate(animation),
      child: Container(
        margin: EdgeInsets.only(bottom: (12.0 + 50.0), left: 10),
        child: Text(
          this.fullName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontFamily: AppTextStyles.helveticaFontLight,
            fontSize: Tween<double>(begin: fontSizeBegin, end: fontSizeEnd)
                .evaluate(animation),
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  Container _buildGradient(Animation<double> animation) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            ColorTween(begin: Colors.black87, end: Colors.black38)
                .evaluate(animation)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (coverImageLocal != null) {
      return Image.memory(coverImageLocal, fit: BoxFit.cover,
          errorBuilder: (cx, _, __) {
        return FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: this.coverAvatarPath ?? "",
          fit: BoxFit.cover,
          imageErrorBuilder: (cx, _, __) {
            return Image.asset('assets/images/default_avatar.png',
                fit: BoxFit.cover);
          },
        );
      });
    } else {
      return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: this.coverAvatarPath ?? "",
        fit: BoxFit.cover,
        imageErrorBuilder: (cx, _, __) {
          return Image.asset('assets/images/default_avatar.png',
              fit: BoxFit.cover);
        },
      );
    }
  }
}
