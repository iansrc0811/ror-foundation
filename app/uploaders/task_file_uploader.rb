# encoding: utf-8

class TaskFileUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  
  include Sprockets::Rails::Helper

  #Choose what kind of storage to use for this uploader:
  storage :fog


  def store_dir
    #structure in AWS, assure that the name is uniq
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #Add a white list of extensions which ard allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png pdf mp4 wmv xls xlsx doc docx ppt pptx mov)
    # ["jpg", "jpeg"... ]
  end

end
