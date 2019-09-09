module CarrierWave
	module OptimzeImage
		def optimize(options = {})
			@level = options[:level].present? ? options[:level].to_i : 30
			begin
				
			if check_file_format?
				lossless_ffmpeg_compression
			end
				
			rescue Exception => e
				puts e
			end
		end

		def check_file_format?
			if file.content_type.include?("gif") || file.content_type.include?("video")
				false
			else 
				true
			end
		end

		def lossless_ffmpeg_compression
			 create_temp_image
		end

		def create_temp_image
			tempfile = Tempfile.new(["#{file.filename}_#{Time.current.to_i}", File.extname(file.path)])
			tempfile.binmode
			tempfile.write(to_blob)
			ffmpeg(tempfile)
			tempfile.unlink
		end

		def to_blob
			File.binread(file.path)
		end

		def ffmpeg(tempfile)
			 system(" ffmpeg -y -i #{tempfile.path}  -q:v #{@level} #{current_path}")  
		end
	end
end
