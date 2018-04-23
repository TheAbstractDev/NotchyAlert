Pod::Spec.new do |s|
  s.name         = "NotchyAlert"
  s.version      = "1.0"
  s.summary      = "Use the iPhone X notch space to display creative alerts."

  s.homepage 	 = 'https://github.com/TheAbstractDev/NotchyAlert'
  s.author       = { "Sofiane Beors (TheAbstractDev)" => "theabstractdev@gmail.com" }
  s.license      = "MIT"
  s.source       = { :git => "https://github.com/TheAbstractDev/NotchyAlert.git", :tag => "v1.0" }

  s.source_files  = "NotchyAlert", "NotchyAlert/**/*.{h,m}"
  s.framework  	  = "UIKit"

  s.platform = :ios
  s.ios.deployment_target = "11.0"

end