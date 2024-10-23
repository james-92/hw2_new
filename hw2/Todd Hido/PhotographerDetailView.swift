//
//  Todd_ContentView.swift
//  hw2
//
//  Created by James.Lai on 25/10/2024.
//

import SwiftUI


struct PhotographerDetailView: View {
    let photographer: Photographer
    
    var body: some View {
        TabView {  // 使用 TabView 切換不同頁面
            BiographyView(photographer: photographer)
                .tabItem {
                    Label("Biography", systemImage: "person.text.rectangle")
                }
            
            PhotoView(photographer: photographer)
                .tabItem {
                    Label("Photos", systemImage: "photo")
                }
            
            BooksView(photographer: photographer)
                .tabItem {
                    Label("PhotoBooks", systemImage: "book")
                }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}
