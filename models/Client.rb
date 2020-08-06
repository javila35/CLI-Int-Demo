class Client
    def initialize
        @time = Time.now
    end
    
    def prepare_time
        # Check if TimeZone is Pacific Daylight.
        self.convert_time_zone?
        hour = @time.strftime("%H:%M")
        day = @time.strftime("%A")
        return hour, day
    end

    def api_call
        params = self.prepare_time
        hour = params[0]
        day = params[1]
        response = HTTParty.get("https://data.sfgov.org/resource/jjew-r69b.json?$where=start24 <= '#{hour}' AND end24 >= '#{hour}' AND dayofweekstr = '#{day}'")
    end

    def convert_time_zone?
        time_zone = @time.strftime("%Z")
        if time_zone != "PDT"
            puts "Converting time to Pacific."
            @time = @time.in_time_zone("Pacific Time (US & Canada)")
        end;
    end;

end