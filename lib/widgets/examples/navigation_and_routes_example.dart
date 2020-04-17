import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/app/app_colors.dart';
import 'package:o4_navigation_and_animation/app/app_textstyles.dart';
import 'package:o4_navigation_and_animation/widgets/examples/navigation_and_routes_example2.dart';

class NavigationAndRoutes extends StatefulWidget {
  const NavigationAndRoutes({
    Key key,
  }) : super(key: key);

  @override
  _NavigationAndRoutesState createState() => _NavigationAndRoutesState();
}

class _NavigationAndRoutesState extends State<NavigationAndRoutes> {
  final Widget divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx = const SizedBox(
    height: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Button Examples',
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          margin: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: MediaQuery.of(context).size.width * .05,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50.0,
              ),

              /// Material Page Route Button ***********************
              RaisedButton(
                onPressed: () {
                  // ignore: strict_raw_type
                  Navigator.push<MaterialPageRoute>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationAndRoutesPage2(),
                    ),
                  );
                },
                color: AppColors.darkTheme2dpElevationOverlay,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Material Page Route',
                        style: AppTextStyles.bold18.copyWith(
                          color: AppColors.darkThemeWhite,
                          shadows: [
                            Shadow(
                              color: AppColors.dropShadowColor,
                              offset: const Offset(2, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'onPressed: () {\n'
                          '     Navigator.push(\n'
                          '          context,\n'
                          '          MaterialPageRoute(builder:\n'
                          '               (context) => SimpleMaterialPageRoute(),\n'
                          '          ),\n'
                          '     );\n'
                          '},',
                        style: AppTextStyles.normal14.copyWith(
                          color: AppColors.whiteTextColor,
                          shadows: [
                            Shadow(
                              color: AppColors.dropShadowColor,
                              offset: const Offset(2, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),

              /// Named Route Button ***********************
              RaisedButton(
                onPressed: () => Navigator.popAndPushNamed(
                  context,
                  '/backToBasics',
                ),
                color: AppColors.darkTheme2dpElevationOverlay,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Named Route',
                        style: AppTextStyles.bold18.copyWith(
                          color: AppColors.darkThemeWhite,
                          shadows: [
                            Shadow(
                              color: AppColors.dropShadowColor,
                              offset: const Offset(2, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "onPressed: () => "
                          "\n  Navigator.popAndPushNamed("
                          "\n  context,"
                          "\n  /backToBasics',"
                          "\n),",
                        style: AppTextStyles.normal14.copyWith(
                          color: AppColors.whiteTextColor,
                          shadows: [
                            Shadow(
                              color: AppColors.dropShadowColor,
                              offset: const Offset(2, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),

              /// Pop Button ***********************
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: AppColors.darkTheme2dpElevationOverlay,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Material Page Pop',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bold18.copyWith(
                          color: AppColors.darkThemeWhite,
                          shadows: [
                            Shadow(
                              color: AppColors.dropShadowColor,
                              offset: const Offset(2, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'onPressed: () {\n'
                          '     Navigator.pop(context);\n'
                          '},',
                        style: AppTextStyles.normal14.copyWith(
                          color: AppColors.whiteTextColor,
                          shadows: [
                            Shadow(
                              color: AppColors.dropShadowColor,
                              offset: const Offset(2, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String dropdownValue = 'DropdownMenuButton';
