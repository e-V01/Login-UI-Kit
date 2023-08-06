//
//  Login.swift
//  Login UI Kit
//
//  Created by Y K on 06.08.2023.
//

import SwiftUI

struct Login: View {
    @Binding var showSignup: Bool
    // View properties
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var showForgotPasswordView: Bool = false
    /// Reset Password View(with New Password and Confimation Password)
    @State private var showResetView: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Spacer(minLength: 0)
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Sign in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Custom Text Field
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)
                
                Button("Forgot Password?") {
                    showForgotPasswordView.toggle()
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.yellow)
                .hSpacing(.trailing)
                /// Disabling untill the Data is entered
                .disableWidthOpacity(emailID.isEmpty || password.isEmpty)
                
                /// Login Button
                GradientButton(title: "Login", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6) {
                Text("Don`t have an account?")
                    .foregroundStyle(.gray)
                
                Button("Sign Up") {
                    showSignup.toggle()
                }
                .fontWeight(.bold)
                .tint(.yellow)
            }
            .font(.callout)
            .hSpacing()
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        .sheet(isPresented: $showForgotPasswordView, content: {
            if #available(iOS 16.4, *) {
                ///  Since I wanted a Custom Sheet Radius
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
            }
        })
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
