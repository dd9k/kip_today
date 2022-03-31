import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/model/CheckInFlow.dart';
import 'package:checkinpromobile/src/model/ETPaymentType.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/Loading.dart';
import 'package:checkinpromobile/src/widgetUtilities/TypeHead.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'CreateGuestNotifier.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/IconContainer.dart';
import 'package:checkinpromobile/src/model/ETBookingDiscountInfo.dart';

class CreateGuestScreen extends MainScreen {
  static const String route_name = '/createGuestScreen';
  @override
  _CreateGuestScreenState createState() => _CreateGuestScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _CreateGuestScreenState extends MainScreenState<CreateGuestNotifier> {
  List<FocusNode> focusNodes = List();
  FocusNode currentNodes;

  bool isOpeningKeyboard = false;

  @override
  void onKeyboardChange(bool visible) {
    isOpeningKeyboard = visible;
  }

  @override
  Widget build(BuildContext context) {
    provider.loadData(context);
    return GestureDetector(
      onTap: () => provider.utilities.hideKeyBoard(context),
      child: Selector<CreateGuestNotifier, bool>(
        builder: (context, isLoading, child) => Loading(
          visible: isLoading,
          child: Container(
            color: context.bgSliverAppBar,
            padding: EdgeInsets.fromLTRB(
                0, provider.utilities.paddingTopSizeHeight, 0, 0),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Scaffold(
                appBar: CustomAppBar(
                    index: -1,
                    provider: provider,
                    context: context,
                    childLeft: IconContainer(
                        icon: Icons.arrow_back, child: AppImage.backBtn),
                    childRight: IconContainer(icon: Icons.save)),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      color: context.bgCard,
                      child: Column(
                        children: renderWidgetByType(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        selector: (context, provider) => provider.isLoading,
      ),
    );
  }

  Widget _buildPayment() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: TypeAheadField<ETPaymentType>(
        hideSuggestionsOnKeyboardHide: false,
        noItemsFoundBuilder: (context) => Container(),
        getImmediateSuggestions: true,
        hideOnLoading: true,
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.bgColorlabelStyle,
              width: 1,
            ),
          ),
          constraints: BoxConstraints(
            maxHeight: SizeConfig.safeBlockVertical * 40,
          ),
        ),
        textFieldConfiguration: TextFieldConfiguration(
          enabled: true,
          decoration: InputDecoration(
            fillColor: context.bgCard,
            filled: true,
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: context.isModeViewDisable),
            ),
            suffixIcon: Icon(
              Icons.arrow_drop_down,
              size: AdaptiveTextSize().getadaptiveTextSize(
                context,
                multiplier: 3.0,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            labelText: appLocalizations.ticketPayment,
            hintStyle: TextStyle(),
            labelStyle: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: AppColors.TEXT_COLOR_DARK),
          ),
          readOnly: true,
          showCursor: false,
          onTap: () {
//            provider.keyList[provider.flows.length - 1].currentState.validate();
          },
          onSubmitted: (_) async {},
          controller: provider.paymentController,
          style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 14),
        ),
        suggestionsCallback: (String pattern) {
          return provider.eventDetail.paymentTypes;
        },
        transitionBuilder: (context, suggestionsBox, controller) {
          return suggestionsBox;
        },
        itemBuilder: (context, ETPaymentType suggestion) {
          return TextFormField(
            textAlign: TextAlign.start,
            textCapitalization: TextCapitalization.none,
            style: Theme.of(context).textTheme.bodyText2,
            enabled: false,
            controller: TextEditingController()..text = provider.utilities.getStringByLang(suggestion.settingValue, provider.langSaved),
            decoration: InputDecoration(
              icon: SizedBox(),
              contentPadding: EdgeInsets.only(left: 5),
            ),
          );
        },
        onSuggestionSelected: (ETPaymentType suggestion) async {
          provider.paymentController.text = provider.utilities.getStringByLang(suggestion.settingValue, provider.langSaved);
          provider.itemPayment = suggestion;
        },
      ),
    );
  }

  Widget _buildDiscount(ETBookingDiscountInfo discountInfo) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 5),
            child: Text(
              appLocalizations.discountTicketFrom +
                  discountInfo.bookingQuantity.toInt().toString() +
                  appLocalizations.ticketsAreDiscounted +
                  discountInfo.discountValue.toInt().toString() +
                  ' ' +
                  discountInfo.discountUnit,
              style: Theme.of(context).textTheme.headline5.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> renderWidgetByType() {
    List<Widget> list = List();
    provider.flows.asMap().forEach((index, CheckInFlow value) {
      CheckInFlow item = value;
      provider.initItemFlow(item, index, null, focusNodes);
      var widgetChild = buildTextFormField(item);
      list.add(Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: provider.keyList[item.index],
          child: widgetChild,
        ),
      ));
    });
    list.add(_buildPayment());
    list.add(buildQuantity());
    if (provider.listDiscount?.isNotEmpty == true) {
      list.add(buildTitleDiscount());
      provider.listDiscount.forEach((element) {
        list.add(_buildDiscount(element));
      });
    }
    if (provider?.eventDetail?.ticketInfo?.isFree != 1) {
      list.add(buildPrice());
      list.add(buildAmountNo());
      list.add(buildDiscount());
      list.add(buildTotalAmount());
    }
    list.add(SizedBox(
      height: Constants.HEIGHT_BUTTON + 40,
    ));
    return list;
  }

  Widget buildTitleDiscount() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Text(
            appLocalizations.discountOrderTicket,
            style: Theme.of(context).textTheme.headline5.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }

  Selector<CreateGuestNotifier, int> buildTotalAmount() {
    return Selector<CreateGuestNotifier, int>(
      builder: (context, quantity, child) => Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: 20,
        ),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appLocalizations.ticketsIntoMoney.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  "${Constants.formatCurrency.format(provider.totalAmount ?? 0)}",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ),
      ),
      selector: (context, provider) => provider.quantity,
    );
  }

  Selector<CreateGuestNotifier, int> buildDiscount() {
    return Selector<CreateGuestNotifier, int>(
      builder: (context, quantity, child) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appLocalizations.ticketsDiscount.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  "${Constants.formatCurrency.format(provider.amountDiscount ?? 0)}",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ),
      ),
      selector: (context, provider) => provider.quantity,
    );
  }

  Selector<CreateGuestNotifier, int> buildAmountNo() {
    return Selector<CreateGuestNotifier, int>(
      builder: (context, quantity, child) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appLocalizations.ticketsTemporaryprice.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  "${Constants.formatCurrency.format(provider.totalAmountNoDiscount ?? 0)}",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ),
      ),
      selector: (context, provider) => provider.quantity,
    );
  }

  Selector<CreateGuestNotifier, int> buildPrice() {
    return Selector<CreateGuestNotifier, int>(
      builder: (context, quantity, child) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appLocalizations.ticketsFare.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  provider.eventDetail.ticketInfo.getPriceString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ),
      ),
      selector: (context, provider) => provider.quantity,
    );
  }

  Widget buildQuantity() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Selector<CreateGuestNotifier, String>(
          builder: (context, data, child) {
            return TextFormField(
                controller: provider.quantityController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                style: Theme.of(context).textTheme.bodyText2,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  labelText: appLocalizations.visitorAmountTitle + '*',
                  errorText: provider.errorQuantity,
                  labelStyle: TextStyle(
                    fontFamily: AppTextStyles.helveticaFontLight,
                    color: AppColors.TEXT_COLOR_DARK,
                    fontSize: 14,
                  ),
                ),
                onEditingComplete: () async {
                  provider.utilities.hideKeyBoard(context);
                },
                onChanged: (text) {
                  int quantity;
                  if (text.isEmpty) {
                    quantity = 0;
                  } else {
                    quantity = int.parse(text);
                  }
                  provider.updateQuantity(quantity);
                });
          },
          selector: (context, provider) => provider.errorQuantity),
    );
  }

  Widget buildTextFormField(CheckInFlow item) {
    var labelText = item.getRequestType() == RequestType.ALWAYS_NO
        ? item.getStepName(appLocalizations)
        : "${item.getStepName(appLocalizations)}*";
    return Selector<CreateGuestNotifier, String>(
      builder: (context, data, child) {
        return TextFormField(
            controller: provider.textEditingControllers[item.stepCode],
            validator: provider.checkingValidator(item),
            textCapitalization: provider.checkingCapitalization(item),
            keyboardType: provider.getKeyBoardType(item.stepType),
            textInputAction: TextInputAction.done,
            inputFormatters: provider.inputFormat(item),
            maxLines: item.stepType == StepType.MULTIPLE_TEXT ? 3 : 1,
            focusNode: focusNodes[item.index],
            style: Theme.of(context).textTheme.bodyText2,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              labelText: labelText,
              suffixIcon: (provider.valueFocus == item.stepCode)
                  ? GestureDetector(
                      onTap: () {
                        provider.textEditingControllers[item.stepCode].text =
                            "";
                        item.initValue = '';
                      },
                      child: Container(
                        height: 56,
                        width: 56,
                        child: Icon(
                          Icons.cancel,
                          size: 24,
                          color: AppColors.HINT_TEXT_COLOR,
                        ),
                      ),
                    )
                  : null,
              labelStyle: TextStyle(
                fontFamily: AppTextStyles.helveticaFontLight,
                color: AppColors.TEXT_COLOR_DARK,
                fontSize: 14,
              ),
            ),
            onEditingComplete: () async {
              //Condition hide keyboard
              if ((item.index + 1) == provider.flows.length) {
                Utilities().hideKeyBoard(context);
                bool isValidate = true;
                provider.keyList.forEach((key) {
                  if (key.currentState?.validate() == false) {
                    isValidate = false;
                    return;
                  }
                });
                if (isValidate) {}
              } else {
                nextFocus(context, item);
              }
            },
            onTap: () {
//              if (item.index > 0) {
//                provider.keyList[item.index - 1].currentState.validate();
//              }
            },
            onChanged: (text) {
              item.initValue = text;
            });
      },
      selector: (buildContext, provider) => provider.valueFocus,
    );
  }

  void nextFocus(BuildContext context, CheckInFlow item) {
    FocusScope.of(context).requestFocus(focusNodes[item.index + 1]);
    currentNodes = focusNodes[item.index + 1];
//    provider.keyList[item.index].currentState.validate();
  }
}
