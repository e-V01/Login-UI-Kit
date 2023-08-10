//
//  ContentView.swift
//  Login UI Kit
//
//  Created by Y K on 06.08.2023.
//

import SwiftUI

struct ContentView: View {
    /// View Properties
    @State private var showSignup: Bool = false
    /// Keyboard Status
    @State private var isKeyboardShowing: Bool = false
    var body: some View {
        NavigationStack {
            Login(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup) {
                    SignUp(showSignup: $showSignup)
                    
                }
            
            /// Checking if any Keyabord is visible
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification),
                           perform: { _ in
                    /// Disabling it for signup view
                    if !showSignup {
                        isKeyboardShowing = true
                    }
                })
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification), perform: {
                    _ in isKeyboardShowing = false
                })
        }
        .overlay {
            /// iOS 17 Bounce Animation
            if #available(iOS 17, *) {
                /// Since this Project Supports iOS 16 too.
                CircleView()
                    .animation(.easeInOut(duration: 0.1), value: showSignup)
                    .animation(.easeInOut(duration: 0.1), value: isKeyboardShowing)
            } else {
                CircleView()
                    .animation(.easeInOut(duration: 0.3), value: showSignup)
                    .animation(.easeInOut(duration: 0.3), value: isKeyboardShowing)

            }
        }
    }
    /// Moving blurred background
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.yellow, .orange, .red], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
        ///  Moving when the signup pages load/dismiss
            .offset(x: showSignup ? 90 : -90, y: -90 - (isKeyboardShowing ? 200 : 0))
            .blur(radius: 15)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
