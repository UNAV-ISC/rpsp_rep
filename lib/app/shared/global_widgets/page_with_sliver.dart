import 'package:flutter/material.dart';
import '../helpers/date_2_spanish_date.dart';

class PageWithSliver extends StatefulWidget {
  final String title;
  final String imagePath;
  final double height;
  final List<Widget> children;
  final Color titleColor;
  final Color dateColor;
  final double titleFontSize;
  final double dateFontSize;
  final bool isOpacityImage;
  const PageWithSliver({super.key, 
    required this.imagePath,
    this.height = 300,
    required this.children,
    required this.title,
    this.titleColor = Colors.white,
    this.dateColor = Colors.white,
    this.titleFontSize = 16.0,
    this.dateFontSize = 13.0,
    this.isOpacityImage = false,
  });

  @override
  _PageWithSliverState createState() => _PageWithSliverState();
}

class _PageWithSliverState extends State<PageWithSliver> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  bool get _isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  bool lastStatus = true;

  _scrollListener() {
    if (_isShrink != lastStatus) {
      lastStatus = _isShrink;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: false,
            elevation: 0,
            iconTheme:
                IconThemeData(color: _isShrink ? Colors.black : Colors.white),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: widget.height,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              titlePadding: const EdgeInsets.all(0),
              centerTitle: true,
              title: _title(),
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
              background: _image(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 6,
                      child: SingleChildScrollView(
                        child: _buildWidgtes(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWidgtes(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.children,
      ),
    );
  }

  Widget _image() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/${widget.imagePath}'),
          colorFilter: widget.isOpacityImage
              ? const ColorFilter.mode(Colors.black38, BlendMode.darken)
              : null,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _title() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: _isShrink ? Colors.black : widget.titleColor,
            fontSize: _isShrink ? 18 : widget.titleFontSize,
            fontWeight: FontWeight.w800,
          ),
          // maxLines: _isShrink ? 1 : 2,
          // overflow: TextOverflow.ellipsis,
        ),
        Text(
          today(),
          style: TextStyle(
              color: _isShrink ? Colors.black : widget.dateColor,
              fontSize: _isShrink ? 12 : widget.dateFontSize,
              fontWeight: FontWeight.w400),
          maxLines: _isShrink ? 1 : 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }
}
