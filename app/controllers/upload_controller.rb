class UploadController < ApplicationController
 skip_before_filter :login_required
 skip_before_filter :verify_authenticity_token

 def index
   APP_LOGGER_LOG.info "UPLOAD CONTROLLER CALLED"
   @fileData = params[:Filedata]
   @fileName = params[:Filename].to_s
   #NOT USED
   @length = @fileName.length
   @offset = @length - 4
   @extension = @fileName[@offset..@length]
   #@newFileName = File.join("pic",@extension)
   @newFileName = "pic.jpg"
   #END NOT USED
   @patientID = params[:id].to_s
   APP_LOGGER_LOG.info "Upload Photo IS CALLED - FileName: " + @fileName + " Patient ID: " + @patientID
   @directory = File.join(RAILS_ROOT,"public/patients/photos")
   @directory = File.join(@directory,@patientID)
   post = Upload.save(@fileData,@newFileName,@patientID,@directory)
   #@p = Patient.find(@patientID)
   #@p.photo_file_name = @fileName
   #@p.save
   render :text => "File has been uploaded successfully"
 end
end