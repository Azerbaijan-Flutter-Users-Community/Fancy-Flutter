/*
 * Created on Sat Feb 20 2021
 *
 * BSD 3-Clause License
 *
 *Copyright (c) 2020, Kanan Yusubov
 *All rights reserved.
 *
 *Redistribution and use in source and binary forms, with or without
 *modification, are permitted provided that the following conditions are met:
 *
 *1. Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 *2. Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 *3. Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 *THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 *FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 *DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 *SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 *OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import 'package:flutter/material.dart';

part 'widgets/dotx_painter.dart';

class DotX extends StatefulWidget {
  DotX({
    Key key,
    this.dotWidget,
    this.color,
    this.pageController,
    this.space,
    @required this.pageCount,
    this.radius = 50,
  }) : super(key: key);

  /// default indicator of page
  final Widget dotWidget;

  /// selected page indicator color
  final Color color;

  /// should be provided due to normal work of [DotX]
  /// it will help swapping process of dots
  final PageController pageController;

  /// count of pages
  final int pageCount;

  /// space between dots
  final double space;

  ///  radius of each dot
  final double radius;

  @override
  _DotXState createState() => _DotXState();
}

class _DotXState extends State<DotX> {
  int _currentPage = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    widget.pageController.addListener(() {
      print('yay!');
      final page = widget.pageController.page.round();

      print('page: $page');

      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, widget.radius),
      painter: DotXPainter(
        context: context,
        pageController: widget.pageController,
        pageCount: widget.pageCount,
        space: widget.space,
      ),
    );
  }
}
