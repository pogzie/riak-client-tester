/*
 1.) Make sure Mono is installed correctly. Test using `mono --version`.
 2.) Make sure that the Riak .Net client is installed correctly. (assuming its at ~/riak-dotnet-client)
 3.) Change the address and port to your corresponding Riak address and port in the app.config file.
 4.) Run `xbuild` on the dotnet directory (not on the src drectory where this file is located)
 5.) Go to `bin/Debug` directory and run `mono Riak.exe`

 TODO:
 - Better exception handling.
*/

using System;
using RiakClient;

namespace Riak
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Console.WriteLine ("Testing Riak connectivity.");
			var cluster = RiakCluster.FromConfig("riakConfig");
			var client = cluster.CreateClient();
			Console.WriteLine ("Ok.");
		}
	}
}
