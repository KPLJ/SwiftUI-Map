//
//  ContentView.swift
//  SwiftUI-Map
//
//  Created by Ji Wang on 9/11/21.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color(.systemPink))
                .onAppear() {
                    viewModel.checkIfLocationServicesIsEnabled()
                }
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        viewModel.navigateToMyself()
                    }, label:  {
                        Image("Refresh Button")
                    })
                    .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .cornerRadius(38.5)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
