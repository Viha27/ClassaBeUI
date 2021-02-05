import 'package:best_flutter_ui_templates/design_course/design_course_app_theme.dart';
import 'package:best_flutter_ui_templates/design_course/models/category.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({Key key, this.callBack}) : super(key: key);

  final Function callBack;
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 4),
      child: Container(
        height: 134,
        width: double.infinity,
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: Category.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = Category.categoryList.length > 10
                      ? 10
                      : Category.categoryList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return CategoryView(
                    category: Category.categoryList[index],
                    animation: animation,
                    animationController: animationController,
                    callback: () {
                      widget.callBack();
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key key,
      this.category,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback callback;
  final Category category;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                callback();
              },
              child: SizedBox(
                width: 300.0,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 48,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: DesignCourseAppTheme.grey
                                          .withOpacity(0.5),
                                      offset: const Offset(1.3, 1.4),
                                      blurRadius: 10.0),
                                ],
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                              ),
                              child: Row(
                                children: <Widget>[
                                  const SizedBox(
                                    width: 7.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  color: Colors.black,
                                                  size: 25.0,
                                                ),
                                                Text(
                                                  category.title,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 17,
                                                    letterSpacing: 0.0,
                                                    color: DesignCourseAppTheme
                                                        .darkerText,
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                          color:
                                                              DesignCourseAppTheme
                                                                  .grey
                                                                  .withOpacity(
                                                                      0.5),
                                                          offset: const Offset(
                                                              1.3, 1.4),
                                                          blurRadius: 10.0),
                                                    ],
                                                    color: DesignCourseAppTheme
                                                        .nearlyWhite,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                8.0)),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Icon(
                                                      Icons
                                                          .chat_bubble_outline_rounded,
                                                      color:
                                                          DesignCourseAppTheme
                                                              .green,
                                                    ),
                                                    /* FavoriteButton(
                                                    isFavorite: true,
                                                    iconSize: 35.0,
                                                    valueChanged:
                                                        (_isFavorite) {
                                                      print(
                                                          'Is Favorite : $_isFavorite');
                                                    },
                                                  ), */
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                          color:
                                                              DesignCourseAppTheme
                                                                  .grey
                                                                  .withOpacity(
                                                                      0.5),
                                                          offset: const Offset(
                                                              1.3, 1.4),
                                                          blurRadius: 10.0),
                                                    ],
                                                    color: DesignCourseAppTheme
                                                        .nearlyWhite,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                8.0)),
                                                  ),
                                                  child:
                                                      /* Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                   /*  child: Icon( */
                                                      Icons.add,
                                                      color:
                                                          DesignCourseAppTheme
                                                              .nearlyWhite,
                                                    ), */
                                                      FavoriteButton(
                                                    isFavorite: true,
                                                    iconSize: 35.0,
                                                    valueChanged:
                                                        (_isFavorite) {
                                                      print(
                                                          'Is Favorite : $_isFavorite');
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Expanded(
                                            child: SizedBox(
                                              height: 25.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16, bottom: 8),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  SizedBox(width: 48.0),
                                                  Text(
                                                    '${category.description}',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      letterSpacing: 0.2,
                                                      color:
                                                          DesignCourseAppTheme
                                                              .grey,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                            color:
                                                                DesignCourseAppTheme
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5),
                                                            offset:
                                                                const Offset(
                                                                    1.3, 1.4),
                                                            blurRadius: 10.0),
                                                      ],
                                                      color:
                                                          DesignCourseAppTheme
                                                              .nearlyWhite,
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  8.0)),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              1.0),
                                                      child: Icon(
                                                        Icons.live_tv,
                                                        color:
                                                            DesignCourseAppTheme
                                                                .red,
                                                      ),
                                                      /* FavoriteButton(
                                                    isFavorite: true,
                                                    iconSize: 35.0,
                                                    valueChanged:
                                                        (_isFavorite) {
                                                      print(
                                                          'Is Favorite : $_isFavorite');
                                                    },
                                                  ), */
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8, right: 10),
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            DesignCourseAppTheme
                                                                .nearlyBlue,
                                                        size: 13,
                                                      ),
                                                      Text(
                                                        '${category.rating} (${category.reviews} reviews)',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 15,
                                                          letterSpacing: 0.27,
                                                          color:
                                                              DesignCourseAppTheme
                                                                  .grey,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      Text(
                                                        '\$${category.money}/Hour',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14,
                                                          letterSpacing: 0.27,
                                                          color:
                                                              DesignCourseAppTheme
                                                                  .green,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 24, bottom: 24, left: 16),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16.0)),
                              child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Image.asset(category.imagePath)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
