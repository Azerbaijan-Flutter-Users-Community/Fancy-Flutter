import 'package:flutter/material.dart';

class LengthIndicator extends LeafRenderObjectWidget {
  final String label;
  final String leadingLabel;
  final String trailingLabel;
  final Color barColor;
  final Color activeBarColor;
  final double height;
  final double percentage;
  final double thumbRadius;
  final Color thumbColor;

  LengthIndicator({
    required this.label,
    required this.leadingLabel,
    required this.trailingLabel,
    this.barColor = Colors.grey,
    this.activeBarColor = Colors.lightBlueAccent,
    this.height = 50,
    this.percentage = 0.0,
    this.thumbRadius = 20,
    this.thumbColor = Colors.blue,
  })  : assert(percentage <= 100),
        assert(thumbRadius <= height);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderLengthIndicator(
      label: label,
      leadingLabel: leadingLabel,
      trailingLabel: trailingLabel,
      barColor: barColor,
      activeBarColor: activeBarColor,
      barHeight: height,
      percentage: percentage,
      thumbRadius: thumbRadius,
      thumbColor: thumbColor,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context,
      _RenderLengthIndicator renderObject,
      ) {
    renderObject
      ..label = label
      ..leadingLabel = leadingLabel
      ..trailingLabel = trailingLabel
      ..barColor = barColor
      ..activeBarColor = activeBarColor
      ..barHeight = height
      ..percentage = percentage
      ..thumbRadius = thumbRadius
      ..thumbColor = thumbColor;
  }
}

class _RenderLengthIndicator extends RenderBox {
  _RenderLengthIndicator({
    required String label,
    required String leadingLabel,
    required String trailingLabel,
    required Color barColor,
    required Color activeBarColor,
    required double barHeight,
    required double percentage,
    required double thumbRadius,
    required Color thumbColor,
  })   : _label = label,
        _leadingLabel = leadingLabel,
        _trailingLabel = trailingLabel,
        _barColor = barColor,
        _activeBarColor = activeBarColor,
        _barHeight = barHeight,
        _percentage = percentage,
        _thumbRadius = thumbRadius,
        _thumbColor = thumbColor;

  String _label;

  set label(String value) {
    if (_label == value) return;
    _label = value;
    markNeedsPaint();
  }

  String _leadingLabel;

  set leadingLabel(String value) {
    if (_leadingLabel == value) return;
    _leadingLabel = value;
    markNeedsPaint();
  }

  String _trailingLabel;

  set trailingLabel(String value) {
    if (_trailingLabel == value) return;
    _trailingLabel = value;
    markNeedsPaint();
  }

  Color _barColor;

  set barColor(Color value) {
    if (_barColor == value) return;
    _barColor = value;
    markNeedsPaint();
  }

  Color _activeBarColor;

  set activeBarColor(Color value) {
    if (_activeBarColor == value) return;
    _activeBarColor = value;
    markNeedsPaint();
  }

  double _barHeight;

  set barHeight(double value) {
    if (_barHeight == value) return;
    _barHeight = value;
    markNeedsPaint();
  }

  double _percentage;

  set percentage(double value) {
    if (_percentage == value) return;
    _percentage = value;
    markNeedsPaint();
  }

  double _thumbRadius;

  set thumbRadius(double value) {
    if (_thumbRadius == value) return;
    _thumbRadius = value;
    markNeedsPaint();
  }

  Color _thumbColor;

  set thumbColor(Color value) {
    if (_thumbColor == value) return;
    _thumbColor = value;
    markNeedsPaint();
  }

  @override
  bool get isRepaintBoundary => false;

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = _barHeight;
    final size = Size(width, height);
    return constraints.constrain(size);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    final barPaint = Paint()
      ..color = _barColor
      ..strokeWidth = _barHeight * 0.1;

    final barStartPoint = Offset(0, size.height / 2);
    final barEndPoint = Offset(size.width, size.height / 2);
    canvas.drawLine(barStartPoint, barEndPoint, barPaint);

    final activeBarPaint = Paint()
      ..color = _activeBarColor
      ..strokeWidth = _barHeight * 0.1;

    final activeEndDx = size.width * _percentage / 100;

    final activeBarStartPoint = Offset(0, size.height / 2);
    final activeBarEndPoint = Offset(activeEndDx, size.height / 2);
    canvas.drawLine(activeBarStartPoint, activeBarEndPoint, activeBarPaint);

    final thumbPaint = Paint()
      ..color = _thumbColor
      ..strokeWidth = _barHeight * 0.1;

    final thumbCenterOffset = Offset(activeEndDx, size.height / 2);
    canvas.drawCircle(thumbCenterOffset, _thumbRadius, thumbPaint);

    final thumbCenterPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = _barHeight * 0.1;

    final centerCircleOffset = Offset(activeEndDx, size.height / 2);
    canvas.drawCircle(centerCircleOffset, _thumbRadius * 0.5, thumbCenterPaint);

    final textStyle = TextStyle(color: Colors.black, fontSize: 18);

    final leadingTextSpan = TextSpan(text: _leadingLabel, style: textStyle);
    final trailingTextSpan = TextSpan(text: _trailingLabel, style: textStyle);
    final labelSpan = TextSpan(text: _label, style: textStyle);

    final leadingTextPainter = TextPainter(
      text: leadingTextSpan,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: size.width / 3);

    final trailingTextPainter = TextPainter(
      text: trailingTextSpan,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: size.width / 3);

    final labelTextPainter = TextPainter(
      text: labelSpan,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: size.width / 3);

    final textOffsetDy = size.height / 2 + _thumbRadius + 10;

    final leadingTextOffset = Offset(
      0.0 - leadingTextPainter.width / 2,
      textOffsetDy,
    );
    leadingTextPainter.paint(canvas, leadingTextOffset);

    final trailingTextOffset = Offset(
      size.width - trailingTextPainter.width / 2,
      textOffsetDy,
    );
    trailingTextPainter.paint(canvas, trailingTextOffset);

    final labelTextOffset = Offset(
      activeEndDx - labelTextPainter.width / 2,
      textOffsetDy,
    );
    labelTextPainter.paint(canvas, labelTextOffset);
    canvas.restore();
  }
}
