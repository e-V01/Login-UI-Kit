//
//  ForgotPassword.swift
//  Login UI Kit
//
//  Created by Y K on 06.08.2023.
//

import SwiftUI

struct ForgotPassword: View {
    @Binding var showResetView: Bool
    // View properties
    @State private var emailID: String = ""
    /// Environment properties
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            /// Back button
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("Please enter your Email ID so that we can send the reset link.")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Custom Text Field
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                    .padding(.top, 5)
                
                .hSpacing(.trailing)
                /// Disabling untill the Data is entered
                .disableWidthOpacity(emailID.isEmpty)
                
                /// SignUp Button
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    /// Your code
                    /// after the link sent
                    Task {
                        dismiss()
                        try? await Task.sleep(for: .seconds(0))
                        /// Showing the reset View
                        showResetView = true
                    }
                }
                .hSpacing(.trailing)
            }
            .padding(.top, 20)
        
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        /// Since this is going to be a Sheet
        .interactiveDismissDisabled()
        
    }
}


struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
