//
//  ContentView.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 12/08/25.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("🩸 Blood Bank")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .red))
                .scaleEffect(1.5)
            
            Spacer()
            
            Text("Loading...")
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom, 40)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
