import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

DemoPage {
    title: qsTr("Iconography")
    description: qsTr("Fluent icons used by RinUI components.")

    GridLayout {
        columns: 6
        columnSpacing: 12
        rowSpacing: 12
        Layout.fillWidth: true

        Repeater {
            model: [
                "ic_fluent_home_20_regular",
                "ic_fluent_settings_20_regular",
                "ic_fluent_search_20_regular",
                "ic_fluent_add_20_regular",
                "ic_fluent_delete_20_regular",
                "ic_fluent_checkmark_20_regular",
                "ic_fluent_dismiss_20_regular",
                "ic_fluent_info_20_regular",
                "ic_fluent_warning_20_regular",
                "ic_fluent_error_circle_20_regular",
                "ic_fluent_help_20_regular",
                "ic_fluent_star_20_regular",
                "ic_fluent_heart_20_regular",
                "ic_fluent_like_20_regular",
                "ic_fluent_dislike_20_regular",
                "ic_fluent_favorite_20_regular",
                "ic_fluent_tag_20_regular",
                "ic_fluent_clipboard_20_regular",
                "ic_fluent_copy_20_regular",
                "ic_fluent_paste_20_regular",
                "ic_fluent_cut_20_regular",
                "ic_fluent_edit_20_regular",
                "ic_fluent_save_20_regular",
                "ic_fluent_refresh_20_regular",
                "ic_fluent_download_20_regular",
                "ic_fluent_upload_20_regular",
                "ic_fluent_share_20_regular",
                "ic_fluent_link_20_regular",
                "ic_fluent_image_20_regular",
                "ic_fluent_video_20_regular",
                "ic_fluent_camera_20_regular",
                "ic_fluent_mic_20_regular",
                "ic_fluent_speaker_20_regular",
                "ic_fluent_pause_20_regular",
                "ic_fluent_play_20_regular",
                "ic_fluent_stop_20_regular",
                "ic_fluent_forward_20_regular",
                "ic_fluent_backward_20_regular",
                "ic_fluent_arrow_up_20_regular",
                "ic_fluent_arrow_down_20_regular",
                "ic_fluent_arrow_left_20_regular",
                "ic_fluent_arrow_right_20_regular",
                "ic_fluent_zoom_in_20_regular",
                "ic_fluent_zoom_out_20_regular",
                "ic_fluent_full_screen_20_regular",
                "ic_fluent_calendar_20_regular",
                "ic_fluent_clock_20_regular",
                "ic_fluent_mail_20_regular",
                "ic_fluent_chat_20_regular",
                "ic_fluent_phone_20_regular",
                "ic_fluent_person_20_regular",
                "ic_fluent_people_20_regular",
                "ic_fluent_group_20_regular",
                "ic_fluent_globe_20_regular",
                "ic_fluent_filter_20_regular",
                "ic_fluent_sort_20_regular",
                "ic_fluent_more_20_regular",
                "ic_fluent_menu_20_regular",
                "ic_fluent_keyboard_20_regular",
                "ic_fluent_view_20_regular",
                "ic_fluent_dashboard_20_regular"
            ]
            delegate: Rin.Frame {
                Layout.fillWidth: true
                Layout.preferredHeight: 72

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 12
                    spacing: 6

                    Rin.Icon {
                        Layout.alignment: Qt.AlignHCenter
                        size: 22
                        name: modelData
                    }
                    Text {
                        Layout.fillWidth: true
                        font.pixelSize: 10
                        horizontalAlignment: Text.AlignHCenter
                        text: modelData
                        elide: Text.ElideRight
                    }
                }
            }
        }
    }
}
