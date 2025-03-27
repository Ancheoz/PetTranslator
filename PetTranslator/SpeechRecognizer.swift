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
    private var isErrorProcessing = false
    private var lastRecognizedText: String = ""
    
    @Published var recognizedText: String = ""
    var onStop: ((String) -> Void)?
    
    func startRecognition() {
        recognizedText = ""
        SFSpeechRecognizer.requestAuthorization { status in
            guard status == .authorized else {
                print("Have no access to microphone")
                return
                
            }
            DispatchQueue.main.async {
                self.setupAudioSession()
                self.startRecording()
            }
            
        }
    }
    
    func setupAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Ошибка настройки аудиосессии: \(error.localizedDescription)")
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
                let newText = result.bestTranscription.formattedString
                
                if newText.count > self.lastRecognizedText.count {
                    let difference = String(newText.dropFirst(self.lastRecognizedText.count)).trimmingCharacters(in: .whitespaces)
                    if !difference.isEmpty {
                        self.recognizedText += " " + difference
                    }
                }
                
                self.lastRecognizedText = newText
                print("Recognized: \(self.recognizedText)")
            }
            if let error = error {
                if self.isErrorProcessing { return }
                self.isErrorProcessing = true
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.stopRecognition()
                }
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
        
        
        onStop?(recognizedText)
        recognitionRequest?.endAudio()
        recognitionTask?.finish()
        recognitionTask?.cancel()
        recognitionTask = nil
        
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        print("RECOGNITION STOPPED")
    }
    
}
