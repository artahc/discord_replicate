import 'package:discord_replicate/data/model/channel_data.dart';
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
  ChannelData _getLastChannel() {
    return ChannelData.createDummy();
  }

  List<ChannelData> _getSuggestionChannels() {
    return List.generate(20, (index) => ChannelData.createDummy());
  }

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
                height: 75,
                margin: const EdgeInsets.only(top: 5),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  separatorBuilder: (_, __) {
                    return SizedBox(width: 10);
                  },
                  itemBuilder: (_, index) {
                    return Center(
                        child: CircleContainer(
                      color: Colors.white,
                      size: Size(45, 45),
                    ));
                  },
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.secondary,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
                          child: Text(
                            "LAST CHANNEL",
                            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                        ),
                        ChannelTile(data: _getLastChannel()),
                        Container(
                          margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Text(
                            "SUGGESTION",
                            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                        ),
                        Column(
                          children: _getSuggestionChannels().map((e) => ChannelTile(data: e)).toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChannelTile extends StatelessWidget {
  final ChannelData data;

  const ChannelTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Icon(
              Icons.grid_3x3_rounded,
              size: 25,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  Text(
                    data.channelName,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    data.channelName,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              data.serverName,
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
