//
//  SignUp.swift
//  Login UI Kit
//
//  Created by Y K on 06.08.2023.
//

import SwiftUI

struct SignUp: View {
    @Binding var showSignup: Bool
    // View properties
    @State private var emailID: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            /// Back button
            Button(action: {
                showSignup = false
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 25)
            
            Text("Pleas, Sign up to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Custom Text Field
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTF(sfIcon: "person", hint: "Full Name", value: $fullName)
                    .padding(.top, 5)
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)
                
                .hSpacing(.trailing)
                /// Disabling untill the Data is entered
                .disableWidthOpacity(emailID.isEmpty || password.isEmpty || fullName.isEmpty)
                
                /// SignUp Button
                GradientButton(title: "Continue", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6) {
                Text("Already have an account?")
                    .foregroundStyle(.gray)
                
                Button("Sign Up") {
                    showSignup = false
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
    }
}


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
