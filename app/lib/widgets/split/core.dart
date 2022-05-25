import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef ExpandCallback = void Function(bool expanded);
typedef SplitWindowBuilder = Widget Function(BuildContext context);

class SplitWindow extends StatelessWidget {
  final SplitWindowBuilder builder;
  final double maxSize;
  final double minSize;
  final double size;
  final bool border;

  const SplitWindow(
      {required this.builder,
      this.minSize = 0,
      this.maxSize = double.infinity,
      this.size = 0.5,
      this.border = true,
      super.key});

  @override
  Widget build(BuildContext context) => Container(
      decoration: border ? BoxDecoration(border: Border.all()) : null,
      child: builder(context));
}

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 750);

  CustomPageRoute({builder}) : super(builder: builder);
}

class SplitView extends StatefulWidget {
  final SplitWindow first;
  final SplitWindow second;
  final double ratio;
  final Icon icon;
  final Axis axis;

  const SplitView(
      {Key? key,
      required this.first,
      required this.second,
      this.ratio = 0.5,
      this.axis = Axis.horizontal,
      this.icon = const Icon(Icons.drag_handle)})
      : assert(ratio >= 0),
        assert(ratio <= 1),
        super(key: key);

  @override
  _SplitViewState createState() => _SplitViewState();
}

class _SplitViewState extends State<SplitView> {
  final _dividerWidth = 20.0;

  //from 0-1
  late double _ratio;
  late double _maxSize = 1;

  get _firstSize => _ratio * _maxSize;
  get _secondSize => (1 - _ratio) * _maxSize;

  @override
  void initState() {
    super.initState();
    _ratio = widget.ratio;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      assert(_ratio <= 1);
      assert(_ratio >= 0);
      var constraintsSize = widget.axis == Axis.horizontal
          ? constraints.maxWidth
          : constraints.maxHeight;
      if (widget.first.minSize > _firstSize ||
          widget.second.minSize > _secondSize ||
          widget.first.maxSize < _firstSize ||
          widget.second.maxSize < _secondSize) {
        _maxSize = constraintsSize - _dividerWidth;
        _ratio = widget.first.size / _maxSize;
        _ratio = (_maxSize - widget.second.size) / _maxSize;
      }
      if (_maxSize != constraintsSize) {
        _maxSize = constraintsSize - _dividerWidth;
      }
      var list = widget.axis == Axis.horizontal
          ? Row(
              children: _buildBody(constraints),
            )
          : Column(children: _buildBody(constraints));
      return SizedBox(
          width: widget.axis == Axis.horizontal ? constraints.maxWidth : null,
          height: widget.axis == Axis.horizontal ? null : constraints.maxHeight,
          child: list);
    });
  }

  _buildBody(BoxConstraints constraints) {
    return [
      Builder(
          builder: (context) => SizedBox(
              width: widget.axis == Axis.horizontal ? _firstSize : null,
              height: widget.axis == Axis.horizontal ? null : _firstSize,
              child: SizedBox.expand(child: widget.first))),
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: SizedBox(
            width: widget.axis == Axis.horizontal
                ? _dividerWidth
                : constraints.maxWidth,
            height: widget.axis == Axis.horizontal
                ? constraints.maxHeight
                : _dividerWidth,
            child: RotationTransition(
                turns: AlwaysStoppedAnimation(
                    widget.axis == Axis.horizontal ? 0.25 : 0),
                child: widget.icon)),
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            var last = _ratio;
            _ratio += (widget.axis == Axis.horizontal
                    ? details.delta.dx
                    : details.delta.dy) /
                _maxSize;
            if (widget.first.minSize > _firstSize ||
                widget.second.minSize > _secondSize ||
                widget.first.maxSize < _firstSize ||
                widget.second.maxSize < _secondSize) _ratio = last;
            if (_ratio > 1) {
              _ratio = 1;
            } else if (_ratio < 0.0) {
              _ratio = 0.0;
            }
          });
        },
      ),
      Builder(
          builder: (context) => SizedBox(
              width: widget.axis == Axis.horizontal ? _secondSize : null,
              height: widget.axis == Axis.horizontal ? null : _secondSize,
              child: SizedBox.expand(child: widget.second)))
    ];
  }
}
