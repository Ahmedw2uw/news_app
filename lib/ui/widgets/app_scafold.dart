import 'package:flutter/material.dart';
import 'package:news/ui/provider/theme_provider.dart';
import 'package:news/ui/utilites/app_asstes.dart';
import 'package:news/ui/utilites/app_colors.dart';
import 'package:news/ui/utilites/extentions/bild_context_extention.dart';
import 'package:provider/provider.dart';

class AppScafold extends StatefulWidget {
  final String appParTitle;
  final Widget body;
  const AppScafold({super.key, required this.appParTitle, required this.body});

  @override
  State<AppScafold> createState() => _AppScafoldState();
}

class _AppScafoldState extends State<AppScafold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Icon(
                Icons.menu,
                color:
                    Provider.of<ThemeProvider>(context).themeMode ==
                            ThemeMode.light
                        ? Colors.black
                        : Colors.white,
              ),
            );
          },
        ),
        title: Text(widget.appParTitle),
        actions: [
          Icon(
            Icons.search,
            color:
                Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
            //* this from the extention method
          ),
        ],
      ),
      drawer: bildDrawer(),
      body: widget.body,
    );
  }

  Widget bildDrawer() {
    return Container(
      color: AppColors.balck,
      width: context.width * 0.7,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.white),
            child: Center(
              child: Text(
                "News App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.balck,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      color:
                          Provider.of<ThemeProvider>(context).themeMode ==
                                  ThemeMode.light
                              ? Colors.white
                              : Colors.black,
                      child: ImageIcon(AssetImage(AppAsstes.homeIc)),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Go To Home",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.white, thickness: 1),

                Row(
                  children: [
                    Container(
                      color:
                          Provider.of<ThemeProvider>(context).themeMode ==
                                  ThemeMode.light
                              ? Colors.white
                              : Colors.black,
                      child: ImageIcon(AssetImage(AppAsstes.themeIc)),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Theme",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    Expanded(child: buildThemeDropDown(context)),
                  ],
                ),

                Divider(color: AppColors.white, thickness: 1),

                Row(
                  children: [
                    Container(
                      color:
                          Provider.of<ThemeProvider>(context).themeMode ==
                                  ThemeMode.light
                              ? Colors.white
                              : Colors.black,
                      child: ImageIcon(AssetImage(AppAsstes.languageIc)),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Language",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildThemeDropDown(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButton<ThemeMode>(
        value: context.themeProvider.themeMode,
        dropdownColor: AppColors.balck,
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down, color: AppColors.white),
        underline: SizedBox(),
        items: [
          DropdownMenuItem(
            value: ThemeMode.light,
            child: Text("light", style: TextStyle(color: AppColors.white)),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text("Dark", style: TextStyle(color: AppColors.white)),
          ),
        ],
        onChanged: (value) {
          if (value != null) {
            themeProvider.changeTheme(value);
          }
        },
      ),
    );
  }
}
