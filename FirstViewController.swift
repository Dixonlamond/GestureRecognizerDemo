//
//  FirstViewController.swift
//  GestureRecognizerDemo
//
//  Created by Lamond Dixon on 8/3/16.
//  Copyright © 2016 Lamond Dixon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController  {
  
  var squareView: UIView!

  override func viewDidLoad() {
    
    // This is setting up the blue square
    squareView = UIView(frame: CGRect(x: 150, y: 250, width: 100, height: 100))
    squareView.backgroundColor = UIColor.blueColor()
    view.addSubview(squareView)
    
    
    super.viewDidLoad()
    
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(FirstViewController.handlePan(_:)))
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.handleTap(_:)))
    let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(FirstViewController.handleRotation(_:)))
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(FirstViewController.handlePinch(_:)))
    let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(FirstViewController.handleSwipe(_:)))
    let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(FirstViewController.handleLongPress(_:)))

    
    squareView.gestureRecognizers = [panGesture, tapGesture, rotateGesture, pinchGesture, swipeGesture, longPressGesture]
    
  }

  
  // this should follgow the user finger when they touch the blueSquare
  func handlePan (recognizer: UIPanGestureRecognizer) {
    let translationInView = recognizer.translationInView(self.view)
    recognizer.view!.center = CGPoint(x: view.center.x + translationInView.x, y: view.center.y + translationInView.y)
    
    
     }
  
  // everytime the user taps on the box it will change colors
  func handleTap(gesture: UITapGestureRecognizer) {
    let tapAlert = UIAlertController(title: "Tap", message: "You just tapped to change the color", preferredStyle: UIAlertControllerStyle.Alert)
    tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
    self.presentViewController(tapAlert, animated: true, completion: nil)
    //let red = CGFloat(drand48())
    //let green = CGFloat(drand48())
    //let blue = CGFloat(drand48())
    //gesture.view?.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
  }
  
  func handleRotation(recognizer: UIRotationGestureRecognizer) {
    if let view = recognizer.view {
      view.transform = CGAffineTransformRotate(view.transform, recognizer.rotation)
      recognizer.rotation = 0
    }
  }
  
  func handlePinch(recognizer : UIPinchGestureRecognizer) {
    if let view = recognizer.view {
      view.transform = CGAffineTransformScale(view.transform, recognizer.scale, recognizer.scale)
        recognizer.scale = 1
    }
  }
  
  func handleSwipe(recognizer : UISwipeGestureRecognizer) {
    let tapAlert = UIAlertController(title: "swiped", message: "You just swiped he swipe view.", preferredStyle: UIAlertControllerStyle.Alert)
    tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
    self.presentViewController(tapAlert, animated: true, completion: nil)
  }
  
  func handleLongPress(recognizer : UILongPressGestureRecognizer) {
    let tapAlert = UIAlertController(title: "Long Pressed", message: "You just long pressed.", preferredStyle: UIAlertControllerStyle.Alert)
    tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
    self.presentViewController(tapAlert, animated: true, completion: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

