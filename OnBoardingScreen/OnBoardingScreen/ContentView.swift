//
//  ContentView.swift
//  OnBoardingScreen
//
//  Created by karmjit singh on 18/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isFirstLaunch: Bool = false
    var body: some View {
        HStack {
            VStack {
                Text("Main Content View")
                    .padding()
            }
        }
        .onAppear {
            isFirstLaunch = !UserDefaults.standard.bool(forKey: Constants.UserDefaultKeys.appLaunchedBefore)
            print(isFirstLaunch)
        }
        .sheet(isPresented: $isFirstLaunch) {
            UserDefaults.standard.set(true, forKey: Constants.UserDefaultKeys.appLaunchedBefore)
        } content: {
            LaunchView
        }
    }
    
    @ViewBuilder var LaunchView: some View {
        VStack {
            Spacer()
            
            Text("OnBoarding View Content")
            
            Spacer()
            
            Button("Continue") {
                isFirstLaunch.toggle()
             }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
