import 'package:best_flutter_ui_templates/fitness_app/training/extended_review_view.dart';
import 'package:best_flutter_ui_templates/fitness_app/training/other_reivew_list_data.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OtherReviewListView extends StatefulWidget  {
  const OtherReviewListView(
      {Key? key,
        this.OtherReviewData,
        this.animationController,
        this.animation,
        this.callback})
      : super(key: key);

  final VoidCallback? callback;
  final OtherReviewListData? OtherReviewData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  _OtherReviewListViewState createState() => _OtherReviewListViewState();
}

class _OtherReviewListViewState extends State<OtherReviewListView>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - widget.animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: widget.callback,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 2,
                              child: Image.network(
                                widget.OtherReviewData!.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              color: HotelAppTheme.buildLightTheme()
                                  .backgroundColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, top: 8, bottom: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              widget.OtherReviewData!.titleTxt,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  widget.OtherReviewData!.subTxt,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey
                                                          .withOpacity(0.8)),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                // Icon(
                                                //   FontAwesomeIcons.locationDot,
                                                //   size: 12,
                                                //   color: HotelAppTheme
                                                //       .buildLightTheme()
                                                //       .primaryColor,
                                                // ),
                                                // Expanded(
                                                //   child: Text(
                                                //     '${OtherReviewData!.dist.toStringAsFixed(1)} km to city',
                                                //     overflow:
                                                //     TextOverflow.ellipsis,
                                                //     style: TextStyle(
                                                //         fontSize: 14,
                                                //         color: Colors.grey
                                                //             .withOpacity(0.8)),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 4),
                                              child: Column(
                                                children: <Widget>[
                                                  RatingBar(
                                                    initialRating:
                                                    widget.OtherReviewData!.rating,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemSize: 24,
                                                    ratingWidget: RatingWidget(
                                                      full: Icon(
                                                        Icons.star_rate_rounded,
                                                        color: HotelAppTheme
                                                            .buildLightTheme()
                                                            .primaryColor,
                                                      ),
                                                      half: Icon(
                                                        Icons.star_half_rounded,
                                                        color: HotelAppTheme
                                                            .buildLightTheme()
                                                            .primaryColor,
                                                      ),
                                                      empty: Icon(
                                                        Icons
                                                            .star_border_rounded,
                                                        color: HotelAppTheme
                                                            .buildLightTheme()
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    itemPadding:
                                                    EdgeInsets.zero,
                                                    onRatingUpdate: (rating) {
                                                      print(rating);
                                                    },
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width* 0.8,
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Flexible(
                                                            child: TextButton(
                                                              onPressed: (){
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => ExtendedReviewView(data: widget.OtherReviewData),
                                                                  ),
                                                                );
                                                              },
                                                              style: TextButton.styleFrom(
                                                                minimumSize: Size.zero, // Set this
                                                                padding: EdgeInsets.zero, // and this
                                                              ),
                                                              child: RichText(
                                                                overflow: TextOverflow.ellipsis,
                                                                maxLines: 3,
                                                                text: TextSpan(
                                                                  text:'${widget.OtherReviewData!.reviews }',
                                                                  style: TextStyle(
                                                                    color: Color(0xFF4E4E4E),
                                                                    fontSize: 12,
                                                                    fontFamily: 'Noto Sans KR',
                                                                    fontWeight: FontWeight.w400,
                                                                  ),
                                                                ),
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       right: 16, top: 8),
                                  //   child: Column(
                                  //     mainAxisAlignment:
                                  //     MainAxisAlignment.center,
                                  //     crossAxisAlignment:
                                  //     CrossAxisAlignment.end,
                                  //     children: <Widget>[
                                  //       Text(
                                  //         '\$${OtherReviewData!.perNight}',
                                  //         textAlign: TextAlign.left,
                                  //         style: TextStyle(
                                  //           fontWeight: FontWeight.w600,
                                  //           fontSize: 22,
                                  //         ),
                                  //       ),
                                  //       Text(
                                  //         '/per night',
                                  //         style: TextStyle(
                                  //             fontSize: 14,
                                  //             color:
                                  //             Colors.grey.withOpacity(0.8)),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(32.0),
                              ),
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: HotelAppTheme.buildLightTheme()
                                      .primaryColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
