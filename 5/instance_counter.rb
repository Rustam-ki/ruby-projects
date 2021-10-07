module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances
    def instances
      puts @instances
    end
  end

  module InstanceMethods
    protected

    self.class.instances ||= 0

    def register_instances
      self.class.instances += 1
    end
  end
end