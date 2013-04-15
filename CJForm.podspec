Pod::Spec.new do |s|
  s.name         = "CJForm"
  s.version      = "0.1"
  s.summary      = "CJForm, create simple form in app iOS."
  s.homepage     = "https://github.com/batosai/CJForm"
  s.license      = 'MIT'
  s.author       = { "Jeremy Chaufourier" => "jeremy@opsone.net" }
  s.source       = { :git => "https://github.com/batosai/CJForm.git", :tag => "0.1" }
  s.platform     = :ios, '5.0'
  s.source_files = 'CJForm'
  s.requires_arc = true
  s.dependency 'CJStringValidator', '~> 1.0.1'
  s.dependency 'GCPlaceholderTextView', '~> 1.0.1'
end