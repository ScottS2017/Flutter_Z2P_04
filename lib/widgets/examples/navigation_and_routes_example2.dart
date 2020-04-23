import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/app/app_colors.dart';
import 'package:o4_navigation_and_animation/app/app_textstyles.dart';
import 'package:o4_navigation_and_animation/pages/home_teal.dart';

class NavigationAndRoutesPage2 extends StatefulWidget {
  const NavigationAndRoutesPage2({
    Key key,
  }) : super(key: key);

  @override
  _NavigationAndRoutesPage2State createState() => _NavigationAndRoutesPage2State();
}

class _NavigationAndRoutesPage2State extends State<NavigationAndRoutesPage2> {
  final Widget divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx = const SizedBox(
    height: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkThemeOrangeVariant,
        title: const FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Routes Examples Page Two',
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.darkThemeOrangePrimary,
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: MediaQuery.of(context).size.width * .05,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50.0,
              ),

              /// Material Page Route Button ***********************
              RaisedButton(
                onPressed: () {

                  /// There is more than one syntax that will work with a
                  /// MaterialPageRoute, but the one we want to use is the
                  /// one that is going to specifically check the current
                  /// context.
                  ///
                  /// *** Mnemonic Devices and Concepts ***
                  ///
                  /// - Use a Navigator, since we're Navigating
                  ///
                  /// - What are we Navigating? The current situation, or
                  ///       context. So it's a Navigator OF our context.
                  ///
                  /// - When we Navigate we keep a stack of past pages.
                  ///      New pages go on top of the stack so that when
                  ///      we go back, we take the most recent one off
                  ///      of the stack. This is how a back button works.
                  ///
                  /// - Are we going somewhere new (pushing a new
                  ///      Route onto the stack) or are we going back (popping
                  ///      the most recent Route off the stack)?
                  ///
                  /// - Here, we're going somewhere new so we're going to
                  ///       push.
                  ///
                  /// - HOT TIP: The push is not something that happens
                  ///      instantly, it's what we call a Future (sometimes
                  ///      called a promise elsewhere). This means it needs
                  ///      to say what type of thing is going to be returned
                  ///      in the Future. That's what the < > is for. However,
                  ///      this time we aren't going to return anything, so
                  ///      we just say "void" (we have to say something).
                  ///
                  /// - The most common way to route to a new page is by
                  ///       using a MaterialPageRoute. It has to build the page,
                  ///       but under what conditions is it going to build this
                  ///       page? We'll find the current conditions, you guessed
                  ///       it, in the context.
                  ///
                  /// - The builder is going to go build something and then
                  ///       bring it back to us, so it returns something ( here
                  ///       we're using a lambda => for this). What it will
                  ///       return is **the constructor** for whatever page we
                  ///       want to go to.
                  ///
                  /// - The constructor is a constant constructor, so use const
                  ///       when calling it.
                  ///
                  /// So, in English:
                  ///       _ We're going to use a Navigator to navigate
                  ///       within the current context (Navigator OF).
                  ///       - We're going to a new page, so we push it
                  ///       onto the stack.
                  ///       - We're not returning anything (void).
                  ///       - To go anywhere in real life we need a route to
                  ///       get there and this is no different, so we're using
                  ///       a MaterialPageRoute, to route through the current
                  ///       context.
                  ///       - Before we can go to the new page we need to build
                  ///       it.
                  ///       - Under what conditions do we build? The context
                  ///       - We need to tell the builder what page to bring
                  ///       back to us, and call the constructor so the builder
                  ///       can construct it.
                  Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (context) => const HomeTeal(),
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
                          '      builder: (context) => const HomeTeal(),\n'
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

                /// Named routes are similar to MaterialPageRoutes
                /// but the main difference is in where they get
                /// the name of the page to build. There is a Map
                /// (dictionary) of route names in the MaterialApp
                /// Widget (here it's in the main.dart file).
                ///
                /// The pushNamed technique of routing will take
                /// whatever string you give it here and go look
                /// up which constructor it needs to call from the
                /// routes Map in the MaterialAppWidget.
                ///
                /// Why do this? Imagine if you had an app with
                /// 50 screens, each one is a route. Now, you need
                /// to change something that will affect how 20 of
                /// them work. You could dig through all of these files
                /// to find every single time you created a route to
                /// the affected area, or you could just change one
                /// listing in a routes Map.
                ///
                /// HOT TIP: If your routes table is large, put it
                /// somewhere else and call it into the routes Map
                /// by name. IE instead of:
                ///
                ///           routes: {
                ///           '/': (context) => const Welcome(),
                ///           '/routes_one': (context) => const HomeTeal(),
                ///           '/routes_two': (context) => const HomeOrange(),
                ///           },
                ///
                /// Put your Map somewhere else and use:
                ///
                ///             routes: placeWhereMyMapIsStashed,
                ///
                ///
                /// Danger! If you use popAndPushNamed here instead of
                /// pushNamed, it will pop this page off the stack before
                /// the next page is loaded. This will cause this page to
                /// not be in the stack when you try to go back (pop)
                /// and you'll skip over this page, end up at the
                /// page before this one instead of coming back here.
                onPressed: () => Navigator.of(context).pushNamed(
                  '/routes_one',
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
                          "\n  /routes_one,"
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
                  ///
                  /// This is the easy one. Navigate the context and
                  /// pop the top page off the stack.
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
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}