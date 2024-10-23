//
//  IntroAnimationView.swift
//  hw2
//
//  Created by James.Lai on 10/11/2024.
//

import SwiftUI

struct IntroAnimationView: View {
    @State private var isAnimating = false
    @State private var showContentView = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()  // 背景顏色

            Image("Todd_Hido_face")
                .resizable()
                .scaledToFit()
                //.frame(width: isAnimating ? 300 : 100, height: isAnimating ? 300 : 100)
                .opacity(isAnimating ? 0.3 : 0)
                .animation(.easeInOut(duration: 1), value: isAnimating)
                .onAppear {
                    isAnimating = true
                }
                .blur(radius: 4)//SwiftUI 生動有趣的圖片效果 modifier
            // 文字淡入效果
            Text("Welcome to Photographer's Journey")
                .font(.largeTitle)
                .foregroundColor(.white)
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeInOut(duration: 1).delay(0.5), value: isAnimating)
        }
        .onAppear {
            // 在動畫結束後延遲切換到ContentView
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    showContentView = true
                }
            }
        }
        .overlay {
            if showContentView {
                // 使用NavigationStack來確保過渡是正確的
                NavigationStack {
                    ContentView()  // 動畫結束後顯示的主要畫面
                        .transition(.opacity)  // 使用轉場效果
                        .opacity(showContentView ? 1 : 0)
                        .animation(.easeInOut(duration: 1), value: showContentView)
                }
            }
        }
    }
}

struct IntroAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        IntroAnimationView()
    }
}
