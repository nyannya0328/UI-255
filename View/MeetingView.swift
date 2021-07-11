//
//  MeetingView.swift
//  UI-255
//
//  Created by nyannyan0328 on 2021/07/07.
//

import SwiftUI

struct MeetingView: View {
    @Binding var meetings : Metting
    var body: some View {
        VStack(spacing:20){
            
            
            HStack(alignment:.top){
                
                
                VStack(alignment:.leading,spacing:10){
                    
                    
                    Text(meetings.timing.formatted(date: .abbreviated, time: .omitted))
                        .font(.callout.bold())
                    
                    
                    Text(meetings.title)
                    Text("\($meetings.members.count)")
                        .font(.headline)
                    
                    
                }
                
                
                Spacer(minLength: 0)
                
                
                ZStack(alignment: meetings.turnedOn ? .trailing : .leading) {
                    
                    
                    Capsule()
                        .fill(.secondary)
                        .frame(width: 35, height: 18)
                    
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 18, height: 18)
                    
                    
                    
                }
                .onTapGesture {
                    withAnimation{
                        
                        
                        meetings.turnedOn.toggle()
                    }
                }
            }
            .foregroundColor(getColor())
        
            
            
            HStack(spacing:-10){
                
                
                ForEach(1...3,id:\.self){index in
                    
                    
                    
                    Image("animoji\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .background(
                        
                        Capsule()
                            .fill(Color.black)
                        
                        )
                        .background(
                        
                        
                        Circle()
                            .stroke(Color.white,lineWidth: 3)
                        )
                    
                    
                   
                    
                    
                    
                }
                
                Spacer(minLength: 0)
                
                
                Button {
                    
                } label: {
                    Text("Join")
                        .font(.callout.italic())
                        .foregroundColor(.black)
                    
                }
                .buttonStyle(.bordered)
                .tint(.purple)
                .controlSize(.small)
                .controlProminence(.increased)
                .shadow(radius: 1.5)
            
                
                

                
                
            }
         
        }
        .padding()
        .background(meetings.cardColor,in: RoundedRectangle(cornerRadius: 10))
        
    }
    func getColor()->Color{
        
        if meetings.cardColor == Color("Blue") || meetings.cardColor == Color("Orange"){
            
            return Color.white
        }
        
        return Color.black
        
        
    }
    
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
