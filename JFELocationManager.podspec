#
# Be sure to run `pod lib lint JFELocationManager.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JFELocationManager"
  s.version          = "0.1.1"
  s.summary          = "JFELocationManager is a CLLocationManager wrapper."

  s.description      = <<-DESC
                        JFELocationManager is a CLLocationManager wrapper that enable a really simple usage of location and heading update in your app instead of allocating a CLLocationManager object on each view.

                        * JFELocationManagerDelegate -> three methods that will be called on heading, location or status updates
                        * delegate vs importantDelegate -> be able to know if you have to stop background update or not

                        DESC

  s.homepage         = "https://github.com/jfreyre/JFELocationManager"
  s.license          = 'MIT'
  s.author           = { "Jérome Freyre" => "jerome.freyre@gmail.com" }
  s.source           = { :git => "https://github.com/jfreyre/JFELocationManager.git", :branch => 'master', :tag => '0.1.1'}
  # s.social_media_url = 'https://twitter.com/j_freyre'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*.{h,m}'
  s.framework  = 'CoreLocation'

  s.public_header_files = 'Pod/Classes/*.h'
  s.frameworks = 'CoreLocation'

end
