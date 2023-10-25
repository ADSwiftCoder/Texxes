//
//  HomeView.swift
//  Texxes
//
//  Created by Adrian Menezes on 25/10/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            VStack{
                //Text("Reccomendations")
                    //.bold()
                  //  .font(.system(size:(25)))
                  //  .offset(x:-80, y:15)
                
                NavigationStack{
                    // Sample
                }
                .navigationTitle("Home")
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
