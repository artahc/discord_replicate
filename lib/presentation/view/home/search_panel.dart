import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SearchPanel extends StatefulWidget {
  final Widget? body;
  final PanelController? panelController;

  const SearchPanel({Key? key, this.body, this.panelController}) : super(key: key);

  @override
  _SearchPanelState createState() => _SearchPanelState();
}

class _SearchPanelState extends State<SearchPanel> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            children: [
              AppInputField(
                height: 50,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.only(right: 8, left: 8, top: 8),
                prefixIcon: Container(
                  height: 50,
                  width: 50,
                  child: IconButton(
                    color: Theme.of(context).iconTheme.color,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                hintText: "Where would you like to go?",
                suffixIcon: Container(
                  height: 50,
                  width: 50,
                  child: IconButton(
                    color: Theme.of(context).iconTheme.color,
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      print("Filter");
                    },
                  ),
                ),
              ),
              Container(
                height: 90,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  separatorBuilder: (_, __) {
                    return SizedBox(width: 10);
                  },
                  itemBuilder: (_, index) {
                    return Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 50,
                          width: 50,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
