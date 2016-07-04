'''
1.) Make sure Python is installed correctly. Test using `python --version`
2.) Make sure that the Riak Python client is installed correctly. (assuming its at ~/riak-python-client)
3.) Change the address and port to your corresponding Riak address and port.
4.) Run the `python riak.py`.

TODO:
- Better exception handling.
- Maybe its good to read values of existing default bucket? it will not hit not found if
  there is an existing bucket with the same name as RiakTestBucket and the same key.

'''

# This is only needed if this script is outside of the Riak Python library folder
import sys
sys.path.insert(0, '/root/riak-python-client')

import riak

print "Testing Riak connectivity."

myClient = riak.RiakClient(pb_port=8087, protocol='pbc')
myClient = riak.RiakClient(pb_port=8087)

myBucket = myClient.bucket('RiakTestBucket')
val1 = 1
key1 = myBucket.new('KeyOne', data=val1)
fetched1 = myBucket.get('KeyOne')

if fetched1.data is None:
        print "Ok."
else:
        print fetched1.data
