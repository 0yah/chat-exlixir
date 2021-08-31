# Supervisors are processes which are used to watch other processes
defmodule Chat.Supervisor do
    use Supervisor

    def start_link do
        Supervisor.start_link(__MODULE__, [])
    end

    def init(_) do

    
        # Defines the ChatServer as a worker
        children = [
            worker(Chat.Server, []) 
        ]

        # The strategy 
        Supervisor.init(children, strategy: :one_for_one)
        # :one_for_one if one of the processes dies then supervisor will try to spin it up
        # :one_for_all if one of the processes dies the supervisor will restart all of them
        # :rest_for_all if one of the processes dies the supervisor will restart that process and any other process that was restarted after it
        
        
    end
end