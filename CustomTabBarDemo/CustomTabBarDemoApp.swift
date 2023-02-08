//
//  CustomTabBarDemoApp.swift
//  CustomTabBarDemo
//
//  Created by Joynal Abedin on 5/2/23.
//

import SwiftUI

@main
struct CustomTabBarDemoApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView(pages: .constant([TabBarPage(page: ContentView(), selectIcon: "select_conversation_image_icon", unselectIcon: "conversation_image_icon", tag: "Conversation", selectTextColor: .blue, unselectTextColor: Color(red: 99/255, green: 99/255, blue: 99/255).opacity(0.6)),
                                         TabBarPage(page: ContentView(), selectIcon: "select_camera_image_icon", unselectIcon: "camera_image_icon", tag: "Camera", selectTextColor: .blue, unselectTextColor: Color(red: 99/255, green: 99/255, blue: 99/255).opacity(0.6)),
                                         TabBarPage(page: ContentView(), selectIcon: "select_translate_image_icon", unselectIcon: "translate_image_icon", tag: "Translate", selectTextColor: .blue, unselectTextColor: Color(red: 99/255, green: 99/255, blue: 99/255).opacity(0.6)),
                                         TabBarPage(page: ContentView(), selectIcon: "select_document_image_icon", unselectIcon: "document_image_icon", tag: "Document", selectTextColor: .blue, unselectTextColor: Color(red: 99/255, green: 99/255, blue: 99/255).opacity(0.6)),
                                         TabBarPage(page: ContentView(), selectIcon: "select_settings_image_icon", unselectIcon: "settings_image_icon", tag: "Settings", selectTextColor: .blue, unselectTextColor: Color(red: 99/255, green: 99/255, blue: 99/255).opacity(0.6))]))
        }
    }
}
