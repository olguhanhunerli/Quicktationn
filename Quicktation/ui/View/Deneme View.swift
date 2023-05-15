import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View{
        Text("Selam")
    }
    /* let audioURL: URL  // Ses dosyasının URL'sini tutmak için bir değişken
     
     @State private var isPlaying = false
     @State private var progress: Float = 0.0
     @State private var currentTime: TimeInterval = 0.0
     @State private var totalTime: TimeInterval = 0.0
     
     private var player: AVPlayer?
     private var timer: Timer?
     
     init(audioURL: URL) {
     self.audioURL = audioURL
     }
     
     var body: some View {
     VStack {
     ProgressBar(progress: $progress)
     
     Button(action: {
     if isPlaying {
     pause()
     } else {
     play()
     }
     }) {
     Image(systemName: isPlaying ? "pause.circle" : "play.circle")
     .resizable()
     .aspectRatio(contentMode: .fit)
     .frame(width: 50, height: 50)
     }
     
     Text(formatTime(time: currentTime))
     }
     .onAppear {
     preparePlayer()
     }
     .onDisappear {
     stop()
     }
     }
     
     private func preparePlayer() {
     let playerItem = AVPlayerItem(url: audioURL)
     self.player = AVPlayer(playerItem: playerItem)
     totalTime = playerItem.asset.duration.seconds
     
     self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
     guard let player = player else { return }
     
     currentTime = player.currentTime().seconds
     progress = Float(currentTime / totalTime)
     
     if currentTime >= totalTime {
     stop()
     }
     }
     }
     
     private func play() {
     player?.play()
     isPlaying = true
     }
     
     private func pause() {
     player?.pause()
     isPlaying = false
     }
     
     private func stop() {
     player?.pause()
     player?.seek(to: CMTime(seconds: 0.0, preferredTimescale: 1))
     isPlaying = false
     progress = 0.0
     currentTime = 0.0
     timer?.invalidate()
     }
     
     private func formatTime(time: TimeInterval) -> String {
     let minutes = Int(time) / 60
     let seconds = Int(time) % 60
     return String(format: "%02d:%02d", minutes, seconds)
     }
     }
     
     struct ProgressBar: View {
     @Binding var progress: Float
     
     var body: some View {
     ZStack(alignment: .leading) {
     Rectangle()
     .foregroundColor(Color.gray.opacity(0.2))
     
     Rectangle()
     .foregroundColor(Color.blue)
     .frame(width: CGFloat(progress) * UIScreen.main.bounds.width)
     }
     }
     }*/
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
