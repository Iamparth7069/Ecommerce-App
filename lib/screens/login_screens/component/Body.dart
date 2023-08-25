import 'package:flutter/material.dart';
import 'package:shoppio_app/screens/login_screens/component/sign_in_forms.dart';

import 'fotter.dart';
import 'header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              reverse: true,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight:  constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        LayoutHeader(),
                        SizedBox(
                          height: 24,
                        ),
                        sign_in_forms(),
                        SizedBox(
                          height: 24,
                        ),
                        fotter(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ),
    );
  }
}
