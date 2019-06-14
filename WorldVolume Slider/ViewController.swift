//
//  ViewController.swift
//  WorldVolume Slider
//
//  Created by Eric Dolecki on 10/2/18.
//  Copyright © 2018 Eric Dolecki. All rights reserved.
//

import UIKit

/*
    This is a test slider to noodle on until it's alright
    to integrate into the World Volume prototype for testing.
 */
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    let reuseIdentifier = "cell"
    //var items  = ["0","1","2","3","4","5","6","7","8","9","10","11"]
    var items2 = ["0","1","2","3","4","5","6","7","8","9","10"] // This is the one to use. 0-10.
    //var items3 = ["Off","1","2","3","4","5","6","7","8","9","10","11"]
    
    // Favorite dots on 1, 6, and 12 (each control).
    
    var sliderIndex: Int = 1 //Which labels to use in the UI.
    var selectedIndex: Int = 0
    @IBOutlet var modeLabel: UILabel!
    @IBOutlet var centerView: UIView!

    //Custom Slider.
    @IBOutlet var mySlider: CustomSlider!
    var sliderStepValue = 1
    @IBOutlet var sliderLabel: UILabel!
    @IBOutlet var star: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Notified from an extension that cell snapping is complete. So we can modify the cell to show this.
        NotificationCenter.default.addObserver(self, selector: #selector(sliderSnapped(notification:)), name: .myNotification, object: nil)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        centerView.layer.borderColor = UIColor.black.cgColor
        centerView.layer.borderWidth = 1.0
        centerView.layer.cornerRadius = 10.0
        centerView.layer.masksToBounds = true
        centerView.backgroundColor = UIColor.clear
        
        // The control needs to be built before we start manipulating it.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.defaultToValue(index: 4)
        }
        
        //Slider Code.
        let leftImage = UIImage(named:"sliderBlack")?.resizableImage(withCapInsets: UIEdgeInsets.zero)  //Will not stretch.
        let rightImage = UIImage(named:"sliderGrey")?.resizableImage(withCapInsets: UIEdgeInsets.zero)  //Will not stretch.
        mySlider.setMaximumTrackImage(rightImage, for: .normal)
        mySlider.setMinimumTrackImage(leftImage, for: .normal)
        mySlider.setThumbImage(UIImage(named:"thumb"), for: .normal)
        star.isHidden = true
    }
    
    @IBAction func toggleMode(sender: UIButton)
    {
        sliderIndex = sliderIndex + 1
        if sliderIndex > 2 {
            sliderIndex = 0
        }
        modeLabel.text = "MODE \(sliderIndex)"
        collectionView.reloadData()
    }
    
    func defaultToValue(index: Int) {
        selectedIndex = index
        unhighlightAllCells()
        let indexPath = IndexPath(item: index, section: 0)
        let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        cell.myLabel.textColor = UIColor.black
        collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
    }

    @objc func sliderSnapped(notification: Notification)
    {
        if let index = notification.userInfo?["value"] as? Int
        {
            selectedIndex = index
            unhighlightAllCells()
            let indexPath = IndexPath(item: index, section: 0)
            let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
            cell.myLabel.textColor = UIColor.black
            cell.myDot.image = UIImage(named:"blackDot")
            print("sel: \(index)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(items.count)
        return items2.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        cell.myLabel.text = self.items2[indexPath.item]
        
        //if sliderIndex == 0 {
        //    cell.myLabel.text = self.items[indexPath.item]
        //} else if sliderIndex == 1 {
        //    cell.myLabel.text = self.items2[indexPath.item]
        //} else if sliderIndex == 2 {
        //    cell.myLabel.text = self.items3[indexPath.item]
        //}
        
        if selectedIndex == indexPath.item {
            cell.myLabel.textColor = UIColor.black
        } else {
            cell.myLabel.textColor = UIColor.lightGray
        }
        cell.backgroundColor = UIColor.white
        cell.myDot.image = UIImage(named:"greyDot")
 
        
        //FIXME: I think at times 12 loses it's dot. Need to check on that.
        //FIXME: Josh wants favs on slider to be grey and only black when you've gone past them in the line.
        
        if indexPath.item != 0 && indexPath.item != 5 && indexPath.item != 11 {
            cell.myDot.isHidden = true
        } else {
            cell.myDot.isHidden = false
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        selectedIndex = indexPath.item
        unhighlightAllCells()
        let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        cell.myLabel.textColor = UIColor.black
        cell.myDot.image = UIImage(named:"blackDot")
        
        collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        print("selection \(selectedIndex)")
    }
    
    func unhighlightAllCells()
    {
        for cell in collectionView.visibleCells as! [MyCollectionViewCell] {
            cell.myLabel.textColor = UIColor.lightGray
            cell.myDot.image = UIImage(named:"greyDot")
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        unhighlightAllCells()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.collectionView.scrollToNearestVisibleCollectionViewCell()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.collectionView.scrollToNearestVisibleCollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        cell.myLabel.textColor = UIColor.lightGray
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        cell.myLabel.textColor = UIColor.black
        cell.myDot.image = UIImage(named:"blackDot")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Special Slider Code. Custom Class FYI.
    
    // We are not providing continuous updates - just on release.
    @IBAction func mySliderChanged(_ sender: CustomSlider)
    {
        let newStep = Int(round(sender.value)) / sliderStepValue
        let myAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14) ]
        let myString = NSMutableAttributedString(string: "World Volume: ", attributes: myAttribute )
        let myAttribute2 = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14) ]
        let myString2 = NSMutableAttributedString(string: "\(newStep)", attributes: myAttribute2 )
        myString.append(myString2)
        sliderLabel.attributedText = myString
        if newStep == 1 || newStep == 6 || newStep == 12 {
            star.isHidden = false
        } else {
            star.isHidden = true
        }
        // Change the color of the favorite in the 6th position.
        if newStep > 6 {
            sender.pos6.backgroundColor = UIColor.black
        } else {
            sender.pos6.backgroundColor = UIColor(hex: 0xCCCCCC)
        }
    }
    
    @IBAction func mySliderStoppedDragging(_ sender: CustomSlider)
    {
        let newStep = Int(round(sender.value)) / sliderStepValue
        sender.value = Float(newStep * sliderStepValue) //Snap.
        let myAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14) ]
        let myString = NSMutableAttributedString(string: "World Volume: ", attributes: myAttribute )
        let myAttribute2 = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14) ]
        let myString2 = NSMutableAttributedString(string: "\(Int(sender.value))", attributes: myAttribute2 )
        myString.append(myString2)
        sliderLabel.attributedText = myString
        if newStep == 1 || newStep == 6 || newStep == 12 {
            star.isHidden = false
        } else {
            star.isHidden = true
        }
    }
    
    // MARK: - Typicals
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

