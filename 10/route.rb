# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation
  attr_accessor :stations

  validate :stations, :first_last_uniq, message: 'Первая и последняя станции должны быть разными'
  validate :stations, :each_type,

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
