library dropdownfield;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';

///DropDownField has customized autocomplete text field functionality
///
///Parameters
///
///value - dynamic - Optional value to be set into the Dropdown field by default when this field renders
///
///icon - Widget - Optional icon to be shown to the left of the Dropdown field
///
///hintText - String - Optional Hint text to be shown
///
///hintStyle - TextStyle - Optional styling for Hint text. Default is normal, gray colored font of size 18.0
///
///labelText - String - Optional Label text to be shown
///
///labelStyle - TextStyle - Optional styling for Label text. Default is normal, gray colored font of size 18.0
///
///required - bool - True will validate that this field has a non-null/non-empty value. Default is false
///
///enabled - bool - False will disable the field. You can unset this to use the Dropdown field as a read only form field. Default is true
///
///items - List<dynamic> - List of items to be shown as suggestions in the Dropdown. Typically a list of String values.
///You can supply a static list of values or pass in a dynamic list using a FutureBuilder
///
///textStyle - TextStyle - Optional styling for text shown in the Dropdown. Default is bold, black colored font of size 14.0
///
///inputFormatters - List<TextInputFormatter> - Optional list of TextInputFormatter to format the text field
///
///setter - FormFieldSetter<dynamic> - Optional implementation of your setter method. Will be called internally by Form.save() method
///
///onValueChanged - ValueChanged<dynamic> - Optional implementation of code that needs to be executed when the value in the Dropdown
///field is changed
///
///strict - bool - True will validate if the value in this dropdown is amongst those suggestions listed.
///False will let user type in new values as well. Default is true
///
///itemsVisibleInDropdown - int - Number of suggestions to be shown by default in the Dropdown after which the list scrolls. Defaults to 3
class DropDownField extends FormField<String> {
  final dynamic value;
  final Widget icon;
  final String hintText;
  final TextStyle hintStyle;
  final String labelText;
  final TextStyle labelStyle;
  final TextStyle textStyle;
  final bool required;
  final bool enabled;
  final List<dynamic> items;
  final List<String> itemValues;
  final List<TextInputFormatter> inputFormatters;
  final FormFieldSetter<dynamic> setter;
  final ValueChanged<dynamic> onValueChanged;
  final bool strict;
  final int itemsVisibleInDropdown;
  final String Function(String) validator;
  final FocusNode focusNode;
  final Function(String) onChange;
  final Color fillColor;
  final bool filled;
  final Function onComplete;
  final InputDecoration effectiveDecoration;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController controller;
  DropDownField({
    Key key,
    this.controller,
    this.value,
    this.required: false,
    this.icon,
    this.hintText,
    this.hintStyle: const TextStyle(
        fontWeight: FontWeight.normal, color: Colors.grey, fontSize: 18.0),
    this.labelText,
    this.labelStyle: const TextStyle(
        fontWeight: FontWeight.normal, color: Colors.grey, fontSize: 18.0),
    this.inputFormatters,
    this.items,
    this.textStyle: const TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14.0),
    this.setter,
    this.onValueChanged,
    this.itemsVisibleInDropdown: 3,
    this.enabled: true,
    this.strict: true,
    this.itemValues,
    this.validator,
    this.focusNode,
    this.onChange,
    this.fillColor,
    this.filled,
    this.onComplete,
    this.effectiveDecoration,
  }) : super(
          key: key,
          initialValue: controller != null ? controller.text : (value ?? ''),
          onSaved: setter,
          builder: (FormFieldState<String> field) {
            final DropDownFieldState state = field;
            final ScrollController _scrollController = ScrollController();
            var listChild = state._getChildren(state._items, state._itemValues);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        onTap: () {
                          SystemChannels.textInput
                              .invokeMethod('TextInput.hide');
                          // ignore: invalid_use_of_protected_member
                          state.setState(() {
                            state._showdropdown = !state._showdropdown;
                          });
                        },
                        onEditingComplete: onComplete,
                        onChanged: onChange,
                        controller: state._effectiveController,
                        decoration: effectiveDecoration.copyWith(
                            errorText: field.errorText),
                        style: textStyle,
                        textAlign: TextAlign.start,
                        autofocus: false,
                        focusNode: state._focusNode
                          ..addListener(() {
                            if (state._focusNode.hasFocus) {
                              state.setState(() {
                                state._showdropdown = true;
                              });
                            }
                          }),
                        obscureText: false,
                        maxLengthEnforced: true,
                        maxLines: 1,
                        onSaved: setter,
                        enabled: enabled,
                        inputFormatters: inputFormatters,
                        validator: validator,
                      ),
                    ),
                  ],
                ),
                !state._showdropdown || listChild.isEmpty
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 3),
                          alignment: Alignment.centerLeft,
                          height: itemsVisibleInDropdown * 48.0,
                          width: MediaQuery.of(field.context).size.width,
                          child: ListView(
                            cacheExtent: 0.0,
                            scrollDirection: Axis.vertical,
                            controller: _scrollController,
                            children: items.isNotEmpty
                                ? ListTile.divideTiles(
                                    context: field.context,
                                    tiles: listChild,
                                  ).toList()
                                : List(),
                          ),
                        ),
                      ),
              ],
            );
          },
        );

  @override
  DropDownFieldState createState() => DropDownFieldState();
}

class DropDownFieldState extends FormFieldState<String> {
  TextEditingController _controller;
  bool _showdropdown = false;
  bool _isSearching = true;
  String _searchText = "";

  @override
  DropDownField get widget => super.widget;
  TextEditingController get _effectiveController =>
      widget.controller ?? _controller;

  List<dynamic> get _items => widget.items;
  FocusNode get _focusNode => widget.focusNode;
  List<String> get _itemValues => widget.itemValues;
  Map<String, dynamic> itemExist = {};

  void toggleDropDownVisibility() {}

  void clearValue() {
    setState(() {
      _effectiveController.text = '';
    });
  }

  @override
  void didUpdateWidget(DropDownField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null)
        _controller =
            TextEditingController.fromValue(oldWidget.controller.value);
      if (widget.controller != null) {
        setValue(widget.controller.text);
        if (oldWidget.controller == null) _controller = null;
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    }

    _effectiveController.addListener(_handleControllerChanged);

    _searchText = _effectiveController.text;

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _searchText.isNotEmpty && _showdropdown && itemExist.isNotEmpty) {
        setState(() {
          _effectiveController.text = itemExist.keys.first;
          _handleControllerChanged();
          _showdropdown = false;
          _isSearching = false;
          if (widget.onValueChanged != null) widget.onValueChanged(itemExist.values.first);
        });
      }
    });
  }

  @override
  void reset() {
    super.reset();
    setState(() {
      _effectiveController.text = widget.initialValue;
    });
  }

  List<Widget> _getChildren(List<dynamic> items, List<String> itemValues) {
    List<Widget> childItems = List();
    itemExist.clear();
    for (var i = 0; i < items.length; i++) {
      if (_searchText.isNotEmpty) {
        if (itemValues[i].toUpperCase().contains(_searchText.toUpperCase())) {
          childItems.add(_getListTile(items[i], itemValues[i]));
          itemExist[itemValues[i]] = items[i];
        }
      } else {
        childItems.add(_getListTile(items[i], itemValues[i]));
      }
    }
    // ignore: unnecessary_statements
    _isSearching ? childItems : List();
    return childItems;
  }

  Widget _getListTile(dynamic value, String text) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 12, left: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      onTap: () {
        setState(() {
          _effectiveController.text = text;
          _handleControllerChanged();
          _showdropdown = false;
          _isSearching = false;
          if (widget.onValueChanged != null) widget.onValueChanged(value);
        });
      },
    );
  }

  void _handleControllerChanged() {
    if (_effectiveController.text != value)
      didChange(_effectiveController.text);

    if (_effectiveController.text.isEmpty) {
      setState(() {
        _isSearching = false;
        _searchText = "";
      });
    } else {
      setState(() {
        _isSearching = true;
        _searchText = _effectiveController.text;
        _showdropdown = true;
      });
    }
  }
}
