import 'package:flutter/material.dart';
import 'package:expn_app/src/config/const.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expn_app/src/expansion_widget/features_card.dart';

class ExpansionWidget extends StatefulWidget {
  const ExpansionWidget({Key? key}) : super(key: key);

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(commonMargin),
        child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14))),
            child: Column(
              children: [
                _expandableGetStarted(),
                _expandablePromoteBusiness(),
                _expandableFeatureExplained()
              ],
            )),
      ),
    );
  }

  Widget _expandableGetStarted() {
    return Card(
        child: ExpansionTile(
          title: const Text("Let's get you\nstarted...",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0)),
          subtitle: Text(_customTileExpanded ? 'Show less' : 'Show more',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 18)),
          trailing: SvgPicture.asset(
            'assets/icons/get_started.svg',
            height: 64,
          ),
          collapsedIconColor: Colors.transparent,
          iconColor: Colors.transparent,
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
          children: <Widget>[
            _buildExpandableWidget(expandableWidgetGetStartedFeatures),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () => {},
                        child: Text('Remove this',
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 18))))
              ],
            )
          ],
        ));
  }

  Widget _expandablePromoteBusiness() {
    return Card(
        color: congratsBgColor,
        child: ExpansionTile(
          title: const Text("Promote your\nbusiness...",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0)),
          trailing: SvgPicture.asset(
            'assets/icons/promote.svg',
            height: 64,
          ),
          collapsedIconColor: Colors.transparent,
          iconColor: Colors.transparent,
          initiallyExpanded: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () => {},
                      child: const Text('Simple do-it-yourself',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    )),
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () => {},
                      child: const Text('Remove this',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    )),
              ],
            )
          ],
        ));
  }

  Widget _expandableFeatureExplained() {
    return Card(
        child: ExpansionTile(
          title: const Text("Urordr features\nexplained...",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0)),
          trailing: SvgPicture.asset(
            'assets/icons/self_learning.svg',
            height: 64,
          ),
          collapsedIconColor: Colors.transparent,
          iconColor: Colors.transparent,
          initiallyExpanded: true,
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () => {},
                      child: Text('Watch now',
                          style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 18)),
                    )),
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () => {},
                      child: Text('Remove this',
                          style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 18)),
                    )),
              ],
            )
          ],
        ));
  }

  Widget _buildExpandableWidget(_features) {
    return GridView.count(
      shrinkWrap: true,
      childAspectRatio: 4 / 1,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(_features.length, (index) {
        return FeatureCard(
          widgetFeature: _features[index],
        );
      }),
      crossAxisCount: 1,
    );
  }
}
