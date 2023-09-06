//
//  MainView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import OpenTDS

struct MainView: View {

    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Color("default").ignoresSafeArea()
        
        VStack {
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .imageScale(.large)
                        .font(.headline)
                }
                Spacer()
                .frame(alignment: .topLeading)
            }
            NavigationView {
                ZStack {
                    
                    TimePickerView()
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
