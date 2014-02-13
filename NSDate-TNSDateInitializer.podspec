#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name         = "NSDate-TNSDateInitializer"
  s.version      = "0.0.1"
  s.summary      = "NSDate category adding useful initializer"
  s.description  = <<-DESC
                   NSDate category adding useful initializer
                   DESC
  s.homepage     = "http://github.com/takuji31/NSDate-TNSDateInitializer"
  s.license      = 'MIT'
  s.author             = { "Takuji Nishibayashi" => "takuji31@gmail.com" }
  s.source       = { :git => "http://github.com/takuji31/NSDate-TNSDateInitializer.git", :tag => "0.0.1" }
  s.social_media_url = 'https://twitter.com/takuji31'

  # s.platform     = :ios, '5.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Assets'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
