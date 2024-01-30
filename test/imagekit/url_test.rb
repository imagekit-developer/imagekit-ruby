require_relative "./spec_helper"
require "rspec/autorun"

RSpec.describe ImageKitIo::Url do
  let(:request_obj) { ImageKitIo::Request.new(@private_key, @public_key, @url_endpoint) }
  let(:url_obj) { ImageKitIo::Url.new(request_obj) }

  before(:each) do
    @private_key = 'private_key_xyz'
    @public_key = 'public_key_xyz'
    @url_endpoint = 'https://imagekit.io/your-imgekit-id'
  end
  describe "TestGenerateUrl" do
    it "test_request_init" do
      expect(request_obj.private_key).to eq(@private_key)
    end

    it "test_generate_url_without_transformations" do

      options = { path: "/default-image.jpg",
                  url_endpoint: @url_endpoint,
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://imagekit.io/your-imgekit-id/default-image.jpg")
    end

    it "test_generate_url_with_path" do

      options = { path: "/default-image.jpg",
                  url_endpoint: @url_endpoint,
                  transformation: [{ height: 300, width: 400 }],
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/default-image.jpg")
    end

    it "test_generate_url_with_path_with_special_characters" do

      options = { path: "/γειασας/Fjällräven_KnSJwp87u6q.png",
                  url_endpoint: @url_endpoint,
                  transformation: [{ height: 300, width: 400 }],
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/γειασας/Fjällräven_KnSJwp87u6q.png")
    end

    it "test_generate_url_without_slash" do
      options = { path: "default-image.jpg",
                  url_endpoint: @url_endpoint,
                  transformation: [{ height: 300, width: 400 }],
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/default-image.jpg")
    end

    it "test_generate_url_with_path_without_slash_with_special_characters" do

      options = { path: "γειασας/Fjällräven_KnSJwp87u6q.png",
                  url_endpoint: @url_endpoint,
                  transformation: [{ height: 300, width: 400 }],
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/γειασας/Fjällräven_KnSJwp87u6q.png")
    end

    it "test_generate_url_with_override_url_endpoint_without_slash" do
      options = { path: "/default-image.jpg",
                  url_endpoint: "https://ik.imagekit.io/your_override_imagekit_id",
                  transformation: [{ height: 300, width: 400 }],
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://ik.imagekit.io/your_override_imagekit_id/tr:h-300,w-400/default-image.jpg")
    end

    it "test_generate_url_with_override_url_endpoint_without_slash_with_special_characters" do
      options = { path: "/γειασας/Fjällräven_KnSJwp87u6q.png",
                  url_endpoint: "https://ik.imagekit.io/your_override_imagekit_id",
                  transformation: [{ height: 300, width: 400 }],
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://ik.imagekit.io/your_override_imagekit_id/tr:h-300,w-400/γειασας/Fjällräven_KnSJwp87u6q.png")
    end

    it "test_generate_url_with_override_url_endpoint_with_slash" do

      options = { path: "/default-image.jpg",
                  url_endpoint: "https://ik.imagekit.io/your_override_imagekit_id/",
                  transformation: [{ height: 300, width: 400 }],
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://ik.imagekit.io/your_override_imagekit_id/tr:h-300,w-400/default-image.jpg")
    end

    it "test_generate_url_with_override_url_endpoint_with_slash_with_special_characters" do
      options = { path: "/γειασας/Fjällräven_KnSJwp87u6q.png",
                  url_endpoint: "https://ik.imagekit.io/your_override_imagekit_id/",
                  transformation: [{ height: 300, width: 400 }],
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://ik.imagekit.io/your_override_imagekit_id/tr:h-300,w-400/γειασας/Fjällräven_KnSJwp87u6q.png")
    end

    it "test_generate_url_with_override_url_endpoint_with_special_characters" do
      options = { path: "/γειασας/Fjällräven_KnSJwp87u6q.png",
                  url_endpoint: "https://www.Fjällräven.com/your_override_imagekit_id/",
                  transformation: [{ height: 300, width: 400 }],
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://www.Fjällräven.com/your_override_imagekit_id/tr:h-300,w-400/γειασας/Fjällräven_KnSJwp87u6q.png")
    end

    it "test_generate_url_with_new_transformation_parameters" do

      options = { path: "default-image.jpg",
                  url_endpoint: @url_endpoint,
                  transformation: [{ height: 300, width: 400 }, { new_params: 100 }],
      }
      url = url_obj.generate_url(options)
      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400:new_params-100/default-image.jpg")
    end

    it "test_generate_url_should_have_ik_sdk_version" do

      options = { path: "default-image.jpg",
                  url_endpoint: @url_endpoint,
                  transformation: [{ height: 300, width: 400 },]
      }
      url = url_obj.generate_url(options)
      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/default-image.jpg")
    end

    it "test_generate_url_should_have_transformation_parameters" do

      options = { path: "default-image.jpg",
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
                                     effect_shadow: 'bl-15_st-40_x-10_y-N5',
                                     effect_gradient: 'from-red_to-white',
                                     original: true,
                                     raw: 'w-200,h-200'
                                   },]
      }
      url = url_obj.generate_url(options)
      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400,ar-4-3,q-40,c-force,cm-extract,fo-left,f-jpeg,r-50,bg-A94D34,b-5-A94D34,rt-90,bl-10,n-some_name,pr-true,lo-true,t-5,md-true,cp-true,di-folder@@file.jpg,dpr-3,e-sharpen-10,e-usm-2-2-0.8-0.024,e-contrast-true,e-grayscale-true,e-shadow-bl-15_st-40_x-10_y-N5,e-gradient-from-red_to-white,orig-true,w-200,h-200/default-image.jpg")
    end

    it "test_generate_url_with_chained_transformation" do

      options = { path: "default-image.jpg",
                  url_endpoint: @url_endpoint,
                  transformation: [{ height: 300, width: 400 }, { rotation: 90 }],
      }
      url = url_obj.generate_url(options)
      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400:rt-90/default-image.jpg")
    end

    it "test_generate_url_transformation_parameters_setted_to_query" do

      options = { path: "default-image.jpg",
                  url_endpoint: @url_endpoint,
                  transformation: [{ height: 300, width: 400 }],
                  transformation_position: "query",
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://imagekit.io/your-imgekit-id/default-image.jpg?tr=h-300,w-400")
    end

    it "test_generate_url_with_special_characters_transformation_parameters_setted_to_query" do

      options = { path: "/γειασας/Fjällräven_KnSJwp87u6q.png",
                  url_endpoint: @url_endpoint,
                  transformation: [{ height: 300, width: 400 }],
                  transformation_position: "query",
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://imagekit.io/your-imgekit-id/γειασας/Fjällräven_KnSJwp87u6q.png?tr=h-300,w-400")
    end

    it "test_generate_url_with_query_parameters" do

      options = { path: "/default-image.jpg",
                  query_parameters: { "v": "123", "blank_parameter": "" },
                  transformation: [{ height: 300, width: 400 }]
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/default-image.jpg?v=123&blank_parameter")
    end

    it "test_generate_url_with_query_parameters_with_special_characters" do

      options = { path: "/default-image.jpg",
                  query_parameters: { "γειασας": "γειασας" },
                  transformation: [{ height: 300, width: 400 }]
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/default-image.jpg?γειασας=γειασας")
    end

    it 'test_generate_url_with_absolute_path' do
      options = { path: "https://example.com/external-image.jpg",
                  query_parameters: { "γειασας": "γειασας" },
                  transformation: [{ height: 300, width: 400 }]
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/https%3A%2F%2Fexample.com%2Fexternal-image.jpg?γειασας=γειασας")
    end

    it "test_generate_url_with_src_checking_query_param_added" do

      options = { src: "https://ik.imagekit.io/ldt7znpgpjs/test_YhNhoRxWt.jpg?another=abc&xyz=888",
                  transformation: [{ height: "300", width: "400", }],
                  query_parameters: { "v": "123" },
      }

      url = url_obj.generate_url(options)
      expect(url).to eq("https://ik.imagekit.io/ldt7znpgpjs/test_YhNhoRxWt.jpg?another=abc&xyz=888&v=123&tr=h-300,w-400")
    end

    it "test_generate_url_with_path_checking_query_param_added" do

      options = { path: "/test_YhNhoRxWt.jpg?another=abc&xyz=888",
                  transformation: [{ height: "300", width: "400", }],
                  query_parameters: { "v": "123" },
      }

      url = url_obj.generate_url(options)
      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/test_YhNhoRxWt.jpg?another=abc&xyz=888&v=123")
    end

    it "test_generate_url_with_src" do
      # Test url generation with src param

      options = { src: "https://ik.imagekit.io/ldt7znpgpjs/test_YhNhoRxWt.jpg",
                  transformation: [{ height: "300",
                                     width: "400",
                                     format: "jpg",
                                     progressive: "true",
                                     effect_sharpen: "-",
                                     effect_contrast: "1", },
                                   { rotation: 90 },],
                  transformation_position: "query" }

      url = url_obj.generate_url(options)

      expect(url).to eq("https://ik.imagekit.io/ldt7znpgpjs/test_YhNhoRxWt.jpg?tr=h-300,w-400,f-jpg,pr-true,e-sharpen,e-contrast-1:rt-90")

    end

    it "test_generate_url_with_src_with_special_characters" do
      # Test url generation with src param

      options = { src: "https://www.Fjällräve.com/γειασας/Fjällräven_KnSJwp87u6q.png",
                  transformation: [{ height: "300",
                                     width: "400",
                                     format: "jpg",
                                     progressive: "true",
                                     effect_sharpen: "-",
                                     effect_contrast: "1", },
                                   { rotation: 90 },],
                  transformation_position: "query" }

      url = url_obj.generate_url(options)

      expect(url).to eq("https://www.Fjällräve.com/γειασας/Fjällräven_KnSJwp87u6q.png?tr=h-300,w-400,f-jpg,pr-true,e-sharpen,e-contrast-1:rt-90")

    end

    it "test_generate_url_with_src_and_query_parameters_is_path" do

      options = { src: "https://ik.imagekit.io/ldt7znpgpjs/test_YhNhoRxWt.jpg",
                  transformation: [{ height: "300",
                                     width: "400",
                                     format: "jpg",
                                     progressive: "true",
                                     effect_sharpen: "-",
                                     effect_contrast: "1", },
                                   { rotation: 90 },],
                  transformation_position: "path" }

      url = url_obj.generate_url(options)

      expect(url).to eq("https://ik.imagekit.io/ldt7znpgpjs/test_YhNhoRxWt.jpg?tr=h-300,w-400,f-jpg,pr-true,e-sharpen,e-contrast-1:rt-90")
    end

    it "test_generate_url_with_path_and_signed" do

      options = { path: "/default-image.jpg",
                  url_endpoint: "https://ik.imagekit.io/your_imagekit_id/endpoint/",
                  transformation: [{ height: "300", width: "400" }],
                  signed: true, }

      url = url_obj.generate_url(options)

      expect(url).to include("https://ik.imagekit.io/your_imagekit_id/endpoint/tr:h-300,w-400/default-image.jpg?ik-s=")
    end

    it "test_generate_url_with_path_and_signed_with_special_characters" do

      options = { path: "/Fjällräven_KnSJwp87u6q.png",
                  url_endpoint: "https://ik.imagekit.io/your_imagekit_id/endpoint/",
                  transformation: [{ height: "300", width: "400" }],
                  signed: true, }

      url = url_obj.generate_url(options)

      expect(url).to include("https://ik.imagekit.io/your_imagekit_id/endpoint/tr:h-300,w-400/Fjällräven_KnSJwp87u6q.png?ik-s=")
    end

    it 'test_generate_url_with_absolute_path_and_signed' do
      allow(url_obj).to receive(:get_signature_timestamp).with(5) { 100 }
      options = { path: "https://example.com/external-image.jpg",
                  query_parameters: { "γειασας": "γειασας" },
                  transformation: [{ height: 300, width: 400 }],
                  signed: true,
                  expire_seconds: 5
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/https%3A%2F%2Fexample.com%2Fexternal-image.jpg?γειασας=γειασας&ik-s=44c1295edb1dbc1d59216fba8994b4d3a36c61e2&ik-t=100")
    end

    it "test_url_with_invalid_args_returns_as_it_is" do

      options = { path: "/default-image.jpg",
                  url_endpoint: @url_endpoint,
                  transformation: [{ height: "300", fake_field: "400" }],
      }
      url = url_obj.generate_url(options)

      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,fake_field-400/default-image.jpg")
    end

    it "test_url_without_path_and_src_should_return_empty" do

      options = { url_endpoint: @url_endpoint,
                  transformation: { height: "300", width: 400 },
                  signed: true,
      }
      url = url_obj.generate_url(options)
      expect(url.to_s).to eq("")
    end

    it "test_url_with_invalid_trans_pos" do

      options = { path: "/default-image.jpg",
                  url_endpoint: @url_endpoint,
                  transformation: [{ height: "300", fake: "400" }],
                  transformation_position: "fake",
                  signed: true, }

      expect { url_obj.generate_url(options) }.to raise_error(ArgumentError)

    end

    it "test_url_with_signed_without_seconds" do
      request_obj = ImageKitIo::Request.new('private_key_test', 'public_key_test', 'https://test-domain.com/test-endpoint')
      url_obj = ImageKitIo::Url.new(request_obj)

      options = { path: "/test-signed-url.png",
                  transformation: [{ width: 100 }],
                  signed: true, }
      url = url_obj.generate_url(options)

      expect(url).to include("https://test-domain.com/test-endpoint/tr:w-100/test-signed-url.png?ik-s=")
    end

    it "test_url_with_signed_with_seconds" do
      request_obj = ImageKitIo::Request.new('private_key_test', 'public_key_test', 'https://test-domain.com/test-endpoint')
      url_obj = ImageKitIo::Url.new(request_obj)

      options = { path: "/test-signed-url.png",
                  transformation: [{ width: 100 }],
                  expire_seconds: 100,
                  signed: true }
      url = url_obj.generate_url(options)

      expect(url).to include("ik-t")
    end

    it "test_get_signature_with_100_expire_seconds" do

      url = "https://test-domain.com/test-endpoint/tr:w-100/test-signed-url.png"
      signature = url_obj.get_signature("private_key_test", url, "https://test-domain.com/test-endpoint/", 100)
      expect(signature).to eq("5e5037a31a7121cbe2964e220b4338cc6e1ba66d")
    end

    it "test_get_signature_expect_without_expire_seconds" do

      url = "https://test-domain.com/test-endpoint/tr:w-100/test-signed-url.png"
      signature = url_obj.get_signature("private_key_test", url, "https://test-domain.com/test-endpoint/", 0)

      expect(signature).to eq("41b3075c40bc84147eb71b8b49ae7fbf349d0f00")
    end

    it "test_get_signature_expect_without_expire_seconds_without_slash" do

      url = "https://test-domain.com/test-endpoint/tr:w-100/test-signed-url.png"
      signature = url_obj.get_signature("private_key_test", url, "https://test-domain.com/test-endpoint", 0)

      expect(signature).to eq("41b3075c40bc84147eb71b8b49ae7fbf349d0f00")
    end

  end
end
