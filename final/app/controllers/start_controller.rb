class StartController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:upload]
  def index
  end
  def upload
	###this should be migrated to a service object
	##Lets parse the file and send it to the database
	@uploaded_io = params[:file].read
	@first_section = true
	@second_section = false
	@second_section_header = 0
	@gps_import = Array[]
	@ssid_import = Array[]

	##Used for testing output
	f = File.new("/tmp/somefile.txt", "w+")
	f.sync = true

	#Lets process the uploaded file
	@uploaded_io.split("\r").each_with_index do |line,i|
		#headers in VS1 file 1-5
		if i < 5 then
			#should do some minimal checks here
			next
		#remove blank lines
		#elsif line =~ /\r/ or line =~ /\n/
		#	next
		#check to make sure we haven't hit second part of VS1 file
		elsif line !~ /^#.*/ and @first_section
			##Should be GPS locations here
			@new_line = line.gsub("\r\n","")
			@gps_import.push(@new_line.lstrip.split("|",12)) unless line.empty?
			#f.write(@new_line.lstrip.split("|",12))
			#f.write("\n")
		elsif line !~ /^#.*/ and @second_section
			##Should be SSIDs here
			@new_line = line.gsub("\r\n","")
			#@ssid_import.push(@new_line.lstrip) unless line.empty?
			@ssid_import.push(@new_line.lstrip.split("|",15)) unless line.empty?
			#f.write(line.lstrip.gsub!("\r\n", "").split("|",15))
			#f.write(@new_line.lstrip.split("|",15))
			#f.write("\n")
		elsif line =~ /^[#].*/
			@second_section_header += 1
			if @second_section_header == 3 then 
				@first_section = false
				@second_section = true
			end
		else
			next
		end
	end

	#lets convert column 15 (starting at 1) to and array
	#this will be useful later on
	@ssid_import.each_with_index do |columns, si|
		new_column = Array[]
		if columns.count > 0 then
			columns[14].split("\\").each do |fields|
				new_column.push(fields)
			end
		end
		@ssid_import[si] = [columns[0..13],new_column]
	end
			
	#f.write(@gps_import)

	@gps_import.each_with_index do |g,gi|
		if g.count > 0 then
		#f.write("GPS index is: " + gi.to_s + "\n")
		#f.write("this is g: ")
		#f.write(g)
		#f.write("\n")
		old_id = g[0]
		@new_gps = Gpspoint.new
		@new_gps.latitude = g[1]
		@new_gps.longitude = g[2]
		@new_gps.num_sats = g[3]
		@new_gps.hdofp = g[4]
		@new_gps.altitude = g[5]
		@new_gps.hofgae = g[6]
		@new_gps.speed_km = g[7]
		@new_gps.speed_mph = g[8]
		@new_gps.angle = g[9]
		@new_gps.date = g[10]
		@new_gps.time = g[11] 
		@new_gps.save
		#f.write("DONE WITH GPS index: " + gi.to_s + "\n")
		
			#f.write("This is ssid_import.count " + @ssid_import.count.to_s + "\n")
		#f.write("######SSID INSPECT$$$$$$$\n")
		#f.write(@ssid_import)
		#f.write("#END###SSID INSPECT$$$$$$$\n")
			#f.write("Goint to show columns then t before assignment\n")
			#f.write(columns)
			#f.write("end of columns\n")
		@ssid_import.each_with_index do |ssid_loc, sli|
			ssid_loc[1].each_with_index do |a_gps, agi| #<---array with each gps location
				subfields = a_gps.split(",")
				subfields[0] = subfields.first.to_i == old_id.to_i ? @new_gps.id : subfields.first
				@ssid_import[sli][1][agi] = subfields.join(",") 
			end
		end
		end
	end

	f.write(@ssid_import)

	@ssid_import.each do |ss|
		@new_ssid = Ssid.new
		@new_ssid.ssid = ss[0][0]
		@new_ssid.bssid = ss[0][1]
		@new_ssid.manufacture = ss[0][2]
		@new_ssid.auth = ss[0][3]
		@new_ssid.encryption = ss[0][4]
		@new_ssid.sec_type = ss[0][5]
		@new_ssid.radio_type = ss[0][6]
		@new_ssid.channel = ss[0][7]
		@new_ssid.transfer_rates = ss[0][8]
		@new_ssid.special_transfer_rates = ss[0][9]
		@new_ssid.high_signal = ss[0][10]
		@new_ssid.high_rssi = ss[0][11]
		@new_ssid.net_type = ss[0][12]
		@new_ssid.label = ss[0][13]
		@new_ssid.save
		ss[1].each do |pp|
			ppp = pp.split(",")
			a_pollpoint = Pollpoint.new(ssid: @new_ssid, gpspoint: Gpspoint.find(ppp[0]), signal: ppp[1], rssi: ppp[2])
			a_pollpoint.save
		end
	end
	f.close
  end
end
