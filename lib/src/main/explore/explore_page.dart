import 'dart:math' as math;

import 'package:fl_video/fl_video.dart';
import 'package:flutter/material.dart';
import 'package:penta/penta.dart';
import 'package:video_player/video_player.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _selectedIndex = 1;

  late FlVideoPlayerController controller;

  late VideoPlayerController videoPlayerController1 =
      VideoPlayerController.network(
          'ws://10.10.10.40:8000/live/livestreamteste.flv');

  bool isLoading = false;

  @override
  void initState() {

    controller = FlVideoPlayerController(
      videoPlayerController: videoPlayerController1,
      controls: CupertinoControls(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        backgroundColor: background,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken_outlined), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
        ],
      ),
      body: [
        Container(),
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                appbar(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.5, left: 23.0, right: 23.0, bottom: 10.0),
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 3,
                        child: PentaTitle(
                          label:
                              'Find the best eSports lives, tips and highlights!',
                          size: 24.0,
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 8.5, left: 23.0, right: 23.0, bottom: 24.0),
                  child: PentaInput(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.5, left: 23.0, right: 0.0, bottom: 24.0),
                  child: PentaListStories(stories: STORIES_MOCK),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.5, left: 23.0, right: 23.0, bottom: 24.0),
                  child: Row(
                    children: const [
                      PentaTitle(
                        label: 'Popular streamers',
                        size: 24,
                      ),
                      Divider(
                        height: 1,
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Row(
                            children: [
                              PentaLiveCard(
                                onTap: () async {
                                  isLoading = true;
                                  setState(() {});
                                  showModalBottomSheet(
                                        enableDrag: true,
                                        isScrollControlled: true,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (c) {
                                          return modalStream(controller);
                                        });
                                  if (controller!.videoPlayerController !=
                                      videoPlayerController1) {
                                    await controller!.dispose();
                                    initializePlayer(videoPlayerController1);
                                    setState(() {});

                                    
                                  }
                                  isLoading = false;
                                  setState(() {});
                                },
                                livestream: Container(),
                              ),
                              PentaLiveCard(
                                onTap: () async {
                                  if (controller!.videoPlayerController !=
                                      videoPlayerController1) {
                                    await controller!.dispose();
                                    initializePlayer(videoPlayerController1);
                                    setState(() {});

                                    showModalBottomSheet(
                                        enableDrag: true,
                                        isScrollControlled: true,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (c) {
                                          return modalStream(controller);
                                        });
                                  }
                                },
                                livestream: Container(),
                              ),
                              PentaLiveCard(
                                onTap: () async {
                                  if (controller!.videoPlayerController !=
                                      videoPlayerController1) {
                                    await controller!.dispose();
                                    initializePlayer(videoPlayerController1);
                                    setState(() {});

                                    showModalBottomSheet(
                                        enableDrag: true,
                                        isScrollControlled: true,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (c) {
                                          return modalStream(controller);
                                        });
                                  }
                                },
                                livestream: Container(),
                              ),
                              PentaLiveCard(
                                onTap: () async {
                                  if (controller.videoPlayerController !=
                                      videoPlayerController1) {
                                    await controller.dispose();
                                    initializePlayer(videoPlayerController1);
                                    setState(() {});
                                  }

                                   showModalBottomSheet(
                                        enableDrag: true,
                                        isScrollControlled: true,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (c) {
                                          return modalStream(controller);
                                        });
                                },
                                livestream: Container(),
                              ),
                            ],
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.5, left: 23.0, right: 23.0, bottom: 24.0),
                  child: Row(
                    children: const [
                      PentaTitle(
                        label: 'Games',
                        size: 24,
                      ),
                      Divider(
                        height: 1,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.5, left: 20.0, right: 23.0, bottom: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: PentaGameCard(),
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: PentaGameCard(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: PentaGameCard(),
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: PentaGameCard(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: PentaGameCard(),
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: PentaGameCard(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: PentaPrimaryButton(
                            onPressed: () {}, label: 'See more', reverse: true),
                      )
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       top: 8.5, left: 23.0, right: 23.0, bottom: 24.0),
                //   child: Row(
                //     children: const [
                //       PentaTitle(
                //         label: 'Sok likes these streamers',
                //         size: 24,
                //       ),
                //       Divider(
                //         height: 1,
                //       )
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 23.0),
                //   child: Column(
                //     children: List.generate(3, (index) => streamersLists()),
                //   ),
                // )
              ]),
            ),
          ],
        ),
        Container()
      ][_selectedIndex],
    );
  }

  Widget streamersLists() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
          color: neutralMedium,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 3)
          ]),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Image.asset('assets/img/stories/user1.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GenYasy1',
                        style: TextStyle(color: neutralLight, fontSize: 18),
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        'Valorant',
                        style: TextStyle(color: neutralLight, fontSize: 12),
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Container(
                        color: colorPrimary,
                        width: 5,
                        height: 5,
                      ),
                    ),
                  ),
                  Text(
                    '25.5k',
                    style: TextStyle(color: neutralLight, fontSize: 18),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appbar() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            'assets/img/efeito.png',
            width: 300,
            scale: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Image.asset('assets/img/logo.png'),
            actions: const [
              CircleAvatar(
                child: FlutterLogo(),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget modalStream(FlVideoPlayerController controller) {

    if(isLoading){
      return Center(child: CircularProgressIndicator(),);
    }

    return ListView(
      children: [
        SafeArea(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: FlVideoPlayer(controller: controller),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset('assets/img/stories/user1.png'),
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GenYasy1',
                              style:
                                  TextStyle(color: neutralLight, fontSize: 18),
                              overflow: TextOverflow.fade,
                            ),
                            Text(
                              'Valorant',
                              style:
                                  TextStyle(color: neutralLight, fontSize: 12),
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  PentaPrimaryButton(onPressed: () {}, label: 'Subscribe'),
                ],
              ),
              const SizedBox(height: 24),
              PentaTitle(
                label: 'Support CAN CARRY!',
                size: 30,
              ),
              Text(
                'Valorant',
                style: TextStyle(color: neutralLight, fontSize: 16),
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void initializePlayer(VideoPlayerController videoPlayerController) {
    controller = FlVideoPlayerController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        overlay: const Center(
            child: Text('overlay',
                style: TextStyle(color: Colors.lightBlue, fontSize: 20))),
        placeholder: const Center(
            child: Text('placeholder',
                style: TextStyle(color: Colors.red, fontSize: 20))),
        controls: videoPlayerController == videoPlayerController
            ? MaterialControls(
                hideDuration: const Duration(minutes: 30),
                enablePlay: true,
                enableFullscreen: true,
                enableSpeed: true,
                enableVolume: true,
                enableSubtitle: true,
                enablePosition: true,
                enableBottomBar: true,
                onTap: (FlVideoTapEvent event,
                    FlVideoPlayerController controller) {
                  debugPrint(event.toString());
                },
                onDragProgress:
                    (FlVideoDragProgressEvent event, Duration duration) {
                  debugPrint('$event===$duration');
                })
            : CupertinoControls(
                hideDuration: const Duration(minutes: 30),
                enableSpeed: true,
                enableSkip: true,
                enableSubtitle: true,
                enableFullscreen: true,
                enableVolume: true,
                enablePlay: true,
                enableBottomBar: true,
                onTap: (FlVideoTapEvent event,
                    FlVideoPlayerController controller) {
                  debugPrint(event.toString());
                },
                onDragProgress:
                    (FlVideoDragProgressEvent event, Duration duration) {
                  debugPrint('$event===$duration');
                },
                remainingBuilder: (String position) {
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 6, 6),
                      child: Text(position,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.red)));
                },
                positionBuilder: (String position) {
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(6, 6, 0, 6),
                      child: Text(position,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.lightBlue)));
                },
              ),
        subtitle: Subtitles([
          Subtitle(
              index: 0,
              start: Duration.zero,
              end: const Duration(seconds: 10),
              text: 'No.1 subtitle'),
          Subtitle(
              index: 0,
              start: const Duration(seconds: 10),
              end: const Duration(seconds: 20),
              text: 'No.2 subtitle)'),
        ]));
  }
}
