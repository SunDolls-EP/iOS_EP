//
//  OpenSourceView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/11/23.
//

import SwiftUI

struct OpenSourceView: View {
    let openSourceNames = ["*Alamofire 5.8.0", "*The Composable Architect 1.2.0", "*OpenTDS", "*GoogleSignIn 7.0.0"]
    let openSourceLinks = ["https://github.com/Alamofire/Alamofire",
                           "https://github.com/pointfreeco/swift-composable-architecture",
                           "https://github.com/OpenToss/OpenTDS-SwiftUI",
                           "https://github.com/google/GoogleSignIn-iOS"]
    var body: some View {
        NavigationView {
            ScrollView {
                Rectangle()
                    .padding(.vertical, 10)
                    .padding(.horizontal, 0)
                    .foregroundColor(Color("customLightGray"))
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(0..<openSourceNames.count, id: \.self) { index in
                        let name = openSourceNames[index]
                        let link = openSourceLinks[index]
                        VStack(alignment: .leading) {
                            Text(name)
                                .font(.custom(pretendardBold, size: 18))
                            Link(destination: URL(string: link)!) {
                                Text(link)
                                    .font(.custom(pretendardMedium, size: 12))
                                    .foregroundColor(.blue)
                                    .underline()
                            }
                            if name == "*GoogleSignIn 7.0.0" {
                                Text("Apache License Version 2.0")
                                    .font(.custom(pretendardRegular, size: 15))
                            } else {
                                Text("MIT Licence")
                                    .font(.custom(pretendardRegular, size: 15))
                            }
                            
                        }
                    }
                }
                .frame(alignment: .top)
                .padding(.top, 40)
            }
            .navigationBarTitle("OpenSourceLicense", displayMode: .large)
        }
    }
}

#Preview {
    OpenSourceView()
}
