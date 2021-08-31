defmodule Chat.Server do
    # import the Genserv module
    use GenServer


    

    ### Client side ###

    # Starts a process will all the attributes associated with all 
    def start_link do
        # __MODULE__ is the same as Chat.Server
        GenServer.start_link(__MODULE__, [], name: :chat_room)
    end

    # Get the state from our process
    def get_msgs do
        #Genserver calls that process and sends a message to the process which fires handle_call
        GenServer.call(:chat_room, :get_msgs)
    end

    def add_msg( msg) do
        GenServer.cast(:chat_room, {:add_msg, msg})
    end

    ### Server side / callback functions ###
    
    def init(msgs) do
        # Returns a tuple of ok and messages after the server has been started using start_link
        # msgs is the current state of the server
        {:ok, msgs}
    end

    def handle_call(:get_msgs, _from, msgs) do
    

    # Required params that are not being used can be ignored by adding an underscore before the param name
        {:reply, msgs, msgs}
    end


    def handle_cast({:add_msg, msg}, msgs) do
        # Adds the message in from of the state(msgs)
        {:noreply, [msg | msgs]}
    end
    
end