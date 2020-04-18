import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/app/app_colors.dart';
import 'package:o4_navigation_and_animation/app/app_textstyles.dart';
import 'package:o4_navigation_and_animation/pages/home_orange.dart';

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
        backgroundColor: AppColors.darkThemeTealVariant,
        title: const Text(
          'Routes Examples Page One',
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.darkThemeTealPrimary,
        padding: EdgeInsets.symmetric(
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
                Navigator.of(context).push<void>(
                  MaterialPageRoute(
                    builder: (context) => const HomeOrange(),
                  ),
                );
              },
              color: AppColors.darkThemeWhiteText87pctOpacity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: AppColors.darkThemeBlackText60pctOpacity,
                  width: 3,
                ),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Material Page Route',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.bold24.copyWith(
                        color: AppColors.darkThemeBlackText60pctOpacity,
                        shadows: [
                          const Shadow(
                            color: AppColors.dropShadowColor,
                            offset: Offset(2, 2),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'onPressed: () {\n'
                      '  Navigator.of(context).push<void>(\n'
                      '    MaterialPageRoute(\n'
                      '      builder: (context) => const HomeOrange(),\n'
                      '    ),\n'
                      '  );\n'
                      '},',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.normal18.copyWith(
                        color: AppColors.darkThemeBlackText60pctOpacity,
                        shadows: [
                          const Shadow(
                            color: AppColors.dropShadowColor,
                            offset: Offset(2, 2),
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
              /// Danger! If you use popAndPushNamed here instead of
              /// pushNamed, it will pop this page off the stack before
              /// the next page is loaded. This will cause this page to
              /// not be in the stack when you try to go back (pop)
              /// from the next page and you'll end up at the
              /// Welcome page instead of coming back here.
              onPressed: () => Navigator.of(context).pushNamed(
                '/routes_two',
              ),
              color: AppColors.darkThemeWhiteText87pctOpacity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: AppColors.darkThemeBlackText60pctOpacity,
                  width: 3,
                ),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Named Route',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.bold24.copyWith(
                        color: AppColors.darkThemeBlackText60pctOpacity,
                        shadows: [
                          const Shadow(
                            color: AppColors.dropShadowColor,
                            offset: Offset(2, 2),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "onPressed: () => "
                        "\n  Navigator.of(context).pushNamed("
                        "\n  /routes_two,"
                      "\n),",
                      textAlign: TextAlign.left,
                      style: AppTextStyles.normal18.copyWith(
                        color: AppColors.darkThemeBlackText60pctOpacity,
                        shadows: [
                          const Shadow(
                            color: AppColors.dropShadowColor,
                            offset: Offset(2, 2),
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
                Navigator.of(context).pop();
              },
              color: AppColors.darkThemeWhiteText87pctOpacity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: AppColors.darkThemeBlackText60pctOpacity,
                  width: 3,
                ),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Material Page Pop (Back)',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.bold24.copyWith(
                        color: AppColors.darkThemeBlackText60pctOpacity,
                        shadows: [
                          const Shadow(
                            color: AppColors.dropShadowColor,
                            offset: Offset(2, 2),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'onPressed: () {\n'
                      '     Navigator.of(context).pop();\n'
                      '},',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.normal18.copyWith(
                        color: AppColors.darkThemeBlackText60pctOpacity,
                        shadows: [
                          const Shadow(
                            color: AppColors.dropShadowColor,
                            offset: Offset(2, 2),
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
    );
  }
}
