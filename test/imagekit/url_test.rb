require_relative "./helper"
require "rspec/autorun"

RSpec.configure do |config|
  config.before(:each) do
    @private_key = PRIVATE_KEY
    @public_key = PUBLIC_KEY
    @url_endpoint = URL_ENDPOINT
  end

  config.after(:each) do
  
  end
end

RSpec.describe "TestGenerateUrl" do
  it "test_request_init" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    expect(request_obj.private_key).to eq(@private_key)
  end
  
  it "test_generate_url_without_transformations" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "/default-image.jpg",
      url_endpoint: @url_endpoint,
    }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://imagekit.io/your-imgekit-id/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end

  it "test_generate_url_with_path" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "/default-image.jpg",
      url_endpoint: @url_endpoint,
      transformation: [{height: 300, width: 400}],
    }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end

  it "test_generate_url_with_path_with_special_characters" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "/γειασας/Fjällräven_KnSJwp87u6q.png",
      url_endpoint: @url_endpoint,
      transformation: [{height: 300, width: 400}],
    }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/γειασας/Fjällräven_KnSJwp87u6q.png?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end
  
  it "test_generate_url_without_slash" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)
    options = {path: "default-image.jpg",
      url_endpoint: @url_endpoint,
      transformation: [{height: 300, width: 400}],
    }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end

  it "test_generate_url_with_path_without_slash_with_special_characters" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "γειασας/Fjällräven_KnSJwp87u6q.png",
      url_endpoint: @url_endpoint,
      transformation: [{height: 300, width: 400}],
    }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/γειασας/Fjällräven_KnSJwp87u6q.png?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end
  
  it "test_generate_url_with_override_url_endpoint_without_slash" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)
    options = {path: "/default-image.jpg",
      url_endpoint: "https://ik.imagekit.io/your_override_imagekit_id",
      transformation: [{height: 300, width: 400}],
    }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://ik.imagekit.io/your_override_imagekit_id/tr:h-300,w-400/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end

  it "test_generate_url_with_override_url_endpoint_without_slash_with_special_characters" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)
    options = {path: "/γειασας/Fjällräven_KnSJwp87u6q.png",
      url_endpoint: "https://ik.imagekit.io/your_override_imagekit_id",
      transformation: [{height: 300, width: 400}],
    }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://ik.imagekit.io/your_override_imagekit_id/tr:h-300,w-400/γειασας/Fjällräven_KnSJwp87u6q.png?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end
  
  it "test_generate_url_with_override_url_endpoint_with_slash" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "/default-image.jpg",
      url_endpoint: "https://ik.imagekit.io/your_override_imagekit_id/",
      transformation: [{height: 300, width: 400}],
    }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://ik.imagekit.io/your_override_imagekit_id/tr:h-300,w-400/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end

  it "test_generate_url_with_override_url_endpoint_with_slash_with_special_characters" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)
    options = {path: "/γειασας/Fjällräven_KnSJwp87u6q.png",
      url_endpoint: "https://ik.imagekit.io/your_override_imagekit_id/",
      transformation: [{height: 300, width: 400}],
    }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://ik.imagekit.io/your_override_imagekit_id/tr:h-300,w-400/γειασας/Fjällräven_KnSJwp87u6q.png?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end

  it "test_generate_url_with_override_url_endpoint_with_special_characters" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)
    options = {path: "/γειασας/Fjällräven_KnSJwp87u6q.png",
      url_endpoint: "https://www.Fjällräven.com/your_override_imagekit_id/",
      transformation: [{height: 300, width: 400}],
    }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://www.Fjällräven.com/your_override_imagekit_id/tr:h-300,w-400/γειασας/Fjällräven_KnSJwp87u6q.png?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end

  it "test_generate_url_with_new_transformation_parameters" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "default-image.jpg",
      url_endpoint: @url_endpoint,
      transformation: [{height: 300, width: 400},{new_params: 100}],
    }
    url = url_obj.generate_url(options)
    expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400:new_params-100/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end
  
  it "test_generate_url_should_have_ik_sdk_version" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "default-image.jpg",
      url_endpoint: @url_endpoint,
      transformation: [{height: 300, width: 400},]
    }
    url = url_obj.generate_url(options)
    expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end

  it "test_generate_url_should_have_transformation_parameters" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "default-image.jpg",
      url_endpoint: @url_endpoint,
      transformation: [{
      height: 300,
      width: 400,
      aspect_ratio: '4-3',
      quality: 40,
      crop: 'force',
      crop_mode: 'extract',
      focus: 'left',
      format: 'jpeg',
      radius: 50,
      bg: "A94D34",
      border: "5-A94D34",
      rotation: 90,
      blur: 10,
      named: "some_name",
      overlay_x: 35,
      overlay_y: 35,
      overlay_focus: "bottom",
      overlay_height: 20,
      overlay_width: 20,
      overlay_image: "/folder/file.jpg",
      overlay_image_trim: false,
      overlay_image_aspect_ratio: "4:3",
      overlay_image_background: "0F0F0F",
      overlay_image_border: "10_0F0F0F",
      overlay_image_DPR: 2,
      overlay_image_quality: 50,
      overlay_image_cropping: "force",
      overlay_text: "two words",
      overlay_text_font_size: 20,
      overlay_text_font_family: "Open Sans",
      overlay_text_color: "00FFFF",
      overlay_text_transparency: 5,
      overlay_text_typography: "b",
      overlay_background: "00AAFF55",
      overlay_text_encoded: "b3ZlcmxheSBtYWRlIGVhc3k%3D",
      overlay_text_width: 50,
      overlay_text_background: "00AAFF55",
      overlay_text_padding: 40,
      overlay_text_inner_alignment: "left",
      overlay_radius: 10,
      progressive: true,
      lossless: true,
      trim: 5,
      metadata: true,
      color_profile: true,
      default_image: "/folder/file.jpg",
      dpr: 3,
      effect_sharpen: 10,
      effect_usm: "2-2-0.8-0.024",
      effect_contrast: true,
      effect_gray: true,
      original: true,
      },]
    }
    url = url_obj.generate_url(options)
    expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400,ar-4-3,q-40,c-force,cm-extract,fo-left,f-jpeg,r-50,bg-A94D34,b-5-A94D34,rt-90,bl-10,n-some_name,ox-35,oy-35,ofo-bottom,oh-20,ow-20,oi-folder@@file.jpg,oit-false,oiar-4:3,oibg-0F0F0F,oib-10_0F0F0F,oidpr-2,oiq-50,oic-force,ot-two words,ots-20,otf-Open Sans,otc-00FFFF,oa-5,ott-b,obg-00AAFF55,ote-b3ZlcmxheSBtYWRlIGVhc3k%3D,otw-50,otbg-00AAFF55,otp-40,otia-left,or-10,pr-true,lo-true,t-5,md-true,cp-true,di-folder@@file.jpg,dpr-3,e-sharpen-10,e-usm-2-2-0.8-0.024,e-contrast-true,e-grayscale-true,orig-true/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end
  
  it "test_generate_url_with_chained_transformation" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "default-image.jpg",
      url_endpoint: @url_endpoint,
      transformation: [{height: 300, width: 400},{rotation: 90}],
    }
    url = url_obj.generate_url(options)
    expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400:rt-90/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end
  
  it "test_generate_url_transformation_parameters_setted_to_query" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "default-image.jpg",
      url_endpoint: @url_endpoint,
      transformation: [{height: 300, width: 400}],
      transformation_position: "query",
     }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://imagekit.io/your-imgekit-id/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}&tr=h-300,w-400")
  end

  it "test_generate_url_with_special_characters_transformation_parameters_setted_to_query" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "/γειασας/Fjällräven_KnSJwp87u6q.png",
      url_endpoint: @url_endpoint,
      transformation: [{height: 300, width: 400}],
      transformation_position: "query",
     }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://imagekit.io/your-imgekit-id/γειασας/Fjällräven_KnSJwp87u6q.png?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}&tr=h-300,w-400")
  end
  
  it "test_generate_url_with_query_parameters" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "/default-image.jpg",
      query_parameters: {"v": "123", "blank_parameter": ""},
      transformation: [{height: 300, width: 400}]
    }
    url = url_obj.generate_url(options)
    
    expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}&v=123&blank_parameter")
  end

  it "test_generate_url_with_query_parameters_with_special_characters" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "/default-image.jpg",
      query_parameters: {"γειασας": "γειασας"},
      transformation: [{height: 300, width: 400}]
    }
    url = url_obj.generate_url(options)
    
    expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}&γειασας=γειασας")
  end

  it "test_generate_url_with_src_checking_query_param_added" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {src: "https://ik.imagekit.io/ldt7znpgpjs/test_YhNhoRxWt.jpg?another=abc&xyz=888",
      transformation: [{height: "300",width: "400",}],
      query_parameters: {"v": "123"},
    }

    url = url_obj.generate_url(options)
    expect(url).to eq("https://ik.imagekit.io/ldt7znpgpjs/test_YhNhoRxWt.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}&another=abc&xyz=888&v=123&tr=h-300,w-400")
  end

  it "test_generate_url_with_path_checking_query_param_added" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "/test_YhNhoRxWt.jpg?another=abc&xyz=888",
      transformation: [{height: "300",width: "400",}],
      query_parameters: {"v": "123"},
    }

    url = url_obj.generate_url(options)
    expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/test_YhNhoRxWt.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}&another=abc&xyz=888&v=123")
  end
  
  it "test_generate_url_with_src" do
    # Test url generation with src param
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {src: "https://ik.imagekit.io/ldt7znpgpjs/test_YhNhoRxWt.jpg",
      transformation: [{height: "300",
                        width: "400",
                        format: "jpg",
                        progressive: "true",
                        effect_sharpen: "-",
                        effect_contrast: "1",},
                       {rotation: 90},],
      transformation_position: "query"}

    url = url_obj.generate_url(options)
    
    expect(url).to eq("https://ik.imagekit.io/ldt7znpgpjs/test_YhNhoRxWt.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}&tr=h-300,w-400,f-jpg,pr-true,e-sharpen,e-contrast-1:rt-90")

  end

  it "test_generate_url_with_src_with_special_characters" do
    # Test url generation with src param
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {src: "https://www.Fjällräve.com/γειασας/Fjällräven_KnSJwp87u6q.png",
      transformation: [{height: "300",
                        width: "400",
                        format: "jpg",
                        progressive: "true",
                        effect_sharpen: "-",
                        effect_contrast: "1",},
                       {rotation: 90},],
      transformation_position: "query"}

    url = url_obj.generate_url(options)
    
    expect(url).to eq("https://www.Fjällräve.com/γειασας/Fjällräven_KnSJwp87u6q.png?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}&tr=h-300,w-400,f-jpg,pr-true,e-sharpen,e-contrast-1:rt-90")

  end

  it "test_generate_url_with_src_and_query_parameters_is_path" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {src: "https://ik.imagekit.io/ldt7znpgpjs/test_YhNhoRxWt.jpg",
      transformation: [{height: "300",
                        width: "400",
                        format: "jpg",
                        progressive: "true",
                        effect_sharpen: "-",
                        effect_contrast: "1",},
                       {rotation: 90},],
      transformation_position: "path"}

    url = url_obj.generate_url(options)

    expect(url).to eq("https://ik.imagekit.io/ldt7znpgpjs/test_YhNhoRxWt.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}&tr=h-300,w-400,f-jpg,pr-true,e-sharpen,e-contrast-1:rt-90")
  end
  
  it "test_generate_url_with_path_and_signed" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "/default-image.jpg",
      url_endpoint: "https://ik.imagekit.io/your_imagekit_id/endpoint/",
      transformation: [{height: "300", width: "400"}],
      signed: true,}

    url = url_obj.generate_url(options)

    expect(url).to include("https://ik.imagekit.io/your_imagekit_id/endpoint/tr:h-300,w-400/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}&ik-s=")
  end

  it "test_generate_url_with_path_and_signed_with_special_characters" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "/Fjällräven_KnSJwp87u6q.png",
      url_endpoint: "https://ik.imagekit.io/your_imagekit_id/endpoint/",
      transformation: [{height: "300", width: "400"}],
      signed: true,}

    url = url_obj.generate_url(options)

    expect(url).to include("https://ik.imagekit.io/your_imagekit_id/endpoint/tr:h-300,w-400/Fjällräven_KnSJwp87u6q.png?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}&ik-s=")
  end

  it "test_url_with_invalid_args_returns_as_it_is" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "/default-image.jpg",
      url_endpoint: @url_endpoint,
      transformation: [{height: "300", fake_field: "400"}],
    }
    url = url_obj.generate_url(options)

    expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,fake_field-400/default-image.jpg?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}")
  end
  
  it "test_url_without_path_and_src_should_return_empty" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {url_endpoint: @url_endpoint,
      transformation: {height: "300", width: 400},
      signed: true,
    }
    url = url_obj.generate_url(options)
    expect(url.to_s).to eq("")
  end
  
  it "test_url_with_invalid_trans_pos" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    options = {path: "/default-image.jpg",
      url_endpoint: @url_endpoint,
      transformation: [{height: "300", fake: "400"}],
      transformation_position: "fake",
      signed: true,}

    expect{url_obj.generate_url(options)}.to raise_error(ArgumentError)
    
  end
  
  it "test_url_with_signed_without_seconds" do
    request_obj = ImageKitRequest.new('private_key_test', 'public_key_test', 'https://test-domain.com/test-endpoint')
    url_obj = Url.new(request_obj)

    options = {path: "/test-signed-url.png",
               transformation: [{width: 100}],
               signed: true,}
    url = url_obj.generate_url(options)

    expect(url).to include("https://test-domain.com/test-endpoint/tr:w-100/test-signed-url.png?ik-sdk-version=ruby-#{Imagekit::Sdk::VERSION}&ik-s=")
  end
  
  it "test_url_with_signed_with_seconds" do
    request_obj = ImageKitRequest.new('private_key_test', 'public_key_test', 'https://test-domain.com/test-endpoint')
    url_obj = Url.new(request_obj)

    options = {path: "/test-signed-url.png",
               transformation: [{width: 100}],
               expire_seconds: 100,
               signed: true}
    url = url_obj.generate_url(options)
    
    expect(url).to include("ik-t")
  end
  
  it "test_get_signature_with_100_expire_seconds" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    url = "https://test-domain.com/test-endpoint/tr:w-100/test-signed-url.png"
    signature = url_obj.get_signature("private_key_test",url,"https://test-domain.com/test-endpoint/",100)
    expect(signature).to eq("5e5037a31a7121cbe2964e220b4338cc6e1ba66d")
  end

  it "test_get_signature_expect_without_expire_seconds" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    url = "https://test-domain.com/test-endpoint/tr:w-100/test-signed-url.png"
    signature = url_obj.get_signature("private_key_test",url,"https://test-domain.com/test-endpoint/",0)

    expect(signature).to eq("41b3075c40bc84147eb71b8b49ae7fbf349d0f00")
  end

  it "test_get_signature_expect_without_expire_seconds_without_slash" do
    request_obj=ImageKitRequest.new(@private_key,@public_key,@url_endpoint)
    url_obj = Url.new(request_obj)

    url = "https://test-domain.com/test-endpoint/tr:w-100/test-signed-url.png"
    signature = url_obj.get_signature("private_key_test",url,"https://test-domain.com/test-endpoint",0)

    expect(signature).to eq("41b3075c40bc84147eb71b8b49ae7fbf349d0f00")
  end

end
