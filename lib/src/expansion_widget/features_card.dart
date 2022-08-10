import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expn_app/src/expansion_widget/widget_data.dart';

class FeatureCard extends StatelessWidget {
  final ExpandableWidgetFeature widgetFeature;

  const FeatureCard({Key? key,required this.widgetFeature}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(children: [
            Flexible(
              fit: FlexFit.tight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SvgPicture.asset(widgetFeature.icon??''),
                  const SizedBox(width: 8.0),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0,0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widgetFeature.title??'',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                fontSize: 18, color: Colors.black),
                          ),
                          const SizedBox(height: 10),
                          Flexible(
                            child: Text(
                            widgetFeature.description??'',
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                fontSize: 18, color: Colors.grey.shade500),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
