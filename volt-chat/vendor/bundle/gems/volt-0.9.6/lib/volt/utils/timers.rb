module Volt
  # The timers class provides useful methods for working in an asynchronus environment.
  class Timers
    # next tick (same as setImmediate) calls the block of code after any currently
    # running code is finished.
    def self.next_tick(&block)
      if Volt.in_browser?
        `setImmediate(function() {`
        yield
        `})`
      else
        tick_timers = (Thread.current['tick_timers'] ||= [])
        tick_timers << block
      end
    end

    # yields the passed in block after interval ms, or immediately if on the
    # server.
    #
    # @return - the timeout id generated by setTimeout
    def self.client_set_timeout(interval)
      if Volt.in_browser?
        timer_id = nil
        `timer_id = setTimeout(function() {`
          yield
        `}, interval);`

        # return the timer_id
        timer_id
      else
        yield
      end
    end

    def self.clear_timeout(timeout_id)
      if Volt.in_browser?
        `clearTimeout(timeout_id);`
      end
    end

    # On the server, we need to manually flush next tick timers.
    # This is done automatically in the console after each enter.
    def self.flush_next_tick_timers!
      tick_timers = Thread.current['tick_timers']

      if tick_timers
        # clear
        Thread.current['tick_timers'] = nil
        tick_timers.each(&:call)
      end
    end
  end
end
