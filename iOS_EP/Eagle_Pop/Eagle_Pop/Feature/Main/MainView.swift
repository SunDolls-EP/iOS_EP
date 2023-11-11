//
//  MainView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 2023/08/23.
//

import SwiftUI
import ComposableArchitecture
import Alamofire
import OpenTDS

struct MainView: View {
    
    @Binding var selection: Int
    let store: StoreOf<MainCore>
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let sizes = [90, 110, 85]
    let names = ["성의근", "최시훈", "혜성"]
    let images = ["https://lh3.googleusercontent.com/a/ACg8ocKlnIRak92dnMXxnLt3nFZoSPDosqXPS9-tD71Q9QA3EA=s96-c", "https://lh3.googleusercontent.com/a/ACg8ocK1Wvgt-PkiGcwk02KAPlNGMTwMJoyixIcPR5v5lyyA=s96-c", "https://lh3.googleusercontent.com/a/ACg8ocJtJEWGB5I3AxTUbseFU4pNm-qdicTs55mGLiq4shVI=s96-c"]

    var body: some View {
        
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                ScrollView {
                    VStack(spacing: 15) {
                        TimerView(store: Store(initialState: MainCore.State()) { MainCore() })
                            .frame(alignment: .center)
                            .padding(.top, 26)
                            .padding(.bottom, 26)
                            .padding([.leading, .trailing], 26)
                            .frame(maxHeight: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                        
                        VStack {
                                Menu("\(viewStore.menuTitle)") {
                                    Button("일간 랭킹") { viewStore.send(.selectDaily) }
                                    Button("주간 랭킹") { viewStore.send(.selectWeekly) }
                                    Button("월간 랭킹") { viewStore.send(.selectMonthly) }
                                }
                                .font(.system(size: 25, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                                .frame(alignment: .center)
                            Button(action: {
                                selection = 2
                            }) {
                                ForEach(0..<sizes.count, id: \.self) { info in
                                    SimpleRanking(size: sizes[info], name: names[info], imageName: images[info])
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 25)

                        }
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.top, 20)
                    }
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity)
                }
                .navigationBarTitle(Text("Eagle Pop"), displayMode: .inline)
                .background(Color("background"))
                .navigationBarItems(trailing: Button {
                    viewStore.send(.sheetToSetting)
                } label: {
                    Image(systemName: "gearshape")
                        .foregroundStyle(.black)
                        .font(.title3)
                })
            }
        }
    }
}

#Preview {
    MainView(selection: .constant(0), store: Store(initialState: MainCore.State()) {
        MainCore()
    })
}
