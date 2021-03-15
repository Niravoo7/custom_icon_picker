import 'package:custom_icon_picker/IconPicker/Packs/Cupertino.dart';
import 'package:custom_icon_picker/IconPicker/Packs/FontAwesome.dart';
import 'package:custom_icon_picker/IconPicker/Packs/LineIcons.dart';
import 'package:custom_icon_picker/IconPicker/Packs/Material.dart';
import 'package:flutter/material.dart';
import 'FullScreenDialog.dart';
import 'AdaptiveDialog.dart';
import '../Helpers/ColorBrightness.dart';
import '../IconPicker/iconPicker.dart';
import '../IconPicker/searchBar.dart';
import '../Models/IconPack.dart';

class DefaultDialog extends StatefulWidget {
  DefaultDialog({
    Key? key,
    this.showSearchBar,
    this.routedView = false,
    this.adaptive = false,
    this.showTooltips,
    this.barrierDismissible,
    this.iconSize,
    this.iconColor,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.iconPickerShape,
    this.backgroundColor,
    this.constraints,
    this.title,
    this.closeChild,
    this.searchIcon,
    this.searchHintText,
    this.searchClearIcon,
    this.noResultsText,
    this.iconPackMode,
    this.customIconPack,
  }) : super(key: key);

  final bool? showSearchBar;
  final bool routedView;
  final bool adaptive;
  final bool? showTooltips;
  final bool? barrierDismissible;
  final double? iconSize;
  final Color? iconColor;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final ShapeBorder? iconPickerShape;
  final Color? backgroundColor;
  final BoxConstraints? constraints;
  final Widget? title;
  final Widget? closeChild;
  final Icon? searchIcon;
  final String? searchHintText;
  final Icon? searchClearIcon;
  final String? noResultsText;
  final IconPack? iconPackMode;
  final Map<String, IconData>? customIconPack;

  @override
  _DefaultDialogState createState() => _DefaultDialogState();
}

class _DefaultDialogState extends State<DefaultDialog> {
  @override
  Widget build(BuildContext context) {
    if (widget.adaptive) {
      if (widget.routedView) {
        print("DefaultDialog -> 1");
        return FullScreenDialog(
          showSearchBar: widget.showSearchBar,
          showTooltips: widget.showTooltips,
          backgroundColor: widget.backgroundColor,
          title: Row(
            children: [
              widget.title!,
              PopupMenuButton(
                  onSelected: (selectedValue) {
                    print(selectedValue);
                    switch (selectedValue) {
                      case "material":
                        IconPicker.iconMap = icons;
                        break;
                      case "cupertino":
                        IconPicker.iconMap = cupertinoIcons;
                        break;
                      case "fontAwesomeIcons":
                        IconPicker.iconMap = fontAwesomeIcons;
                        break;
                      case "lineAwesomeIcons":
                        IconPicker.iconMap = lineAwesomeIcons;
                        break;
                      default:
                        IconPicker.iconMap = widget.customIconPack;
                        break;
                    }
                    setState(() {});
                  },
                  itemBuilder: (BuildContext ctx) => [
                        PopupMenuItem(
                            child: Text('material'), value: 'material'),
                        PopupMenuItem(
                            child: Text('cupertino'), value: 'cupertino'),
                        PopupMenuItem(
                            child: Text('fontAwesomeIcons'),
                            value: 'fontAwesomeIcons'),
                        PopupMenuItem(
                            child: Text('lineAwesomeIcons'),
                            value: 'lineAwesomeIcons'),
                        PopupMenuItem(child: Text('custom'), value: 'custom'),
                      ]),
            ],
          ),
          /*DropdownButton<IconPack>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (IconPack? newValue) {
                  switch (newValue) {
                    case IconPack.material:
                      IconPicker.iconMap = icons;
                      break;
                    case IconPack.cupertino:
                      IconPicker.iconMap = cupertinoIcons;
                      break;
                    case IconPack.fontAwesomeIcons:
                      IconPicker.iconMap = fontAwesomeIcons;
                      break;
                    case IconPack.lineAwesomeIcons:
                      IconPicker.iconMap = lineAwesomeIcons;
                      break;
                    default:
                      IconPicker.iconMap = widget.customIconPack;
                      break;
                  }
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <IconPack>[
                  IconPack.material,
                  IconPack.cupertino,
                  IconPack.fontAwesomeIcons,
                  IconPack.lineAwesomeIcons,
                  IconPack.custom
                ].map<DropdownMenuItem<IconPack>>((IconPack value) {
                  return DropdownMenuItem<IconPack>(
                    value: value,
                    child: Text(value.toString().replaceAll("IconPack.", "")),
                  );
                }).toList(),
              ),*/
          iconPackMode: widget.iconPackMode,
          customIconPack: widget.customIconPack,
          searchIcon: widget.searchIcon,
          searchClearIcon: widget.searchClearIcon,
          searchHintText: widget.searchHintText,
          iconColor: widget.iconColor,
          noResultsText: widget.noResultsText,
          iconSize: widget.iconSize,
          mainAxisSpacing: widget.mainAxisSpacing,
          crossAxisSpacing: widget.crossAxisSpacing,
        );
      }
      print("DefaultDialog -> 2");
      return AdaptiveDialog(
        constraints: widget.constraints,
        shape: widget.iconPickerShape,
        child: Scaffold(
          backgroundColor: widget.backgroundColor,
          body: Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: kToolbarHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: DefaultTextStyle(
                          child: Row(
                            children: [
                              widget.title!,
                              PopupMenuButton(
                                  onSelected: (selectedValue) {
                                    print(selectedValue);
                                    switch (selectedValue) {
                                      case "material":
                                        IconPicker.iconMap = icons;
                                        break;
                                      case "cupertino":
                                        IconPicker.iconMap = cupertinoIcons;
                                        break;
                                      case "fontAwesomeIcons":
                                        IconPicker.iconMap = fontAwesomeIcons;
                                        break;
                                      case "lineAwesomeIcons":
                                        IconPicker.iconMap = lineAwesomeIcons;
                                        break;
                                      default:
                                        IconPicker.iconMap = widget.customIconPack;
                                        break;
                                    }
                                    setState(() {});
                                  },
                                  itemBuilder: (BuildContext ctx) => [
                                        PopupMenuItem(
                                            child: Text('material'),
                                            value: 'material'),
                                        PopupMenuItem(
                                            child: Text('cupertino'),
                                            value: 'cupertino'),
                                        PopupMenuItem(
                                            child: Text('fontAwesomeIcons'),
                                            value: 'fontAwesomeIcons'),
                                        PopupMenuItem(
                                            child: Text('lineAwesomeIcons'),
                                            value: 'lineAwesomeIcons'),
                                        PopupMenuItem(
                                            child: Text('custom'),
                                            value: 'custom'),
                                      ]),
                            ],
                          ),
                          style: TextStyle(
                            color: ColorBrightness(widget.backgroundColor!)
                                    .isLight()
                                ? Colors.black
                                : Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color:
                              ColorBrightness(widget.backgroundColor!).isLight()
                                  ? Colors.black
                                  : Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                if (widget.showSearchBar!)
                  SearchBar(
                    iconPack: widget.iconPackMode,
                    customIconPack: widget.customIconPack,
                    searchIcon: widget.searchIcon,
                    searchClearIcon: widget.searchClearIcon,
                    searchHintText: widget.searchHintText,
                    backgroundColor: widget.backgroundColor,
                  ),
                Expanded(
                  child: IconPicker(
                    showTooltips: widget.showTooltips,
                    iconPack: widget.iconPackMode,
                    customIconPack: widget.customIconPack,
                    iconColor: widget.iconColor,
                    backgroundColor: widget.backgroundColor,
                    noResultsText: widget.noResultsText,
                    iconSize: widget.iconSize,
                    mainAxisSpacing: widget.mainAxisSpacing,
                    crossAxisSpacing: widget.crossAxisSpacing,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      print("DefaultDialog -> 3");
      return AlertDialog(
        backgroundColor: widget.backgroundColor,
        shape: widget.iconPickerShape,
        title: DefaultTextStyle(
          child: Row(
            children: [
              widget.title!,
              PopupMenuButton(
                  onSelected: (selectedValue) {
                    print(selectedValue);
                    switch (selectedValue) {
                      case "material":
                        IconPicker.iconMap = icons;
                        break;
                      case "cupertino":
                        IconPicker.iconMap = cupertinoIcons;
                        break;
                      case "fontAwesomeIcons":
                        IconPicker.iconMap = fontAwesomeIcons;
                        break;
                      case "lineAwesomeIcons":
                        IconPicker.iconMap = lineAwesomeIcons;
                        break;
                      default:
                        IconPicker.iconMap = widget.customIconPack;
                        break;
                    }
                    setState(() {});
                  },
                  itemBuilder: (BuildContext ctx) => [
                        PopupMenuItem(
                            child: Text('material'), value: 'material'),
                        PopupMenuItem(
                            child: Text('cupertino'), value: 'cupertino'),
                        PopupMenuItem(
                            child: Text('fontAwesomeIcons'),
                            value: 'fontAwesomeIcons'),
                        PopupMenuItem(
                            child: Text('lineAwesomeIcons'),
                            value: 'lineAwesomeIcons'),
                        PopupMenuItem(child: Text('custom'), value: 'custom'),
                      ]),
            ],
          ),
          style: TextStyle(
            color: ColorBrightness(widget.backgroundColor!).isLight()
                ? Colors.black
                : Colors.white,
            fontSize: 20,
          ),
        ),
        content: Container(
          constraints: widget.constraints,
          child: Column(
            children: <Widget>[
              if (widget.showSearchBar!)
                SearchBar(
                  iconPack: widget.iconPackMode,
                  customIconPack: widget.customIconPack,
                  searchIcon: widget.searchIcon,
                  searchClearIcon: widget.searchClearIcon,
                  searchHintText: widget.searchHintText,
                  backgroundColor: widget.backgroundColor,
                ),
              Expanded(
                child: IconPicker(
                  showTooltips: widget.showTooltips,
                  iconPack: widget.iconPackMode,
                  customIconPack: widget.customIconPack,
                  iconColor: widget.iconColor,
                  backgroundColor: widget.backgroundColor,
                  noResultsText: widget.noResultsText,
                  iconSize: widget.iconSize,
                  mainAxisSpacing: widget.mainAxisSpacing,
                  crossAxisSpacing: widget.crossAxisSpacing,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith(
                (states) => const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: widget.closeChild!,
          ),
        ],
      );
    }
  }
}
