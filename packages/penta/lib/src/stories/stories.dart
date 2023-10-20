import 'package:flutter/material.dart';
import 'package:penta/penta.dart';

class __PentaStories extends StatefulWidget {
  final PentaStoriesType story;
  const __PentaStories({super.key, required this.story});

  @override
  State<__PentaStories> createState() => _PentaStoriesState();
}

class _PentaStoriesState extends State<__PentaStories> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: widget.story.viewd ? neutralDark : colorPrimary,
        radius: 40,
        child: CircleAvatar(
          radius: 37,
          backgroundImage: widget.story.content,
        ),
      );
  }
}

class PentaListStories extends StatefulWidget {
  final List<PentaStoriesType> stories;
  const PentaListStories({super.key, required this.stories});

  @override
  State<PentaListStories> createState() => _PentaListStoriesState();
}

class _PentaListStoriesState extends State<PentaListStories> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.stories.sort((a, b) => a.viewd == b.viewd
        ? 0
        : a.viewd
            ? 1
            : -1);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.stories
            .map((story) => __PentaStories(story: story))
            .toList(),
      ),
    );
  }
}

class PentaStoriesType {
  final String user;
  final ImageProvider content;
  bool viewd = false;
  PentaStoriesType(this.user, this.content, this.viewd);
}

final List<PentaStoriesType> STORIES_MOCK = [
  PentaStoriesType('Jonas', AssetImage('assets/img/stories/user1.png'), false),
  PentaStoriesType('Marcelo', AssetImage('assets/img/stories/user1.png'), true),
  PentaStoriesType('Jonas', AssetImage('assets/img/stories/user1.png'), true),
  PentaStoriesType('Jonas', AssetImage('assets/img/stories/user4.png'), true),
  PentaStoriesType('Jonas', AssetImage('assets/img/stories/user5.png'), true),
  PentaStoriesType('Jonas', AssetImage('assets/img/stories/user6.png'), true),
  PentaStoriesType('Jonas', AssetImage('assets/img/stories/user7.png'), true),
];
