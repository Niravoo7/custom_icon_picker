import 'dart:convert';

import 'package:custom_icon_picker/custom_icon_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericonpickerexample/customIconPack.dart';

void main() {
  runApp(FlutterIconPickerExample());
}

class FlutterIconPickerExample extends StatefulWidget {
  const FlutterIconPickerExample({
    Key key,
  }) : super(key: key);

  @override
  _FlutterIconPickerExampleState createState() =>
      _FlutterIconPickerExampleState();
}

class _FlutterIconPickerExampleState extends State<FlutterIconPickerExample> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(
        isDarkTheme: isDarkTheme,
        onThemeChanged: (bool val) => setState(() => isDarkTheme = val),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(brightness: Brightness.light),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
    this.isDarkTheme,
    this.onThemeChanged,
  }) : super(key: key);

  final bool isDarkTheme;
  final ValueChanged<bool> onThemeChanged;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IconModel icon;
  bool isAdaptive = true;
  bool showTooltips = false;
  bool showSearch = true;

  bool isOptionShow = false;

  pickIcon() async {
    icon = await FlutterIconPicker.showIconPicker(context,
        adaptiveDialog: isAdaptive,
        showTooltips: showTooltips,
        showSearchBar: showSearch,
        iconPickerShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        iconPackMode: IconPack.material,
        customIconPack: myCustomIcons);

    if (icon != null) {
      setState(() {});
      debugPrint(
          'Picked Icon:  ${icon.iconData.codePoint}  ${icon.iconData.fontFamily}  ${icon.iconData.fontPackage}  ${icon.iconData.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Icon Picker Demo'),
          actions: [
            IconButton(
              icon: widget.isDarkTheme
                  ? Transform.rotate(
                      angle: .55, child: Icon(Icons.brightness_3))
                  : Icon(Icons.brightness_7),
              onPressed: () => widget.onThemeChanged(!widget.isDarkTheme),
              tooltip: 'Switch brightness',
            ),
          ],
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            GestureDetector(
                                child: Container(
                                    height: 100,
                                    width: 150,
                                    color: Colors.grey,
                                    alignment: Alignment.center,
                                    child: (icon != null)
                                        ? Icon(icon.iconData, size: 80)
                                        : Text("Pic Icon",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18))),
                                onTap: () {
                                  if (icon == null) {
                                    pickIcon();
                                  } else {
                                    isOptionShow = !isOptionShow;
                                    setState(() {});
                                    /*showDialog(
                                    context: context,
                                    builder: (BuildContext ctx) {
                                      return Dialog(
                                          child: Container(
                                              padding: EdgeInsets.all(20),
                                              child: Wrap(children: [
                                                GestureDetector(
                                                  child: Container(
                                                    height: 50,
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.all(10),
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10)),
                                                    child: Text(
                                                      "Change Icon",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(ctx);
                                                    pickIcon();
                                                  },
                                                ),
                                                GestureDetector(
                                                  child: Container(
                                                    height: 50,
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.all(10),
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10)),
                                                    child: Text(
                                                      "Delete Icon",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(ctx);
                                                    icon = null;
                                                    setState(() {});
                                                  },
                                                ),
                                                GestureDetector(
                                                    child: Container(
                                                      height: 50,
                                                      alignment: Alignment.center,
                                                      margin: EdgeInsets.all(10),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10)),
                                                      child: Text(
                                                        "Cancle",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.pop(ctx);
                                                    })
                                              ])));
                                    });*/
                                  }
                                }),
                            (isOptionShow)
                                ? Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Text("Change Icon"),
                                          ),
                                          onTap: () {
                                            isOptionShow = false;
                                            pickIcon();
                                          },
                                        ),
                                        SizedBox(height: 5),
                                        GestureDetector(
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Text("Delete Icon"),
                                          ),
                                          onTap: () {
                                            icon = null;
                                            isOptionShow = false;
                                            setState(() {});
                                          },
                                        ),
                                        SizedBox(height: 5),
                                        GestureDetector(
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Text("Cancle"),
                                          ),
                                          onTap: () {
                                            isOptionShow = false;
                                            setState(() {});
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                        //"Picked Icon:  ${icon.codePoint}  ${icon.fontFamily}  ${icon.fontPackage}  ${icon.toString()}"
                        (icon != null)
                            ? Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  jsonEncode({
                                    'codePoint': '${icon.iconData.codePoint}',
                                    'fontFamily': '${icon.iconData.fontFamily}',
                                    'iconName': '${icon.iconName}'
                                  }).toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              )
                            : Container()
                      ]),
                  flex: 1,
                ),
                Container(
                    color: Colors.lightBlueAccent,
                    child: Column(children: [
                      SwitchListTile.adaptive(
                        title: Text('Show search-bar',
                            style: TextStyle(color: Colors.white)),
                        value: showSearch,
                        onChanged: (val) => setState(() => showSearch = val),
                      ),
                      SwitchListTile.adaptive(
                        title: Text('Show tooltips',
                            style: TextStyle(color: Colors.white)),
                        value: showTooltips,
                        onChanged: (val) => setState(() => showTooltips = val),
                      ),
                      SwitchListTile.adaptive(
                        title: Text('Adaptive dialog',
                            style: TextStyle(color: Colors.white)),
                        value: isAdaptive,
                        onChanged: (val) => setState(() => isAdaptive = val),
                      )
                    ]))
              ]),
        ));
  }
}
