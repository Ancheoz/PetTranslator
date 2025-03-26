//
//  SpeechRecognizer.swift
//  PetTranslator
//
//  Created by Oleksandr Prytchyn on 26.03.2025.
//

import Speech
import AVFoundation

class SpeechRecognizer: ObservableObject {
    
    let speechRecognizer = SFSpeechRecognizer()
    private let audioEngine = AVAudioEngine()
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    @Published var recognizedText: String = ""
    var onStop: ((String) -> Void)?
    
    func startRecognition() {
        SFSpeechRecognizer.requestAuthorization { status in
            guard status == .authorized else {
                print("Have no access to microphone")
                return
            }
            DispatchQueue.main.async {
                self.startRecording()
            }
            
        }
    }
    func startRecording() {
        if audioEngine.isRunning {
            stopRecognition()
        }
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { return }
        let inputNode = audioEngine.inputNode
        inputNode.removeTap(onBus: 0)
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
            if let result = result {
                self.recognizedText = result.bestTranscription.formattedString
                print("Recognized: \(self.recognizedText)")
            }
            if error != nil {
                self.stopRecognition()
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) {(buffer, _) in
            recognitionRequest.append(buffer)
        }
        audioEngine.prepare()
        try? audioEngine.start()
    }
    func stopRecognition() {
        audioEngine.stop()
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
        
        onStop?(recognizedText)
    }
    
}
