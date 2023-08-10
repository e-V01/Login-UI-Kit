//
//  OTPVerificationView.swift
//  Login UI Kit
//
//  Created by Y K on 08.08.2023.
//

import SwiftUI

struct OTPVerificationView: View {
    /// View Properties
    @Binding var otpText: String
    /// - Keyboard State
    @FocusState private var isKeyboardShowing: Bool
    var body: some View {
        HStack(spacing: 0) {
            /// OTP Text Boxes
            /// Change COunt Vased on your OTP text size
            ForEach(0..<6, id: \.self) { index in
                OTPTextBox(index)
            }
        }
        .background(content: {
            TextField("", text: $otpText.limit(6))
                .keyboardType(.numberPad)
            // to show the most recent one-time code from messages
                .textContentType(.oneTimeCode)
            /// - Hiding it out
                .frame(width: 1, height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isKeyboardShowing)
        })
        .contentShape(Rectangle())
        /// Opening Keyboard when tapped
        .onTapGesture {
            isKeyboardShowing.toggle()
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    isKeyboardShowing.toggle()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
    
    //MARK: - OTP Text Box
    @ViewBuilder
    func OTPTextBox(_ index: Int) -> some View {
        ZStack {
            // safe check for avoiding crashes while reading the string index
            if otpText.count > index {
                /// - Finding Char at Index
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            } else {
                Text(" ")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            /// - Highlighting CUrrent Active Box
            let status = (isKeyboardShowing && otpText.count == index)
            RoundedRectangle(cornerRadius: 6,
                             style: .continuous)
            .stroke(status ? .black : .gray, lineWidth: status ? 1 : 0.5)
            /// - Adding ANimation
            .animation(.easeInOut(duration: 0.2), value: status)
        }
        .frame(maxWidth: .infinity)
    }
}




//// MARK: - View Extensions
//extension View {
//    func disableWithOpacity(_ condition: Bool) -> some View {
//        self
//            .disabled(condition)
//            .opacity(condition ? 0.6 : 1)
//    }
//}

// MARK: - Binding <String> Extension
//Since we only need 6 chars from the TextField as we have only 6 boxes, creating an extension for limitng the binding string to some prescribed limit

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
