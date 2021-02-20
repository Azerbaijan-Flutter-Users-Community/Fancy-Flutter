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

part of '../dotx.dart';

class DotXPainter extends CustomPainter {
  DotXPainter({
    @required this.context,
    @required this.pageController,
    @required this.pageCount,
    this.space = 10.0,
  })  : assert(context != null),
        assert(pageController != null),
        assert(pageCount != null);

  final BuildContext context;
  final PageController pageController;
  final int pageCount;
  final double space;

  @override
  void paint(Canvas canvas, Size size) {
    print('painting...');
    final paint = Paint()
      ..color = Theme.of(context).primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final radius = size.height;
    final availableSpace = size.width - 20;
    final occupiedSpace = radius * 2 * pageCount + space * (pageCount - 1);

    if (availableSpace >= occupiedSpace) {
      final startX = (availableSpace - occupiedSpace) / 2 + 10 + radius;

      int page = pageController.page.round();

      for (int i = 0; i < pageCount; i++) {
        final cx = startX + i * (space + radius * 2);

        print('painter page: $page');

        canvas.drawCircle(
          Offset(cx, size.height / 2),
          radius,
          paint
            ..color = Theme.of(context).primaryColor
            ..style = page == i ? PaintingStyle.fill : PaintingStyle.stroke,
        );
      }
    } else {
      throw Exception(
        'There is no available space to draw dots!'
        ' available space: $availableSpace, occupiedSpace: $occupiedSpace',
      );
    }
  }

  @override
  bool shouldRepaint(DotXPainter oldDelegate) => true;
}
