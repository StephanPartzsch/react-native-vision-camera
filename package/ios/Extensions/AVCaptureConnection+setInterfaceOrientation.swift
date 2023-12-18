//
//  AVCaptureConnection+setInterfaceOrientation.swift
//  VisionCamera
//
//  Created by Marc Rousavy on 26.07.21.
//  Copyright © 2021 mrousavy. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit

extension AVCaptureConnection {
    /**
     Sets the `videoOrientation` to the given `orientation` if video orientation / rotation angle is supported.
     */
    extension AVCaptureConnection {
      func setInterfaceOrientation(_ orientation: Orientation) {
        switch orientation {
        case .portrait:
            setVideoOrientation(90, .portrait)
        case .portraitUpsideDown:
            setVideoOrientation(270, .portraitUpsideDown)
        case .landscapeLeft:
            setVideoOrientation(180, .landscapeLeft)
        case .landscapeRight:
            setVideoOrientation(0, .landscapeRight)
        }
      }
        
      private func setVideoOrientation(_ angle: CGFloat, _ orientation: Orientation) {
        if #available(iOS 17.0, *) {
            guard isVideoRotationAngleSupported(angle) else { return }
            videoRotationAngle = angle
        } else {
            guard isVideoOrientationSupported else { return }
            videoOrientation = orientation.toAVCaptureVideoOrientation()
        }
      }
    }
}
