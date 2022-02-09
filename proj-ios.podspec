Pod::Spec.new do |s|
  s.name             = 'proj-ios'
  s.version          = '1.0.3'
  s.license          =  {:type => 'MIT', :file => 'LICENSE' }
  s.summary          = 'iOS SDK for Projections'
  s.homepage         = 'https://github.com/ngageoint/projections-ios'
  s.authors          = { 'NGA' => '', 'BIT Systems' => '', 'Brian Osborn' => 'bosborn@caci.com' }
  s.social_media_url = 'https://twitter.com/NGA_GEOINT'
  s.source           = { :git => 'https://github.com/ngageoint/projections-ios.git', :tag => s.version }
  s.requires_arc     = true

  s.platform         = :ios, '12.0'
  s.ios.deployment_target = '12.0'

  s.source_files = 'proj-ios/**/*.{h,m}'

  s.exclude_files = 'proj-ios/**/Info.plist'
  s.resource_bundle = { 'proj-ios' => ['proj-ios/**/*.plist'] }
  s.frameworks = 'Foundation'

  s.dependency 'proj4-ios', '~> 4.9.3'
  s.dependency 'crs-ios', '~> 1.0.2'
end
