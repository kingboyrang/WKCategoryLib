#
# Be sure to run `pod lib lint WKCategoryLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WKCategoryLib' #库的名字
  s.version          = '0.0.2' #版本号，当私有库需要更新的时候只要修改这个值
  s.summary          = '分类库' #库的简介，pod search 显示在上面的介绍

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

#库的详细描述
  s.description      = <<-DESC
这是一个分类库.
                       DESC

#主页地址，pod search 会显示，一般填写仓库的地址就行了
  s.homepage         = 'https://github.com/wuchaorang.2008@163.com/WKCategoryLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  #开源协议，项目文件目录下需要有一个MIT开源协议文件，创建的时候默认就创建了这个，具体内容可以打开 LICENSE 查看
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  #作者名字、邮箱
  s.author           = { 'kingboyrang' => 'wuchaorang.2008@163.com' }
  #资源地址，pod install 的时候会根据这个地址去下载你的想要库，以及下载的版本，必须要跟s.version一致。
  s.source           = { :git => 'https://github.com/wuchaorang.2008@163.com/WKCategoryLib.git', :tag => s.version.to_s }
  s.social_media_url = 'https://weibo.com/u/2735662583'
  #库最低支持的系统版本
  s.ios.deployment_target = '9.0'
  #是否支持arc
  s.requires_arc = true

  #这个很重要，指定资源文件，前缀就是 .podspec 文件当前路径，只用写之后的路径，如 Classes/* 是指 Classes 文件夹下的所有文件，但不包括子文件夹里面的文件、Classes/**/* 是指包含所有 Classes 文件夹下的文件，包括子文件、Classes/**/*.{h,m} 是指包含所有 Classes 文件夹下的后缀为 .h 和 .m 的文件，也可以指定文件。
  s.source_files = 'WKCategoryLib/Classes/**/*'
  
  s.resource_bundles = {
    'WKCategoryLib' => ['WKCategoryLib/Assets/*.xcassets']
  }

  #公开的头文件，如果没有公开，用户在用的时候可能引不到响应的头文件
  # s.public_header_files = 'Pod/Classes/**/*.h'
  #需要依赖的框架
  s.frameworks = 'UIKit', 'Foundation', 'Security'
  #需要依赖的三方库
  # s.dependency 'AFNetworking', '~> 2.3'
  
  
  #这个是子依赖库，如果我们只是用 s.source_files 来指定文件，那么用户在 pod 下来之后所有的文件都在同一个目录下，没有子文件夹，如果想要分类，用 s.subspec，每一个 subspec 可以分一个子文件夹，但是记得一定要将 .h 文件通过 ss.public_header_files 公开，不然有可能会找不到头文件。
  #s.subspec 'UIKit' do |ss|
  #    ss.source_files = 'WKCategoryLib/Classes/UIKit/*.{h,m}'
  #end
  
  #s.subspec 'Category' do |ss|
  #    ss.source_files = 'WKCategoryLib/Classes/Category/*.{h,m}'
  #end

  
end
