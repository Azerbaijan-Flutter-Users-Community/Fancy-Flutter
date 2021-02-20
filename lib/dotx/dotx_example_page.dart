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
import 'dotx.dart';

class DotXExamplePage extends StatefulWidget {
  DotXExamplePage({Key key}) : super(key: key);

  @override
  _DotXExamplePageState createState() => _DotXExamplePageState();
}

class _DotXExamplePageState extends State<DotXExamplePage> {
  final pageController = PageController(initialPage: 0, viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: PageView(
              controller: pageController,
              children: [
                Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Container(
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Container(
                  color: Colors.green,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ],
            ),
          ),
          Flexible(
            child: Center(
              child: DotX(
                pageController: pageController,
                radius: 10,
                pageCount: 3,
                space: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
