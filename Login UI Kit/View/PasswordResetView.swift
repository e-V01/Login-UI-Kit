//
//  PasswordResetView.swift
//  Login UI Kit
//
//  Created by Y K on 08.08.2023.
//

import SwiftUI

struct PasswordResetView: View {
    // View properties
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    /// Environment properties
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            /// Back button
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            
            Text("Reset Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            
            VStack(spacing: 25) {
                /// Custom Text Field
                CustomTF(sfIcon: "lock", hint: "Password", value: $password)
                
                CustomTF(sfIcon: "lock", hint: "Confirm Password", value: $confirmPassword)

                    .padding(.top, 5)
                
                
                /// SignUp Button
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    /// Your code
                    /// reset password
                }
                .hSpacing(.trailing)
                /// Disabling untill the Data is entered
                .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty)

            }
            .padding(.top, 20)
        
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        /// Since this is going to be a Sheet
        .interactiveDismissDisabled()
        
    }
}


struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
