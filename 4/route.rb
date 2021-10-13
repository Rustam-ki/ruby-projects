# frozen_string_literal: true

require_relative 'instance_counter'

class Route
  include InstanceCounter
  attr_accessor :stations

  def initialize(start, ending)
    register_instances
    @start = start
    @ending = ending
    @stations = [start, ending]
    validate!
  end

  def validate!
    raise "Parameter start can't be nill" if @start.nil?
    raise "Parameter ending can't be nill" if @ending.nil?
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def add_st(station)
    @stations.insert(-2, station)
  end

  def del_st(station)
    @stations.delete(station)
  end
end
