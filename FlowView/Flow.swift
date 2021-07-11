//
//  Flow.swift
//  UI-255
//
//  Created by nyannyan0328 on 2021/07/09.
//

import SwiftUI

struct Flow: View {
    @State var show = false
    var body: some View {
        ZStack{
            
            WaveView(color: .red.opacity(0.2), amipify: 200, isResived: true)
            
            WaveView(color: show ? Color.orange.opacity(0.3) : .green.opacity(0.3), amipify: 200, isResived: false)
            
            
        }
       
        .overlay(
        
           
            VStack{
            
            HStack{
                
                
                Text("WAVES")
                    .font(.largeTitle.monospacedDigit())
                    .padding(.leading,10)
                    
                
                
                Spacer()
                
                Toggle(isOn: $show) {
                    
                    Image(systemName: "eyedropper.halffull")
                        .foregroundColor(.blue)
                        .background(.primary,in:Circle())
                    
                    
                }
                .toggleStyle(.button)
                .buttonStyle(.bordered)
                .tint(.purple)
                .controlProminence(.increased)
                
            }
            .padding(.top,50)
    
            
            
        }
                .frame(maxHeight: .infinity, alignment: .top)
           
              
           
        
        )
        .background(
        
            GeometryReader{proxy in
            
            let size = proxy.size
            Image("pro")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .cornerRadius(1)
                
        }
                .overlay(.secondary)
        
        )
        
        .ignoresSafeArea(.all, edges: .all)
        
      
    }
}

struct Flow_Previews: PreviewProvider {
    static var previews: some View {
        Flow()
    }
}


struct WaveView : View{
    var color : Color
    var amipify : CGFloat
    
    var isResived : Bool
    
    var body: some View{
        
        
        TimelineView(.animation){timeline in
            
            Canvas{context,size in
                
                let timeNow = timeline.date.timeIntervalSinceReferenceDate
                
                let angle = timeNow.remainder(dividingBy: 2)
                
                let offset = angle * size.width
                
                
                context.translateBy(x: isResived ? -offset : offset, y: 0)
                
                context.fill(getPath(size: size), with: .color(color))
                
                
                context.translateBy(x: -size.width, y: 0)
                context.fill(getPath(size: size), with: .color(color))
                
                context.translateBy(x: size.width * 2, y: 0)
                context.fill(getPath(size: size), with: .color(color))
                
                
                
            }
            
            
            
        }
    }
    func getPath(size:CGSize) ->Path{
        
        
        return Path{path in
            
            
            let midHight = size.height / 2
            
            let with = size.width
            
            
            path.move(to: CGPoint(x: 0, y: midHight))
            
            path.addCurve(to: CGPoint(x: with, y: midHight), control1: CGPoint(x: with * 0.4, y: midHight + amipify), control2: CGPoint(x: with * 0.65, y: midHight - amipify))
            
            
            path.addLine(to: CGPoint(x: with, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            
            
            
            
            
        }
    }
}
