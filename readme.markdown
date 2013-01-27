s3_image_tag
------------

An example plugin for Octopress.  This add the tag 's3_image_tag' which allows you reference images hosted on Amazon S3 within your posts.  A bit of a contrived example, but it demonstrates the process of creating custom Liquid tags.

To use it, just host some public images on s3 and use the tag with the syntax    
    {% s3_image filename [bucket:bucket_name] [folder:folder_name] %}.

If you don't specify a bucket name and folder name, it will look for a default defined in _config.yml as 'aws_bucket' and 'aws_bucket_folder' respectively.

_config.yml
-----------
\# Amazon S3 Images  
aws_bucket: my.bucket   
aws_bucket_folder: blog   

Example
-------
    Here is an image:  {% s3_image ash2.jpg bucket:my.bucket folder:friends/avatars/000/000/003/original %}  
    Here is an image:  {% s3_image myimage.jpg %}  # with configuration used form _config.yml	


This is likely more useful as a template for creating your own custom tags.
