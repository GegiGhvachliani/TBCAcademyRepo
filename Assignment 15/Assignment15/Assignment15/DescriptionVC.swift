
import UIKit

class DescriptionVC: UIViewController {
    //MARK: Properties
    var zodiacName: String = ""
    private var background: Background = Background()
    
    weak var MainDelegate: ColorChangerDelegate?
    
    private var zodiacSign: UIImageView = UIImageView()
    private var zodiacSignTitle: UILabel = UILabel()
    private var zodiacSignDescription: UILabel = UILabel()
    
    private var nextPageButton: UIButton = UIButton()
    
    private let geoToEng: [String : String] = [
        "ვერძი" : "aries",
        "კურო" : "taurus",
        "ტყუპები" : "gemini",
        "კირჩხიბი": "cancer",
        "ლომი": "leo",
        "ქალწული": "virgo",
        "სასწორი": "libra",
        "მორიელი": "scorpio",
        "მშვილდოსანი": "sagittarius",
        "თხის რქა": "capricorn",
        "მერწყული": "aquarius",
        "თევზები": "pisces"
    ]
    private let engToGeo: [String : String] = [
        "aries" : "ვერძი",
        "taurus" : "კურო",
        "gemini" : "ტყუპები",
        "cancer" : "კირჩხიბი",
        "leo" : "ლომი",
        "virgo" : "ქალწული",
        "libra" : "სასწორი",
        "scorpio" : "მორიელი",
        "sagittarius" : "მშვილდოსანი",
        "capricorn" : "თხის რქა",
        "aquarius" : "მერწყული",
        "pisces" :"თევზები"
    ]
    let zodiacText: [String: String] = [
        "aries" : "თუ თქვენ 21 მარტსა და 20 აპრილს შორის დაიბადეთ, ეს იმას ნიშნავს, რომ თქვენთი მზის ზოდიაქოს ნიშანი არის ვერძი. ვერძი ზოდიაქოს პირველი ნიშანი და ასევე პირველი ცეცხლის ნიშანია (ცეცხლის სტიქიის დანარჩენ ორ წარმომადგენელს ლომსა და მშვილდოსანს შორის).პლანეტა მარსის გავლენით, რომელიც ზოდიაქოს ამ ნიშნის მმართველად ითვლება, ვერძებს დაუშრეტელი ენერგია, გასაოცარი სიცოცხლისუნარიანობა და უჩვეულო ოპტიმიზმი ახასიათებთ. ამ ადამიანების ხასიათში ერთმანეთს ერწყმის, ბავშვური გულწრფელობა და ბრძოლისუნარიანობა, აგრესია და გულუბრყვილობა.",
        
        "taurus": "ადამიანები, რომელთაც ბედმა კუროს ზოდიაქოს ნიშნით დაბადება არგუნა წილად, როგორც წესი სხვებისგან მშვიდი, გაწონასწორებული და უშფოთველი იმიჯით გამოირჩევიან. მათი ცნობა გარეგნობის მიხედვით, ადვილზე ადვილი საქმეა. კარგი აღნაგობის, ძვალმსხვილი, ხშირად ჩასუქებული.. უჩვეულოდ ლამაზი, მეტყველი თვალებით და საოცრად ნათელი, მშვიდი მზერით. ბუნებაში იშვიათად შეხვდებით კუროს, რომელიც თქვენს ყურადღებას ნერვოზული საქციელით ან ხმაურიანი აურზაურით მიიპყრობს, თუ მაინც შეხვედრიხართ ამგვარ ეგზემპლარს დამერწმუნეთ, ყველა ეს ნაკლოვანებები, მის პირად რუკაში ვერძის, ლომის ან მშვილდოსნის დიდი გავლენის შედეგი იქნება.",
        
        "gemini": "ტყუპების ზოდიაქოს ნიშნით დაბადებული ადამიანები, ზოდიაქოს ამ ნიშნის სიმბოლოს -ხელიხელჩაკიდებული მითიური ძმების კასტორის და პოლუქსის მგსავსად, გაორებულობით გამოირჩევიან. ისინი, მრავალმხრივი, ცვალებადი, მოუსვენარი, ცნობისმოყვარე და მერყევი ბუნების პიროვნებები არიან. ტიპიური ტყუპს, მიუხედავად იმისა, რომ ხშირად საკუთარი თავის ვერაფერი გაუგია, გამუდმებით აინტერესებს სხვისი ცხოვრების დეტალები. ამ ადამიანებს ასევე ახასიათებთ, როგორც გარეგნობის, ისე შეხედულებებისა და ცხოვრებისეული ფასეულობების გამუდმებული ცვლა.",
        
        "cancer": "კირჩხიბის ზოდიაქოს ნიშნით, ყველაზე ამოუცნობი, მგრძნობიარე და ინტუიტიური ადამიანები იბადებიან. კირჩხიბს მთვარე მართავს, აქედან გამომდინარე მთვარის ფაზების შესაბამისად , ამ ადამანების ხასიათიც ანალოგიური ტემპებით და სიხშირით იცვლება. მთვარის გავლენითაა განპირობებული, ისიც რომ კირჩხიბების უმრავლესობას, ხშირად ესაჭიროება განმარტოება და საკუთარ თავში ჩაღრმავება. კირჩხიბს უზომოდ სათუთი და მგრძნობიარე ნერვული სისტემა გააჩნია. აქედან გამომდინარე, ეს ადამიანები განსაკუთრებული სიმძაფრით აღიქვამენ გარშემომყოფთა მხირდან მათდამი დამოკიდებულებას. ზოდიაქოს ამ ნიშნით დაბადებულები, ძლიერ მიჯაჭვულობას განიცდიან მშობლების და ზოგადად ოჯახური კერის მიმართ.",
        
        "leo": "„ადამიანი დღესასწაული“ - ასე შემიძლია, ორი სიტყვით დავახასიათო, ადამიანები რომელთაც ბედმა, ლომის ზოდიაქოს ნიშნით დაბადება არგუნა წილად. ლომი გულით იმართება, ამიტომ ზოდიაქოს ამ ნიშნის წარმამადგენლებისთვის, ცხოვრებაში ყველაფერი „გულზე გადის“. მათი გასაოცარი სიცოცხლისუნარიანობა, ენერგია და ტემპერამენტი ბევრ ადამიანზე სტიმულის მომცემად და პოზიტიურად მოქმედებს. შემთხვევითი როდია ის ფაქტი, რომ ლომებს შორის ბევრი ფსიქოლოგი, მასწავლებელი ან რელიგიური ლიდერი გვხვდება. თქმა არ უნდა, ლომებს უყვართ რჩევა-დარიგებების გაცემა და სხვებისთვის ჭკუის სწავლება. ამ ყველაფერს ისინი სიამოვნებით აკეთებენ და საკუთარი თავის რწმენა ერთი ორად უმაღლდებათ, თუკი საპირისპირო მხარეს მადლიერების გრძნობა და აპლოდისმენტები არ დააყოვნებს. ლომები კომუნიკაბელური, დინამიური და ეპატაჟური ნატურები არიან.",
        
        "virgo": "პლანეტა მერკურის გავლენის ქვეშ დაბადებული ქალწულები, მოწესრიგებულობით, უზადო პასუხისმგებლობის გრძნობით და წვრილმანების მიმართ გასაოცარი ყურადღებიანობით გამოირჩევიან. ზოდიაქოს სხვა ნიშნის წარმომადგენლებს შორის, ქალწულის ცნობა მისი უნაკლო ჩაცმულობით, დავარცხნილ-გაწკრიალებული გარეგნობით და ზრდილობიანი მანერებით შეიძლება. ქალწულებს შორის როგორც წესი, ტანმორჩილი ხალხი სჭარბობს. მათ შორის გიგანტს ან შესამჩნევად დიდი გაბარიტების მქონე ხალხს იშვიათად შეხვდებით. გამომდინარე იქედან, რომ ქალწულის ზოდიაქო, კუჭნაწლავის და ზოგადად საჭმლის მომნელებელ სისტემაზეა პასუხისმგებელი, ზოდიაქოს ამ ნიშნით დაბადებულ ადამიანებს, საკვების და ზოგადად ჯანსაღი კვების სფერო განსაკუთრებულად აღელვებთ და აინტერესებთ. იშვიათი არ არის არც ის ფაქტი, რომ ქალწულის ზოდიაქოს ნიშნით დაბადებულთა შორის, ბევრი ექიმი- დიეტოლოგი და ფარმაცევტი გვხვდება.",
        
        "libra": "სასწორის ზოდიაქოს ნიშნით დაბადებული ადამიანები, პლანეტა ვენერას გავლენის ქვეშ იმყოფებიან, რაც მათ ხასიათში თანდაყოლილ დიპლომატიის უანრს, ჰარმონიის და სილამაზის სიყვარულს განაპირობებს. სასწორების უმრავლესობა, როგორც გარეგნობით ისე ხასიათით, სასიამოვნო და კომუნიკაბელური ხალხია. ორივე სქესის სასწორებს, ძალიან უყვართ კამათი, შესაბამისად მათთვის უცხო არ არის სხვადასხვა სახის დისკუსიებსა და პოლემიკებში მონაწილეობის მიღების სიყვარული, თუმცა ასეთ შემთხვევაში, როგრც წესი სასწორი არა საკუთარ, არამედ საზოგადოებაში გავრცელებულ ამა თუ იმ მოსაზრებას იცავს. ხოლო, საკუთარი აზრის ქონა, რომელიც მყარ არგუმენტებზე იქნება დაფუძნებული, როგორც წესი სასწორებს იშვიათად ახასიათებთ.",
        
        "scorpio": "მორიელის ზოდიაქოს ნიშნით დაბადებულ ადამიანებს თანდაყოლილი სიმამაცე, პრინციპულობა, ამტანობა და გარშემომყოფებით გასაოცარი მანიპულაციის უნარი გააჩნიათ. ნებისმიერი ადამიანის დაბადებას, რომელიც 24 ოქტომბრიდან 22 ნოემბრის შუალედში ევლინება ქვეყანას, როგორც წესი, ოჯახსა და სანათესაოში ვინმეს გარდაცვალება უსწრებს წინ. ასტროლოგების აზრით მორიელში, არაერთი, არამედ ერთბაშად ორი ადამიანის სასიცოცხლო ენერგიაა თავმოყრილი, სწორედ ამით აიხსნება ალბათ, ის ფატალური მოვლენები, რაც მათ დაბადებას უძღვის წინ. მორიელების უმრავლესობისთვის დამახასიათებელი თვისებაა წარბშეუხრელად, თავისებური გულგრილობითაც კი შეხვდეს განსაცდელს. სწორედ ამ თვისების გამო იმსახურებენ ისინი, გარშემომყოფთა მხრიდან მოწიწებას და პატივისცემას",
        
        "sagittarius": "მშვილდოსნის ზოდიაქოს წარმატების და იღბლის მომტანი პლანეტა იუპიტერი მფარველობს. აქედან გამომდინარე, გასაკვირი არ არის ის ფაქტი, რომ ადამიანები, რომლებიც ზოდიაქოს ამ ნიშნით მოევლინენ ქვეყანას, უსაზღვრო ოპტიმიზმითა და პოზიტიური ხასიათის თვისებებით არიან დაჯილდოვებულნლი. საზოგადოებაში, მშვილდოსნის ცნობა ძალზე მარტივია მისი საქციელის და მანერების მიხედვით. თუ ვინმე მონდომებით ყვება სასაცილო ისტორიებს, ერთად შეჯგუფებული ხალხის ეპიცენტრში ან სრულიად შემთხვევით, ფურშეტის მაგიდა ამოაყირავა და სანამ დამლაგებელი მოვა, პირდაპირ იატაკზე მოახერხა, საღამოს „ინდური ფართის“ სტილიში გაგრძელება, აუცილებლად მშვილდოსანი იქნება.",
        
        "capricorn": "თხის რქის ზოდიაქოს ნიშნით როგორც წესი, ყველაზე პრინციპული, გასაოცარი ამტანობით გამორჩეული და უზომოდ შრომისმოყვარე ადამიანები იბადებიან. პლანეტა სატურნი, რომელიც ზოდიაქოს ამ ნიშნის მფარველად ითვლება, თავის შვილებს დისცილინირებულობას, მოვალეობის გამძაფრებულ შეგრძნებას და წესრიგის სიყვარულს ანიჭებს. ორივე სქესის თხის რქები, განსაკუთრებული მოთმინების უნარით და კარიერისტობით გამოირჩევიან. მათი უმრავლესობა, ჯერ კიდევ ღრმა ბავშვობიდან ისახავს მიზანს და როგორც კლდის მწვერვალისკენ მიმავალი ვაცი, ისეთივე მიზანსწრაფულობით მიიწევს წინ, ამ მიზნის ასახდენად.",
        
        "aquarius": "ადამიანები, რომლებიც მერწყულის ზოდიაქოს ნიშნით ევლინებიან ქვეყანას, ხასიათის მრავალმხრივობით გამოირჩევიან. მერწყულს ერთბაშად ორი პლანეტა მართავს, ბისექსუალური ენერგეტიკით დამუხტული ურანი და გამოკვეთილი მამაკაცური თვისებების მქონე სატურნი. აქედან გამომდინარე, ეს ადამიანები ერთის მხრივ ნოვატორები, რეფორმატორები და დრომოჭმული ტრადიციების წინააღმდეგ მებრძოლები არიან, მეორეს მხრივ კი სატურნის გავლენით, მათში პერიოდულად დეპრესიული განწყობა სჭარბობს, რაც მერწყულებს ხშირად განმარტოებისაკენ და იზოლაციისკენ უბიძგებს, რის გამოც გარშემომყოფთა შორის ამოუცნობ, მარტოსულ და ძნელად გასაგებ ადამიანებად ითვლებიან.",
        
        "pisces": "თევზები ზოდიაქოს ბოლო ნიშანია. აქედან გამომდინარე, ნუ გაგაკვირვებთ ის ფაქტი, თუ ამ ადამიანების ხასიათში წინამორბედი თერთმეტი ზოდიაქოს ნიშნისთვის დამახასიათებელ ამა თუ იმ თვისებას აღმოაჩენთ. პლანეტა ნეპტუნის გავლენაში მოქცეული ეს ადამიანები, გარდასახვის საოცარი უნარით და უძლიერესი ინტუიციით დააჯილდოვა ბუნებამ. თუმცა სწორედ ნეპტუნის ბუნდოვანი ენერგეტიკა განაპირობებს იმას, რომ მათ უმრავლესობას ხშირად გამოგონილ სამყაროში ურჩევნია ცხოვრება, ვიდრე რეალურ ყოველდღიურობაში."
    ]
    
    
    //MARK: Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupUI()
    }

    //MARK: Methods
    private func setupUI() {
        setupBackground()
        setupZodiacSign()
        setupZodiacSignTitle()
        setupZodiacSignDescription()
        setupNextPageButton()
    }
    
    private func setupBackground() {
        view.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            background.heightAnchor.constraint(equalTo: view.heightAnchor),
            background.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func setupZodiacSign() {
        view.addSubview(zodiacSign)
        zodiacSign.translatesAutoresizingMaskIntoConstraints = false
        
        zodiacSign.image = UIImage(named: geoToEng[zodiacName] ?? zodiacName )
        
        NSLayoutConstraint.activate([
            zodiacSign.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            zodiacSign.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height * (60.0 / 812)),
            zodiacSign.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 156.0 / 375),
            zodiacSign.heightAnchor.constraint(equalTo: zodiacSign.widthAnchor)
        ])
    }
    
    private func setupZodiacSignTitle() {
        view.addSubview(zodiacSignTitle)
        zodiacSignTitle.translatesAutoresizingMaskIntoConstraints = false
        
        zodiacSignTitle.text = engToGeo[zodiacName] ?? zodiacName
        zodiacSignTitle.textColor = .white
        zodiacSignTitle.font = UIFont(name: "Sylfaen", size:  UIScreen.main.bounds.height * (24.0 / 812))
        zodiacSignTitle.textAlignment = .center
        
        NSLayoutConstraint.activate([
            zodiacSignTitle.topAnchor.constraint(equalTo: zodiacSign.bottomAnchor, constant: UIScreen.main.bounds.height * (-20.0 / 812)),
            zodiacSignTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            zodiacSignTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 200 / 375),
            zodiacSignTitle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 35 / 375)
        ])
        
        
    }
    
    private func setupZodiacSignDescription() {
        view.addSubview(zodiacSignDescription)
        zodiacSignDescription.translatesAutoresizingMaskIntoConstraints = false
        
        zodiacSignDescription.text = zodiacText[geoToEng[zodiacName] ?? zodiacName]
        zodiacSignDescription.textColor = .gray
        zodiacSignDescription.font = UIFont(name: "Sylfaen", size: UIScreen.main.bounds.height * (15.0 / 812))
        zodiacSignDescription.numberOfLines = .min
        zodiacSignDescription.textAlignment = .left

       
        
        NSLayoutConstraint.activate([
            zodiacSignDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            zodiacSignDescription.topAnchor.constraint(equalTo: zodiacSignTitle.bottomAnchor),
            zodiacSignDescription.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 327.0 / 375),
            zodiacSignDescription.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 410.0 / 812)
        ])
    }
    
    private func setupNextPageButton() {
        view.addSubview(nextPageButton)
        nextPageButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextPageButton.setTitle("პოლარული ნიშანი", for: .normal)
        nextPageButton.titleLabel?.font = UIFont(name: "Sylfaen", size: UIScreen.main.bounds.height * (16.0 / 812))
        nextPageButton.backgroundColor = .violet
        nextPageButton.titleLabel?.textColor = .white
        nextPageButton.clipsToBounds = true
        nextPageButton.layer.cornerRadius = UIScreen.main.bounds.height * (15.0 / 812)
        
        NSLayoutConstraint.activate([
            nextPageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextPageButton.topAnchor.constraint(equalTo: zodiacSignDescription.bottomAnchor, constant: UIScreen.main.bounds.height * (1.0 / 812)),
            nextPageButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 335.0 / 375),
            nextPageButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 46.0 / 812)
        ])
        nextPageButton.addAction(UIAction(handler: { [weak self] action in
            self?.btnAction()
        }), for: .touchUpInside)
    }
    
    private func btnAction() {
        let nextVC = OppositeSignVC()
        nextVC.delegate = MainDelegate
        nextVC.signTitle = geoToEng[zodiacName] ?? zodiacName
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

