//
//  ContentView.swift
//  MyMap
//
//  Created by 高木克 on 2022/03/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
//            マップを表示
            MapView(searchKey: "東京タワー")
        } //VStack ここまで
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
