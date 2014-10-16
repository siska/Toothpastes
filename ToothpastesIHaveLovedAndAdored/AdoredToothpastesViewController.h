//
//  ViewController.h
//  ToothpastesIHaveLovedAndAdored
//
//  Created by S on 10/16/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdoredToothpastesViewController : UIViewController

@end

//step 1 - really simple stuff, just set up the table view and proto cell in storyboard, connected the delegate and datasource, changed the name in AdoredToothpastesViewController using the refactor, set up the tableview delegate methods in the adoredtoothpaste.m
//step 2 - added a Table View Controller in storyboard - we also added that add button to the previous view controller and used that to create a segue to the next view controller - we did all the normal table view stuff -set the name of the proto cell and changed the name fo the view controller to the name of the view controller file that we created of type UITableViewController
//step 2 - we then went through the new thing that we created - added JSON and other table view stuff
/*step 3 
 
  - this step was actually really easy - created and set up the unwind, within the unwind we called the adoredToothpaste method that we had included in the secondVC.h and set up in the 2ndVC.m - then in that unwind, we also put the thing from the adoredToothpaste into the array we had created in that firstVC and then set that up to display through its own cellForRowAtIndexPath
 
 - we added a whole mess of stuff
 - we wanted to create an unwind segue from the tableViewController to the original viewController 
    - in the first VC, we imported the .h of the second VC and then we added a new method titled unwindFromToothpasteViewController to get the unwind segue action *an important note is that this method had to start with IBAction and have passed back in a UIStoryBoard *
 - we also wanted to pass back whatever the selected row was and add it to an array so that we could - we added a new method called adoredToothpaste to the .h file -we added it here so that it could be called by the first VC and get the selected thing back - this is why we imported the second h file into the first VC - so what we could call the method
 - in the unwind segue method - we said that we knew the VC was going to be that second VC and then we called the adoredToothpaste on that second VC in the unwind place - we put what was returned into an NSMutableArray that we created (and initialized on viewDidLoad) and then loaded that thing on the bottom of the cellForRowAtIndexPath
 
 the second can just be called even though it doesnt know about the first?
 */
//step 4 - we added 3 new methods below, we created them ourselves - documentsDirectory, load, and save - we called the load in view did load and then did the if to make sure the array is initialized if this is the first time that someone opens it
//step 4 - called the save method in the unwind portion since that's when the array will be updated
// - go over what happens in each later

//step 5 - NSUserDefaults is how you do user onboarding - at the bottom of the code, we added the user defaults information to be able to know the time of the last save - it's not related to the plist stuff, just stored in the same methods
//singletons - for things that only have one instance - NSUserDefaults only has one instance, all of these pointers go to the same thing








