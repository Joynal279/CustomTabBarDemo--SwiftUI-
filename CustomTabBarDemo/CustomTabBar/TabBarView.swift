//
//  TabBarView.swift
//  Translate AI
//
//  Created by Joynal Abedin on 3/2/23.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selectedTab = "Translate"
    @Binding var pages: [TabBarPage]
    init(pages: Binding<[TabBarPage]>) {
        UITabBar.appearance().isHidden = true
        self._pages = pages
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedTab) {
                ForEach(pages) { item in
                    AnyView(_fromValue: item.page)
                    
                        .tabItem{
                            EmptyView()
                        }.tag(item.tag)
                }
            }
            
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 30)
                    .background(Color.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .foregroundColor(Color(UIColor.clear))
                    .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: -2)
                
                HStack {
                    ForEach(pages) { item in
                        Button(action: {
                            self.selectedTab = item.tag
                        }) {
                            VStack {
                                Image("\(self.selectedTab == item.tag ? item.selectIcon : item.unselectIcon)")
                                    .imageScale(.large)
                                    .padding(.bottom, 0)
                                //.background(self.selectedTab == item.tag ? Color.gray : item.color )
                                Text(item.tag)
                                    .lineLimit(1)
                                    .foregroundColor(self.selectedTab == item.tag ? item.selectTextColor : item.unselectTextColor)
                                    .font(.custom("Roboto-Medium", size: 11))
                                
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .padding(EdgeInsets(top: 11, leading: 20, bottom: 34, trailing: 20))
                .background(Color(red: 64/255, green: 156/255, blue: 255/255).opacity(0.04))
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .frame(height: 83)
            .frame(maxWidth: .infinity)
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(pages: .constant([TabBarPage(page: ContentView(), selectIcon: "select_conversation_image_icon", unselectIcon: "conversation_image_icon", tag: "Conversation", selectTextColor: .blue, unselectTextColor: Color(red: 99/255, green: 99/255, blue: 99/255).opacity(0.6)),
                                     TabBarPage(page: ContentView(), selectIcon: "select_camera_image_icon", unselectIcon: "camera_image_icon", tag: "Camera", selectTextColor: .blue, unselectTextColor: Color(red: 99/255, green: 99/255, blue: 99/255).opacity(0.6)),
                                     TabBarPage(page: ContentView(), selectIcon: "select_translate_image_icon", unselectIcon: "translate_image_icon", tag: "Translate", selectTextColor: .blue, unselectTextColor: Color(red: 99/255, green: 99/255, blue: 99/255).opacity(0.6)),
                                     TabBarPage(page: ContentView(), selectIcon: "select_document_image_icon", unselectIcon: "document_image_icon", tag: "Document", selectTextColor: .blue, unselectTextColor: Color(red: 99/255, green: 99/255, blue: 99/255).opacity(0.6)),
                                     TabBarPage(page: ContentView(), selectIcon: "select_settings_image_icon", unselectIcon: "settings_image_icon", tag: "Settings", selectTextColor: .blue, unselectTextColor: Color(red: 99/255, green: 99/255, blue: 99/255).opacity(0.6))]))
    }
}

struct TabBarPage: Identifiable {
    var id = UUID()
    var page: Any
    var selectIcon: String
    var unselectIcon: String
    var tag: String
    var selectTextColor: Color
    var unselectTextColor: Color
}

extension UIColor {
    convenience init(hexaString: String, alpha: CGFloat = 1) {
        let chars = Array(hexaString.dropFirst())
        self.init(red:   .init(strtoul(String(chars[0...1]),nil,16))/255,
                  green: .init(strtoul(String(chars[2...3]),nil,16))/255,
                  blue:  .init(strtoul(String(chars[4...5]),nil,16))/255,
                  alpha: alpha)}
}
