%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc TEMPLATE.

-module(concurrent).
-author('author <author@example.com>').
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.

%% @spec start() -> ok
%% @doc Start the concurrent server.
start() ->
    concurrent_deps:ensure(),
    ensure_started(crypto),
    application:start(concurrent).

%% @spec stop() -> ok
%% @doc Stop the concurrent server.
stop() ->
    Res = application:stop(concurrent),
    application:stop(crypto),
    Res.
