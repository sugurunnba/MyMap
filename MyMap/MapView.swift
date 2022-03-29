//
//  MapView.swift
//  MyMap
//
//  Created by 高木克 on 2022/03/29.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
//    表示するViewを作成するときに実行
    func makeUIView(context: Context) -> MKMapView{
//        MKMapViewのインスタンス生成
        MKMapView()
    } //makeUIView ここまで
    
//    表示したViewが更新されるたびに実行
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    } //updateUIView ここまで
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
