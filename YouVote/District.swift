//  UVote
//
//  Nicholas Wetta
//  Austin Mestayer
//  Brian Gates

import UIKit
import Firebase

//Class that handles the User finding and/or selecting the district for a given election
class District: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var keyboardHeight:CGRect?
    
    @IBOutlet weak var HeaderText: UITextField!
    @IBOutlet weak var LocationStack: UIStackView!
    
    let DistrictPickerView = UIPickerView()
    @IBOutlet weak var DistrictPicker: UITextField!

    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var City: UITextField!
    @IBOutlet weak var ZIPCode: UITextField!
    
    var DistrictSelection:[String] = []
    
    
    //To setup pickerview, the number of components must be selected. There is only one option for the User to select.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //To setup pickerview, the number of rows is populated by the array containing the different districts.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DistrictSelection.count
    }
    
    //To setup pickerview, the name of each row is set to the value of the array containing the different districts.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DistrictSelection[row]
    }
    
    //Handles when the User swaps from one item to another in the pickerview
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        GlobalVariables.Variables.CurrentDistrict = DistrictSelection[row]
        DistrictPicker.text = GlobalVariables.Variables.CurrentDistrict
        
    }

    
    
    
    //Method to add or removes previously saved values when View Controller becomes active
    override func viewWillAppear(_ animated: Bool) {
        
        GlobalVariables.Variables.Names.removeAll()
        GlobalVariables.Variables.Summary.removeAll()
        GlobalVariables.Variables.Party.removeAll()
        GlobalVariables.Variables.ImageLink.removeAll()
        
        GlobalVariables.Variables.ProLife.removeAll()
        GlobalVariables.Variables.ProChoice.removeAll()
        GlobalVariables.Variables.ClimateChange.removeAll()
        GlobalVariables.Variables.ProGunControl.removeAll()
        GlobalVariables.Variables.Pro2ndAmendment.removeAll()
        GlobalVariables.Variables.ProTrump.removeAll()
        GlobalVariables.Variables.ProLGBTQRights.removeAll()
        GlobalVariables.Variables.DecriminalizingMarijuana.removeAll()
        GlobalVariables.Variables.SinglePayerHealthcare.removeAll()
        
    }
    
    //Method to setup view when it is displayed
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(District.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(District.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        if (GlobalVariables.Variables.CurrentElection == "Louisiana House of Representatives") {
            DistrictSelection = ["District 1", "District 2", "District 3", "District 4", "District 5", "District 6", "District 7", "District 8", "District 9", "District 10", "District 11", "District 12", "District 13", "District 14", "District 15", "District 16", "District 17", "District 18", "District 19", "District 20", "District 21", "District 22", "District 23", "District 24", "District 25", "District 26", "District 27", "District 28", "District 29", "District 30", "District 31", "District 32", "District 33", "District 34", "District 35", "District 36", "District 37", "District 38", "District 39", "District 40", "District 41", "District 42", "District 43", "District 44", "District 45", "District 46", "District 47", "District 48", "District 49", "District 50", "District 51", "District 52", "District 53", "District 54", "District 55", "District 56", "District 57", "District 58", "District 59", "District 60", "District 61", "District 62", "District 63", "District 64", "District 65", "District 66", "District 67", "District 68", "District 69", "District 70", "District 71", "District 72", "District 73", "District 74", "District 75", "District 76", "District 77", "District 78", "District 79", "District 80", "District 81", "District 82", "District 83", "District 84", "District 85", "District 86", "District 87", "District 88", "District 89", "District 90", "District 91", "District 92", "District 93", "District 94", "District 95", "District 96", "District 97", "District 98", "District 99", "District 100", "District 101", "District 102", "District 103", "District 104", "District 105"]
        }
        else if (GlobalVariables.Variables.CurrentElection == "Louisiana Senate") {
            DistrictSelection = ["District 1", "District 2", "District 3", "District 4", "District 5", "District 6", "District 7", "District 8", "District 9", "District 10", "District 11", "District 12", "District 13", "District 14", "District 15", "District 16", "District 17", "District 18", "District 19", "District 20", "District 21", "District 22", "District 23", "District 24", "District 25", "District 26", "District 27", "District 28", "District 29", "District 30", "District 31", "District 32", "District 33", "District 34", "District 35", "District 36", "District 37", "District 38", "District 39"]
        }
        else {
            DistrictSelection = ["District 1", "District 2", "District 3", "District 4", "District 5", "District 6"]
        }
        
        DistrictPickerView.backgroundColor = UIColor.white
        DistrictPickerView.delegate = self
        DistrictPickerView.dataSource = self
        
        self.Address.delegate = self
        self.City.delegate = self
        self.ZIPCode.delegate = self
        self.DistrictPicker.delegate = self
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let toolbarDone = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneTapped))
        toolbar.setItems([flexSpace, toolbarDone], animated: false)
        
        DistrictPicker.inputView = DistrictPickerView;
        DistrictPicker.inputAccessoryView = toolbar;
        
        //Grab Default Value
        GlobalVariables.Variables.CurrentDistrict = DistrictSelection[0]
        DistrictPicker.text = GlobalVariables.Variables.CurrentDistrict
        
        HeaderText.text = GlobalVariables.Variables.CurrentElection + " " + "Districts"
        
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight!.height, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    @objc func doneTapped() {
        print(DistrictPickerView.selectedRow(inComponent: 0))
        view.endEditing(true)
    }

    //Method to proceed to next View Controller
    @IBAction func NavigateForward(_ sender: Any) {
        
        //Access Database to gather the information needed to populate the next View Controller
        let db = Firestore.firestore().collection(GlobalVariables.Variables.CurrentElection + " Districts" + "/" + GlobalVariables.Variables.CurrentDistrict + "/" + "Candidates")

        db.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in snapshot!.documents {
                    let Name:String = document.documentID
                    GlobalVariables.Variables.Names.append(Name)
                    GlobalVariables.Variables.Party.append(document.get("Party") as! String)
                    GlobalVariables.Variables.Summary.append(document.get("Summary") as! String)
                    if (document.get("Image") != nil) {
                        GlobalVariables.Variables.ImageLink.append(document.get("Image") as! String)
                    }
                    else {
                        GlobalVariables.Variables.ImageLink.append("")
                    }
                    
                    //FILTERS
                    if (document.get("Pro Life") != nil) {
                        GlobalVariables.Variables.ProLife.append(document.get("Pro Life") as! Bool)
                    }
                    else {
                        GlobalVariables.Variables.ProLife.append(false)
                    }
                    
                    if (document.get("Pro Choice") != nil) {
                        GlobalVariables.Variables.ProChoice.append(document.get("Pro Choice") as! Bool)
                    }
                    else {
                        GlobalVariables.Variables.ProChoice.append(false)
                    }
                    
                    if (document.get("Climate Change") != nil) {
                        GlobalVariables.Variables.ClimateChange.append(document.get("Climate Change") as! Bool)
                    }
                    else {
                        GlobalVariables.Variables.ClimateChange.append(false)
                    }
                    
                    if (document.get("Pro Gun Control") != nil) {
                        GlobalVariables.Variables.ProGunControl.append(document.get("Pro Gun Control") as! Bool)
                    }
                    else {
                        GlobalVariables.Variables.ProGunControl.append(false)
                    }
                    
                    if (document.get("Pro 2nd Amendment") != nil) {
                        GlobalVariables.Variables.Pro2ndAmendment.append(document.get("Pro 2nd Amendment") as! Bool)
                    }
                    else {
                        GlobalVariables.Variables.Pro2ndAmendment.append(false)
                    }
                    
                    if (document.get("Pro Trump") != nil) {
                        GlobalVariables.Variables.ProTrump.append(document.get("Pro Trump") as! Bool)
                    }
                    else {
                        GlobalVariables.Variables.ProTrump.append(false)
                    }
                    
                    if (document.get("Pro LGBTQ Rights") != nil) {
                        GlobalVariables.Variables.ProLGBTQRights.append(document.get("Pro LGBTQ Rights") as! Bool)
                    }
                    else {
                        GlobalVariables.Variables.ProLGBTQRights.append(false)
                    }
                    
                    if (document.get("Decriminalizing Marijuana") != nil) {
                        GlobalVariables.Variables.DecriminalizingMarijuana.append(document.get("Decriminalizing Marijuana") as! Bool)
                    }
                    else {
                        GlobalVariables.Variables.DecriminalizingMarijuana.append(false)
                    }
                    
                    if (document.get("Single Payer Healthcare") != nil) {
                        GlobalVariables.Variables.SinglePayerHealthcare.append(document.get("Single Payer Healthcare") as! Bool)
                    }
                    else {
                        GlobalVariables.Variables.SinglePayerHealthcare.append(false)
                    }
                    
                }
                
                self.performSegue(withIdentifier: "Select Candidate", sender: self)
                
            }
        }

    }
    
    //Method to Find the District based on the Address, City, and Zipcode that the User enters
    @IBAction func FindDistrict(_ sender: Any) {
        
        if (Address.text != nil && City.text != nil && ZIPCode.text != nil) {
            
            var address:String = Address.text!
            var city:String = City.text!
            var zipcode:String = ZIPCode.text!
            
            address = address.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            city = city.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            zipcode = zipcode.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            
            if let url = URL(string: "http://legis.la.gov/Legis/FindMyLegislators.aspx?addr=" + address + "&city=" + city + "&zip=" + zipcode) {
                do {
                    //If Currently On House Elections
                    if (GlobalVariables.Variables.CurrentElection == "Louisiana House of Representatives") {
                        let contents = try String(contentsOf: url)
                        if (contents.contains("Louisiana House District ")) {
                            let num = FindStringIndex(string: contents, substring: "Louisiana House District ")
                            DistrictPickerView.selectRow(num-1, inComponent: 0, animated: true)
                            GlobalVariables.Variables.CurrentDistrict = DistrictSelection[num-1]
                            DistrictPicker.text = GlobalVariables.Variables.CurrentDistrict
                        }
                    }
                    //If Currently On Senate Elections
                    else if (GlobalVariables.Variables.CurrentElection == "Louisiana Senate") {
                        let contents = try String(contentsOf: url)
                        if (contents.contains("Louisiana Senate District ")) {
                            let num = FindStringIndex(string: contents, substring: "Louisiana Senate District ")
                            DistrictPickerView.selectRow(num-1, inComponent: 0, animated: true)
                            GlobalVariables.Variables.CurrentDistrict = DistrictSelection[num-1]
                            DistrictPicker.text = GlobalVariables.Variables.CurrentDistrict
                        }
                    }
                    //If Currently On U.S. Congress Elections
                    else if (GlobalVariables.Variables.CurrentElection == "U.S. Congress") {
                        let contents = try String(contentsOf: url)
                        if (contents.contains("Louisiana Senate District ")) {
                            let num = FindStringIndex(string: contents, substring: "U.S. Congress District ")
                            DistrictPickerView.selectRow(num-1, inComponent: 0, animated: true)
                            GlobalVariables.Variables.CurrentDistrict = DistrictSelection[num-1]
                            DistrictPicker.text = GlobalVariables.Variables.CurrentDistrict
                        }
                    }
                    else {
                        print("Couldn't Find Information")
                    }
                } catch {
                    print("Couldn't Load Content")
                }
            } else {
                print("URL Was Bad!")
            }
            
        }
        
    }
    
    //Part of the method used to gather information related to the current District of the User in order to display it to them
    func FindStringIndex(string: String, substring: String) -> Int {
  
        var index:Int = 0
        var district:Int?
        
        // Loop through parent string looking for the first character of the substring
        for char in string {
            if substring.first == char {

                let startOfFoundCharacter = string.index(string.startIndex, offsetBy: index)
                let lengthOfFoundCharacter = string.index(string.startIndex, offsetBy: (substring.count + index))
                let range = startOfFoundCharacter..<lengthOfFoundCharacter
                
                if string[range] == substring {
                    let start = string.index(string.startIndex, offsetBy: substring.count + index)
                    var length = string.index(string.startIndex, offsetBy: (substring.count + index+3))
                    var range = start..<length
                    if let intFromText = Int(string[range]) {
                        print(intFromText)
                        district = intFromText
                    }
                    else {
                        length = string.index(string.startIndex, offsetBy: (substring.count + index+2))
                        range = start..<length
                        if let intFromText = Int(string[range]) {
                            print(intFromText)
                            district = intFromText
                        }
                        else {
                            length = string.index(string.startIndex, offsetBy: (substring.count + index+1))
                            range = start..<length
                            if let intFromText = Int(string[range]) {
                                print(intFromText)
                                district = intFromText
                            }
                        }
                    }
                    break
                }
                
            }
            index += 1
        }
        
        return district!
        
    }
    
    //Method to return to previous View Controller
    @IBAction func NavigateBackwards(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    
    
}

