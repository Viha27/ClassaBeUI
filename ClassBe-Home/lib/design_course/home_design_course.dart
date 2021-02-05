import 'package:best_flutter_ui_templates/design_course/category_list_view.dart';
import 'package:best_flutter_ui_templates/design_course/course_info_screen.dart';
import 'package:best_flutter_ui_templates/design_course/popular_course_list_view.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';
import 'design_course_app_theme.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

class DesignCourseHomeScreen extends StatefulWidget {
  @override
  _DesignCourseHomeScreenState createState() => _DesignCourseHomeScreenState();
}

class _DesignCourseHomeScreenState extends State<DesignCourseHomeScreen> {
  CategoryType categoryType = CategoryType.coding;
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      getSearchBarUI(),
                      getCategoryUI("Popular Classes"),
                      /* Flexible(
                        child: /* getPopularCourseUI() */ getCategoryUI(),
                      ), */
                      getCategoryUI("New Classes"),
                      getCategoryUI("Online Classes"),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color:
                                    DesignCourseAppTheme.grey.withOpacity(0.05),
                                offset: const Offset(1.2, 1.1),
                                blurRadius: 0.0),
                          ],
                        ),
                        child: bottomnavbar(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomnavbar() {
    return FloatingNavbar(
      unselectedItemColor: Colors.blue,
      selectedItemColor: Colors.black,
      backgroundColor: Colors.white70,
      borderRadius: 79.0,
      selectedBackgroundColor: Colors.lightBlueAccent,
      onTap: (int val) => setState(() => _index = val),
      currentIndex: _index,
      items: [
        FloatingNavbarItem(icon: Icons.home, title: 'Home'),
        FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
        FloatingNavbarItem(icon: Icons.notifications, title: 'Notification'),
        FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
      ],
    );
  }

  Widget getCategoryUI(String Type) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2.0, left: 18, right: 16),
          /* child: Text(
            'Category',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ), */
        ),
        const SizedBox(
          height: 0.0,
        ),
        getPopularCourseUI(Type),
        const SizedBox(
          height: 2,
        ),
        CategoryListView(
          callBack: () {
            moveTo();
          },
        ),
      ],
    );
  }

  Widget getPopularCourseUI(String type) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  letterSpacing: 0.25,
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 15.0),
                child: Divider(
                  color: Colors.blue,
                  height: 50.0,
                ),
              )),
              getButtonUI(CategoryType.ui, categoryType == CategoryType.ui),
            ],
          ),
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseInfoScreen(),
      ),
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String txt = '';
    if (CategoryType.ui == categoryTypeData) {
      txt = 'Show All';
    } else if (CategoryType.coding == categoryTypeData) {
      txt = 'Coding';
    } else if (CategoryType.basic == categoryTypeData) {
      txt = 'Basic UI';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: DesignCourseAppTheme.grey.withOpacity(0.3),
                  offset: const Offset(1.3, 1.4),
                  blurRadius: 7.0),
            ],
            color: isSelected
                ? DesignCourseAppTheme.nearlyBlue
                : DesignCourseAppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(100.0)),
            border: Border.all(color: DesignCourseAppTheme.nearlyWhite)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(100.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 0, right: 0),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0,
                    color: isSelected
                        ? DesignCourseAppTheme.nearlyWhite
                        : DesignCourseAppTheme.nearlyBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 370,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color:
                                    DesignCourseAppTheme.grey.withOpacity(0.5),
                                offset: const Offset(1.3, 1.4),
                                blurRadius: 10.0),
                          ],
                          color: DesignCourseAppTheme.nearlyWhite,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(79.0)),
                        ),
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: DesignCourseAppTheme.nearlyBlue,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'What are you looking for?',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                      height: 60,
                      //  child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: DesignCourseAppTheme.grey.withOpacity(0.5),
                              offset: const Offset(1.3, 1.4),
                              blurRadius: 10.0),
                        ],
                        color: DesignCourseAppTheme.nearlyWhite,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(79.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Icon(
                          Icons.search,
                          color: DesignCourseAppTheme.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 17,
                      height: 60,
                      //  child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: DesignCourseAppTheme.grey.withOpacity(0.5),
                              offset: const Offset(1.3, 1.4),
                              blurRadius: 10.0),
                        ],
                        color: DesignCourseAppTheme.nearlyWhite,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(79.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Icon(
                          Icons.where_to_vote,
                          color: DesignCourseAppTheme.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 18, right: 18),
        child: Column(
          children: [
            Row(children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'ClassBe',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        letterSpacing: 0.1,
                        color: DesignCourseAppTheme.nearlyBlue,
                      ),
                    ),
                    Text(
                      'Online Clases',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 0.2,
                        color: DesignCourseAppTheme.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 60,
                  height: 60,
                  //child: Image.asset('assets/design_course/userImage.png'),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => print('hello'),
                    iconSize: 40.0,
                  )),
            ]),
            /*  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Classes",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    letterSpacing: 0.25,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 10.0, right: 15.0),
                  child: Divider(
                    color: Colors.blue,
                    height: 50.0,
                  ),
                )),
                getButtonUI(CategoryType.ui, categoryType == CategoryType.ui),
              ],
            ), */
          ],
        ));
  }
}

enum CategoryType {
  ui,
  coding,
  basic,
}
