import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageTile extends StatelessWidget {
  final Message message;

  const MessageTile({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Theme.of(context).colorScheme.primary,
          onLongPress: () => print(message.contentHash),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleContainer(
                  color: message.status == "Sent" ? Colors.green : Colors.yellow,
                  size: const Size(40, 40),
                  child: null,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 10,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            FutureBuilder(
                              future: sl.get<UserRepository>().getUserById(message.senderRef),
                              builder: (_, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  final user = snapshot.data as User;
                                  return Text(user.name, style: Theme.of(context).textTheme.bodyText1);
                                }

                                return Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: const Color.fromARGB(255, 84, 79, 91),
                                  ),
                                );
                              },
                            ),
                            // Text(message.date.millisecondsSinceEpoch.toString()),
                            Text(DateFormat.yMMMd().add_jm().format(message.date),
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      color: Theme.of(context).colorScheme.onSecondary,
                                    )),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 2),
                          child: Builder(builder: (_) {
                            return Text(message.message, style: Theme.of(_).textTheme.bodyText2);
                          }),
                        ),
                      ],
                    ),
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

class SkeletonMessageTile extends StatelessWidget {
  const SkeletonMessageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleContainer(
            color: Color.fromARGB(255, 84, 79, 91),
            size: Size(45, 45),
            child: null,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color.fromARGB(255, 84, 79, 91),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromARGB(255, 84, 79, 91),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
