# frozen_string_literal: true

require_relative "../../test_helper"

class AdvancedURLGenerationTest < Minitest::Test
  def setup
    @client = Imagekitio::Client.new(
      private_key: "My Private API Key"
    )
  end

  # AI Transformation Tests
  def test_should_generate_the_correct_url_for_ai_background_removal_when_set_to_true
    transformation = [
      Imagekitio::Models::Transformation.new(
        ai_remove_background: true
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=e-bgremove"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_for_external_ai_background_removal_when_set_to_true
    transformation = [
      Imagekitio::Models::Transformation.new(
        ai_remove_background_external: true
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=e-removedotbg"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_when_ai_drop_shadow_transformation_is_set_to_true
    transformation = [
      Imagekitio::Models::Transformation.new(
        ai_drop_shadow: true
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=e-dropshadow"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_when_gradient_transformation_is_set_to_true
    transformation = [
      Imagekitio::Models::Transformation.new(
        gradient: true
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=e-gradient"
    assert_equal(expected, url)
  end

  def test_should_not_apply_ai_background_removal_when_value_is_not_true
    transformation = [
      Imagekitio::Models::Transformation.new
      # AIRemoveBackground: false, # This would be the case for false values

    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg"
    assert_equal(expected, url)
  end

  def test_should_not_apply_external_ai_background_removal_when_value_is_not_true
    transformation = [
      Imagekitio::Models::Transformation.new
      # AIRemoveBackgroundExternal: false, # This would be the case for false values

    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg"
    assert_equal(expected, url)
  end

  def test_should_handle_ai_transformations_with_parameters
    transformation = [
      Imagekitio::Models::Transformation.new(
        ai_drop_shadow: "custom-shadow-params"
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=e-dropshadow-custom-shadow-params"
    assert_equal(expected, url)
  end

  def test_should_handle_gradient_with_parameters
    transformation = [
      Imagekitio::Models::Transformation.new(
        gradient: "ld-top_from-green_to-00FF0010_sp-1"
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=e-gradient-ld-top_from-green_to-00FF0010_sp-1"
    assert_equal(expected, url)
  end

  def test_should_combine_ai_transformations_with_regular_transformations
    transformation = [
      Imagekitio::Models::Transformation.new(
        width: 300.0,
        height: 200.0,
        ai_remove_background: true
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=w-300,h-200,e-bgremove"
    assert_equal(expected, url)
  end

  def test_should_handle_multiple_ai_transformations
    transformation = [
      Imagekitio::Models::Transformation.new(
        ai_remove_background: true,
        ai_drop_shadow: true
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=e-bgremove,e-dropshadow"
    assert_equal(expected, url)
  end

  # Parameter-specific tests
  def test_should_generate_the_correct_url_for_width_transformation_when_provided_with_a_number_value
    transformation = [
      Imagekitio::Models::Transformation.new(
        width: 400.0
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=w-400"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_for_height_transformation_when_provided_with_a_string_value
    transformation = [
      Imagekitio::Models::Transformation.new(
        height: "300"
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=h-300"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_for_aspect_ratio_transformation_when_provided_with_colon_format
    transformation = [
      Imagekitio::Models::Transformation.new(
        aspect_ratio: "4:3"
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=ar-4:3"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_for_quality_transformation_when_provided_with_a_number_value
    transformation = [
      Imagekitio::Models::Transformation.new(
        quality: 80.0
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=q-80"
    assert_equal(expected, url)
  end

  # Additional parameter validation tests from Node.js SDK
  def test_should_skip_transformation_parameters_that_are_undefined_or_empty
    transformation = [
      Imagekitio::Models::Transformation.new(
        width: 300.0
        # Quality is not set - should be ignored
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=w-300"
    assert_equal(expected, url)
  end

  def test_should_handle_boolean_transformation_values
    transformation = [
      Imagekitio::Models::Transformation.new(
        trim: true
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=t-true"
    assert_equal(expected, url)
  end

  def test_should_handle_transformation_parameter_with_empty_string_value
    transformation = [
      Imagekitio::Models::Transformation.new(
        default_image: ""
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg"
    assert_equal(expected, url)
  end

  def test_should_handle_complex_transformation_combinations
    transformation = [
      Imagekitio::Models::Transformation.new(
        width: 300.0,
        height: 200.0,
        quality: 85.0,
        border: "5_FF0000"
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=w-300,h-200,q-85,b-5_FF0000"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_with_many_transformations_including_video_and_ai_transforms
    transformation = [
      Imagekitio::Models::Transformation.new(
        height: 300.0,
        width: 400.0,
        aspect_ratio: "4-3",
        quality: 40.0,
        crop: :force,
        crop_mode: :extract,
        focus: "left",
        format_: :jpeg,
        radius: 50.0,
        background: "A94D34",
        border: "5-A94D34",
        rotation: 90.0,
        blur: 10.0,
        named: "some_name",
        progressive: true,
        lossless: true,
        trim: 5.0,
        metadata: true,
        color_profile: true,
        default_image: "/folder/file.jpg/",
        dpr: 3.0,
        x: 10.0,
        y_: 20.0,
        x_center: 30.0,
        y_center: 40.0,
        flip: :h,
        opacity: 0.8,
        zoom: 2.0,
        # Video transformations
        video_codec: :h264,
        audio_codec: :aac,
        start_offset: 5.0,
        end_offset: 15.0,
        duration: 10.0,
        streaming_resolutions: [:"1440", :"1080"],
        # AI transformations
        grayscale: true,
        ai_upscale: true,
        ai_retouch: true,
        ai_variation: true,
        ai_drop_shadow: true,
        ai_change_background: "prompt-car",
        ai_edit: "prompt-make it vintage",
        ai_remove_background: true,
        contrast_stretch: true,
        shadow: "bl-15_st-40_x-10_y-N5",
        sharpen: 10.0,
        unsharp_mask: "2-2-0.8-0.024",
        gradient: "from-red_to-white",
        original: true,
        page: "2_4",
        raw: "h-200,w-300,l-image,i-logo.png,l-end"
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path.jpg?tr=h-300,w-400,ar-4-3,q-40,c-force,cm-extract,fo-left,f-jpeg,r-50,bg-A94D34,b-5-A94D34,rt-90,bl-10,n-some_name,pr-true,lo-true,t-5,md-true,cp-true,di-folder@@file.jpg,dpr-3,x-10,y-20,xc-30,yc-40,fl-h,o-0.8,z-2,vc-h264,ac-aac,so-5,eo-15,du-10,sr-1440_1080,e-grayscale,e-upscale,e-retouch,e-genvar,e-dropshadow,e-changebg-prompt-car,e-edit-prompt-make it vintage,e-bgremove,e-contrast,e-shadow-bl-15_st-40_x-10_y-N5,e-sharpen-10,e-usm-2-2-0.8-0.024,e-gradient-from-red_to-white,orig-true,pg-2_4,h-200,w-300,l-image,i-logo.png,l-end"
    assert_equal(expected, url)
  end

  # Hash-based API test - verify that plain hashes work for both transformations and options
  # Developers can use hashes instead of model objects for a more concise, Ruby-idiomatic syntax
  def test_should_work_with_plain_hashes_for_transformations_and_options
    # Using plain hashes instead of Transformation.new and SrcOptions.new
    url = @client.helper.build_url(
      {
        src: "/test_path1.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: [
          {
            width: 300,
            height: 200,
            quality: 85,
            border: "5_FF0000",
            ai_remove_background: true,
            ai_drop_shadow: true
          }
        ]
      }
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path1.jpg?tr=w-300,h-200,q-85,b-5_FF0000,e-bgremove,e-dropshadow"
    assert_equal(expected, url)
  end
end
