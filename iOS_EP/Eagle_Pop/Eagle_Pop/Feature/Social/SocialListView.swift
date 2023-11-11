//
//  SocialListView.swift
//  Eagle_Pop
//
//  Created by 최시훈 on 10/4/23.
//

import SwiftUI
import Alamofire
struct SocialListView: View {
    @State var userDataArray: [RandomList] = []
    
    var body: some View {
        Section {
            
            ForEach(0..<userDataArray.count, id: \.self) { index in
                let info = userDataArray[index]
                
                HStack {
                    Group {
                        if let profileUrl = info.profileUrl {
                            AsyncImage(url: URL(string: profileUrl)) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                Color.gray
                            }
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Color.white)
                                .background(Color.gray)
                                .cornerRadius(15)
                        }
                    }
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
                    .font(.headline)
                    .padding(.leading, 20)
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(info.username ?? "")
                                    .font(.custom(pretendardRegular, size: 16)) +
                                Text("#\(info.tag ?? "")" )
                                    .font(.custom(pretendardLight, size: 11))
                                    .foregroundColor(.gray)
                                
                                Text("\(info.totalStudyTime ?? 0)시간")
                                    .foregroundColor(.gray)
                                    .font(.custom(pretendardLight, size: 13))
                                    .padding(.leading, 0)
                                    .frame(alignment: .leading)
                            }
                        }
                        Text(info.schoolName ?? "학교가 없습니다.")
                            .foregroundColor(.gray)
                            .font(.custom(pretendardMedium, size: 10))
                        Spacer()
                    }
                    .padding(.horizontal, 0)
                    
                    
                }
                .padding(.horizontal, 0)
                .frame(minHeight: 45)
                .listRowInsets(EdgeInsets())
                
                
            }
            .frame(minHeight: 50)
            .listRowInsets(EdgeInsets())
        } header: {
            Text("")
        }
        .onAppear() {
            do {
                let serchArray = """
    [
    {
        "username": "최시훈",
        "tag": "4133",
        "schoolName": null,
        "totalStudyTime": 13833,
        "profileUrl": "https://lh3.googleusercontent.com/a/ACg8ocK1Wvgt-PkiGcwk02KAPlNGMTwMJoyixIcPR5v5lyyA=s96-c",
        "createdAt": "2023-11-06T21:24:31",
        "modifiedAt": "2023-11-06T21:24:31"
    },
                                            {
        "username": "성의근",
        "tag": "1040",
        "schoolName": null,
        "totalStudyTime": 10482,
        "profileUrl": "https://lh3.googleusercontent.com/a/ACg8ocKlnIRak92dnMXxnLt3nFZoSPDosqXPS9-tD71Q9QA3EA=s96-c",
        "createdAt": "2023-11-06T20:04:40",
        "modifiedAt": "2023-11-06T20:04:40"
    },
                                            {
        "username": "혜성",
        "tag": "9321",
        "schoolName": null,
        "totalStudyTime": 9387,
        "profileUrl": "https://lh3.googleusercontent.com/a/ACg8ocJtJEWGB5I3AxTUbseFU4pNm-qdicTs55mGLiq4shVI=s96-c",
        "createdAt": "2023-11-06T17:10:26",
        "modifiedAt": "2023-11-06T17:10:26"
    },
                                            {
        "username": "Ham Tory",
        "tag": "9030",
        "schoolName": null,
        "totalStudyTime": 3925,
        "profileUrl": "https://lh3.googleusercontent.com/a/ACg8ocJlTzpARz4eOz6cb9rDiYSIicL_eQ73y5BhV5H-KnSCHrs=s96-c",
        "createdAt": "2023-11-06T17:03:06",
        "modifiedAt": "2023-11-06T17:03:06"
    },
                                            {
        "username": "김진우",
        "tag": "0001",
        "schoolName": "대구소프트웨어마이스터고등학교",
        "totalStudyTime": 46,
        "profileUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png",
        "createdAt": "2023-11-06T16:56:13",
        "modifiedAt": "2023-11-06T16:56:13"
    },
                                            {
        "username": "박준범",
        "tag": "0001",
        "schoolName": "대구소프트웨어마이스터고등학교",
        "totalStudyTime": 38,
        "profileUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png",
        "createdAt": "2023-11-06T18:08:37",
        "modifiedAt": "2023-11-06T18:08:37"
    },
                                            {
        "username": "김수인",
        "tag": "0001",
        "schoolName": "대구소프트웨어마이스터고등학교",
        "totalStudyTime": 34,
        "profileUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png",
        "createdAt": "2023-11-06T18:09:14",
        "modifiedAt": "2023-11-06T18:09:14"
    },
                                            {
        "username": "김진욱",
        "tag": "0001",
        "schoolName": "대구소프트웨어마이스터고등학교",
        "totalStudyTime": 26,
        "profileUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png",
        "createdAt": "2023-11-06T18:08:54",
        "modifiedAt": "2023-11-06T18:08:54"
    },
                                            {
        "username": "박준법",
        "tag": "0001",
        "schoolName": "대구소프트웨어마이스터고등학교",
        "totalStudyTime": 22,
        "profileUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png",
        "createdAt": "2023-11-06T16:53:37",
        "modifiedAt": "2023-11-06T16:53:37"
    },
                                            {
        "username": "김수임",
        "tag": "0001",
        "schoolName": "대구소프트웨어마이스터고등학교",
        "totalStudyTime": 18,
        "profileUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png",
        "createdAt": "2023-11-06T17:08:51",
        "modifiedAt": "2023-11-06T17:08:51"
    },
                                            {
        "username": "성의근",
        "tag": "8812",
        "schoolName": null,
        "totalStudyTime": 12,
        "profileUrl": "http://k.kakaocdn.net/dn/DYFZ7/btsyYoGRFYx/bUK6RRbTj3lCLNFd5WdqYK/img_110x110.jpg",
        "createdAt": "2023-11-06T17:01:55",
        "modifiedAt": "2023-11-06T17:01:55"
    }
]
""".data(using: .utf8)!
                // JSON 데이터를 배열로 디코딩
                userDataArray = try JSONDecoder().decode([RandomList].self, from: serchArray)
                
                userDataArray.shuffle()
            } catch {
                print("JSON 디코딩 오류: \(error)")
            }
            
            
        }
    }
}
