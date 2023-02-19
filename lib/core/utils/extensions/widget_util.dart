import 'dart:async';
import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Future<void> showSheet(BuildContext ctx, Widget sheet, {bool isControlled = true}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isDismissible: isControlled,
    builder: (ctx) => Padding(
      child: sheet,
      padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
    ),
    context: ctx,
    isScrollControlled: isControlled,
    enableDrag: isControlled,
  );
}


void showAlert(BuildContext ctx, {bool isControlled = true, required String text, required VoidCallback yes}) {
  showDialog<void>(
    context: ctx,
    barrierDismissible: isControlled,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text18BlackBold(
         'Confirm',
          alignment: TextAlign.left,
        ),
        content: Text14BlackRegular(text),
        actions: <Widget>[
          TextButton(
            child: Text14BlueBold('No'),
            onPressed: () {
              ctx.router.pop();
            },
          ),
          TextButton(
            child: Text14BlueBold('Yes'),
            onPressed: yes,
          ),
        ],
      );
    },
  );
}

class BottomDrawer extends StatelessWidget {
  final Widget child;

  final bool withBack;

  const BottomDrawer({
    Key? key,
    required this.child,
    this.withBack = false,
  }) : super(key: key);

  @override
  Widget build(ctx) => withBack
      ? Column(
          children: [
            Padding(
              child: _backButton(ctx),
              padding: const EdgeInsets.all(8),
            ),
            _main(),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
      : _main();

  Widget _main() => Container(
        child: child,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      );

  Widget _backButton(BuildContext ctx) => ElevatedButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(ctx).pop(),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
        ),
      );
}

Widget loader() => BackdropFilter(
      child: Container(
        child: Center(
          child: SpinKitThreeBounce(
            color: Colors.grey[400],
          ),
        ),
        color: Colors.grey[200]!.withOpacity(0.4),
      ),
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
    );

class Loadable extends StatefulWidget {
  final Widget? action;

  final Function()? onRefresh;

  final RefreshController? refreshController;

  final PreferredSizeWidget? appBar;

  final Color? backgroundColor;

  final Widget? bottomNavigationBar;

  final Widget? bottomSheet;

  final Widget child;

  final Widget? extra;

  final Widget? floatingActionButton;

  final bool loading;

  final bool safeTop;

  final bool isUsingGradient;

  final bool extendBodyBehindAppBar;

  const Loadable({
    Key? key,
    this.action,
    this.appBar,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.bottomSheet,
    required this.child,
    this.extra,
    this.floatingActionButton,
    this.loading = false,
    this.safeTop = true,
    this.isUsingGradient = true,
    this.extendBodyBehindAppBar = false,
    this.onRefresh,
    this.refreshController,
  }) : super(key: key);

  @override
  createState() => _State();
}

class _State extends State<Loadable> {
  @override
  Widget build(ctx) => widget.refreshController != null
      ? MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: SmartRefresher(
            controller: widget.refreshController ?? RefreshController(initialRefresh: false),
            enablePullUp: true,
            onRefresh: () {
              widget.refreshController?.refreshCompleted();
              widget.refreshController?.loadComplete();
              widget.onRefresh?.call();
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Scaffold(
                  appBar: widget.appBar,
                  backgroundColor: widget.backgroundColor,
                  extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
                  body: Stack(
                    children: [
                      if (widget.isUsingGradient)
                        Container(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            getSourceByPng('header_gradient'),
                          ),
                        ),
                      widget.child,
                      if (widget.extra != null) widget.extra!,
                      Align(child: widget.bottomSheet ?? const SizedBox(), alignment: Alignment.bottomCenter),
                    ],
                    fit: StackFit.expand,
                  ),
                  bottomNavigationBar: widget.bottomNavigationBar,
                  floatingActionButton: widget.floatingActionButton,
                ),
                if (widget.loading) loader(),
              ],
            ),
          ),
        )
      : MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Scaffold(
                appBar: widget.appBar,
                backgroundColor: widget.backgroundColor,
                extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
                body: Stack(
                  children: [
                    if (widget.isUsingGradient)
                      Container(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          getSourceByPng('header_gradient'),
                        ),
                      ),
                    widget.child,
                    if (widget.extra != null) widget.extra!,
                    Align(child: widget.bottomSheet ?? const SizedBox(), alignment: Alignment.bottomCenter),
                  ],
                  fit: StackFit.expand,
                ),
                bottomNavigationBar: widget.bottomNavigationBar,
                floatingActionButton: widget.floatingActionButton,
              ),
              if (widget.loading) loader(),
            ],
          ),
        );
}

class GenericButton extends StatelessWidget {
  final VoidCallback ontap;
  final bool disable;
  final String text;
  final Color color;
  const GenericButton(this.text, {super.key, required this.ontap, this.disable = false, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: !disable ? ontap : null,
      child: Ink(
        decoration: BoxDecoration(color: !disable ? color : BaseColor.colorGrey, borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: !disable
              ? Text16WhiteBold(
                  text,
                  alignment: TextAlign.center,
                )
              : Text16GreyInactiveBold(
                  text,
                  alignment: TextAlign.center,
                ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback ontap;
  final bool disable;
  final Color? color;
  final Widget? child;
  final double radius;
  const CustomButton({super.key, required this.ontap, this.disable = false, this.color, this.child, this.radius = 12.0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: !disable ? ontap : null,
      child: Ink(
        decoration: BoxDecoration(color: !disable ? (color == null ? BaseColor.colorBlueFacebook : color) : BaseColor.colorGrey, borderRadius: BorderRadius.circular(8)),
        child: child,
      ),
    );
  }
}

class BackAppBar extends AppBar {
  BackAppBar(
    BuildContext ctx,
    String text, {
    Key? key,
    List<Widget> actions = const [],
    PreferredSizeWidget? bottom,
    bool forceBack = false,
    bool center = false,
    double? elevation,
    Color? backgroundColor,
  }) : super(
          key: key,
          actions: actions,
          bottom: bottom,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
          centerTitle: center,
          leading: (ModalRoute.of(ctx)?.canPop ?? false) || forceBack ? const AutoLeadingButton(color: Colors.black) : null,
          title: Text18BlackBold(text),
          elevation: elevation,
          backgroundColor: backgroundColor,
        );
}

class Spinner<T> extends StatelessWidget {
  final bool autofocus;

  final bool dense;

  final String? helperText;

  final String? hintText;

  final List<DropdownMenuItem<T>> items;

  final String? label;

  final ValueChanged<T?>? onChanged;

  final FormFieldSetter<T>? onSaved;

  final FormFieldValidator<T>? validator;

  final T? value;

  final bool isExpanded;

  const Spinner({
    Key? key,
    this.autofocus = false,
    this.dense = false,
    this.helperText,
    this.hintText,
    this.items = const [],
    this.label,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.value,
    this.isExpanded = true,
  }) : super(key: key);

  @override
  Widget build(ctx) => DropdownButtonFormField(
        autofocus: autofocus,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: dense ? const EdgeInsets.fromLTRB(12, 9, 12, 10) : null,
          helperMaxLines: 3,
          helperText: helperText,
          hintText: hintText,
          isDense: dense,
          filled: true,
        ),
        items: items,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        value: value,
        isExpanded: isExpanded,
      );
}
