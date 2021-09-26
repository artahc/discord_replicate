import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class CountryCodeSearchPanel extends StatefulWidget {
  final TextEditingController countryCodeSearchCtrl;

  const CountryCodeSearchPanel({Key? key, required this.countryCodeSearchCtrl}) : super(key: key);

  @override
  State<CountryCodeSearchPanel> createState() => _CountryCodeSearchPanelState();
}

class _CountryCodeSearchPanelState extends State<CountryCodeSearchPanel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: [
          AppInputField(
            controller: widget.countryCodeSearchCtrl,
            hintText: "Search",
            prefixIcon: Container(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: ImageIcon(
                AssetImage(AppIcon.search_icon),
                size: 15,
                color: IconTheme.of(context).color,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 10),
              itemBuilder: (_, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Country"),
                      Text("+0$index"),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, index) => SizedBox(
                height: 1,
              ),
              itemCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}