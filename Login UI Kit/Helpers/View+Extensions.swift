//
//  View+Extensions.swift
//  Login UI Kit
//
//  Created by Y K on 06.08.2023.
//

import SwiftUI

/// Custom SwiftUI View Extensions
extension View {
    /// View Alignments
    /// Instead of using Spacers in some places, I`ve implemented this custom modifier to move views inside the stack
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    /// Disable width Opacity
    @ViewBuilder
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }
}
