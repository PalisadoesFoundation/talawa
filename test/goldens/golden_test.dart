// ignore_for_file: talawa_api_doc
/// Aggregator that runs all golden tests in a single suite.
///
/// Execute with:
///   flutter test test/goldens/golden_test.dart
/// Regenerate baselines with:
///   flutter test test/goldens/golden_test.dart --update-goldens
library golden_test;

import 'add_members_bottom_sheet_golden_test.dart' as add_members_bottom_sheet;
import 'add_pledge_dialogue_box_golden_test.dart' as add_pledge_dialogue_box;
import 'agenda_item_tile_golden_test.dart' as agenda_item_tile;
import 'caption_text_widget_golden_test.dart' as caption_text_widget;
import 'comment_interactions_golden_test.dart' as comment_interactions;
import 'custom_alert_dialog_golden_test.dart' as custom_alert_dialog;
import 'custom_alert_dialog_with_checkbox_golden_test.dart'
    as custom_alert_dialog_with_checkbox;
import 'custom_avatar_golden_test.dart' as custom_avatar;
import 'custom_drawer_golden_test.dart' as custom_drawer;
import 'custom_list_tile_golden_test.dart' as custom_list_tile;
import 'recurring_event_helper_widgets_golden_test.dart'
    as recurring_event_helper_widgets;
import 'rich_text_golden_test.dart' as rich_text;
import 'signup_progress_indicator_golden_test.dart' as signup_progress_indicator;
import 'talawa_error_dialog_golden_test.dart' as talawa_error_dialog;
import 'talawa_error_snack_bar_golden_test.dart' as talawa_error_snack_bar;
import 'theme_switch_golden_test.dart' as theme_switch;
import 'update_pledge_dialogue_box_golden_test.dart' as update_pledge_dialogue_box;
import 'venue_card_golden_test.dart' as venue_card;
import 'venue_selector_golden_test.dart' as venue_selector;
import 'video_widget_golden_test.dart' as video_widget;

void main() {
  add_members_bottom_sheet.main();
  add_pledge_dialogue_box.main();
  agenda_item_tile.main();
  caption_text_widget.main();
  comment_interactions.main();
  custom_alert_dialog.main();
  custom_alert_dialog_with_checkbox.main();
  custom_avatar.main();
  custom_drawer.main();
  custom_list_tile.main();
  recurring_event_helper_widgets.main();
  rich_text.main();
  signup_progress_indicator.main();
  talawa_error_dialog.main();
  talawa_error_snack_bar.main();
  theme_switch.main();
  update_pledge_dialogue_box.main();
  venue_card.main();
  venue_selector.main();
  video_widget.main();
}
