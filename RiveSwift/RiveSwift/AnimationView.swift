import RiveRuntime
import SwiftUI

struct AnimationView: View {
    @State private var riveShapesViewModel = RiveViewModel(fileName: "shapes")
    @State private var navigateToNewView = false

    var body: some View {
        VStack {
            movingBackground
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    
                    Button(action: { riveShapesViewModel.play(animationName: nil, loop: .autoLoop) }) {
                        Text("Play")
                    }
                    .buttonStyle(BlueButtonStyle())
                    
                    Button(action: { riveShapesViewModel.pause() }) {
                        Text("Pause")
                    }
                    .buttonStyle(BlueButtonStyle())
                    
                    Button(action: { riveShapesViewModel.stop() }) {
                        Text("Stop")
                    }
                    .buttonStyle(BlueButtonStyle())
                    
                    Button(action: { riveShapesViewModel.reset() }) {
                        Text("Reset")
                    }
                    .buttonStyle(BlueButtonStyle())
                    
                    Button(action: { riveShapesViewModel.play(animationName: nil, direction: .forwards) }) {
                        Text("Forwards")
                    }
                    .buttonStyle(BlueButtonStyle())
                    
                    Button(action: { riveShapesViewModel.play(animationName: nil, direction: .backwards) }) {
                        Text("Backwards")
                    }
                    .buttonStyle(BlueButtonStyle())
                    
                    Button(action: { riveShapesViewModel.play(animationName: nil, loop: .pingPong) }) {
                        Text("Ping Pong")
                    }
                    .buttonStyle(BlueButtonStyle())
                    
                    Button(action: { riveShapesViewModel.play(animationName: nil, loop: .autoLoop) }) {
                        Text("Loop")
                    }
                    .buttonStyle(BlueButtonStyle())
                    
                    Button(action: { navigateToNewView = true }) {
                        Text("New View")
                    }
                    .buttonStyle(BlueButtonStyle())
                }
            }
                .sheet(isPresented: $navigateToNewView) {
                    TreeView()
                }
        }
    }

    // Simple full screen animation - blurred
    var movingBackground: some View {
        riveShapesViewModel.view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y: 100)
            )
    }
}

struct TreeView: View {
    @State private var riveTreeViewModel = RiveViewModel(fileName: "tree")
    @State private var sliderValue: Double = 50;
    var body: some View {
        VStack{
            Text("Grow your tree!")
            riveTreeViewModel.view()
            Slider(value: $sliderValue, in: 1...100, step: 1) {
                            Text("Value")
                        }
                        .padding()
                        .onChange(of: sliderValue) { newValue in
                            riveTreeViewModel.setInput("input", value: newValue)
            }
        }
    }
}

struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

#Preview {
    AnimationView()
}
