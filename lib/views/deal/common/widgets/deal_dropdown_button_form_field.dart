import 'package:dotorimarket/views/deal/common/widgets/deal_dropdown_menu_item.dart';
import 'package:flutter/material.dart';

class DealDropdownButtonFormField<T> extends StatefulWidget {
  static const double CONTENT_PADDING_DEFAULT = 10.0;

  final List<DealDropdownMenuItem<T>> items;
  final String hintText;
  final double contentPadding;
  final Function(T) onChanged;

  DealDropdownButtonFormField({
    Key key,
    @required this.items,
    @required this.hintText,
    this.contentPadding = CONTENT_PADDING_DEFAULT,
    @required this.onChanged,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _DtrDropdownButtonFormField<T>();
}

class _DtrDropdownButtonFormField<T> extends State<DealDropdownButtonFormField<T>> {
  static const double FONT_SIZE = 16.0;
  static const double TOP_PADDING = 15.0;
  static const double BOTTOM_PADDING = 10.0;
  static const double BORDER_BOTTOM_WIDTH = 1.0;

  List<DealDropdownMenuItem<T>> items;
  String hintText;
  double contentPadding;
  Function(T) onChanged;

  String currentText;

  /// state 초기화
  void _init() {
    items = widget.items;
    hintText = widget.hintText;
    contentPadding = widget.contentPadding;
    onChanged = widget.onChanged;
  }

  @override
  void initState() {
    _init();

    super.initState();
  }

  @override
  void didUpdateWidget(DealDropdownButtonFormField<T> oldWidget) {
    if (oldWidget.items != widget.items) {
      _init();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: currentText != null
                      ? Text(currentText,
                          style: const TextStyle(
                            fontSize: FONT_SIZE,
                          ),
                        )
                      : Text(hintText,
                          style: const TextStyle(
                            fontSize: FONT_SIZE,
                            color: Colors.black54,
                          ),
                        ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    top: TOP_PADDING,
                    bottom: BOTTOM_PADDING,
                    left: contentPadding,
                    right: contentPadding,
                  ),
                ),
              ),
              Container(
                child: Icon(Icons.arrow_drop_down),
              )
            ],
          ),
          decoration: const BoxDecoration(
            border: const Border(
              bottom: const BorderSide(
                width: BORDER_BOTTOM_WIDTH,
                color: Colors.black12,
              ),
            ),
          ),
        ),
        onTap: () async {
          DealDropdownMenuItem<T> item = await showDialog<DealDropdownMenuItem<T>>(
            context: context,
            builder: (BuildContext dialogContext) {
              return SimpleDialog(
                children: List.generate(items.length, (index) => SimpleDialogOption(
                  child: items[index],
                  onPressed: () {
                    Navigator.pop(dialogContext, items[index]);
                  },
                )),
              );
            }
          );

          if (item != null) {
            setState(() {
              currentText = item.text;
            });
            onChanged(item.value);
          }
        },
      ),
    );
  }
}