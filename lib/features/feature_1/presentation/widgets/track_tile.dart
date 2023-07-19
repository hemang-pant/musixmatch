import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/track.dart';

class TrackWidget extends StatelessWidget {
  final TrackEntity ? track;
  final bool ? isRemovable;
  final void Function(TrackEntity track) ? onRemove;
  final void Function(TrackEntity track) ? onTrackPressed;

  const TrackWidget({
    Key ? key,
    this.track,
    this.onTrackPressed,
    this.isRemovable = false,
    this.onRemove,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 7, top: 7),
          height: MediaQuery.of(context).size.width / 2.2,
          child: Row(
            children: [
              //_buildImage(context),
              _buildTitleAndDescription(),
              _buildRemovableArea(),
            ],
          ),
      ),
    );
  }



  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                track!.name?? '',
                maxLines : 3,
                overflow : TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Butler',
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),

              // Description
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      track!.artistName ?? '',
                      maxLines : 2,
                    ),
                ),
              ),

              // Datetime
              Row(
                children: [
                  const Icon(Icons.timeline_outlined, size: 16),
                    const SizedBox(width: 4),
                      Text(
                        track!.albumName ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                ],
              ),
            ],
          ),
      ),
    );
  }

  Widget _buildRemovableArea() {
    if (isRemovable!) {
      return GestureDetector(
        onTap: _onRemove,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.remove_circle_outline, color: Colors.red),
        ),
      );
    }
    return Container();
  }

  void _onTap() {
    if (onTrackPressed != null) {
      onTrackPressed!(track!);
    }
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove!(track!);
    }
  }
}