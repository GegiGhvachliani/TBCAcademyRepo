import SwiftUI

struct TimerAdderView: View {
    @ObservedObject var viewModel: TimerViewModel
    
    @State var title: String = ""
    @State var hours: String = ""
    @State var minutes: String = ""
    @State var seconds: String = ""
    
    var body: some View {
        
        VStack(spacing: 15) {
            TimerTextField(placeholder: "ტაიმერის სახელი", text: $title)
                .padding(.top, 35)
            
            HStack (spacing: 15) {
                TimerTextField(placeholder: "სთ", text: $hours)
                TimerTextField(placeholder: "წთ", text: $minutes)
                TimerTextField(placeholder: "წმ", text: $seconds)
            }
            .multilineTextAlignment(.center)
            
            Button {
                let h = Int(hours) ?? 0
                let m = Int(minutes) ?? 0
                let s = Int(seconds) ?? 0
                
                viewModel.addTimer(title: title, hours: h, minutes: m, seconds: s)
                
                title = ""
                hours = ""
                minutes = ""
                seconds = ""
                
            } label: {
                Text("დამატება")
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .font(.system(size: 18))
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal, 20)
        .font(.footnote)
        .frame(maxWidth: .infinity)
        .frame(height: 180)
        .background(.timerBackground)
        .ignoresSafeArea()
    }
}

#Preview {
    TimerView()
}
