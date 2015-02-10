Pod::Spec.new do |s|
  s.name             = "ABSegmentedViewController"
  s.version          = "0.4.0"
  s.summary          = "A stylized, flat segmented control driven view controller container."
  s.description      = "A stylized, flat segmented control driven view controller container designed for iPhone Meant for two tabs and two view controllers. Titles will look offset if more than two tabs are used."
  s.homepage         = "https://github.com/abouzek/ABSegmentedViewController.git"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "abouzek" => "alan.bouzek@gmail.com" }
  s.source           = { :git => "https://github.com/abouzek/ABSegmentedViewController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/alanbouzek'

  s.platform     = :ios, '7.1'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resources = ['Pod/Assets/ABSegmentedViewController.xib']
  s.resource_bundles = {
    'ABSegmentedViewController' => ['Pod/Assets/*.png']
  }
end
