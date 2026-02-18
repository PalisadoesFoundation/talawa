import 'package:flutter/material.dart';
import 'package:talawa/plugin/types.dart';
import 'package:talawa/plugin/available/summarize_t5/widgets/summarize_button.dart';

/// SummarizeT5 Plugin for Talawa Mobile
/// 
/// Provides AI-powered text summarization for post captions using T5 model.
/// Injects a summarize button below post captions that generates and displays summaries.
class SummarizeT5Plugin implements TalawaMobilePlugin {
  @override
  PluginManifest get manifest => const PluginManifest(
    id: 'summarize_t5',
    name: 'SummarizeT5 AI Summarizer',
    description: 'AI-powered text summarization using T5 model',
  );

  @override
  List<PluginRoute> getRoutes() => [];

  @override
  List<PluginMenuItem> getMenuItems(BuildContext context) => [];

  @override
  PluginExtensions getExtensions() {
    return PluginExtensions(
      // g2 is for post content injectors
      g2: [
        PluginInjectorExtension(
          pluginId: manifest.id,
          name: 'Summarize Button',
          description: 'AI summarize button for post captions',
          order: 0,
          builder: (context, {data}) {
            // Extract caption and postId from data
            final caption = data?['caption'] as String? ?? '';
            final postId = data?['postId'] as String?;
            
            // Don't show button if no caption
            if (caption.trim().isEmpty) {
              return const SizedBox.shrink();
            }
            
            return SummarizeButton(
              caption: caption,
              postId: postId,
            );
          },
        ),
      ],
    );
  }
}
