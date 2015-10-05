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
        laterIcon.alpha = 0
        listIcon.alpha = 0
        archiveIcon.alpha = 0
        deleteIcon.alpha = 0
        //messageContainerView.backgroundColor = UIColor.grayColor()
        
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
        
        
        //Begin panning, set the original center
        if sender.state == UIGestureRecognizerState.Began {
            originalMessageCenter.x = messageView.center.x
            print("Gesture began at: \(point)")
            
        //As the message is dragged, update the center to include the new translated distance
        } else if sender.state == UIGestureRecognizerState.Changed {
            messageView.center.x = CGFloat(originalMessageCenter.x + translation.x)
          

            //print("Gesture changed at: \(point)")
            //print("message view center is: \(messageView.center)")

            //left short swipe of 60pts or fewer, later icon doesn't move
            if (messageView.center.x < 160 && messageView.center.x > 100) {
                laterIcon.alpha = 0.5
                listIcon.alpha = 0
                messageContainerView.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            }
            //left swipe between 60 and 260pts, later icon moves with message view
            else if (messageView.center.x < 100 && messageView.center.x > -100) {
                laterIcon.alpha = 1
                laterIcon.center.x = messageView.center.x + 190
                listIcon.alpha = 0
                messageContainerView.backgroundColor = UIColor(red: 250/255, green: 211/255, blue: 51/255, alpha: 1)
            }
            //left swipe between 260 and 320pts, change to list icon
            else if (messageView.center.x < -100 && messageView.center.x > -160) {
                laterIcon.alpha = 0
                listIcon.alpha = 1
                listIcon.center.x = messageView.center.x + 190
                messageContainerView.backgroundColor = UIColor(red: 216/255, green: 166/255, blue: 117/255, alpha: 1)
            }
            //right swipe of 60pts or fewer, archive icon doesn't move
            else if (messageView.center.x > 160 && messageView.center.x < 220) {
                archiveIcon.alpha = 0.5
                deleteIcon.alpha = 0
                messageContainerView.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            }
            //right swipe between 60pts and 260pts, archive icon moves with message view
            else if (messageView.center.x > 220 && messageView.center.x < 420) {
                archiveIcon.alpha = 1
                archiveIcon.center.x = messageView.center.x - 190
                deleteIcon.alpha = 0
                messageContainerView.backgroundColor = UIColor(red: 112/255, green: 217/255, blue: 98/255, alpha: 1)
            }
            //right swipe between 260pts and 320pts, change to delete icon
            else if (messageView.center.x > 420 && messageView.center.x < 480) {
                archiveIcon.alpha = 0
                deleteIcon.alpha = 1
                deleteIcon.center.x = messageView.center.x - 190
                messageContainerView.backgroundColor = UIColor(red: 235/255, green: 84/255, blue: 51/255, alpha: 1)
            }
        }
        
        
        else if sender.state == UIGestureRecognizerState.Ended {
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
