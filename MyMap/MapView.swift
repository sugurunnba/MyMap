//
//  MapView.swift
//  MyMap
//
//  Created by 高木克 on 2022/03/29.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
//    検索キーワード
    let searchKey: String
//    表示するViewを作成するときに実行
    func makeUIView(context: Context) -> MKMapView{
//        MKMapViewのインスタンス生成
        MKMapView()
    } //makeUIView ここまで
    
//    表示したViewが更新されるたびに実行
    func updateUIView(_ uiView: MKMapView, context: Context) {
//        入力された文字をデバッグエリアに表示
        print(searchKey)
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(
            searchKey,
            completionHandler: { (placemarks,error) in
//            リクエストの結果が存在し、1件目の情報から位置情報を取り出す
            if let unwrapPlacemarks = placemarks ,
               let firstPlacemark = unwrapPlacemarks.first ,
               let location = firstPlacemark.location {
                
                let targetCoordinate = location.coordinate
                                
                print(targetCoordinate)
                
//                MKPointAnnotationインスタンスを取得し、ピンを生成
                let pin = MKPointAnnotation()
                
//                ピンを置く場所に緯度軽度を設定
                pin.coordinate = targetCoordinate
                
//                ピンのタイトルを設定
                pin.title = searchKey
                
//                ピンを地図に置く
                uiView.addAnnotation(pin)
                
//                緯度軽度を中心にして半径500mの範囲を表示
                uiView.region = MKCoordinateRegion(
                    center: targetCoordinate,
                    latitudinalMeters: 500.0,
                    longitudinalMeters: 500.0)
                
          } // if ここまで
      }) //getcoder ここまで
    } //updateUIView ここまで
} //MapView ここまで


// Live Previewを起動してプレビューをCanvasに描画している場合にのみ実行される
// シミュレータでアプリを起動したときには実行されない
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー")
    }
}
