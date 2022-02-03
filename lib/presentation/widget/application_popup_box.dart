import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationPopupBox extends StatelessWidget {
  final SingleChildLayoutDelegate layout;
  final Animation animation;
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final bool border;
  final MainAxisAlignment actionAlignment;
  final EdgeInsets paddingHeader;
  final EdgeInsets paddingActions;

  const ApplicationPopupBox({
     Key? key,
    required this.layout,
    required this.animation,
    this.title,
    this.content,
    this.actions,
    this.border = true,
    this.actionAlignment = MainAxisAlignment.spaceBetween,
    this.paddingHeader = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 32,
    ),
    this.paddingActions = const EdgeInsets.only(bottom: 16, left: 16, right: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSingleChildLayout(
      delegate: layout,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: animation.value,
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IntrinsicWidth(
            child: Flex(
              direction: Axis.vertical,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: paddingHeader,
                      decoration: border
                          ? const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xffF2F2F2),
                                ),
                              ),
                            )
                          : null,
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          title ?? const SizedBox(),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffEFF0F5),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Color(0xff5E646A),
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: content ?? const SizedBox(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                Container(
                  padding: paddingActions,
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: actionAlignment,
                    children: actions ?? [],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
