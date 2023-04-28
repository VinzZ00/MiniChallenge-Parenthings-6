//
//  CustomPicker.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Elvin Sestomi on 28/04/23.
//

import SwiftUI

struct CustomPicker: View {
    
    var CustomPickerList : [String];
    @Binding var selectedValue : Int;
    
    
    var body: some View {
        
        HStack (alignment: .top, spacing: 0){
            VStack {
                Button {
                    self.selectedValue = 0
                } label: {
                    HStack{
                        Text("\(CustomPickerList[0])")
                            .frame(maxWidth: .infinity/2)
                            .foregroundColor(self.selectedValue == 0 ? AppColor.paymentBlueTextColor : AppColor.systemGrayDarker)
                                                        .padding(.horizontal, 16)
                                                        .padding(.vertical, 8)
                                                        .background(self.selectedValue == 0 ? Color.white: AppColor.systemGray)
                                                        
                                            .clipShape(
                                                TopLeadingRoundedRectangle(cornerRadius: 20)
                                                )
                    }
                    .animation(.easeInOut(duration: 0.3), value: selectedValue)
                }
                Spacer();
            }
            
            VStack {
                Button {
                    self.selectedValue = CustomPickerList.count - 1
                } label: {
                    HStack{
                        Text("\(CustomPickerList[CustomPickerList.count - 1])")
                            .frame(maxWidth: .infinity/2)
                            .foregroundColor(self.selectedValue == CustomPickerList.count - 1 ? AppColor.paymentBlueTextColor : AppColor.systemGrayDarker)
                                                        .padding(.horizontal, 16)
                                                        .padding(.vertical, 8)
                                                        .background(self.selectedValue == CustomPickerList.count - 1 ? Color.white: AppColor.systemGray)
                                                        
                                            .clipShape(
                                                TopTrailingRoundedRectangle(cornerRadius: 15)
                                                )
                    }
                    .animation(.easeInOut(duration: 0.3), value: selectedValue)
                }
            }
        }
        .frame(width: .infinity/2, height: 100)
        .background(.white)
        .clipShape(
            TopRoundedRectangle(cornerRadius: 20)
        )
        .shadow(color: .black.opacity(0.50), radius: 2, y: 2).blur(radius: 0.29)
        
        
        
        
        
    }
}


struct TopRoundedRectangle: Shape {
    let cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + cornerRadius))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY),
                          control: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius),
                          control: CGPoint(x: rect.minX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct TopTrailingRoundedRectangle: Shape {
    let cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
        path.closeSubpath()
        return path
    }
}



//struct TopTrailingRoundedRectangle: Shape {
//    let cornerRadius: CGFloat
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX-cornerRadius, y: rect.minY))
//        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
//                    radius: cornerRadius,
//                    startAngle: Angle(degrees: ),
//                    endAngle: Angle(degrees: ),
//                    clockwise: true)
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY-cornerRadius))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.closeSubpath()
//        return path
//    }
//}


struct TopLeadingRoundedRectangle: Shape {
    let cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270),
                    clockwise: false)
        path.closeSubpath()
        return path
    }
}



struct CustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPicker(CustomPickerList: ["satu", "Tiga"], selectedValue: .constant(0))
            .padding();
    }
}
