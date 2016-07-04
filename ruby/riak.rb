=begin
1.) Make sure Ruby is installed correctly. Test using `ruby --version`.
2.) Make sure that the Riak Ruby client is installed correctly.
  2.1) If the Riak Ruby libraries was installed via `gem install` no need to worry about setting paths here.
3.) Change the address and port to your corresponding Riak address and port.
4.) Run `ruby riak.rb`.

TODO:
- Better exception handling.
- Maybe its good to read values of existing default bucket? it will not hit not found if
  there is an existing bucket with the same name as RiakTestBucket and the same key.

=end

require 'riak'

print "Testing Riak connectivity.\n"

# Create a client interface
client = Riak::Client.new

# Automatically balance between multiple nodes
client = Riak::Client.new(:nodes => [
  {:host => 'localhost', :pb_port => 8087},
])

my_bucket = client.bucket("RiakTestBucket")
val1 = 1
obj1 = my_bucket.new('KeyOne')

begin
	fetched1 = my_bucket.get('KeyOne')
rescue => e
	exception_type = e.to_s
	if exception_type.include? "not_found"
		print "Ok."
	else
		print exception_type
	end
end

print "\n"
