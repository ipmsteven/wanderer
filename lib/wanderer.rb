require "wanderer/version"

module Wanderer
  def self.walk
    foot_print = []

    trace = TracePoint.new(:call) do |tp|
      foot_print << "=> #{tp.defined_class} #{tp.inspect}"
    end

    trace.enable
    yield

  ensure
    trace.disable
    return foot_print
  end
end
