import 'package:discord_ui_practice/bloc/server/server_bloc.dart';
import 'package:discord_ui_practice/model/server_data.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/server_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

class GroupableContainer extends StatefulWidget {
  final ServerItem initialServerItem;
  final Widget avatarWhenGroupPreview;

  const GroupableContainer({Key key, this.initialServerItem, this.avatarWhenGroupPreview}) : super(key: key);

  @override
  _GroupableContainerState createState() => _GroupableContainerState();
}

class _GroupableContainerState extends State<GroupableContainer> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<SingleServerData>(
      onWillAccept: (data) {
        return true;
      },
      onLeave: (data) {
      },
      builder: (context, candidateData, rejectedData) {
        bool showPreview = false;
        if (candidateData.isNotEmpty) {
          if (candidateData.first.id != widget.initialServerItem.data.id) {
            showPreview = true;
          }
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: const Color(0xff363940),
                borderRadius: BorderRadius.circular(showPreview ? 16 : 26),
              ),
            ),
            Builder(
              builder: (c) {
                if (showPreview) {
                  return Container(
                    height: 45,
                    width: 45,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(5),
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      children: [
                        widget.avatarWhenGroupPreview,
                        Container(
                          width: 45,
                          height: 45,
                          decoration:
                              BoxDecoration(color: const Color(0xff7289da), borderRadius: BorderRadius.circular(26)),
                        ),
                      ],
                    ),
                  );
                } else {
                  return widget.initialServerItem;
                }
              },
            )
          ],
        );
      },
    );
  }
}
