//  UVote
//
//  Nicholas Wetta
//  Austin Mestayer
//  Brian Gates

import UIKit
import Firebase
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var player = AVAudioPlayer()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        
        //PLAY SOUND
        
        let path = Bundle.main.path(forResource: "App Launch Music", ofType : "mp3")!
        let url = URL(fileURLWithPath : path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.volume = 0.2
            player.play()
            
        } catch {
            
            print ("There is an issue with this code!")
            
        }
        
        
        
        //LOAD FAVORITES
        
        let defaults = UserDefaults.standard
        
        //Transition
        if (defaults.object(forKey: "FavoriteNames") != nil) {
            GlobalVariables.Variables.FavoritesNames = defaults.array(forKey: "FavoriteNames") as! [String]
            GlobalVariables.Variables.FavoritesParty = defaults.array(forKey: "FavoriteParty") as! [String]
            GlobalVariables.Variables.FavoritesSummary = defaults.array(forKey: "FavoriteSummary") as! [String]
            GlobalVariables.Variables.FavoritesImageLink = defaults.array(forKey: "FavoriteImageLink") as! [String]
        }
        
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

