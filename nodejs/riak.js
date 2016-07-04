/*
1.) Make sure NodeJS is installed correctly. Test using `nodejs --version`.
2.) Make sure that the Riak NodeJS client is installed correctly. (assuming its at ~/riak-nodejs-client)
3.) Change the address and port to your corresponding Riak address and port.
4.) Run `nodejs riak.js`.

TIP:
- If it cant find the module, try `export NODE_PATH=/usr/local/lib/node_modules`

TODO:
- Better exception handling.

*/

var assert = require('assert');
var Riak = require('basho-riak-client');

var client = null;

function client_shutdown() {
    client.shutdown(function (state) {
        if (state === Riak.Cluster.State.SHUTDOWN) {
            process.exit();
        }
    });
}

console.log("Testing Riak connectivity.");

client = new Riak.Client(['localhost:8087'], function () {
    client.ping(function (err, rslt) {
        if (err) {
            throw new Error(err);
        } else {
            // On success, ping returns true
            assert(rslt === true);
	    console.log("Ok.");
        }
        client_shutdown();
    });
});
