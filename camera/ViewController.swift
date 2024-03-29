//
//  ViewController.swift
//  camera
//
//  Created by Kevin Chan on 7/6/19.
//  Copyright © 2019 Kevin Chan. All rights reserved.
//

import UIKit
import AVFoundation

var captureSession: AVCaptureSession?
var videoPreviewLayer: AVCaptureVideoPreviewLayer?

class ViewController: UIViewController {
    @IBOutlet weak var viewfinder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video);
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            viewfinder.layer.addSublayer(videoPreviewLayer!)
            captureSession?.startRunning()
        } catch {
            print(error)
        }
        
        
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        videoPreviewLayer?.frame = self.viewfinder.bounds
    }


}

