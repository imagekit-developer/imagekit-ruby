require_relative "../../lib/imagekit/sdk/version"
require_relative "../../lib/imagekit/imagekit"
require "base64"

private_key = ""
public_key = ""
url_endpoint = ""
# dummy image url
url = "https://homepages.cae.wisc.edu/~ece533/images/cat.png"

imagekitio = ImageKit::ImageKitClient.new(private_key, public_key, url_endpoint)

# URL generation using image path and image hostname
gen_url = imagekitio.url({path: "/default-image.jpg",
                      url_endpoint: url_endpoint,
                      transformation: [{height: "300", width: "400"}],})

puts "-------------------------------------"
puts "generated url => #{gen_url}"


# 2 Using full image URL
image_url = imagekitio.url({src: url_endpoint.chomp("/") + "/default-image.jpg",
                            transformation: [{height: "300", width: "400"}],})
puts "-------------------------------------"

puts "Url using full image url =>  #{image_url}"


image_url = imagekitio.url({src: url_endpoint + "default-image.jpg",
                            transformation: [{format: "jpg",
                                              progressive: "true",
                                              effect_sharpen: "-",
                                              effect_contrast: "1",}],})

print("-------------------------------------", "\n")
puts "sharpening and contrast transforms => #{image_url}"
# 4. Sharpening and contrast transforms and a progressive JPG image
print("-------------------------------------")


# Uploading image from file
file = open("sample.jpg", "rb")
upload = imagekitio.upload_file(file, "testing.jpg", {
    response_fields: 'tags,customCoordinates,isPrivateFile,metadata',
    tags: %w[abc def],
    use_unique_file_name: false,
    is_private_file: true
    },)
puts "------------------------------------------", "\n"
puts "Upload Private with binary => ", upload


# signed url
url = imagekitio.url({path: upload[:response]["filePath"],
    transformation: [{'height': "300", 'width': "400"}],
    signed: true,
    expire_seconds: 10})
print("-------------------------------------", "\n")
puts "Signed url => #{url}"


# Uploading image from Base64
image64 = Base64.encode64(File.open("sample.jpg", "rb").read)

upload = imagekitio.upload_file(
    file = image64, file_name = "testing",
    options = {
        response_fields: 'tags,customCoordinates,isPrivateFile,metadata',
        tags: %w[abc def],
        use_unique_file_name: true,
        },
    )
puts "------------------------------------------", "\n"
puts "Upload with base64 => ", upload

# Uploading image from remote URL
upload = imagekitio.upload_file(
    file = "https://file-examples.com/wp-content/uploads/2017/10/file_example_JPG_100kB.jpg",
    file_name = "testing",
    options = {
        response_fields: 'tags,customCoordinates,isPrivateFile,metadata',
        tags: %w[abc def],
        use_unique_file_name: true,
        },
    )
puts "------------------------------------------", "\n"
puts "Upload with url => #{upload}"

# Uploading repeat to grow number of files in the server.
upload = imagekitio.upload_file(
    file = "https://file-examples.com/wp-content/uploads/2017/10/file_example_JPG_100kB.jpg",
    file_name = "testing",
    options = {
        response_fields: 'tags,customCoordinates,isPrivateFile,metadata',
        tags: %w[abc def],
        use_unique_file_name: true,
        },
    )
puts "------------------------------------------", "\n"
puts "Upload with url => #{upload}"
upload = imagekitio.upload_file(
    file = "https://file-examples.com/wp-content/uploads/2017/10/file_example_JPG_100kB.jpg",
    file_name = "testing",
    options = {
        response_fields: 'tags,customCoordinates,isPrivateFile,metadata',
        tags: %w[abc def],
        use_unique_file_name: true,
        },
    )
puts "------------------------------------------", "\n"
puts "Upload with url => #{upload}"


# Getting file list from server
list_files = imagekitio.list_files({skip: 0, limit: 5})
bulk_ids = Array[list_files[:response][1]["fileId"],list_files[:response][2]["fileId"],list_files[:response][3]["fileId"], list_files[:response][4]["fileId"],]

puts bulk_ids
puts list_files[:response][0]["fileId"]
print("-------------------------------------", "\n")

print("List files => ", "\n", list_files, "\n")


# puts "upload with image url", upload
updated_detail = imagekitio.update_file_details(
    list_files[:response][0]["fileId"],
    {
        "tags": ['image_tag1'],
        "custom_coordinates": "10,10,100,200"
    }
)

puts "------------------------------------------", "\n"

print("Updated detail => ", updated_detail, "\n\n")


details = imagekitio.get_file_details(list_files[:response][0]["fileId"])

puts "------------------------------------------", "\n"

print("File detail => ", details, "\n\n")


file_metadata = imagekitio.get_file_metadata(list_files[:response][0]["fileId"])

puts "------------------------------------------", "\n"
puts "File Metadata => #{file_metadata}"

print("-------------------------------------")

delete = imagekitio.delete_file(list_files[:response][0]["fileId"],)

puts "------------------------------------------", "\n"
puts "Delete file => #{delete}", "\n"

puts "-------------------------------------"
purge_cache = imagekitio.purge_file_cache(file_url = image_url)
puts "Purge cache => #{purge_cache}", "\n"

request_id = purge_cache[:response]["requestId"]
purge_cache_status = imagekitio.purge_file_cache_status(request_id)

puts "-------------------------------------", "\n"

print("Cache status => ", purge_cache_status, "\n")

puts "-------------------------------------", "\n"

auth_params = imagekitio.get_authentication_parameters
puts "Auth params => ", auth_params, "\n"

print("-------------------------------------", "\n")
print("Phash distance => ", imagekitio.phash_distance("f06830ca9f1e3e90", "f06830ca9f1e3e90"), "\n")

print("-------------------------------------")


puts "-------------------------------------", "\n"
remote_file_url = upload[:response]["url"]

print("Get metadata => ", imagekitio.get_remote_file_url_metadata(list_files[:response][1]["url"]))

puts "-------------------------------------", "\n"


print("Bulk File delete => ", imagekitio.bulk_file_delete(bulk_ids))
