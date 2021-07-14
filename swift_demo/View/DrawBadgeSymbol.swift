//
//  DrawBadgeSymbol.swift
//  swift_demo
//
//  Created by mac on 08/07/21.
//

import Foundation
import SwiftUI

var x:Double=50;
var y:Double=100;
var isAnimated:Bool=false;

struct BadgeSymbol: View {
//    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    static let symbolColor = Color(red: 0.0, green: 0.0, blue: 0.4).opacity(0.2)
    var x:Double
    var y:Double
    var width:Double
    var height:Double

    var body: some View {
        GeometryReader { geometry in
            Path { path in
//                let width = min(geometry.size.width, geometry.size.height)
//                let height = width * 0.75
//                let spacing = width * 0.030
//                let middle = width * 0.5
//                let topWidth = width * 0.226
//                let topHeight = height * 0.488
//
//                path.addLines([
//                    CGPoint(x: middle, y: spacing),
//                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
//                    CGPoint(x: middle, y: topHeight / 2 + spacing),
//                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
//                    CGPoint(x: middle, y: spacing)
//                ])
//
//                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
//                path.addLines([
//                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
//                    CGPoint(x: spacing, y: height - spacing),
//                    CGPoint(x: width - spacing, y: height - spacing),
//                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
//                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
//                ])
//
//                path.move(to: CGPoint(x: middle, y: topHeight / 5 + spacing * 3))

//                path.addEllipse(in: CGRect(x:isAnimated ?10:50, y: 100, width: 30, height: 30))
//                path.addEllipse(in: CGRect(x:100, y: 200, width: 40, height: 40))
//                path.addEllipse(in: CGRect(x:250, y: 250, width: 50, height: 50))
                path.addEllipse(in: CGRect(x:x, y: y, width: width, height: height))
            }
//            .stroke(Color.red)
            .fill(Self.symbolColor)
//            .animation(Animation.linear(duration: 5).repeatForever(autoreverses: true))
        }.onAppear(){
            isAnimated=true
        }
    }
}
//
//struct BadgeSymbol_Previews: PreviewProvider {
//    static var previews: some View {
//        BadgeSymbol()
//    }
//}
