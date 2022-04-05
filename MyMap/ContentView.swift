//
//  ContentView.swift
//  MyMap
//
//  Created by 高木克 on 2022/03/29.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
//    入力中の文字列を保持する状態変数
    @State var inputText: String = ""
//    検索キーワードを保持する状態変化
    @State var dispSearchKey: String = ""
//    マップ種類の最初は標準から
    @State var dispMapType: MKMapType = .standard
    
    var body: some View {
        VStack{
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
//              入力が完了されたとき
//              (ユーザが入力して改行したときに走る)
//              ここではdispSearchKeyの状態が変化する(入力が完了した)タイミングでViewを更新する
                .onSubmit{
//                  入力が完了したので検索キーワードに設定する
                    dispSearchKey = inputText
                }
//            余白を追加
                .padding()
            
            ZStack(alignment: .bottomTrailing){
//              マップを表示
                MapView(searchKey: dispSearchKey, mapType: dispMapType)
            
//            マップ種類切り替えボタン
                Button(action: {
//                    mapTypeプロパティー値をトグル(切り替え)
//                    標準 → 航空写真 → 航空写真 + 標準
//                    →　3D Flyover → 3D Flyober + 標準
//                    →　交通機関
                    if dispMapType == .standard {
                        dispMapType = .satellite
                    } else if dispMapType == .satellite {
                        dispMapType = .hybrid
                    } else if dispMapType == .hybrid {
                        dispMapType = .satelliteFlyover
                    } else if dispMapType == .satelliteFlyover {
                        dispMapType = .hybridFlyover
                    } else if dispMapType == .hybridFlyover {
                        dispMapType = .mutedStandard
                    } else {
                        dispMapType = .standard
                    }
                }) {
//                    マップアイコン表示
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0, alignment: .leading)
                } //Buttom ここまで
//                右の余白を20空ける
                .padding(.trailing, 20.0)
//                下の余白を30空ける
                .padding(.bottom, 30.0)
            } // ZStack ここまで
            
        } //VStack ここまで
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
