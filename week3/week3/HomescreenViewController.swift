//
//  HomescreenViewController.swift
//  week3
//
//  Created by Angel Steger on 9/29/15.
//  Copyright © 2015 Angel Steger. All rights reserved.
//

import UIKit

class HomescreenViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    
    // Holds the editable message
    @IBOutlet weak var messageContainerView: UIView!
    // Actual message sitting in the container
    @IBOutlet weak var messageView: UIImageView!
    
    // Create placeholder variables so everything has a starting place
    var originalMessageCenter: CGPoint!
    var originalLaterIconCenter: CGPoint!
    var originalArchiveIconCenter: CGPoint!
    var originalDeleteIconCenter: CGPoint!
    var originalListIconCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Scroll View
        scrollView.contentSize = CGSize(width: 320, height: 1367)
        
        //Set initial values
        listIcon.alpha = 0
        deleteIcon.alpha = 0
        messageContainerView.backgroundColor = UIColor.grayColor()
        
        originalMessageCenter = messageView.center
        originalLaterIconCenter = laterIcon.center
        originalListIconCenter = listIcon.center
        originalArchiveIconCenter = archiveIcon.center
        originalDeleteIconCenter = deleteIcon.center
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Pan Gesture Recognizer
    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            originalMessageCenter.x = messageView.center.x
            print("Gesture began at: \(point)")
            
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            messageView.center.x = CGFloat(originalMessageCenter.x + translation.x)
            print("Gesture changed at: \(point)")
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
