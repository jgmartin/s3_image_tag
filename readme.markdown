s3_image_tag
------------

An example plugin for Octopress.  This add the tag 's3_image_tag' which allows you reference images hosted on Amazon S3 within your posts.  A bit of a contrived example, but it demonstrates the process of creating custom Liquid tags.

To use it, just host some public images on s3 and use the tag with the syntax {% s3_image filename [bucket:bucket_name] %}.

If you don't specify a bucket name, it will look for a default defined in _config.yml as 'aws_bucket'.

This is likely more useful as a template for creating your own custom tags.
