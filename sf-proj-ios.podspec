Pod::Spec.new do |s|
  s.name             = 'sf-proj-ios'
  s.version          = '3.0.1'
  s.license          =  {:type => 'MIT', :file => 'LICENSE' }
  s.summary          = 'iOS SDK for Simple Features Projection'
  s.homepage         = 'https://github.com/ngageoint/simple-features-proj-ios'
  s.authors          = { 'NGA' => '', 'BIT Systems' => '', 'Brian Osborn' => 'bosborn@caci.com' }
  s.social_media_url = 'https://twitter.com/NGA_GEOINT'
  s.source           = { :git => 'https://github.com/ngageoint/simple-features-proj-ios.git', :tag => s.version }
  s.requires_arc     = true

  s.platform         = :ios, '8.0'
  s.ios.deployment_target = '8.0'

  s.source_files = 'sf-proj-ios/**/*.{h,m}'

  s.exclude_files = 'sf-proj-ios/**/Info.plist'
  s.resource_bundle = { 'sf-proj-ios' => ['sf-proj-ios/**/*.plist'] }
  s.frameworks = 'Foundation'

  s.dependency 'sf-ios', '~> 3.0.0'
  s.dependency 'proj4-ios', '~> 4.9.3'
end
