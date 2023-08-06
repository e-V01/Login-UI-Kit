//
//  CustomTF.swift
//  Login UI Kit
//
//  Created by Y K on 06.08.2023.
//

import SwiftUI

struct CustomTF: View {
    var sfIcon: String
    var iconTint: Color = .gray
    var hint: String
    /// Hides TextFieled
    var isPassword: Bool = false
    @Binding var value: String
    /// View Properties
    @State private var showPassword: Bool = false

    var body: some View {
        HStack(alignment: .top, spacing: 8, content: {
            Image(systemName: sfIcon)
                .foregroundColor(iconTint)
            /// Since I need same width to align TextFieelds Equally
                .frame(width: 30)
            /// Slightly Bringing Down
                .offset(y: 2)

            
            VStack(alignment: .leading, spacing: 8, content: {
                if isPassword {
                    Group {
                        /// Revelaing password when users wants to show password
                        if showPassword {
                            TextField(hint, text: $value)

                        } else {
                            SecureField(hint, text: $value)

                        }
                    }

                } else {
                    TextField(hint, text: $value)
                }
                
                Divider()
            })
            .overlay(alignment: .trailing) {
                /// Password Reveal Button
                if isPassword {
                    Button(action: {
                        withAnimation {
                            showPassword.toggle()
                        }
                    }, label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(.gray)
                            .padding(10)
    //                        .contentShape()
                    })
                }
            }
        })
    }
}

