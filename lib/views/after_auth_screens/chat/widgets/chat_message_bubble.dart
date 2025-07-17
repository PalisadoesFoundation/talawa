import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/size_config.dart';

/// Message returns a widget for chat message in the bubble form.
class Message extends StatelessWidget {
  const Message({super.key, required this.message});

  /// The chat message to be displayed in the bubble.
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final currentUserId = userConfig.currentUser.id;
    final isCurrentUser = message.creator?.id == currentUserId;

    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical! * 1,
        bottom: SizeConfig.safeBlockVertical! * 1,
        left: SizeConfig.safeBlockHorizontal! * 3,
        right: SizeConfig.safeBlockHorizontal! * 3,
      ),
      child: Row(
        mainAxisAlignment:
            isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isCurrentUser) ...[
            CircleAvatar(
              radius: 16,
              backgroundImage: message.creator?.image != null &&
                      message.creator!.image!.isNotEmpty
                  ? NetworkImage(message.creator!.image!)
                  : null,
              child: message.creator?.image == null ||
                      message.creator!.image!.isEmpty
                  ? Text(
                      message.creator?.firstName?.isNotEmpty == true
                          ? message.creator!.firstName![0].toUpperCase()
                          : '?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: isCurrentUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!isCurrentUser)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      message.creator?.firstName ?? 'Unknown',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal! * 3,
                    vertical: SizeConfig.blockSizeVertical! * 1.5,
                  ),
                  decoration: BoxDecoration(
                    color: isCurrentUser
                        ? Theme.of(context).primaryColor
                        : Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      topRight: const Radius.circular(12),
                      bottomLeft: isCurrentUser
                          ? const Radius.circular(12)
                          : const Radius.circular(4),
                      bottomRight: isCurrentUser
                          ? const Radius.circular(4)
                          : const Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    message.body ?? '',
                    style: TextStyle(
                      color: isCurrentUser ? Colors.white : Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
                if (message.createdAt != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      _formatTime(DateTime.parse(message.createdAt!)),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (isCurrentUser) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 16,
              backgroundImage: message.creator?.image != null &&
                      message.creator!.image!.isNotEmpty
                  ? NetworkImage(message.creator!.image!)
                  : null,
              child: message.creator?.image == null ||
                      message.creator!.image!.isEmpty
                  ? Text(
                      message.creator?.firstName?.isNotEmpty == true
                          ? message.creator!.firstName![0].toUpperCase()
                          : '?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    )
                  : null,
            ),
          ],
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${dateTime.day}/${dateTime.month}';
    } else if (difference.inHours > 0) {
      return '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'now';
    }
  }
}
