//
//  AddNewMeeting.swift
//  UI-255
//
//  Created by nyannyan0328 on 2021/07/07.
//

import SwiftUI

struct AddNewMeeting: View {
    
    @EnvironmentObject var model  : HomeViewModel
    
    
    @State var currentTab = Metting(title: "", timing: Date())
    @State var showDatePicker = false
    
    @State var selectmeeting = "Private"
    var body: some View {
        ScrollView(UIScreen.main.bounds.height < 850 ? .vertical : .init(), showsIndicators: false) {
            
            
            VStack(spacing:20){
                
                HStack{
                    
                    
                    Button {
                        
                        withAnimation{
                            
                            model.addNewMeting.toggle()
                        }
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title.bold())
                            .foregroundColor(.black)
                          
                    }
                    
                    Spacer(minLength: 0)
                    
                    
                    Image("pro")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                    
            
                        
                }
               
                .overlay(
                
                Text("New Meeting")
                    .font(.system(size: 18).bold())
                
                
                
                
                )
                
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                    Text("Enter Meeting Name")
                        .font(.title3.weight(.semibold))
                        .foregroundColor(.gray)
                    
                    
                    TextField("Your Name?", text: $currentTab.title)
                        .font(.system(size: 18, weight: .light))
                    
                    
                    Divider()
                        
                    
                }
                .padding(.top,20)
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                    Text("Timing")
                        .font(.title3.weight(.semibold))
                        .foregroundColor(.gray)
                    
                    HStack{
                        let time = currentTab.timing.formatted(date: .omitted, time: .shortened)
                        
                        let date = currentTab.timing.formatted(date: .numeric, time: .omitted)
                        
                        
                        Text("\(time)  \(date)")
                        
                        
                        Spacer(minLength: 10)
                        
                        
                        Button {
                            
                            withAnimation{
                                
                                
                                showDatePicker.toggle()
                            }
                            
                        } label: {
                            
                            Image(systemName: "calendar.circle.fill")
                                .font(.title.bold())
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.primary,.pink.opacity(0.3))
                                
                            
                            
                            
                        }
                    }

                    
                    
                  
                    
                    
                    Divider()
                        
                    
                }
                .padding(.top,20)
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                    Text("Select Clloboration")
                        .font(.title3.weight(.semibold))
                        .foregroundColor(.gray)
                    
                    
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
                        
                        
                        Spacer(minLength: 30)
                        
                        
                        
                        Button {
                            
                        } label: {
                            
                            Text("CONTACT")
                                .font(.callout.italic())
                                .kerning(1.9)
                                
                            
                        }
                        .buttonStyle(.bordered)
                        .tint(.green)
                        .controlProminence(.increased)
                        .shadow(color: .gray, radius: 5, x: 0, y: 0)

                        
                        
                        
                        
                        
                    }
                    
                    Divider()
                        
                    
                }
                .padding(.top,20)
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                    Text("Meeting Type")
                        .font(.title3.weight(.semibold))
                        .foregroundColor(.gray)
                    
                    
                    HStack(spacing:15){
                        
                        
                        ForEach(["Private" , "Public","Onivited"],id:\.self){meeting in
                            
                            
                            
                            MeetingButton(title: meeting, selectmeeting:$selectmeeting)
                            
                        }
                    }
                    
                    
                    
                    
                    Divider()
                        
                    
                }
                .padding(.top,20)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    
                    Text("Meeting Card Color")
                        .font(.title3.monospacedDigit())
                        
                    
                    let colors = [Color("Blue"),Color("Green"),Color("Purple"),Color("Red"),Color("Orange")]
                    
                    
                    HStack(spacing:10){
                        
                        
                        
                        ForEach(colors,id:\.self){colors in
                            
                            Circle()
                                .fill(colors)
                                .frame(width: 35, height: 35)
                                .overlay(
                                Image(systemName: "checkmark")
                                    .font(.callout)
                                    .foregroundStyle(.ultraThickMaterial)
                                    .opacity(currentTab.cardColor == colors ? 1 : 0)
                                
                            
                                )
                                .onTapGesture {
                                    withAnimation{
                                        
                                        
                                        currentTab.cardColor = colors
                                    }
                                }
                            
                            
                            
                        }
                
                    }
                    .padding(.top,10)
                    
                    
                   
                    
                    
                 
                    

                    
                    
                    
                    
                    
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                
                
                Spacer(minLength: 15)
                
                
                
                Button {
                    
                    
                    withAnimation{
                        
                        addMeeting()
                    }
                    
                } label: {
                    
                    
                    Text("Scheduel")
                        .font(.title.weight(.heavy))
                        .foregroundColor(.white)
                      
                      
                    
                }
               
                .buttonStyle(.bordered)
                .tint(.primary)
                .controlProminence(.increased)
        
              
                
                
                
                
                
            }
            .padding()
            
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("Bg"))
        .overlay(CustomDatePicker(date: $currentTab.timing, showPicker: $showDatePicker))
        .transition(.move(edge: .bottom))
    }
    
    func addMeeting(){
        
        model.metings.append(currentTab)
        model.addNewMeting.toggle()
    }
}



struct AddNewMeeting_Previews: PreviewProvider {
    static var previews: some View {
        AddNewMeeting()
    }
}


struct MeetingButton : View{
    
    var title : String
    @Binding var selectmeeting : String
    
    var body: some View{
        
        Button {
            withAnimation{
                
                selectmeeting = title
            }
        } label: {
            
            Text(title)
                .font(.footnote)
                .frame(maxWidth: .infinity)
                .padding(.vertical,8)
                .foregroundStyle(selectmeeting == title ? .white : .gray)
                .background(
                
                Capsule()
                    .fill(Color.primary.opacity(selectmeeting == title ? 1 : 0))
                
                )
                .background(
                
                Capsule()
                    .stroke(Color.red,lineWidth: 3)
                
                
                )
            
        }
       


        
    }
}

struct CustomDatePicker : View{
    
    @Binding var date : Date
    @Binding var showPicker : Bool
    
    var body: some View{
        
        
        
        ZStack{
            
                 Rectangle()
                .fill(.ultraThickMaterial)
                .ignoresSafeArea()
            
            
            DatePicker("", selection: $date, displayedComponents: [.date, .hourAndMinute])
                .labelsHidden()
            
            
            
            Button {
                
                withAnimation{
                    
                    showPicker.toggle()
                }
                
            } label: {
                Image(systemName: "xmark")
                    .font(.title3.weight(.heavy))
                    .foregroundStyle(.gray)
                    .padding()
                    .background(.white,in: Circle())
                    .shadow(radius: 8)
                  
                
                
                
            }
            .padding(10)
            .frame(maxWidth : .infinity , maxHeight: .infinity, alignment: .topTrailing)

            
            
            
            
            
        }
        .opacity(showPicker ? 1 : 0)
        
        
    }
    
    
    
    
}
