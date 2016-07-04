% 1.) Make sure Erlang is installed correctly. Test using `erl -version`.
% 2.) Make sure that the Riak Erlang client is installed correctly. (assuming its at ~/riak-erlang-client)
% 3.) Change the address and port to your corresponding Riak address and port.
% 4.) Run `erlc riak.erl`
% 5.) erl -pa ~/riak-erlang-client/ebin ~/riak-erlang-client/deps/*/ebin -noshell -s riak start -s init stop
%		5.1) The ~/riak-erlang-client on the command above is the directory where your Riak erlang client is installed
%
% TODO:
% - Better exception handling.

-module(riak).
-export([start/0]).

start() ->
	io:fwrite("Testing Riak connectivity.\n"),
	{ok, Pid} = riakc_pb_socket:start_link("localhost", 8087),
	riakc_pb_socket:ping(Pid),
	io:fwrite("Ok.").
