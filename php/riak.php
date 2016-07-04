<?PHP /*
1.) Make sure PHP is installed correctly. Test using `php --version`.
2.) Make sure that the Riak PHP client is installed correctly. (assuming its at ~/riak-php-client)
3.) Change the address and port to your corresponding Riak address and port.
4.) Run the `php riak.php`.

TODO:
- Better exception handling.
- Maybe its good to read values of existing default bucket? it will not hit not found if
  there is an existing bucket with the same name as RiakTestBucket and the same key.
- Fix this to output 'Ok' if connection is successful to be standard as every other code

*/

//require __DIR__ . '/../vendor/autoload.php';
// Use the require code above if the location of this file is inside examples/
//require "/root/riak-php-client/vendor/autoload.php";

use Basho\Riak;
use Basho\Riak\Command;
use Basho\Riak\Node;

$node = (new Node\Builder)
        ->atHost('127.0.0.1')
        ->onPort(8087)
        ->build();

$riak = new Riak([$node]);

$bucket = new Riak\Bucket('RiakTestBucket');

$location1 = new Riak\Location('KeyOne', $bucket);

echo "Testing Riak connectivity. If there are no errors, then its good.\n";

$response1 = (new Command\Builder\FetchObject($riak))
                ->atLocation($location1)
                ->build()
                ->execute();

?>
