//
//  OTPView.swift
//  Login UI Kit
//
//  Created by Y K on 08.08.2023.
//

import SwiftUI

struct OTPView: View {
    @Binding var otpText: String
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
            .padding(.top, 15)
            Text("Enter OTP")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("A 6 digit code was sent to your email")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Custom OTP Text Field
                OTPVerificationView(otpText: $otpText)
                
                /// Disabling untill the Data is entered
               
                
                /// SignUp Button
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    /// Your code
                    /// after the link sent
                }
                .hSpacing(.trailing)
                .disableWithOpacity(otpText.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
        
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        /// Since this is going to be a Sheet
        .interactiveDismissDisabled()
        
    }
}


struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
