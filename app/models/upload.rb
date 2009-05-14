class Upload < ActiveRecord::Base
 require 'fileutils'
 def self.save(file,name,id,directory)
   APP_LOGGER_LOG.info "UPLOAD MODEL CALLED - ID: " + id
   APP_LOGGER_LOG.info "UPLOAD MODEL CALLED - Directory: " + directory
   APP_LOGGER_LOG.info "UPLOAD MODEL CALLED - file: " + file.to_s
   #Delete the old file if one exists
   FileUtils.rm_rf directory
   #Create the directory
   Dir::mkdir(directory)
   # create the file path
   path = File.join(directory, name)
   # write the file
   File.open(path, "wb") { |f| f.write(file.read) }
 end
 
 def self.delete(directory)
  FileUtils.rm_rf directory
 end
end