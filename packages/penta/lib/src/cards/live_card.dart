import 'package:flutter/material.dart';
import 'package:penta/penta.dart';

class PentaLiveCard extends StatefulWidget {
  final Widget livestream;
  final Function() onTap;
  const PentaLiveCard({super.key, required this.livestream, required this.onTap});

  @override
  State<PentaLiveCard> createState() => _PentaLiveCardState();
}

class _PentaLiveCardState extends State<PentaLiveCard> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await widget.onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: const EdgeInsets.only(right: 16, bottom: 16.0),
        height: 200,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    image: AssetImage("assets/img/lol.png"),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ]),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: background,
                              border: Border.all(
                                  width:
                                      1, //                   <--- border width here
                                  color: neutralMedium),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.0),
                                  bottomLeft: Radius.circular(50.0)),
                            ),
                            padding: EdgeInsets.all(6.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  child: Image.asset(
                                      'assets/img/stories/user1.png'),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    'GenYasy1',
                                    style: TextStyle(color: neutralMedium),
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                                ClipOval(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    color: colorPrimary,
                                    width: 5,
                                    height: 5,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            child: Container(
                              height: 50,
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: background,
                                border: Border.all(
                                    width:
                                        1, //                   <--- border width here
                                    color: neutralMedium),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50.0),
                                    bottomRight: Radius.circular(50.0)),
                              ),
                              child: Center(
                                child: Text(
                                  'League of Legends Wild Rift',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: neutralMedium),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
