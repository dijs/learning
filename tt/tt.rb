require "optparse"
require "psych"
require "benchmark"
require "net/http"

$config = {
	threshold: 0.5,
	log: "log.txt",
	sleep: 10,
	servers: [],
	pages: []
}

OptionParser.new do |opt|

	opt.banner = "Usage: tt.rb [options]"

	opt.on("-t", "--threshold THRESHOLD", "Time threshold for requests, in seconds.") do |t|
		$config[:threshold] = t
	end

	opt.on("-s", "--sleep N", "Sleep N seconds between runs.") do |t|
		$config[:sleep] = t
	end

	opt.on("-c", "--config [path]", "Use specific YAML configuration file.") do |path|
		begin
			$config = $config.merge(Psych.load_file(path))
		rescue
			abort("There was an error parsing your configuration file...")
		end
	end

end.parse!

$log = File.new($config[:log], "w")

def track(config)
	puts Time.now
	$config[:servers].each { |server|
		$config[:pages].each { |page|
			begin
				url_str = "#{server[:host]}:#{server[:port]}#{page}"
				url = URI.parse(url_str)
		        req = Net::HTTP::Get.new(url.path)
		        time = Benchmark.realtime do
		        	res = Net::HTTP.start(url.host, url.port) { |http|
		          		http.request(req)
		          	}
		        end
		        o = sprintf("%s %7.4f\n", url_str, time)
		        puts o
		        if (time >= $config[:threshold])
		        	$log.puts Time.now
		          	$log.puts o
		          	$log.flush
		        end
			rescue Timeout::Error
	        	puts "#{url_str} Timeout"
		    rescue => err
		        puts "#{url_str} Error: #{err}"
			end
		}
	}	
end

if not $config[:servers].empty? and not $config[:pages].empty?
	while true do
		track($config)
		sleep($config[:sleep])
	end
end