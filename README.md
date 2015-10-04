# Ping

Example usage of timeout parameter in call/cast response.

## Usage

Start ping server

    iex(1)> Ping.start_link 
    true
    {{16, 37, 27}, :null}
    {{16, 37, 32}, :null}

You will see new text written in timeout event.

Pause server

    iex(2)> Ping.pause
    :paused

No new events triggered.

