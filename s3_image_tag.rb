module Jekyll
  class S3ImageTag < Liquid::Tag

    def initialize(tag_name, text, token)
      super
      if parts = text.strip.match(/(\w+\.\w+)/)
        @file_name = parts[1].strip
      end
     
      if parts = text.strip.match(/\w*bucket:(.*)\s/)
        @bucket_name = parts[1].strip
      else
        @bucket_name = get_config('aws_bucket')
      end
      
      if parts = text.strip.match(/\w*folder:(.*)/)
        @folder_name = parts[1].strip
      else
        @folder_name = get_config('aws_bucket_folder')
      end
      
      #@bucket_name = @bucket.nil? ? get_config('aws_bucket') : @bucket
      #@folder_name = @folder.nil? ? get_config('aws_bucket_folder') : @folder
    end

    def render(context)
      if @file_name && @bucket_name
        "<img src='https://s3.amazonaws.com/#{@bucket_name}/#{@folder_name}/#{@file_name}'>"
      else
        "Error processing input, expected syntax: {% s3_image file_name [bucket:bucket_name] %}"
      end
    end


    private

    def get_config(string)
      Jekyll.configuration({})[string]
    end
  end

end

Liquid::Template.register_tag('s3_image', Jekyll::S3ImageTag)
